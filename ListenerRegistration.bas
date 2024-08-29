B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.5
@EndOfDesignText@
#Event: Disconnected(Reason As String)

'Class New
Private Sub Class_Globals
	Private CurrentCollection, UpdatedCollection As List
	Private CollectionName, DocumentID,Event,WebAppUrl As String
	Private CurrentDocument,UpdatedDocument As Map
	Private Callback As Object
	Public IsInitialized As Boolean = False
	#if b4j
	Private ws As WebSocketClient
	#else
	Private ws As WebSocket
	#End If
End Sub

'Initialize the Listener
Public Sub Initialize
	IsInitialized = True
	CurrentCollection.Initialize
	UpdatedCollection.Initialize
	CurrentDocument.Initialize
	UpdatedDocument.Initialize
End Sub

Private Sub ws_Connected
	Log("Listener Connected")
End Sub

'Create Listeners with Firestore Class
Private Sub Create(Module As Object, FirDatabase As Map)
	Callback = Module
	Event = FirDatabase.Get("event")
	Event = FirDatabase.Get("event")
	WebAppUrl = FirDatabase.get("web_url")
End Sub

Private Sub ws_TextMessage (Message As String)
	Dim json As JSONParser
	json.Initialize(Message)
	Dim Map As Map = json.NextObject
	If CollectionName <> "" And DocumentID == "" Then
		CallSub2(Callback,Event&"_CollectionChanged",Map)
		CurrentCollection = Map.Get("documents")
	Else If CollectionName <> "" And DocumentID <> "" Then
		UpdatedDocument = Map
		If CurrentDocument.Size == 0 Then CurrentDocument = Map
		CheckDocumentChanges(CurrentDocument,UpdatedDocument)
		CurrentDocument = Map
	End If
End Sub

Private Sub ws_Closed (Reason As String)
	Remove
	CallSub2(Callback,Event&"_ListenerDisconnected",Reason)
End Sub

'Removes the Listener
Public Sub Remove
	If IsInitialized Then
		If ws.Connected Then
			ws.Close
		End If
		IsInitialized = False
	End If
End Sub

Public Sub CollectionListen(Collection As String)
	CollectionName = Collection
	WebAppUrl = $"${WebAppUrl}?collection=${CollectionName}"$
	ws.Initialize("ws")
	ws.Connect(WebAppUrl)
	ReConnectWS
End Sub

Public Sub DocumentListen(Collection As String, Document As String)
	CollectionName = Collection
	DocumentID = Document
	WebAppUrl = $"${WebAppUrl}?collection=${CollectionName}&documentId=${DocumentID}"$
	ReConnectWS
End Sub

Private Sub ReConnectWS
	If ws.Connected Then ws.Close
	ws.Initialize("ws")
	ws.Connect(WebAppUrl)
End Sub

