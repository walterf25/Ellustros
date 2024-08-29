B4i=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.3
@EndOfDesignText@
#Event: Ready
#Event: Error(Code As Int, Status As String)
#Event: DocumentChanged(Data As Map)
#Event: CollectionChanged(Data As Map)
#Event: ListenerDisconnected(Reason As String)

Private Sub Class_Globals
	Private xui As XUI
	Private Tk As String
	Private Db As String = "(default)"
	Private ID As String
	Private FilesLink As String
	Private API_URL As String
	Private API_END_POINT As String = "https://firestore.googleapis.com/v1/"
	Dim IsInitialized As Boolean = False
	Private Callback As Object
	Private Event As String
	Private FirestoreData As KeyValueStore
	
	Public const TYPE_ADDED As String = "ADDED"
	Public const TYPE_MODIFIED As String = "MODIFIED"
	Public const TYPE_REMOVED As String = "REMOVED"
	
	Public OfflineMode As Boolean = False
	Public WebAppUrl As String = ""
End Sub

'Initializes The Firestore Library
'Token: Token generated from Firebase Auth
'Databse: Use (default)
'ProjectId: Your firebase project ID
'<code>
'Dim Store As Firestore
'Store.Initialize("Firestore",Me,TOken,"",projectID)
'End Sub
'</code>
Public Sub Initialize(EventName As String,Module As Object, Token As String, Database As String, ProjectId As String)
	Event = EventName
	Callback = Module
	If Database == "" Then
		Db = "(default)"
	End If
	Tk = Token
	Db = Database
	ID =  ProjectId
	FilesLink = "https://firebasestorage.googleapis.com/v0/b/"&ID&".appspot.com/o/"
	API_URL = $"${API_END_POINT}projects/${ID}/databases/${Db}/documents/"$
	Log("API_URL: " & API_URL)
	#if b4j
	xui.SetDataFolder("firestore")
	#End If
	FirestoreData.Initialize(xui.DefaultFolder,"firestore.db")
	Log("Firestore Initialized")
	If IsInitialized == False And xui.SubExists(Callback,Event&"_Ready",0) Then
		IsInitialized = True
		CallSub(Callback,Event&"_Ready")
	Else If IsInitialized == False Then
		IsInitialized = True
	End If
End Sub

'Gets a single document from Firestore
'Collection: The collection contating the document
'Document: The document containing the data
'<code>
'Wait For(Store.GetDocument("products","items")) Complete(Map As Map)
'</code>
Public Sub GetDocument(Collection As String, Document As String) As ResumableSub
	Dim Map As Map
	Map.Initialize
	If IsInitialized == True Then
		Try
			Map = GetOfflineDocument(Collection,Document)
			If OfflineMode  And Map.IsInitialized And Map.Size > 0 Then
				Return Map
			Else
				Dim link As String = $"${API_URL}${Collection}/${Document}"$
				Dim okHttp As HttpJob
				okHttp.Initialize("HTTP", Me)
				okHttp.Download(link)
				okHttp.GetRequest.SetHeader("Authorization","Bearer " & Tk)
				Wait For (okHttp) JobDone(j As HttpJob)
				If j.Success Then
					Dim jsonString As JSONParser
					Dim doc As Map
					jsonString.Initialize(j.GetString)
					doc = jsonString.NextObject
					If doc.IsInitialized Then
						Dim fields As Map = doc.Get("fields")
						If fields.IsInitialized Then
							Dim Map As Map  = FirestoreUtils.ParseFirestoreMap(fields)
							Dim Name() As String = Regex.Split("/",doc.Get("name"))
							Map.Put("id",Name(Name.Length-1))
						End If
					End If
				Else
					Map = GetOfflineDocument(Collection,Document)
					GenerateErrorMsg(j)
				End If
				j.Release
			End If
		Catch
			Map = GetOfflineDocument(Collection,Document)
			Log(LastException)
		End Try
	End If
	Return Map
End Sub

