B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=12.5
@EndOfDesignText@
'Code module
'Subs in this code module will be accessible from all modules.
Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

'Converts firestore json to Map
Public Sub ParseFirestoreJson(firestoreJson As String) As Map
	Dim normalJsonMap As Map
	Try
		Private parser As JSONParser
		parser.Initialize(firestoreJson)
		Dim doc As Map =  parser.NextObject
		Dim documentJsonMap As Map = doc.Get("document")
		Dim Name() As String = Regex.Split("/",documentJsonMap.Get("name"))
		Dim firestoreJsonMap As Map = documentJsonMap.Get("fields")
		normalJsonMap = ParseFirestoreMap(firestoreJsonMap)
		normalJsonMap.Put("id",Name(Name.Length-1))
	Catch
		Log(LastException)
	End Try
	Return normalJsonMap
End Sub

'Converts firestore json to Map
Public Sub ParseFirestoreMap(firestoreJsonMap As Map) As Map
'	Log(firestoreJsonMap)
	Dim normalJsonMap As Map : normalJsonMap.Initialize
	Try
		For Each key As String In firestoreJsonMap.Keys
			Dim value As Map = firestoreJsonMap.Get(key)
			For Each vkey As String In value.Keys
				Select key
					Case "mapValue"
						Dim mapValue As Map = firestoreJsonMap.Get("mapValue")
						Dim fields As Map = mapValue.Get("fields")
						Dim mapValues As Map : mapValues.Initialize
						For Each mapKey As String In fields.Keys
							Dim mapItem As Object = fields.Get(mapKey)
							If mapItem Is Map Then
								Dim m As Map = mapItem
								For Each mm As String In m.Keys
									mapValues.Put(mapKey, m.get(mm))
								Next
							Else
								mapValues.Put(mapKey, mapItem)
							End If
						Next
						Return mapValues
				End Select
				Select vkey
					Case "integerValue"
						normalJsonMap.Put(key, value.Get("integerValue"))
					Case "stringValue"
						normalJsonMap.Put(key, QUOTE &value.Get("stringValue")&QUOTE)
					Case "timestampValue"
						normalJsonMap.Put(key, value.Get("timestampValue"))
					Case "booleanValue"
						normalJsonMap.Put(key, value.Get("booleanValue"))
					Case "doubleValue"
						normalJsonMap.Put(key, value.Get("doubleValue"))
					Case "arrayValue"
						Dim arrayValue As Map = value.Get("arrayValue")
						Dim values As List = arrayValue.Get("values")
	'						Log(values)
						If values.IsInitialized Then
							Dim arrayValues As List : arrayValues.Initialize
							For Each item As Object In values
								If item Is Map Then
									Dim m As Map = item
									If m.ContainsKey("mapValue") Then
										Dim JString As JSONGenerator
										JString.Initialize(m)
										arrayValues.Add(ParseFirestoreMap(m))
									Else
										Dim m As Map = item
										For Each mm As String In m.Keys
											arrayValues.Add(m.get(mm))
										Next
									End If
								Else
									arrayValues.Add(item)
								End If
							Next
							normalJsonMap.Put(key, arrayValues)
						End If
					Case "mapValue"
						Dim mapValue As Map = value.Get("mapValue")
						Dim fields As Map = mapValue.Get("fields")
						Dim mapValues As Map : mapValues.Initialize
						For Each mapKey As String In fields.Keys
							Dim mapItem As Object = fields.Get(mapKey)
							If mapItem Is Map Then
								Dim m As Map = mapItem
								For Each mm As String In m.Keys
									mapValues.Put(mapKey, m.get(mm))
								Next
							Else
								mapValues.Put(mapKey, mapItem)
							End If
						Next
						normalJsonMap.Put(key, mapValues)
				End Select
			Next
		Next
	Catch
		Log(LastException)
	End Try
	Return normalJsonMap
End Sub

