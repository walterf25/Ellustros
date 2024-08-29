B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private lblTitle As B4XView
	Private pnlHeight As B4XView
	Private lblHeight As B4XView
	Private lblHeightValue As B4XView
	Private pnlSeatDepth As B4XView
	Private lblSeatDepth As B4XView
	Private lblSeatDepthValue As B4XView
	Private pnlArmRestWidth As B4XView
	Private lblArmRestWidth As B4XView
	Private lblArmRestWidthValue As B4XView
	Private pnlArmRestHeight As B4XView
	Private lblArmRestHeight As B4XView
	Private lblArmRestHeightValue As B4XView
	Private pnlLumbar As B4XView
	Private lblLumbar As B4XView
	Private lblLumbarValue As B4XView
	Private pnlTilt As B4XView
	Private lblTilt As B4XView
	Private lblTiltValue As B4XView
	Private btnSetMyChair As B4XView
	Private ASBottomMenu1 As ASBottomMenu
	Private btnBack As B4XView
	
	Private height, lumbar, knee, elbow, buttocks, hip, elbowwidth, shoe, positionpref As String
	Private tiltAngle As Double
	Private progressdialog As CustomProgressDialog
	Private heightadd As Double
	Private btnOptimalChairDone As B4XView
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("optimalchair")
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.PartinglineVisible = False
	ASBottomMenu1.UnderlineVisible = False
	'''ASBottomMenu1.SelectedPageIconColor = Colors.Black
	ASBottomMenu1.MiddleButtonVisible = False
	ASBottomMenu1.BadgetColor1 = Colors.Black
	ASBottomMenu1.BadgetColor2 = Colors.Black
	ASBottomMenu1.BadgetColor4 = Colors.Black
	Dim myfont As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 30)
	Dim myfont2 As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Bold.otf"), 16)
'''	Dim cd1, cd2, cd3, cd4, cd5, cd6 As ColorDrawable
'''	cd1.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
'''	cd2.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
'''	cd3.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
'''	cd4.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
'''	cd5.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
'''	cd6.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
	
	'''	btnSetMyChair.SetBackgroundImage(LoadBitmap(File.DirAssets, "setMychair.png"))
	
	'''btnSetMyChair.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSetMyChair)
	btnSetMyChair.font = Common.btnFont
	btnSetMyChair.Text = "Set my chair to these settings."
	btnSetMyChair.TextSize = 16
	btnSetMyChair.TextColor = xui.Color_White
	
	Common.DarkGrayColor(btnOptimalChairDone)
	btnOptimalChairDone.Font = Common.btnFont
	btnOptimalChairDone.Text = "Done"
	btnOptimalChairDone.TextSize = 16
	btnOptimalChairDone.TextColor = xui.Color_White
	
	btnBack.Color = xui.Color_Transparent
'''	pnlHeight.Background = cd1
'''	pnlSeatDepth.Background = cd2
'''	pnlArmRestWidth.Background = cd3
'''	pnlArmRestHeight.Background = cd4
'''	pnlLumbar.Background = cd5
'''	pnlTilt.Background = cd6
	
	pnlHeight.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	pnlSeatDepth.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	pnlArmRestWidth.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	pnlArmRestHeight.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	pnlLumbar.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	pnlTilt.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	
	lblTitle.font = myfont
	lblTitle.Text = "Your optimal ergonomic chair" & CRLF &  "recommendations:"
	lblTitle.TextColor = xui.Color_argb(204, 28, 30, 36)
	lblTitle.TextSize = 18
	
	lblHeight.Text = "Seat height"
	lblHeight.font = myfont2
	lblHeight.TextSize = 14
	lblHeight.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	
	lblSeatDepth.font = myfont2
	lblSeatDepth.TextSize = 14
	lblSeatDepth.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblSeatDepth.Text = "Seat depth"
	
	lblArmRestWidth.font = myfont2
	lblArmRestWidth.TextSize = 14
	lblArmRestWidth.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblArmRestWidth.Text = "Armrest width"
	
	lblArmRestHeight.font = myfont2
	lblArmRestHeight.TextSize = 14
	lblArmRestHeight.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblArmRestHeight.Text = "Armrest height"
	
	lblLumbar.font = myfont2
	lblLumbar.TextSize = 14
	lblLumbar.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblLumbar.Text = "Lumbar height"
	
	lblTilt.font = myfont2
	lblTilt.TextSize = 14
	lblTilt.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblTilt.Text = "Tilt angle"
	