'Gets an entire collection
'Collection: The collection to fetch
'<code>
'Wait For(Store.GetCollection("products")) Complete(Map As Map)
'</code>
Public Sub GetCollection(Collection As String) As ResumableSub
	Dim Map As Map
	Map.Initialize
	If IsInitialized == True Then
		Try
			Map = GetOfflineCollection(Collection)
			If OfflineMode  And Map.IsInitialized And Map.Size > 0 And Map.Get("documents").As(List).Size > 0 Then
				Return Map
			Else
				Dim link As String = $"${API_URL}${Collection}"$
				Dim okHttp As HttpJob
				okHttp.Initialize("HTTP", Me)
				okHttp.Download(link)
				okHttp.GetRequest.SetHeader("Authorization","Bearer " & Tk)
				Wait For (okHttp) JobDone(j As HttpJob)
				If j.Success Then
					Dim jsonString As JSONParser
					Dim data As Map
					jsonString.Initialize(j.GetString)
					data = jsonString.NextObject
					If data.IsInitialized Then
						Dim documents As List = data.Get("documents")
						If documents.IsInitialized Then
							Dim Items As List : Items.Initialize
							For d=0 To documents.Size-1
								Dim ItemsMap As Map : ItemsMap.Initialize
								Dim doc As Map = documents.Get(d)
								Dim fields As Map = doc.Get("fields")
								If fields.IsInitialized Then
									Dim ItemsMap As Map  = FirestoreUtils.ParseFirestoreMap(fields)
									Dim Name() As String = Regex.Split("/",doc.Get("name"))
									ItemsMap.Put("id",Name(Name.Length-1))
									Items.Add(ItemsMap)
								End If
							Next
							Map.Put("documents",Items)
							CreateOfflineCollection(Collection,Items)
							If data.ContainsKey("nextPageToken") And Collection.Contains("pageSize") == False Then
								Log(data.get("nextPageToken"))
								GetCollection(Collection&$"?pageSize=10&pageToken=${data.get("nextPageToken")}"$)
							End If
						End If
					End If
				Else
					Map = GetOfflineCollection(Collection)
					GenerateErrorMsg(j)
				End If
				j.Release
			End If
		Catch
			Map = GetOfflineCollection(Collection)
			Log(LastException)
		End Try
	End If
	Return Map
End Sub

'Gets a collection with limited number
'Collection: The collection to fetch
'Limit: documents to fetch
'<code>
'Wait For(Store.GetCollection("products",4)) Complete(Map As Map)
'</code>
Public Sub GetCollection2(Collection As String, Limit As Int) As ResumableSub
	Dim Map As Map
	Map.Initialize
	If IsInitialized == True Then
		Try
			Map = GetOfflineCollection(Collection)
			If OfflineMode  And Map.IsInitialized And Map.Size > 0 And Map.Get("documents").As(List).Size > 0 Then
				Return Map
			Else
				Dim link As String = $"${API_URL}${Collection}?pageSize=${Limit}"$
				Dim okHttp As HttpJob
				okHttp.Initialize("HTTP", Me)
				okHttp.Download(link)
				okHttp.GetRequest.SetHeader("Authorization","Bearer " & Tk)
				Wait For (okHttp) JobDone(j As HttpJob)
				If j.Success Then
'				Log(j.GetString)
					Dim jsonString As JSONParser
					Dim data As Map
					jsonString.Initialize(j.GetString)
					data = jsonString.NextObject
					If data.IsInitialized Then
						Dim documents As List = data.Get("documents")
						If documents.IsInitialized Then
							Dim Items As List : Items.Initialize
							For d=0 To documents.Size-1
								Dim doc As Map = documents.Get(d)
								Dim fields As Map = doc.Get("fields")
								If fields.IsInitialized Then
									Dim ItemsMap As Map  = FirestoreUtils.ParseFirestoreMap(fields)
									Dim Name() As String = Regex.Split("/",doc.Get("name"))
									ItemsMap.Put("id",Name(Name.Length-1))
									Items.Add(ItemsMap)
								End If
							Next
							Map.Put("documents",Items)
							CreateOfflineCollection(Collection,Items)
							If data.ContainsKey("nextPageToken") Then
								Map.Put("next",data.get("nextPageToken"))
							End If
						End If
					End If
				Else
					Map = GetOfflineCollection(Collection)
					GenerateErrorMsg(j)
				End If
				j.Release
			End If
		Catch
			Map = GetOfflineCollection(Collection)
			Log(LastException)
		End Try
	End If
	Return Map