Private Sub CheckCollectionChanges(oldCollection As List, newCollection As List) As Object
	Dim result As Object ' Changed to Object to allow for Map or List return
    
	Dim changedDocs As List ' A list to keep track of changed documents
	changedDocs.Initialize
	
	If newCollection.IsInitialized And oldCollection.IsInitialized Then
		
	Else
		Return CreateMap()
	End If

	' Check for new data added
	If newCollection.Size > oldCollection.Size Then
		Dim addedData As List
		addedData.Initialize
		For Each newDoc As Map In newCollection
			If CollectionContainsDoc(oldCollection, newDoc) = False Then
				Dim data As Map
				data.Initialize
				data.Put("collection", CollectionName)
				data.Put("type", "ADDED")
				data.Put("id", newDoc.Get("id"))
				data.Put("data", newDoc)
				CallSub2(Callback,Event&"_CollectionChanged",data)
				addedData.Add(newDoc)
			End If
		Next
		If addedData.Size > 0 Then
			changedDocs.Add(CreateMap("AddedData": addedData))
		End If
	End If
    
	' Check for documents with different field values
	For Each oldDoc As Map In oldCollection
		Dim newDoc As Map
		newDoc = GetMatchingDoc(newCollection, oldDoc)
		If newDoc <> Null Then
			If newDoc.IsInitialized Then
				If oldDoc.Get("id") == newDoc.Get("id") Then
					If AreDocsEqual(oldDoc, newDoc) = False Then
						Dim data As Map
						data.Initialize
						data.Put("collection", CollectionName)
						data.Put("type", "MODIFIED")
						data.Put("id", newDoc.Get("id"))
						data.Put("data", newDoc)
						CallSub2(Callback,Event&"_CollectionChanged",data)
						changedDocs.Add(newDoc)
					End If
				End If
			End If
		End If
	Next
    
	' Check for deleted documents
	If oldCollection.Size > newCollection.Size Then
		For Each oldDoc As Map In oldCollection
			If CollectionContainsDoc(newCollection, oldDoc) == False Then
				Dim data As Map
				data.Initialize
				data.Put("collection", CollectionName)
				data.Put("type", "REMOVED")
				data.Put("id", oldDoc.Get("id"))
				data.Put("data", oldDoc)
				CallSub2(Callback,Event&"_CollectionChanged",data)
				changedDocs.Add(oldDoc)
			End If
		Next
	End If
    
	' Decide whether to return a map or a list based on the number of changes
	If changedDocs.Size > 1 Then
		result = changedDocs ' Return a list of changes
	Else If changedDocs.Size = 1 Then
		result = changedDocs.Get(0) ' Return the single change as a map
	Else
		result = CreateMap()
	End If
    
	Return result
End Sub


Private Sub CollectionContainsDoc(collection As List, Doc As Map) As Boolean
	For Each item As Object In collection
		If item Is Map Then
'			If doc.Get("id") == item.As(Map).Get("id") Then
			If AreDocsEqual(Doc, item) Then
				Return True
			End If
		End If
	Next
	Return False
End Sub

Private Sub GetMatchingDoc(collection As List, Doc As Map) As Map
	For Each item As Object In collection
		If item Is Map Then
			If item.As(Map).Get("id") == Doc.Get("id") Then
				Return item
			End If
		End If
	Next
	Return Null
End Sub

Private Sub AreDocsEqual(doc1 As Map, doc2 As Map) As Boolean
	If doc1 = Null Or doc2 = Null Then
		Return False ' One or both maps are not initialized
	End If
	
	If doc1.IsInitialized == False Then
		Return False
	End If
	
	If doc2.IsInitialized == False Then
		Return False
	End If
	
	If doc1.Size <> doc2.Size Then
		Return False ' Maps have different sizes, they can't be equal
	End If
	
'	If doc1.Get("id") == doc2.Get("id") Then
'		Return True ' Maps are equal
'	End If

	For Each key As String In doc1.Keys
		If doc2.ContainsKey(key) = False Then
			Return False ' Keys don't match
		End If

		Dim value1 As Object
		Dim value2 As Object
		value1 = doc1.Get(key)
		value2 = doc2.Get(key)

		If IsMap(value1) And IsMap(value2) Then
			If AreDocsEqual(value1, value2) = False Then
				Return False ' Recursively compare nested maps
			End If
		Else If IsList(value1) And IsList(value2) Then
			If AreListsEqual(value1, value2) = False Then
				Return False ' Compare lists
			End If
		Else If value1 <> value2 Then
			Return False ' Values are different
		End If
	Next

	Return True ' Maps are equal
End Sub

Private Sub AreListsEqual(list1 As List, list2 As List) As Boolean
	If list1.Size <> list2.Size Then
		Return False ' Lists have different sizes
	End If

	For i = 0 To list1.Size - 1
		Dim item1 As Object
		Dim item2 As Object
		item1 = list1.Get(i)
		item2 = list2.Get(i)

		If IsMap(item1) And IsMap(item2) Then
			If AreDocsEqual(item1, item2) = False Then
				Return False ' Recursively compare nested maps
			End If
			Else If IsList(item1) And IsList(item2) Then
			If AreListsEqual(item1, item2) = False Then
				Return False ' Recursively compare nested lists
			End If
			Else If item1 <> item2 Then
			Return False ' List items are different
		End If
	Next

	Return True ' Lists are equal
End Sub

Private Sub IsMap(Value As Object) As Boolean
	If Value Is Map Then
		Return True
	End If
	Return False
