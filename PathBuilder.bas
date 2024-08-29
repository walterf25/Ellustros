B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.5
@EndOfDesignText@
private Sub Class_Globals
	Private pathurl As String
End Sub

Public Sub Initialize As PathBuilder
	Return Me
End Sub

'Appends a string to the path
Public Sub Append(path As String) As PathBuilder
	If pathurl <> "" Then
		pathurl = pathurl & "/" & path
	Else
		pathurl = path
	End If
	Return Me
End Sub

'Appends a string to the path
'Helps to indicate its a collection
Public Sub Collection(path As String) As PathBuilder
	If pathurl <> "" Then
		pathurl = pathurl & "/" & path
	Else
		pathurl = path
	End If
	Return Me
End Sub

'Appends a string to the path
'Helps to indicate its a document
Public Sub Document(path As String) As PathBuilder
	If pathurl <> "" Then
		pathurl = pathurl & "/" & path
	Else
		pathurl = path
	End If
	Return Me
End Sub

'Complete preparing the Path
Public Sub Complete As String
	Return pathurl
End Sub