End Sub

'Inserts data into the given documents under a collection
'Collection: The collection contating the document
'Document: The document containing the data
'Fields: The data to be inserted
'<code>
'Dim Fields As Map = CreateMap("name" : "Kofi", "age": 24)
'Wait For (Store.createDocument("products","ugXJFOC9GHZsOtlpW9Vc", fields)) Complete(m As Map)
'</code>
Public Sub CreateDocument(Collection As String, Document As String, Fields As Map) As ResumableSub
	Fields = FirestoreUtils.CreateFirestoreMap(Fields)
'	Log(Fields)
	Dim Map As Map : Map.Initialize
	If IsInitialized == True Then
		Try
			Dim url As String = $"${API_URL}${Collection}?documentId=${Document}"$
			Log("url: " & url)
			Dim json As JSONGenerator
			json.Initialize(CreateMap("fields":Fields))
			Log("json: " & json.ToPrettyString(3))
			Dim job As HttpJob : job.Initialize("",Me)
			job.PostString(url,json.ToString)
			job.GetRequest.SetHeader("Authorization","Bearer " & Tk)
			job.GetRequest.SetContentType("application/json")
			
			Wait For (job) JobDone(j As HttpJob)
			If j.Success Then
				Dim jsonString As JSONParser
				Dim Doc As Map
				jsonString.Initialize(j.GetString)
				Doc = jsonString.NextObject
				If Doc.IsInitialized Then
					Dim Fields As Map = Doc.Get("fields")
					If Fields.IsInitialized Then
						Dim Map As Map  = FirestoreUtils.ParseFirestoreMap(Fields)
						Dim Name() As String = Regex.Split("/",Doc.Get("name"))
						Map.Put("id",Name(Name.Length-1))
					End If
				End If
				CreateOfflineDocument(Collection,Map.Get("id"),Map)
			Else
				CreateOfflineDocument(Collection,Document,Map)
				GenerateErrorMsg(j)
			End If
			j.Release
		Catch
			CreateOfflineDocument(Collection,Document,Map)
			Log(LastException)
		End Try
	End If
	Return Map
End Sub

Public Sub InsertData(Collection As String, Document As String, Fields As Map) As ResumableSub
	Fields = FirestoreUtils.CreateFirestoreMap(Fields)
'	Log(Fields)
	Dim Map As Map : Map.Initialize
	If IsInitialized == True Then
		Try
			'''Dim url As String = $"${API_URL}${Collection}?documentId=${Document}"$   '''?documentId=${Document}
			Dim url As String = $"${API_URL}${Collection}/${Document}"$
			Log("url: " & url)
			Dim json As JSONGenerator
			json.Initialize(CreateMap("fields":Fields))
			
			Log("json: " & json.ToPrettyString(3))
			Dim job As HttpJob : job.Initialize("",Me)
			job.PutString(url,json.ToString)
			job.GetRequest.SetHeader("Authorization","Bearer " & Tk)
			job.GetRequest.SetContentType("application/json")
			
			Wait For (job) JobDone(j As HttpJob)
			If j.Success Then
				Dim jsonString As JSONParser
				Dim Doc As Map
				jsonString.Initialize(j.GetString)
				Doc = jsonString.NextObject
				If Doc.IsInitialized Then
					Dim Fields As Map = Doc.Get("fields")
					If Fields.IsInitialized Then
						Dim Map As Map  = FirestoreUtils.ParseFirestoreMap(Fields)
						Dim Name() As String = Regex.Split("/",Doc.Get("name"))
						Map.Put("id",Name(Name.Length-1))
					End If
				End If
				CreateOfflineDocument(Collection,Map.Get("id"),Map)
			Else
				CreateOfflineDocument(Collection,Document,Map)
				GenerateErrorMsg(j)
			End If
			j.Release
		Catch
			CreateOfflineDocument(Collection,Document,Map)
			Log(LastException)
		End Try
	End If
	Return Map