'''	Dim query As String = "SELECT Height, LUMBARHEIGHT, KNEEHEIGHT, ELBOWHEIGHT, BUTTOCKSHEIGHT, HIPWIDTH, ELBOWWIDTH, SHOEHEIGHT, POSITIONPREF FROM Registrations WHERE UserName = " & "'"&Starter.userName&"'" & " AND PinNumber = " & "'"&Starter.pinNumber&"'"
'''	Dim db As DBTransactions
	Dim height, lumbar, knee, elbow, buttocks, hip, elbowwidth, shoe, positionpref As String
'''	db.Initialize(Me)
	'''	ProgressDialogShow2("Retrieving chair optimal values", False)
	progressdialog.Initialize(Root, 400dip, -1, -1, "", "", Common.LightBlueColors, xui.Color_White, "DEFAULT", True)
	progressdialog.Show("Retrieving chair optimal values", xui.Color_White)
'''	db.ExecuteRemoteQuery(query, "SELECTCOLUMNS")
'''	
'''	wait for QueryResults(Results As List)
'''	Log("results size: " & Results.Size & " -- " & Results)
'''	For i = 0 To Results.Size - 1
'''		Dim m As Map
'''		m = Results.Get(i)
'''		height = m.get("Height")
'''		lumbar = m.get("LUMBARHEIGHT")
'''		knee = m.get("KNEEHEIGHT")
'''		elbow = m.get("ELBOWHEIGHT")
'''		buttocks = m.get("BUTTOCKSHEIGHT")
'''		hip = m.get("HIPWIDTH")
'''		elbowwidth = m.get("ELBOWWIDTH")
'''		shoe = m.get("SHOEHEIGHT")
	'''		positionpref = m.get("POSITIONPREF")
	'''	Next

	Dim path As PathBuilder
	path.Initialize
	path.Document("StromDB/Registrations/")
	Log("path: " & path.Complete)
	Dim fand As CompositeFilter
	Dim filter As FieldFilter
	filter.Initialize.EqualTo("UserName", Common.userName).EqualTo("PinNumber", Common.pinNumber)
	fand.Initialize.Filters(filter)
	Dim qry As Query
	qry.Initialize.From("Users").OrderBy("UserName", qry.ASCENDING).CollectionIn(path).Where(fand)
	wait for (B4XPages.MainPage.store.RunQuery(qry)) Complete(results As Map)
	Log("results: " & results)
	Dim json As JSONParser
	Dim s As String = results.Get("documents")
	Dim l As List
	If s <> "" Then
		json.Initialize(s)
		Try
			l = json.NextArray
			For Each val As Map In l
				height = val.Get("Height")
				lumbar = val.Get("LUMBARHEIGHT")
				knee = val.Get("KNEEHEIGHT")
				elbow = val.Get("ELBOWHEIGHT")
				buttocks = val.Get("BUTTOCKSHEIGHT")
				hip = val.Get("HIPWIDTH")
				elbowwidth = val.Get("ELBOWWIDTH")
				shoe = val.Get("SHOEHEIGHT")
				positionpref = val.Get("POSITIONPREF")
			Next
		Catch
			Log(LastException)
		End Try
	
	End If


	progressdialog.hide
	

	
	Dim constant As Int
	If positionpref = "Perch" Then
		constant = -5
		tiltAngle = -5
	else if positionpref = "Neutral" Then
		constant = 0
		tiltAngle = 0
	else if positionpref = "Reclined" Or positionpref = "Recline" Then
		constant = 5
		tiltAngle = 5
	End If
	
	
	'''((TAN(B$2*PI()/180))*(A3-7.14))*(-1)
	Try
	heightadd = ((Tan(constant*cPI/180))*(elbowwidth-7.14))*(-1)	
	lblHeightValue.Text = ConvertToInches(NumberFormat(knee + heightadd, 0, 2))
	lblHeightValue.font = myfont2
	lblHeightValue.TextSize = 14
	lblHeightValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblSeatDepthValue.Text = ConvertToInches(elbowwidth)
	lblSeatDepthValue.font = myfont2
	lblSeatDepthValue.TextSize = 14
	lblSeatDepthValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblArmRestWidthValue.Text = ConvertToInches(elbowwidth)
	lblArmRestWidthValue.font = myfont2
	lblArmRestWidthValue.TextSize = 14
	lblArmRestWidthValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblArmRestHeightValue.Text = ConvertToInches(NumberFormat((elbow - buttocks) + knee, 0, 2))
	lblArmRestHeightValue.font = myfont2
	lblArmRestHeightValue.TextSize = 14
	lblArmRestHeightValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblLumbarValue.Text = ConvertToInches(NumberFormat((lumbar - buttocks) + knee, 0, 2))
	lblLumbarValue.font = myfont2
	lblLumbarValue.TextSize = 14
		lblLumbarValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	Catch
		Log(LastException.Message)
	End Try
	
	'''lblButtocksKnee.Text = ConvertToInches(NumberFormat((buttocks - knee), 0, 2)) + 2.6))
	
	
	'''	If positionpref = "Perch" Then
	'''		knee = knee + 1.5
	'''		tiltAngle = 5.0
	'''	else if positionpref = "Neutral" Then
	'''		knee = knee
	'''		tiltAngle = 0.0
	'''	else if positionpref = "Reclined" Or positionpref = "Recline" Then
	'''		knee = knee + 3.0
	'''		tiltAngle = -5.0
	'''	End If
	If tiltAngle > 0 Then
		lblTiltValue.Text = "+"&tiltAngle & " degs"'''$"º"$
	Else
		lblTiltValue.Text = tiltAngle & " degs"
	End If
	lblTiltValue.font = myfont2
	lblTiltValue.TextSize = 14
	lblTiltValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
