B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=10
@EndOfDesignText@
Sub Class_Globals
	Private Customers As String = "CUSTOMERS"
	Private SEARCH As String = "SEARCH"
	Private EXISTS As String = "EXISTS"
	Private COUNT As String = "COUNT"
	Private INSERT As String = "INSERT"
	Private UPDATE As String = "UPDATE"
	Private LOGIN As String = "LOGIN"
	Private UPDATETABLE As String = "UPDATETABLE"
	Private GETVERSION As String = "GETVERSION"
	Private CREATETABLE As String = "CREATETABLE"
	Private SELECTCOLUMNS As String = "SELECTCOLUMNS"
	Private mCallBack As Object
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(callback As Object)
	mCallBack = callback
End Sub

Public Sub ExecuteRemoteQuery(Query As String, JobName As String)
	Try
	Dim Job As HttpJob
	Job.Initialize(JobName, Me)
		Log("query: " & "https://www.stromergonomics.com/stromdb.php?db=" & Query)
	Job.PostString("https://www.stromergonomics.com/stromdb.php?db=", Query)
	'''Job.PostString("http://68.178.247.43/stromdb.php", Query)
	Catch
		Log("Error executing RemoteQuery")
	End Try
End Sub

#IgnoreWarnings: 7
Private Sub JobDone(Job As HttpJob)
	If Job.Success Then
		Dim res As String = Job.GetString
		Dim parser As JSONParser
		Log("response: " & res)
		'''File.WriteString(Starter.rp.GetSafeDirDefaultExternal(""), "responseError.txt", res)
		parser.Initialize(res)
		Select Job.JobName
			Case Customers
				
			Case SEARCH
				
			Case EXISTS
				Dim l As List
				l = parser.NextArray
				LogColor("Record Exists: " & l, Colors.Blue)
				Starter.Results = l
				CallSubDelayed2(mCallBack, "QueryResults", Starter.results)
			Case COUNT
				
			Case INSERT
				If res.Contains("true") Then
					Dim l As List
					l.Initialize
					l.Add(CreateMap("RecordInserted": res))
					LogColor("INSERT: " & l, Colors.Blue)
					Starter.Results = l
					CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
				Else
				Try
				Dim l As List
				l = parser.NextArray
				LogColor("INSERT: " & l, Colors.Blue)
				Starter.Results = l
				CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
				Catch
					Log("Error evaluating response from Server")
'''					Starter.Results.Initialize
					CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
				End Try
				End If
			Case UPDATE
				If res.Contains("true") Then
				Dim l As List
				l.Initialize
				l.Add(CreateMap("RecordUpdated": res))
				LogColor("UPDATE: " & l, Colors.Blue)
				Starter.Results = l
				CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
				Else
				Dim l As List
				l = parser.NextArray
				LogColor("UPDATE: " & l, Colors.Blue)
				Starter.Results = l
				CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
				End If
			Case LOGIN
				Dim l As List
				l = parser.NextArray
				LogColor("Login: " & l, Colors.Blue)
				Starter.Results = l
				CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
			Case UPDATETABLE
				Dim l As List
				l = parser.NextArray
				LogColor("UPDATETABLE: " & l, Colors.Blue)
				Starter.Results = l
				CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
			Case GETVERSION
				Dim l As List
				l = parser.NextArray
				LogColor("GETVERSION: " & l, Colors.Blue)
				Starter.Results = l
				CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
			Case CREATETABLE
				Dim l As List
				l = parser.NextArray
				LogColor("CREATETABLE: " & l, Colors.Blue)
				Starter.Results = l
				CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
			Case SELECTCOLUMNS
				Dim l As List
				l = parser.NextArray
				LogColor("SELECT COLUMNS: " & l, Colors.Blue)
				Starter.Results = l
				CallSubDelayed2(mCallBack, "QueryResults", Starter.Results)
		End Select
	Else
		'''ToastMessageShow("Error: " & Job.ErrorMessage, True)
		Log("Error: " & Job.ErrorMessage)
	End If
	Job.Release
End Sub