End Sub

Private Sub GenerateResult(j As HttpJob) As Map
	Dim response As String = ""
	Dim tmp_result As Map
	tmp_result.Initialize
	Try
		If j.Success Then
			response = j.GetString
			Dim jsonString As JSONParser
			Dim Doc As Map
			Dim Map As Map:Map.Initialize
			jsonString.Initialize(response)
			Doc = jsonString.NextObject
			If Doc.IsInitialized Then
				Dim Fields As Map = Doc.Get("fields")
				If Fields.IsInitialized Then
					Dim Map As Map  = FirestoreUtils.ParseFirestoreMap(Fields)
					Dim Name() As String = Regex.Split("/",Doc.Get("name"))
					Map.Put("id",Name(Name.Length-1))
				End If
				tmp_result.Put("success",j.Success)
				tmp_result.Put("document",Map)
			End If
		Else
			tmp_result.Put("success",j.Success)
			tmp_result.Put("document",Null)
		End If
	Catch
		Log(LastException)
	End Try
	j.Release
	Return tmp_result
End Sub


'Updates data of the given documents under a collection
'Collection: The collection contating the document
'Document: The document containing the data
'Fields: The data to be updata
'<code>
'Dim List As List
'List.Initialize
'List.AddAll(Array As Int(1,2,3,4,5,6))
'Dim Fields As Map = CreateMap("items": List)
'Wait For(Store.UpdateDocument("users","ugXJFOC9GHZsOtlpW9Vc",Fields)) Complete(Map As Map)
'Log(Map)
'</code>
Public Sub UpdateDocument(Collection As String,Document As String, Fields As Map) As ResumableSub
'	Log(Fields)
	Dim Map As Map : Map.Initialize
	If IsInitialized == True Then
		Try
			Dim Json As JSONGenerator
			Json.Initialize(CreateMap("fields":FirestoreUtils.CreateFirestoreMap(Fields)))
			Dim fieldPaths As String = ""
			For Each k As String In Fields.Keys
				If fieldPaths == "" Then
					fieldPaths = $"updateMask.fieldPaths=${k}"$
				Else
					fieldPaths = fieldPaths &$"&updateMask.fieldPaths=${k}"$
				End If
			Next
			Dim url As String = $"${API_URL}${Collection}/${Document}?currentDocument.exists=true&${fieldPaths}&alt=json"$
			Log("url: " & url)
			Dim job As HttpJob : job.Initialize("", Me)
			Log("json: " & Json.ToPrettyString(3))
			job.PatchString(url,Json.ToString)
			job.GetRequest.SetHeader("Authorization","Bearer " & Tk)
			job.GetRequest.SetContentType("application/json")
   
			Wait For (job) JobDone(j As HttpJob)
			If j.Success Then
				Dim jsonString As JSONParser
				Dim Doc As Map
				jsonString.Initialize(j.GetString)
				Doc = jsonString.NextObject
				If Doc.IsInitialized Then
					Dim Fields As Map = Doc.Get("fields")
					If Fields.IsInitialized Then
						Dim Map As Map  = FirestoreUtils.ParseFirestoreMap(Fields)
						Map.Put("id",Document)
					End If
				End If
				UpdateOfflineDocument(Collection,Map.Get("id"),Map)
			Else
				Map = UpdateOfflineDocument(Collection,Document,Map)
				GenerateErrorMsg(j)
			End If
			j.Release
		Catch
			Map = UpdateOfflineDocument(Collection,Document,Map)
			Log(LastException)
		End Try
	End If
	Return Map
