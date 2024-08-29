B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.5
@EndOfDesignText@
Sub Class_Globals	
	Private Filter As Map
	Public Const IN As String = "IN"
	Public Const CONTAINS As String = "CONTAINS"
	Public Const IS_NOT_NAN As String = "IS_NOT_NAN"
	Public Const IS_NOT_NULL As String = "IS_NOT_NULL"
End Sub

'Initializes the UnaryFilter
'A Filter with a single operand.
Public Sub Initialize As UnaryFilter
	Filter.Initialize
	Return Me
End Sub

'A unary operator.
Public Sub SetOperator(Operator As String)As UnaryFilter
	Filter.Put("op",Operator)
	Return Me
End Sub

'The field to which to apply the operator.
Public Sub SetField(Field As String) As UnaryFilter
	Filter.Put("field",CreateMap("fieldPath":Field))
	Return Me
End Sub

'Complete preparing the Filter
Public Sub Complete As Map
	Return Filter
End Sub