'Converts a Map to Firestore JSON format
Public Sub CreateFirestoreMap(normalJsonMap As Map) As Map
	Dim firestoreJsonMap As Map : firestoreJsonMap.Initialize
	Try
		For Each key As String In normalJsonMap.Keys
			Dim value As Object = normalJsonMap.Get(key)
			If value Is Map Then
				Dim mapValue As Map = CreateMap("fields": CreateFirestoreMap(value))
				firestoreJsonMap.Put(key, CreateMap("mapValue": mapValue))
			Else If value Is List Then
				Dim listValue As List = value
				Dim arrayValues As List : arrayValues.Initialize
				For Each item As Object In listValue
					If item Is Map Then
						Dim mapValue As Map = CreateMap("fields": CreateFirestoreMap(item))
						arrayValues.Add(CreateMap("mapValue": mapValue))
					Else
						If item <> Null Then
						Select GetType(item)
							#if b4i
							Case "__NSCFString", "NSTaggedPointerString"
								arrayValues.Add(CreateMap("stringValue": item))
							Case "__NSCFBoolean"
								arrayValues.Add(CreateMap("booleanValue": item))
							Case "__NSCFNumber"
								arrayValues.Add(CreateMap("doubleValue": item))
							Case "__NSCFNumber"
								arrayValues.Add(CreateMap("integerValue": item))
							Case Else
								arrayValues.Add(item)
						#Else If b4a or b4j
							Case "java.lang.Integer"
								arrayValues.Add(CreateMap("integerValue": item))
							Case "java.lang.Long"
								arrayValues.Add(CreateMap("integerValue": item))
							Case "java.lang.String"
								arrayValues.Add(CreateMap("stringValue": item))
							Case "java.lang.Boolean"
								arrayValues.Add(CreateMap("booleanValue": item))
							Case "java.lang.Double"
								arrayValues.Add(CreateMap("doubleValue": item))
							Case Else
								arrayValues.Add(item)
						#End If
						End Select
					End If
					End If
				Next
				firestoreJsonMap.Put(key, CreateMap("arrayValue": CreateMap("values": arrayValues)))
			Else
				If value <> Null Then
					Select GetType(value)
						#if b4i
							Case "__NSCFString", "NSTaggedPointerString"
								firestoreJsonMap.Put(key, CreateMap("stringValue": value))
							Case "__NSCFBoolean"
								firestoreJsonMap.Put(key, CreateMap("booleanValue": value))
							Case "__NSCFNumber"
								firestoreJsonMap.Put(key, CreateMap("doubleValue": value))
							Case "__NSCFNumber"
								firestoreJsonMap.Put(key, CreateMap("integerValue": value))
						#Else If b4a or b4j
						Case "java.lang.Integer"
							firestoreJsonMap.Put(key, CreateMap("integerValue": value))
						Case "java.lang.Long"
							firestoreJsonMap.Put(key, CreateMap("integerValue": value))
						Case "java.lang.String"
							firestoreJsonMap.Put(key, CreateMap("stringValue": value))
						Case "java.lang.Boolean"
							firestoreJsonMap.Put(key, CreateMap("booleanValue": value))
						Case "java.lang.Double"
							firestoreJsonMap.Put(key, CreateMap("doubleValue": value))
						Case "java.lang.Float"
							firestoreJsonMap.Put(key, CreateMap("doubleValue": value))
					#End If
					End Select
				End If
			End If
		Next
	Catch
		Log(LastException)
	End Try
	Return firestoreJsonMap
End Sub

'Converts a value to Firestore format
'<code>
'Dim map As Map = CreateFirestoreValue("Hello")
'</code>
'Returns: {"stringValue": "Hello"}
Public Sub CreateFirestoreValue(Value As Object) As Map
'	Log("CreateFirestoreValue")
'	Log(Value)
'	Log(GetType(Value))
	Dim firestoreJsonMap As Map : firestoreJsonMap.Initialize
'	Log(GetType(firestoreJsonMap))
'	Try
	If GetType(Value) == "anywheresoftware.b4a.objects.collections.Map$MyMap" Or _
		Value Is Map Then
		Dim mapValue As Map = CreateMap("fields": CreateFirestoreMap(Value))
		firestoreJsonMap = CreateMap("mapValue": mapValue)
	Else If GetType(Value) == "java.util.ArrayList" Or _
		 GetType(Value) == "java.util.Arrays$ArrayList" Or _
		 Value Is List Then
		Dim listValue As List = Value
		Dim arrayValues As List : arrayValues.Initialize
		For Each item As Object In listValue
			If item Is Map Then
				Dim mapValue As Map = CreateMap("fields": CreateFirestoreMap(item))
				arrayValues.Add(CreateMap("mapValue": mapValue))
			Else
				Select GetType(item)
					#if b4i
						Case "__NSCFString", "NSTaggedPointerString"
								arrayValues.Add(CreateMap("stringValue": item))
							Case "__NSCFBoolean"
								arrayValues.Add(CreateMap("booleanValue": item))
							Case "__NSCFNumber"
								arrayValues.Add(CreateMap("doubleValue": item))
							Case "__NSCFNumber"
								arrayValues.Add(CreateMap("integerValue": item))
							Case Else
								arrayValues.Add(item)
						#Else If b4a or b4j
					Case "java.lang.Integer"
						arrayValues.Add(CreateMap("integerValue": item))
					Case "java.lang.Long"
						arrayValues.Add(CreateMap("integerValue": item))
					Case "java.lang.String"
						arrayValues.Add(CreateMap("stringValue": item))
					Case "java.lang.Boolean"
						arrayValues.Add(CreateMap("booleanValue": item))
					Case "java.lang.Double"
						arrayValues.Add(CreateMap("doubleValue": item))
					Case Else
						arrayValues.Add(item)
						#End If
				End Select
			End If
		Next
		firestoreJsonMap = CreateMap("arrayValue": CreateMap("values": arrayValues))
	Else
		Select GetType(Value)
				#if b4i
					Case "__NSCFString", "NSTaggedPointerString"
						firestoreJsonMap = CreateMap("stringValue": value)
					Case "__NSCFBoolean"
						firestoreJsonMap = CreateMap("booleanValue": value)
					Case "__NSCFNumber"
						firestoreJsonMap = CreateMap("doubleValue": value)
					Case "__NSCFNumber"
						firestoreJsonMap = CreateMap("integerValue": value)
				#Else If b4a or b4j
			Case "java.lang.Integer"
				firestoreJsonMap = CreateMap("integerValue": Value)
			Case "java.lang.Long"
				firestoreJsonMap = CreateMap("integerValue": Value)
			Case "java.lang.String"
				firestoreJsonMap = CreateMap("stringValue": Value)
			Case "java.lang.Boolean"
				firestoreJsonMap = CreateMap("booleanValue": Value)
			Case "java.lang.Double"
				firestoreJsonMap = CreateMap("doubleValue": Value)
			Case "java.lang.Float"
				firestoreJsonMap = CreateMap("doubleValue": Value)
				#End If
		End Select
	End If
'	Catch
'		Log(LastException)
'	End Try
	Return firestoreJsonMap
End Sub