End Sub

'Deletes an field in a document
'<code>
'Dim Fields As List
'Fields.Initialize
'Fields.AddAll(Array As String("name","age"))
'Wait For(Store.DeleteDocumentFields("users","ugXJFOC9GHZsOtlpW9Vc",Fields)) Complete(Map As Map)
'Log(Map)
'</code>
Public Sub DeleteDocumentFields(Collection As String,  Document As String, Fields As List) As ResumableSub
   
	Dim fieldPaths As String = ""
	For Each k As String In Fields
		If fieldPaths == "" Then
			fieldPaths = $"updateMask.fieldPaths=${k}"$
		Else
			fieldPaths = fieldPaths &$"&updateMask.fieldPaths=${k}"$
		End If
	Next
	Dim url As String = $"${API_URL}${Collection}/${Document}?${fieldPaths}"$
	
	Dim job As HttpJob : job.Initialize("", Me)
	
	job.PatchString(url,"")
	job.GetRequest.SetHeader("Authorization","Bearer " & Tk)
   
	Wait For (job) JobDone(j As HttpJob)
	Return GenerateResult(j)

End Sub

'Deletes an entire collection
'Collection: The collection to be deleted
'<code>
'Wait For(Store.DeleteCollection("products")) Complete(Map As Map)
'</code>
Public Sub DeleteCollection(Collection As String) As ResumableSub
   
	Dim url As String = $"${API_URL}${Collection}"$

	Dim j As HttpJob : j.Initialize("",Me)
	j.Delete(url)
	j.GetRequest.SetHeader("Authorization","Bearer " & Tk)
	
	Wait For (j) JobDone(j As HttpJob)
	Return GenerateResult(j)

End Sub


'Deletes an entire collection
'Collection: The collection to look through
'Document: The document to be deleted
'<code>
'Wait For(Store.DeleteDocument("products","items")) Complete(Map As Map)
'</code>
Public Sub DeleteDocument(Collection As String, Document As String) As ResumableSub
   
	Dim url As String = $"${API_URL}${Collection}/${Document}"$

	Dim j As HttpJob : j.Initialize("",Me)
	j.Delete(url)
	j.GetRequest.SetHeader("Authorization","Bearer " & Tk)
	
	Wait For (j) JobDone(j As HttpJob)
	DeleteOfflineDocument(Collection,Document)
	Return GenerateResult(j)
End Sub

'Get file path from Storage
Public Sub GetFileURL(Path As String) As String
	Dim FileURL As String = Path.Replace("/","%2F")
	FileURL = FilesLink&FileURL&"?alt=media"
	Return FileURL
End Sub

