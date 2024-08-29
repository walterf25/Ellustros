B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.5
@EndOfDesignText@
Sub Class_Globals
	Private QueryMap As Map
	Private FieldsList,OrderList As List
	Public SubCollection As String = ""
	
	Public Const DESCENDING As String = "DESCENDING"
	Public Const ASCENDING As String = "ASCENDING"
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize As Query
	QueryMap.Initialize
	FieldsList.Initialize
	OrderList.Initialize
	Return Me
End Sub

'Adds a projection
Public Sub AddField(Field As String) As Query
	FieldsList.add(CreateMap("fieldPath":Field))
	Return Me
End Sub

'Add multiple projections
Public Sub AddFields(Fields As List) As Query
	For i = 0 To Fields.Size-1
		Dim Field As String = Fields.Get(i)
		FieldsList.Add(CreateMap("fieldPath":Field))
	Next
	Return Me
End Sub

'The projection to return.
'After using AddField or AddFields
Private Sub SelectFields As Query
	Dim SelectMap As Map:SelectMap.Initialize
	If FieldsList.Size > 0 Then
		SelectMap.Put("fields",FieldsList)
	End If
	If OrderList.Size > 0 Then
		QueryMap.Put("orderBy",OrderList)
	End If
	If SelectMap.Size > 0 Then
		QueryMap.Put("select",SelectMap)
	End If
	Return Me
End Sub

'The order to apply to the query results.
Public Sub OrderBy(Field As String, Direction As String) As Query
	Dim OrderMap As Map:OrderMap.Initialize
	OrderMap.Put("field",CreateMap("fieldPath":Field))
	OrderMap.Put("direction",Direction)
	OrderList.Add(OrderMap)
	Return Me
End Sub

'The collections to query.
Public Sub From(CollectionPath As String) As Query
	SelectFields
	Dim FromList As List:FromList.Initialize
	FromList.add(CreateMap("collectionId":CollectionPath))
	QueryMap.Put("from",FromList)
	Return Me
End Sub

'Location of sub collection.
Public Sub CollectionIn(DocumentPath As PathBuilder) As Query
	SubCollection = DocumentPath.Complete
	Return Me
End Sub

'A potential prefix of a position in the result set to start the query at.
Public Sub StartAt(Values As List) As Query
	Dim Start As Map
	Dim NewValues As List
	NewValues.Initialize
	Start.Initialize
	For i = 0  To Values.Size-1
		Dim item As Object = Values.Get(i)
		NewValues.Add(FirestoreUtils.CreateFirestoreValue(item))
	Next
	Start.Put("values",NewValues)
	QueryMap.Put("startAt",Start)
	Return Me
End Sub

'A potential prefix of a position in the result set to end the query at.
Public Sub EndAt(Values As List) As Query
	Dim Start As Map
	Dim NewValues As List
	NewValues.Initialize
	Start.Initialize
	For i = 0  To Values.Size-1
		Dim item As Object = Values.Get(i)
		NewValues.Add(FirestoreUtils.CreateFirestoreValue(item))
	Next
	Start.Put("values",NewValues)
	QueryMap.Put("endAt",Start)
	Return Me
End Sub

'The number of documents to skip before returning the first result.
Public Sub Offset(Position As Int) As Query
	QueryMap.Put("offset",Position)
	Return Me
End Sub

'The maximum number of results to return.
'The value must be greater than or equal to zero if specified.
Public Sub Limit(LimitBy As Int) As Query
	QueryMap.Put("limit",LimitBy)
	Return Me
End Sub

'The filter to apply.
Public Sub Where(Filter As CompositeFilter) As Query
	QueryMap.Put("where",CreateMap("compositeFilter":Filter.Complete))
	Return Me
End Sub

'The filter to apply.
Public Sub Where2(Filter As FieldFilter) As Query
	QueryMap.Put("where",Filter.Complete)
	Return Me
End Sub

'The filter to apply.
Public Sub Where3(Filter As UnaryFilter) As Query
	QueryMap.Put("where",CreateMap("unaryFilter":Filter.Complete))
	Return Me
End Sub

'Complete preparing the Query
Public Sub Complete As Map
	If QueryMap.Size > 0 Then
		Return CreateMap("structuredQuery": QueryMap)
	Else
		Return CreateMap()
	End If
End Sub