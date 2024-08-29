B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Service
Version=9.85
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: False
	#ExcludeFromLibrary: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Public rp As RuntimePermissions
	'''Public customers As SQL
	Public Results As List
	'''Public kvs As KeyValueStore
	Public PictureTaken As Boolean = False
	Private CurrentDBVersion As Int = 0
	Private db As DBTransactions
	Private TABLEUPDATED As Boolean = False
	Public userName As String
	Public pinNumber As String
	Public pictureNumber As Int = 1
	Public pHeight As String
	Public sHeight As Double
	'''	Public analytics As FirebaseAnalytics
	Public SHOWONBOARD As Boolean = False
	Public SHOWONBOARD2 As Boolean = False
	Public HIP_WIDTH As String
	Public SHOULDER_WIDTH As String
	Public HEIGHT As String
	Public ELBOW_HEIGHT As String
	Public LUMBAR_HEIGHT As String
	Public BUTTOCKS_HEIGHT As String
	Public KNEE_HEIGHT As String
	
'''	Public mysql As JdbcSQL
'''	Private driver As String = "com.mysql.jdbc.Driver"
'''	Private jdbcUrl As String = "jdbc:mysql://68.178.247.43/Strom_Ergonomics"
'''	Private userNamedb As String = "stromergo2022"
'''	Private Passworddb As String = "NVeX({?9}DZd"'
	'''Public fb As FirebaseAnalytics
End Sub

Sub Service_Create
	'This is the program entry point.
	'This is a good place to load resources that are not specific to a single activity.
	'''kvs.Initialize(File.DirInternal, "cachedData")
End Sub

Sub Service_Start (StartingIntent As Intent)
	DisableStrictMode
	'''fb.Initialize
'	Dim DBVersion As Int
'	'''	wait for (GetDBVersion) Complete (version As Int)
'	Dim rs As ResumableSub = GetDBVersion
'	Wait For(rs) Complete (version As Int)
'	DBVersion = version
'	Log("read DBVersion: " & version)
'	CurrentDBVersion = 6
'	Do While DBVersion < CurrentDBVersion
'		Select DBVersion
'			Case 1
'				If TABLEUPDATED = False Then
'					UpdateDB1_2
'				End If
'			Case 2
'				If TABLEUPDATED = False Then
'					UpdateDB1_3
'				End If
'			Case 3
'				If TABLEUPDATED = False Then
'					UpdateDB1_4
'				End If
'			Case 4
'				If TABLEUPDATED = False Then
'					UpdateDB1_5
'				End If
'			Case 5
'				If TABLEUPDATED = False Then
'					UpdateDB1_6
'				End If
'				''Common.UpdateDB1_3(Common.SQL1)
'		End Select
'		'''DBVersion = GetDBVersion
'		Dim rs As ResumableSub = GetDBVersion
'		Wait For(rs) Complete (version As Int)
'		Log("read DBVersion: " & version)
'		DBVersion = version
'	Loop
'''	If kvs.ContainsKey("FIRSTTIMEUSER") = True Then
'''		If kvs.Get("FIRSTTIMEUSER") = True Then
'''			SHOWONBOARD = True
'''		Else
'''			SHOWONBOARD = False
'''		End If
'''	End If
	Service.StopAutomaticForeground 'Starter service can start in the foreground state in some edge cases.
End Sub

Sub Service_TaskRemoved
	'This event will be raised when the user removes the app from the recent apps list.
End Sub

'Return true to allow the OS default exceptions handler to handle the uncaught exception.
Sub Application_Error (Error As Exception, StackTrace As String) As Boolean
	Return True
End Sub

Sub Service_Destroy

End Sub

'''Sub Connect As ResumableSub
'''	Common.mysql.InitializeAsync("mysql", Common.driver, Common.jdbcUrl, Common.userName, Common.Password)
'''	Wait For MySQL_Ready (Success As Boolean)
'''	If Success = False Then
'''		Log("Check unfiltered logs for JDBC errors.")
'''	End If
'''	Return Success
'''End Sub
'''
'''Sub CloseConnection
'''	Common.mysql.Close
'''End Sub

Sub DisableStrictMode
	Dim jo As JavaObject
	jo.InitializeStatic("android.os.Build.VERSION")
	If jo.GetField("SDK_INT") > 9 Then
		Dim policy As JavaObject
		policy = policy.InitializeNewInstance("android.os.StrictMode.ThreadPolicy.Builder", Null)
		policy = policy.RunMethodJO("permitAll", Null).RunMethodJO("build", Null)
		Dim sm As JavaObject
		sm.InitializeStatic("android.os.StrictMode").RunMethod("setThreadPolicy", Array(policy))
	End If
End Sub

'''Sub Connect As ResumableSub
'''	mysql.InitializeAsync("mysql", driver, jdbcUrl, userNamedb, Passworddb)
'''	Wait For MySQL_Ready (Success As Boolean)
'''	If Success = False Then
'''		Log("Check unfiltered logs for JDBC errors.")
'''	End If
'''	Return Success
'''End Sub
'''
'''Sub CloseConnection
'''	mysql.Close
'''End Sub

Sub GetDBVersion As ResumableSub
	Dim version As Int
	Dim count As Int
	Dim query As String = "SELECT count(*) FROM version"
'''	Wait For (Connect) Complete (Success As Boolean)
'''	Log("connected to db:  " & Success)
'''
	'''	count = mysql.ExecQuerySingleResult(query)
	db.Initialize(Me)
	db.ExecuteRemoteQuery(query, "UPDATETABLE")
	wait for QueryResults(Results2 As List)
	For i = 0 To Results2.Size - 1
		Dim m As Map
		m = Results2.Get(i)
		'''		Log("m: " & m.GetKeyAt(0) & " -- " & m.GetValueAt(0))
		Try
			count = m.Get("count(*)")
		Catch
			count = 0
		End Try
		'''exists = m.Get("count(*)")
	Next
	'''count = mSQL.ExecQuerySingleResult("SELECT count(*) FROM sqlite_master WHERE Type='table' AND name='version'")
	If count > 0 And count < 2 Then
		Dim query As String = "SELECT * FROM version"
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", query, Null)
'''		Wait For (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		If Success Then
'''			Do While rs.NextRow
'''				''Log(rs.GetInt2(0))
'''				version = rs.GetInt("version")
'''			Loop
'''			rs.Close
'''		Else
'''			Log(LastException)
		'''		End If
		Dim query2 As String = "SELECT * FROM version"
		db.ExecuteRemoteQuery(query2, "GETVERSION")
		wait for QueryResults(Results2 As List)
		For i = 0 To Results2.Size - 1
			Dim m As Map
			m = Results2.Get(i)
			version = m.GetDefault("version", 5)
			'''exists = m.Get("count(*)")
		Next
	End If
	
	Return version