'Runs the structure to perform a filter query
'<code>
'Dim Filter As FieldFilter
'Filter.Initialize.EqualTo("age",30)
'Dim Comp As CompositeFilter
'Comp.Initialize.Filters(Filter)
'Dim Qry As Query
'Qry.Initialize.AddField("age").AddField("name").OrderBy("age",Qry.DESCENDING).From("users").Where(Comp)
'Wait For(Store.RunQuery(Qry)) Complete(Map As Map)
'</code>
Public Sub RunQuery(StructuredQuery As Query) As ResumableSub
	Dim Map As Map : Map.initialize
	Dim Items As List : Items.Initialize
	Dim Collection As String = StructuredQuery.Complete.Get("structuredQuery").As(Map).Get("from").As(List).Get(0).As(Map).Get("collectionId")
	Try
		Map = GetOfflineQuery(Collection)
		If OfflineMode  And Map.IsInitialized And Map.Size > 0 And Map.Get("documents").As(List).Size > 0 Then
			Return Map
		Else
			If StructuredQuery.SubCollection <> "" Then
				Dim url As String =  $"${API_URL}${StructuredQuery.SubCollection}:runQuery"$
			Else
				Dim url As String =  $"${API_URL}:runQuery"$
			End If
			Log("API_URL: " & API_URL)
			Log("url: " & url)
			Dim json As JSONGenerator
			json.Initialize(StructuredQuery.Complete)
			Dim j As HttpJob : j.Initialize("",Me)
			j.PostString(url,json.ToString)
			Log(json.ToPrettyString(4))
			j.GetRequest.SetHeader("Authorization","Bearer " & Tk)
			j.GetRequest.SetContentType("application/json")
			Wait For (j) JobDone(j As HttpJob)
			If j.Success Then
				Dim jsonString As JSONParser
				Dim data As List
				jsonString.Initialize(j.GetString)
				data = jsonString.NextArray
				If data.Size > 0 Then
					For d=0 To data.Size-1
						Dim Document As Map = data.Get(d)
						If Document.IsInitialized == True Then
							Dim Doc As Map = Document.Get("document")
							If Doc.IsInitialized Then
								Dim ItemsMap As Map : ItemsMap.Initialize
								Dim fields As Map = Doc.Get("fields")
								If fields.IsInitialized Then
									Dim ItemsMap As Map  = FirestoreUtils.ParseFirestoreMap(fields)
									Dim Name() As String = Regex.Split("/",Doc.Get("name"))
									If ItemsMap.Size > 0 Then ItemsMap.Put("id",Name(Name.Length-1))
									Items.Add(ItemsMap)
								End If
							End If
						End If
					Next
					Map.Put("documents",Items)
					CreateOfflineQuery(Collection,Items)
				End If
			Else
				GetOfflineQuery(Collection)
				GenerateErrorMsg(j)
			End If
			j.Release
		End If
	Catch
		GetOfflineQuery(Collection)
		Log(LastException)
	End Try
	Return Map
End Sub

'Gets and listens to changes in a collection
Public Sub CollectionListen(Collection As String) As ListenerRegistration
	Log("Listening to: " & Collection)
	Private CollListener As ListenerRegistration
	Dim Map As Map 
	Map.Initialize
	Map.Put("token",Tk)
	Map.Put("database",Db)
	Map.Put("project",ID)
	Map.Put("event",Event)
	Map.Put("web_url",WebAppUrl)
	CollListener.Initialize
	CallSub3(CollListener,"Create",Callback,Map)
	CallSub2(CollListener,"CollectionListen",Collection)
	Return CollListener
End Sub

'Gets and listens to changes in a document
Public Sub DocumentListen(Collection As String, Document As String) As ListenerRegistration
	Log("Listening to: " & Document & " in " & Collection)
	Private DocListener As ListenerRegistration
	Dim Map As Map
	Map.Initialize
	Map.Put("token",Tk)
	Map.Put("database",Db)
	Map.Put("project",ID)
	Map.Put("event",Event)
	Map.Put("web_url",WebAppUrl)
	DocListener.Initialize
	CallSub3(DocListener,"Create",Callback,Map)
	CallSub3(DocListener,"DocumentListen",Collection,Document)
	Return DocListener
End Sub

'Generates a document ID
Public Sub GenerateDocumentId As String
	#if b4a or b4j
	Dim chars() As String = Regex.Split("","ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")
	#Else If b4i
	Dim text As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
	Dim chars(text.Length) As String
	For i = 0 To text.Length - 1
		Dim c As Char = text.CharAt(i)
		chars(i) = c
'		Log(c)
	Next
	#End If
	Dim docID As StringBuilder
	docID.Initialize
	For i = 0 To 19
		Dim index As Int = Rnd(0, chars.Length)
		docID.Append(chars(index))
	Next
	Return docID.ToString
End Sub