End Sub

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Public Sub AnimateFromRight
    #if B4A
	Root.Left = -100%x
	Root.SetLayoutAnimated(300, 0, 0, Root.Width, Root.Height)
    #End If
End Sub

Public Sub AnimateFromLeft
    #if B4A
	Root.Left = 100%x
	Root.SetLayoutAnimated(300, 0, 0, Root.Width, Root.Height)
    #End If
End Sub

Sub ConvertToInches(height1 As String) As String
	Dim realheight As String
	If height1.Length > 0 Then
		realheight = height1 & $"""$
	Else
		realheight = $"0""$
	End If
	Return realheight
End Sub

Private Sub btnSetMyChair_Click
	'''ProgressDialogShow2("Retrieving optimal values...", False)
	progressdialog.Show("Retrieving optimal values...", xui.Color_White)
	Dim email As String
	Dim queryemail As String = "SELECT EMAIL FROM Registrations WHERE UserName = " & "'"&Starter.userName&"'" & " AND PinNumber = " & "'"&Starter.pinNumber&"'"
	Dim db2 As DBTransactions
	db2.Initialize(Me)
	db2.ExecuteRemoteQuery(queryemail, "SELECTCOLUMNS")
	wait for QueryResults(Results2 As List)
	Log("retrieved email: " & Results2)
	If Results2.IsInitialized Then
		Dim m As Map = Results2.Get(0)
		Common.EMAIL = m.Get("EMAIL")
	End If
'''	Dim SenderFilter As Object = Common.mysql.ExecQueryAsync("Email", queryemail, Null)
'''	Wait For (SenderFilter) Email_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''	If Success Then
'''		Do While rs.NextRow
'''			'''Log(rs.GetInt2(0))
'''			Common.EMAIL = rs.GetString("EMAIL")
'''		Loop
'''		rs.Close
'''	Else
'''		Log(LastException)
'''	End If
	Dim count As Int = 0
	Dim query As String = "SELECT count(*) FROM ManualSettings WHERE UserName = " & "'"&Starter.userName&"'" & " AND Password = " & "'"&Starter.pinNumber&"'"
	Dim db As DBTransactions
	db.Initialize(Me)
	db.ExecuteRemoteQuery(query, "UPDATETABLE")
	Log("select count query: " & query)
	wait for QueryResults(Results2 As List)
	Log("after select count query: " & Results2)
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
	
	
	'''count = Common.mysql.ExecQuerySingleResult(query)

	If count > 0 Then
		Dim updateQuery As String = "UPDATE ManualSettings SET SeatHeight = " & "'"&NumberFormat(knee + heightadd, 0, 1)&"'" & " ,SeatWidth = " & "'"&NumberFormat(elbowwidth, 0, 1)&"'"& " ,SeatDepth = " & "'"&NumberFormat(elbowwidth, 0,1)&"'" & " ,SeatTilt="&"'"&tiltAngle&"'" & " ,ArmRestWidth="&"'"&NumberFormat(elbowwidth, 0, 1)&"'" & _
		" ,ArmRestHeight="&"'"&NumberFormat((elbow - buttocks) + knee, 0, 1)&"'" & " ,LumbarHeight="&"'"&NumberFormat((lumbar - buttocks) + knee, 0, 1)&"'" & _
		" WHERE UserName = " &"'"&Starter.userName&"'" & " AND Password = " & "'"&Starter.pinNumber&"'"
		Dim db As DBTransactions
		db.Initialize(Me)
		db.ExecuteRemoteQuery(updateQuery, "UPDATE")
		wait for QueryResults(Results2 As List)
		LogColor("Update ManualSettings", Colors.Blue)
		'''progressdialog.hide
		
'''		Common.mysql.AddNonQueryToBatch(updateQuery, Null)
'''		Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("ManualSettings")
'''		Wait For (SenderFilter) ManualSettings_NonQueryComplete (Success As Boolean)
'''		Log("Updating ManualSettings: " & Success)
		progressdialog.Hide
		Sleep(500)
		'''StartActivity(MainMenu)
		'''B4XPages.ShowPage("MainMenu")
		B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
		B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
	Else
		Dim insertQuery As String = "INSERT INTO ManualSettings (UserName, EMAIL, Password, SeatHeight, SeatDepth, SeatTilt, ArmRestWidth, ArmRestHeight, LumbarHeight) VALUES " & "(" & "'"&Starter.userName&"'" & "," & "'"&Common.EMAIL&"', " & " '"&Starter.pinNumber&"'" & "," & "'"&NumberFormat(knee, 0, 1)&"',  "&"'"&NumberFormat(elbowwidth, 0,1)&"', " & "'"&tiltAngle&"', " & "'"& NumberFormat(elbowwidth, 0, 1) &"', " & "'"&NumberFormat((elbow - buttocks) + knee, 0, 1)&"', " & "'"&NumberFormat((lumbar - buttocks) + knee, 0, 1)&"'" & ")"
		db.ExecuteRemoteQuery(insertQuery, "INSERT")
		wait for QueryResults(Results2 As List)
		LogColor("inserted records into ManualSettings Successfully!", xui.Color_Blue)
		'''		LogColor("new record inserted into ManualSettings", Colors.Blue)
'''		Common.mysql.AddNonQueryToBatch(insertQuery, Null)
'''		Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("InsertSQL")
'''		Wait For (SenderFilter) InsertSQL_NonQueryComplete (Success As Boolean)
'''		Log("Inserting INO ManualSettings: " & Success)
		progressdialog.hide
		Sleep(500)
		'''Activity.Finish
		'''StartActivity(MainMenu)
		'''B4XPages.ShowPage("MainMenu")
		B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
		B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
	End If
'''	Activity.Finish
'''	StartActivity(PairDevice)
	'''B4XPages.ClosePage(Me)
	'''B4XPages.ShowPage("PairDevice")
	B4XPages.ShowPageAndRemovePreviousPages("PairDevice")
	B4XPages.GetPage("PairDevice").As(PairDevice).AnimateFromLeft
End Sub

Private Sub btnBack_Click
	'''Activity.Finish
	'''StartActivity(Profile2)
	'''B4XPages.ClosePage(Me)
	'''B4XPages.ShowPage("Profile2")
	B4XPages.ShowPageAndRemovePreviousPages("Profile2")
	B4XPages.GetPage("Profile2").As(Profile2).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab1Click
	Log("home clicked")
	'''Activity.Finish
	'''StartActivity(MainMenu)
	'''B4XPages.ClosePage(Me)
	'''B4XPages.ShowPage("MainMenu")
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab2Click
	Log("profile clicked")
'''	Activity.Finish
'''	StartActivity(Profile2)
	'''B4XPages.ClosePage(Me)
	'''B4XPages.ShowPage("Profile2")
	B4XPages.ShowPageAndRemovePreviousPages("Profile2")
	B4XPages.GetPage("Profile2").As(Profile2).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab3Click
	Log("help clicked")
	'''Activity.Finish
	'''StartActivity(helpMenu)
	'''B4XPages.ClosePage(Me)
	'''B4XPages.ShowPage("helpMenu")
	B4XPages.ShowPageAndRemovePreviousPages("helpMenu")
	B4XPages.GetPage("helpMenu").As(helpMenu).AnimateFromRight
End Sub

Sub ASBottomMenu1_Tab4Click
	Log("shopping clicked")
	''https://stromergonomics.com/
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_highlighted.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''ASBottomMenu1.SelectedPageIconColor = Colors.RGB(49, 211, 184)
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Private Sub btnOptimalChairDone_Click
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return False
End Sub

Sub B4XPage_Appear
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = xui.Color_RGB(25, 30, 35)
	ASBottomMenu1.CurrentTab = 0
	'''ASBottomMenu1.SelectedPageIconColor = Colors.RGB(49, 211, 184)
End Sub

Sub B4XPage_Disappear
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
End Sub