End Sub

Private Sub IsList(Value As Object) As Boolean
	Try
		If Value Is List Then
			Return True
		End If
	Catch
		Log(LastException)
		Return False
	End Try
	Return False
End Sub

Private Sub CheckDocumentChanges(oldDocument As Map, newDocument As Map) As Map
	Dim result As Map
	result.Initialize
    
	' Check for changes within the document
	Dim changedFields As Map
	changedFields.Initialize
    
	For Each key As String In oldDocument.Keys
		If newDocument.ContainsKey(key) = False Then
			' Key is missing in the new document
			changedFields.Put(key, "Removed")
			Dim data As Map
			data.Initialize
			data.Put("collection", CollectionName)
			data.Put("type", "REMOVED")
			data.Put("id", newDocument.Get("id"))
			data.Put("data", newDocument)
			CallSub2(Callback,Event&"_DocumentChanged",data)
		Else
			Dim oldValue As Object
			Dim newValue As Object
			oldValue = oldDocument.Get(key)
			newValue = newDocument.Get(key)

			If IsMap(oldValue) And IsMap(newValue) Then
				' Recursively compare nested maps
				Dim nestedChanges As Map
				nestedChanges = CheckDocumentChanges(oldValue, newValue)
				If nestedChanges.Size > 0 Then
					changedFields.Put(key, nestedChanges)
				End If
				Else If IsList(oldValue) And IsList(newValue) Then
				' Recursively compare nested lists
				Dim nestedListChanges As List
				nestedListChanges = CheckListChanges(oldValue, newValue)
				If nestedListChanges.IsInitialized And nestedListChanges.Size > 0 Then
					changedFields.Put(key, nestedListChanges)
				End If
				Else If oldValue <> newValue Then
				' Values are different
				Dim data As Map
				data.Initialize
				data.Put("collection", CollectionName)
				data.Put("type", "MODIFIED")
				data.Put("id", newDocument.Get("id"))
				data.Put("data", newDocument)
				changedFields.Put(key, "Changed")
				CallSub2(Callback,Event&"_DocumentChanged",data)
			End If
		End If
	Next
    
	' Check for new fields added in the new document
	For Each key As String In newDocument.Keys
		If oldDocument.ContainsKey(key) = False Then
			' Key is newly added in the new document
			changedFields.Put(key, "Removed")
			Dim data As Map
			data.Initialize
			data.Put("collection", CollectionName)
			data.Put("type", "ADDED")
			data.Put("id", newDocument.Get("id"))
			data.Put("data", newDocument)
			changedFields.Put(key, "Added")
			CallSub2(Callback,Event&"_DocumentChanged",data)
		End If
	Next
    
	If changedFields.Size > 0 Then
		result.Put("ChangedFields", changedFields)
	End If
	
	Return result
End Sub

Private Sub CheckListChanges(oldList As List, newList As List) As List
	Dim result As List
	result.Initialize
    
	' Check for changes within the list
	For i = 0 To Min(oldList.Size, newList.Size) - 1
		Dim oldItem As Object
		Dim newItem As Object
		oldItem = oldList.Get(i)
		newItem = newList.Get(i)

		If IsMap(oldItem) And IsMap(newItem) Then
			' Recursively compare nested maps
			Dim nestedChanges As Map
			nestedChanges = CheckDocumentChanges(oldItem, newItem)
			If nestedChanges.Size > 0 Then
				result.Add(nestedChanges)
			End If
			Else If IsList(oldItem) And IsList(newItem) Then
			' Recursively compare nested lists
			Dim nestedListChanges As List
			nestedListChanges = CheckListChanges(oldItem, newItem)
			If nestedListChanges.Size > 0 Then
				result.Add(nestedListChanges)
			End If
			Else If oldItem <> newItem Then
			' Values are different
			result.Add("Changed")
		End If
	Next
    
	' Check for items added in the new list
	For i = oldList.Size To newList.Size - 1
		result.Add("Added")
	Next
    
	' Check for items removed from the old list
	For i = newList.Size To oldList.Size - 1
		result.Add("Removed")
	Next
    
	Return result
End Sub