Private Sub GenerateErrorMsg(j As HttpJob)
'	Log(j.ErrorMessage)
	If j.ErrorMessage.Contains("{") Then
		Dim jsonString As JSONParser
		jsonString.Initialize(j.ErrorMessage)
		#if b4a or b4j
		If jsonString.NextValue Is Map Then
			Dim ErrorMsg As Map = jsonString.NextObject
		Else If jsonString.NextValue Is List Then
			Dim ErrorMsg As Map = jsonString.NextArray.Get(0)
		End If
		#else
		If jsonString.NextArray.IsInitialized Then
			Dim ErrorMsg As Map = jsonString.NextArray.Get(0)
		End If
		#End If
		Dim Error As Map = ErrorMsg.Get("error")
	Else
		Dim Error As Map = CreateMap("code":0,"status":"The request timed out.")
	End If
	Log($"${Error.Get("code")}: ${Error.Get("status")}"$)
	If xui.SubExists(Callback,Event&"_Error",1) Then
		CallSub3(Callback,Event&"_Error",Error.Get("code"),Error.Get("status"))
	End If
End Sub

#Region OFFLINE
Private Sub GetOfflineCollection(CollectionName As String) As Map
	Log("GetOfflineCollection: "&CollectionName)
	If FirestoreData.ContainsKey(CollectionName) Then
		Dim CollectionMap As Map
		CollectionMap = FirestoreData.Get(CollectionName)
		Return CollectionMap
	End If
    
	' Return an empty map if the data doesn't exist
	Dim List As List
	List.initialize
	Return CreateMap("documents":List)
End Sub

Private Sub GetOfflineDocument(CollectionName As String, DocumentID As String) As Map
	Log("GetOfflineDocument: "&CollectionName)
	If FirestoreData.ContainsKey(CollectionName) Then
		Dim CollectionMap As Map
		CollectionMap = FirestoreData.Get(CollectionName)
        
		If CollectionMap.ContainsKey("documents") Then
			Dim DocumentsList As List
			DocumentsList = CollectionMap.Get("documents")
            
			For Each doc As Map In DocumentsList
				If doc.ContainsKey("id") And doc.Get("id") = DocumentID Then
					Return doc
				End If
			Next
		End If
	End If
    
	' Return an empty map if the data doesn't exist
	Return CreateMap()
End Sub

Private Sub CreateOfflineCollection(CollectionName As String, Documents As List) As Map
	Log("CreateOfflineCollection: "&CollectionName)
	If FirestoreData.ContainsKey(CollectionName) == False Then
		FirestoreData.Put(CollectionName, CreateMap())
	End If
	
	If FirestoreData.ContainsKey(CollectionName) == False Then
		Dim CollectionMap As Map
		CollectionMap.Initialize
		Dim List As List
		List.initialize
		CollectionMap.Put("documents", List)
		FirestoreData.Put(CollectionName, CollectionMap)
	End If
	
	Dim CollectionMap As Map
	CollectionMap = FirestoreData.Get(CollectionName)
	CollectionMap.Put("documents", Documents)
	FirestoreData.Put(CollectionName, CollectionMap)
	
	Return CollectionMap
End Sub

Private Sub DeleteOfflineDocument(CollectionName As String, DocumentID As String)
	Log("DeleteOfflineDocument: "&CollectionName)
	If FirestoreData.ContainsKey(CollectionName) Then
		Dim CollectionMap As Map
		CollectionMap = FirestoreData.Get(CollectionName)
        
		If CollectionMap.ContainsKey("documents") Then
			Dim DocumentsList As List
			DocumentsList = CollectionMap.Get("documents")
            
			For i = DocumentsList.Size - 1 To 0 Step -1
				Dim doc As Map
				doc = DocumentsList.Get(i)
				If doc.ContainsKey("id") And doc.Get("id") = DocumentID Then
					DocumentsList.RemoveAt(i)
				End If
			Next
			CollectionMap.Put("documents", DocumentsList)
		End If
		FirestoreData.Put(CollectionName, CollectionMap)
	End If
End Sub

