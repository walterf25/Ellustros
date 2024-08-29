B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.5
@EndOfDesignText@
Sub Class_Globals
	Private xui As XUI
	Private CompositeMap As Map
End Sub

'Initializes the CompositeFilter
'A filter that merges multiple other filters using the given operator.
Public Sub Initialize As CompositeFilter
	CompositeMap.Initialize
	Return Me
End Sub

'Composite Fileter with AND Operator
Public Sub Filters(Filter As FieldFilter) As CompositeFilter
	If CompositeMap.Size > 0 Then
		LogColor("CompositeFilter already set",xui.Color_Red)
	Else
		CompositeMap.Put("op","AND")
		CompositeMap.Put("filters",Filter.Complete)
	End If
	Return Me
End Sub

'Composite Fileter with OR Operator
Public Sub Filters2(Filter As FieldFilter) As CompositeFilter
	If CompositeMap.Size > 0 Then
		LogColor("CompositeFilter already set",xui.Color_Red)
	Else
		CompositeMap.Put("op","OR")
		CompositeMap.Put("filters",Filter.Complete)
	End If
	Return Me
End Sub

'Completes the CompositeFilter
Public Sub Complete As Map
	If CompositeMap.Size > 0 Then		
		Return CompositeMap
	Else
		Return CreateMap()
	End If
End Sub