End Sub

'Sets the database version to the given version number.
Sub SetDBVersion (Version As Int)
	Log("setting db version to: " & Version)
	db.ExecuteRemoteQuery("UPDATE version SET version = " & "'"&Version&"'", "UPDATETABLE")
'''	Dim sf As Object = mysql.ExecQueryAsync("mysql", "UPDATE version SET version = " & "'"&Version&"'", Null)
'''	wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''	If Success Then
'''	Log("version table updated to version: " & Version)
'''	End If
	'''wait for QueryResults(Results2 As List)
	'''Log("updated version to : " & Results2)
End Sub

''Sub UpdateDB1_2(sq As SQL)
''	sq.ExecNonQuery("ALTER TABLE inbox ADD COLUMN isUUID INTEGER")
''	SetDBVersion(sq, 1)
''	Log("updating to DBVersion 1...")
''End Sub

Sub UpdateDB1_2
	Try
		Dim query As String
		query = "ALTER TABLE Registrations ADD COLUMN CUSTOMERHEIGHT TEXT"
		db.ExecuteRemoteQuery(query, "UPDATETABLE")
		db. ExecuteRemoteQuery("ALTER TABLE Registrations ADD COLUMN HEIGHT TEXT", "UPDATETABLE")
		db.ExecuteRemoteQuery("ALTER TABLE Registrations ADD COLUMN HIPWIDTH TEXT", "UPDATETABLE")
		db.ExecuteRemoteQuery("ALTER TABLE Registrations ADD COLUMN ELBOWWIDTH TEXT", "UPDATETABLE")
		db.ExecuteRemoteQuery("ALTER TABLE Registrations ADD COLUMN KNEEHEIGHT TEXT", "UPDATETABLE")
		db.ExecuteRemoteQuery("ALTER TABLE Registrations ADD COLUMN BUTTOCKSHEIGHT TEXT", "UPDATETABLE")
		db.ExecuteRemoteQuery("ALTER TABLE Registrations ADD COLUMN LUMBARHEIGHT TEXT", "UPDATETABLE")
		db.ExecuteRemoteQuery("ALTER TABLE Registrations ADD COLUMN ELBOWHEIGHT TEXT", "UPDATETABLE")
		db.ExecuteRemoteQuery("ALTER TABLE Registrations ADD COLUMN FRONTIMAGE LONGBLOB", "UPDATETABLE")
		db.ExecuteRemoteQuery("ALTER TABLE Registrations ADD COLUMN SIDEIMAGE LONGBLOB", "UPDATETABLE")
		SetDBVersion(2)
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", query, Null)
'''		Wait For (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		If Success Then Log("updated Registrations table")
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", "ALTER TABLE Registrations ADD COLUMN HEIGHT TEXT", Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", "ALTER TABLE Registrations ADD COLUMN HIPWIDTH TEXT", Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", "ALTER TABLE Registrations ADD COLUMN ELBOWWIDTH TEXT", Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", "ALTER TABLE Registrations ADD COLUMN KNEEHEIGHT TEXT", Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", "ALTER TABLE Registrations ADD COLUMN BUTTOCKSHEIGHT TEXT", Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", "ALTER TABLE Registrations ADD COLUMN LUMBARHEIGHT TEXT", Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", "ALTER TABLE Registrations ADD COLUMN ELBOWHEIGHT TEXT", Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", "ALTER TABLE Registrations ADD COLUMN FRONTIMAGE LONGBLOB", Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''		Dim sf As Object = mysql.ExecQueryAsync("mysql", "ALTER TABLE Registrations ADD COLUMN SIDEIMAGE LONGBLOB", Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
		Log("updating to DBVersion 2...")
		SetDBVersion(2)
	Catch
		LogColor("columns probably already exists", Colors.Red)
	End Try
	TABLEUPDATED = True
End Sub

Sub UpdateDB1_3
	'''ALTER TABLE table_name CHANGE COLUMN column_name column_name data_type AFTER another_column_name;
	Try
		Dim query As String
		query = "ALTER TABLE Registrations ADD COLUMN EMAIL TEXT"
		db.ExecuteRemoteQuery(query, "UPDATETABLE")
		'''wait for QueryResults(Results2 As List)
		'''Log("Added email table: " & Results2)
		Sleep(1000)
		Dim query As String
		query = "ALTER TABLE Registrations MODIFY COLUMN EMAIL TEXT AFTER LastName"
		db.ExecuteRemoteQuery(query, "UPDATETABLE")
		'''wait for QueryResults(Results2 As List)
		'''Log("moved email table to after LastName")
		SetDBVersion(3)
		Log("updating to DBVersion 3...")
	Catch
		'''TABLEUPDATED = True
		Log(LastException)
	End Try
	TABLEUPDATED = True
End Sub

Sub UpdateDB1_4
	'''ALTER TABLE table_name CHANGE COLUMN column_name column_name data_type AFTER another_column_name;
	Try
		Dim CREATE_STATEMENT As String
		CREATE_STATEMENT = "CREATE TABLE IF NOT EXISTS PASSWORD_RESET (Record INT AUTO_INCREMENT, email TEXT, token TEXT, expirationdate INT, PRIMARY KEY (Record))"
		db.ExecuteRemoteQuery(CREATE_STATEMENT, "CREATETABLE")
		'''wait for QueryResults(Results2 As List)
		'''Log("Added email table: " & Results2)
		Sleep(1000)
		SetDBVersion(4)
		Log("updating to DBVersion 4...")
	Catch
		'''TABLEUPDATED = True
		Log(LastException)
	End Try
	TABLEUPDATED = True
End Sub

Sub UpdateDB1_5
	'''ALTER TABLE table_name CHANGE COLUMN column_name column_name data_type AFTER another_column_name;
	Try
		Dim query As String
		query = "ALTER TABLE ManualSettings ADD COLUMN EMAIL TEXT"
		db.ExecuteRemoteQuery(query, "UPDATETABLE")
		'''wait for QueryResults(Results2 As List)
		'''Log("Added email table: " & Results2)
		Sleep(1000)
		Dim query As String
		query = "ALTER TABLE ManualSettings MODIFY COLUMN EMAIL TEXT AFTER UserName"
		db.ExecuteRemoteQuery(query, "UPDATETABLE")
		'''wait for QueryResults(Results2 As List)
		'''Log("moved email table to after LastName")
		SetDBVersion(5)
		Log("updating to DBVersion 5...")
	Catch
		'''TABLEUPDATED = True
		Log(LastException)
	End Try
	TABLEUPDATED = True
End Sub

Sub UpdateDB1_6
	'''ALTER TABLE table_name CHANGE COLUMN column_name column_name data_type AFTER another_column_name;
	Try
		Dim CREATE_STATEMENT As String
		CREATE_STATEMENT = "CREATE TABLE IF NOT EXISTS SeatDepthCompensation (Record INT AUTO_INCREMENT, Seat_Depth DOUBLE, Negative_Tilt DOUBLE, Neutral_Tilt INT, Positive_Tilt DOUBLE, PRIMARY KEY (Record))"
		db.ExecuteRemoteQuery(CREATE_STATEMENT, "CREATETABLE")
		wait for QueryResults(Results2 As List)
		LogColor("updated table: " & Results2, Colors.Red)
		'''Log("Added email table: " & Results2)
		Sleep(1000)
		SetDBVersion(6)
		Log("updating to DBVersion 6...")
	Catch
		'''TABLEUPDATED = True
		Log("Error: " & LastException)
	End Try
	TABLEUPDATED = True
End Sub