Private Sub CreateOfflineQuery(CollectionName As String, Documents As List) As Map
	CollectionName = "QUERY_"&CollectionName
	Log("CreateOfflineQuery: "&CollectionName)
	If FirestoreData.ContainsKey(CollectionName) == False Then
		FirestoreData.Put(CollectionName, CreateMap())
	End If
	
	If FirestoreData.ContainsKey(CollectionName) == False Then
		Dim CollectionMap As Map
		CollectionMap.Initialize
		Dim List As List
		List.initialize
		CollectionMap.Put("documents", List)
		FirestoreData.Put(CollectionName, CollectionMap)
	End If
	
	Dim CollectionMap As Map
	CollectionMap = FirestoreData.Get(CollectionName)
	CollectionMap.Put("documents", Documents)
	FirestoreData.Put(CollectionName, CollectionMap)
	
	Return CollectionMap
End Sub

Private Sub GetOfflineQuery(CollectionName As String) As Map
	CollectionName = "QUERY_"&CollectionName
	Log("GetOfflineQuery: "&CollectionName)
	
	If FirestoreData.ContainsKey(CollectionName) Then
		Dim CollectionMap As Map
		CollectionMap = FirestoreData.Get(CollectionName)
		
		Return CollectionMap
	End If
    
	' Return an empty map if the data doesn't exist
	Dim List As List
	List.initialize
	Return CreateMap("documents":List)
End Sub

Private Sub CreateOfflineDocument(CollectionName As String, DocumentID As String, DataMap As Map) As Map
	Log("CreateOfflineDocument: "&CollectionName)
	If FirestoreData.ContainsKey(CollectionName) == False Then
		FirestoreData.Put(CollectionName, CreateMap())
	End If
	
	If DocumentID == "" Then
		DocumentID = GenerateDocumentId
	End If
    
	If FirestoreData.ContainsKey(CollectionName) == False Then
		Dim CollectionMap As Map
		CollectionMap.Initialize
		Dim List As List
		List.initialize
		CollectionMap.Put("documents", List)
		FirestoreData.Put(CollectionName, CollectionMap)
	End If
    
	Dim CollectionMap As Map
	CollectionMap = FirestoreData.Get(CollectionName)
    
	If CollectionMap.ContainsKey("documents") Then
		Dim DocumentsList As List
		DocumentsList = CollectionMap.Get("documents")
        
		DataMap.Put("id", DocumentID)
        
		DocumentsList.Add(DataMap)
		
		CollectionMap.Put("documents",DocumentsList)
	End If
	FirestoreData.Put(CollectionName, CollectionMap)
	Return DataMap
End Sub

Private Sub UpdateOfflineDocument(CollectionName As String, DocumentID As String, DataMap As Map) As Map
	Log("UpdateOfflineDocument: "&CollectionName)
	Dim Document As Map
	Document.Initialize
	If FirestoreData.ContainsKey(CollectionName) == False Then
		Dim CollectionMap As Map
		CollectionMap.Initialize
		Dim List As List
		List.initialize
		CollectionMap.Put("documents", List)
		FirestoreData.Put(CollectionName, CollectionMap)
	End If
    
	Dim CollectionMap As Map
	CollectionMap = FirestoreData.Get(CollectionName)
    
	If CollectionMap.ContainsKey("documents") Then
		Dim DocumentsList As List
		DocumentsList = CollectionMap.Get("documents")
        
		Dim index As Int = 0
		For Each Doc As Map In DocumentsList
			If Doc.ContainsKey("id") And Doc.Get("id") = DocumentID Then
				DocumentsList.RemoveAt(index)
				For Each key In DataMap.Keys
					Doc.Put(key,DataMap.Get(key))
				Next
				Document = Doc
				DocumentsList.Add(Doc)
			End If
			index = index + 1
		Next
		CollectionMap.Put("documents", DocumentsList)
	End If
	FirestoreData.Put(CollectionName, CollectionMap)
	Return Document
End Sub

Public Sub ClearCahce
	If IsInitialized Then
		If FirestoreData.IsInitialized Then
			FirestoreData.DeleteAll
		End If
	End If
End Sub
#End Region