B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.5
@EndOfDesignText@
Sub Class_Globals
	Private Filters As List
	'Operators
	Private Const LESS_THAN As String = "LESS_THAN"
	Private Const LESS_THAN_OR_EQUAL As String = "LESS_THAN_OR_EQUAL"
	Private Const GREATER_THAN As String = "GREATER_THAN"
	Private Const GREATER_THAN_OR_EQUAL As String = "GREATER_THAN_OR_EQUAL"
	Private Const EQUAL As String = "EQUAL"
	Private Const NOT_EQUAL As String = "NOT_EQUAL"
	Private Const ARRAY_CONTAINS As String = "ARRAY_CONTAINS"
	Private Const ARRAY_CONTAINS_ANY As String = "ARRAY_CONTAINS_ANY"
	Private Const NOT_IN As String = "NOT_IN"
	Private Const IN As String = "IN"
End Sub

'Initializes the FieldFilter
'A filter on a specific field.
Public Sub Initialize As FieldFilter
	Filters.Initialize
	Return Me
End Sub
	
'The given field Is equal To at least one value IN the given Array.
'Requires:
'That value Is a non-empty ArrayValue with at most 10 values.
'No other IN Or ARRAY_CONTAINS_ANY Or NOT_IN.
Public Sub IsIn(Field As String, Value As List) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",IN)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub
	
	
'The Value of the Field Is Not in the given Array.
'Requires:
'That Value Is a non-empty ArrayValue with at most 10 values.
'No other IN, ARRAY_CONTAINS_ANY, NOT_IN, NOT_EQUAL, IS_NOT_NULL, Or IS_NOT_NAN.
'That Field comes first in the orderBy.
Public Sub NotIn(Field As String, Value As List) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",NOT_IN)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub

'The given Field Is an Array that CONTAINS any of the values IN the given Array.
'Requires:
'That Value Is a non-empty ArrayValue with at most 10 values.
'No other IN Or ARRAY_CONTAINS_ANY Or NOT_IN.
Public Sub ArrayContainsAny(Field As String, Value As Object) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",ARRAY_CONTAINS_ANY)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub

'The given Field Is equal To at least one Value IN the given Array.
'Requires:
'That Value Is a non-empty ArrayValue with at most 10 values.
'No other IN Or ARRAY_CONTAINS_ANY Or NOT_IN.
Public Sub ArrayContains(Field As String, Value As Object) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",ARRAY_CONTAINS)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub

'The given Field Is Not EQUAL To the given Value.
'Requires:
'No other NOT_EQUAL, NOT_IN, IS_NOT_NULL, Or IS_NOT_NAN.
'That Field comes first IN the orderBy.
Public Sub NotEqual(Field As String, Value As Object) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",NOT_EQUAL)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub

'The given field is equal to the given value.
Public Sub EqualTo(Field As String, Value As Object) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",EQUAL)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub

'The given Field Is less than the given Value.
'Requires:
'That Field come first IN orderBy.
Public Sub LessThan(Field As String, Value As Object) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",LESS_THAN)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub

'The given Field Is greater than the given Value.
'Requires:
'That Field come first IN orderBy.
Public Sub GreaterThan(Field As String, Value As Object) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",GREATER_THAN)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub

'The given Field Is greater than Or EQUAL To the given Value.
'Requires:
'That Field come first IN orderBy.
Public Sub GreaterThanOrEqualTo(Field As String, Value As Object) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",GREATER_THAN_OR_EQUAL)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub

'The given Field Is less than Or EQUAL To the given Value.
'Requires:
'That Field come first IN orderBy.
Public Sub LessThanOrEqualTo(Field As String, Value As Object) As FieldFilter
	Private Filter As Map : Filter.Initialize
	Filter.Put("field",CreateMap("fieldPath":Field))
	Filter.Put("op",LESS_THAN_OR_EQUAL)
	Filter.Put("value",FirestoreUtils.CreateFirestoreValue(Value))
	Filters.Add(CreateMap("fieldFilter":Filter))
	Return Me
End Sub

'Complete preparing the Filter
Public Sub Complete As Object
'	Log("All Filters: "&Filters.Get(0))
	If Filters.Size >= 2 Then
		Return Filters
	Else
		Return Filters.Get(0)' CreateMap("fieldFilter":Filters.Get(0))
	End If
'	Return Filters
End Sub