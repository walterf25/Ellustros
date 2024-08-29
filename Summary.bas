B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private imgBackground As B4XView
	Private lblSummary As B4XView
	Private imgIcon As B4XView
	Private btnContinue As B4XView
	Private lblTitle As B4XView
	Private lblArmRestHeight As B4XView
	Private lblArmRestHeightVal As B4XView
	Private lblarmrestwidth As B4XView
	Private lblArmRestWidthVal As B4XView
	Private lblLumbarSupportHeight As B4XView
	Private lblLumbarSupportHeightVal As B4XView
	Private lblSeatDepth As B4XView
	Private lblSeatDepthVal As B4XView
	Private lblSeatheight As B4XView
	Private lblSeatHeightVal As B4XView
	Private lblSeatWidth As B4XView
	Private lblTilt As B4XView
	Private lblTiltVal As B4XView
	Private lblSeatWidthVal As B4XView
	
	
	Private ASBottomMenu1 As ASBottomMenu
	Private btnDone As B4XView
	Private lblButtocksKnee As B4XView
	Private lblButtocksKneeValue As B4XView
	Private lblElbow As B4XView
	Private lblElbowValue As B4XView
	Private lblFloorKnee As B4XView
	Private lblFloorKneeValue As B4XView
	Private lblHeight As B4XView
	Private lblHeightValue As B4XView
	Private lblHip As B4XView
	Private lblHipValue As B4XView
	Private lblLumbar As B4XView
	Private lblLumbarValue As B4XView
	Private lblShoulders As B4XView
	Private lblShouldersValue As B4XView
	Private pnlButtocksKnee As B4XView
	Private pnlElbow As B4XView
	Private pnlFloorKnee As B4XView
	Private pnlHeight As B4XView
	Private pnlHip As B4XView
	Private pnlLumbar As B4XView
	Private pnlShoulders As B4XView
	Private btnBack As B4XView
	Private progressdialog As CustomProgressDialog
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("MyMeasurements")
	
		
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.PartinglineVisible = False
	ASBottomMenu1.UnderlineVisible = False
	ASBottomMenu1.SelectedPageIconColor = xui.color_RGB(164, 212, 232)
	ASBottomMenu1.MiddleButtonVisible = False
	ASBottomMenu1.BadgetColor1 = Colors.Black
	ASBottomMenu1.BadgetColor2 = Colors.Black
	ASBottomMenu1.BadgetColor4 = Colors.Black
	btnBack.Color = xui.Color_Transparent
	Dim cd1, cd2, cd3, cd4, cd5, cd6, cd7 As ColorDrawable
	cd1.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
	cd2.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
	cd3.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
	cd4.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
	cd5.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
	cd6.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
	cd7.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
	
'''	pnlHeight.Background = cd1
'''	pnlShoulders.Background = cd2
'''	pnlHip.Background = cd3
'''	pnlElbow.Background = cd4
'''	pnlLumbar.Background = cd5
'''	pnlButtocksKnee.Background = cd6
'''	pnlFloorKnee.Background = cd7
	
	pnlHeight.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, 4dip, xui.Color_Transparent)
	pnlShoulders.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, 4dip, xui.Color_Transparent)
	pnlHip.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, 4dip, xui.Color_Transparent)
	pnlElbow.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, 4dip, xui.Color_Transparent)
	pnlLumbar.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, 4dip, xui.Color_Transparent)
	pnlButtocksKnee.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, 4dip, xui.Color_Transparent)
	pnlFloorKnee.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, 4dip, xui.Color_Transparent)
	
	Dim myfont As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 30)
	Dim myfont2 As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Bold.otf"), 16)
	lblTitle.font = myfont
	lblTitle.Text = "Based on the information you" & CRLF &  "entered, your measurements are:"
	lblTitle.TextColor = xui.Color_argb(204, 28, 30, 36)
	lblTitle.TextSize = 18
	
	'''btnDone.SetBackgroundImage(LoadBitmap(File.DirAssets, "btnDone.png"))
	'''btnDone.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2@2x.png"))
	'''btnDone.Background = Common.LightBlueColor
	Common.LightBlueColor(btnDone)
	btnDone.font = Common.btnFont
	btnDone.Text = "Done"
	btnDone.TextSize = 16
	btnDone.TextColor = xui.Color_White
	
	'''Dim query As String = "SELECT Height, LUMBARHEIGHT, KNEEHEIGHT, ELBOWHEIGHT, BUTTOCKSHEIGHT, HIPWIDTH, ELBOWWIDTH, SHOEHEIGHT, POSITIONPREF FROM Registrations WHERE UserName = " & "'"&Starter.userName&"'" & " AND PinNumber = " & "'"&Starter.pinNumber&"'"
	'''Dim db As DBTransactions
	Dim height, lumbar, knee, elbow, buttocks, hip, elbowwidth, shoe, positionpref As String
	'''db.Initialize(Me)
	'''ProgressDialogShow2("Retrieving Front and Side Measurements, please wait!", False)
	progressdialog.Initialize(Root, 400dip, -1, -1, "", "", Common.LightBlueColors, xui.Color_White, "DEFAULT", True)
	progressdialog.Show("Retrieving Front and Side Measurements, please wait!", xui.Color_White)
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
'''	db.ExecuteRemoteQuery(query, "SELECTCOLUMNS")
'''	
'''	wait for QueryResults(Results As List)
'''	'''Log("results size: " & Results.Size & " -- " & Results)
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

'''	Dim SenderFilter As Object = Common.mysql.ExecQueryAsync("Registration", query, Null)
'''	Wait For (SenderFilter) Registration_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''	If Success Then
'''		Do While rs.NextRow
'''			'''Log(rs.GetInt2(0))
'''			height = rs.GetString("Height")
'''			lumbar = rs.GetString("LUMBARHEIGHT")
'''			knee = rs.GetString("KNEEHEIGHT")
'''			elbow = rs.GetString("ELBOWHEIGHT")
'''			buttocks = rs.GetString("BUTTOCKSHEIGHT")
'''			hip = rs.GetString("HIPWIDTH")
'''			elbowwidth = rs.GetString("ELBOWWIDTH")
'''			shoe = rs.GetString("SHOEHEIGHT")
'''			positionpref = rs.GetString("POSITIONPREF")
'''		Loop
'''		rs.Close
'''	Else
'''		Log(LastException)
'''	End If
	

	
	Dim cs As CSBuilder
	cs.Initialize
	
	Dim tiltAngle As Double
	
	If positionpref = "Perch" Then
		knee = knee + 1.5
		tiltAngle = 5.0
	else if positionpref = "Neutral" Then
		knee = knee
		tiltAngle = 0.0
	else if positionpref = "Reclined" Then
		knee = knee + 3.0
		tiltAngle = -5.0
	End If
	
	Try
	hip = NumberFormat(hip, 0, 2)
	buttocks = NumberFormat(buttocks, 0, 2)
	knee = NumberFormat(knee, 0, 2)
	elbowwidth = NumberFormat(elbowwidth, 0, 2)
	elbow = NumberFormat(elbow, 0, 2)
	
	Dim armRestHeight As Double
	Dim lumbarSupportheight As Double
	armRestHeight = NumberFormat((elbow - buttocks) + knee, 0, 2)
	lumbarSupportheight = NumberFormat((lumbar - buttocks) + knee, 0, 2)
	
	
	Common.SeatWidth = NumberFormat((hip+2.6),0,2)
	'''2.6 inches needs to be 1.6 instead, need to make this change.
	''12/13/2020 Per Diana on phone conversation.
	Common.SeatDepth = NumberFormat((buttocks - knee), 0, 2) + 2.6
	Common.ArmRestWidth = elbowwidth
	Common.SeatHeight = knee
	Common.ArmRestHeight = armRestHeight
	Common.LumbarHeight = lumbarSupportheight
	Common.SeatTilt = tiltAngle

	
	lblHeight.Text = "Height (with shoes)"
	lblHeight.font = myfont2
	lblHeight.TextSize = 14
	lblHeight.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	
	lblShoulders.font = myfont2
	lblShoulders.TextSize = 14
	lblShoulders.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblShoulders.Text = "Shoulder width"
	
	lblHip.font = myfont2
	lblHip.TextSize = 14
	lblHip.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblHip.Text = "Hip width"
	
	lblElbow.font = myfont2
	lblElbow.TextSize = 14
	lblElbow.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblElbow.Text = "Seated elbow height"
	
	lblLumbar.font = myfont2
	lblLumbar.TextSize = 14
	lblLumbar.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblLumbar.Text = "Seated lumbar height"
	
	lblButtocksKnee.font = myfont2
	lblButtocksKnee.TextSize = 14
	lblButtocksKnee.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblButtocksKnee.Text = "Buttocks-knee height"
	
	lblFloorKnee.font = myfont2
	lblFloorKnee.TextSize = 14
	lblFloorKnee.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblFloorKnee.Text = "Floor-knee height (with shoes)"
	
	Dim inches As String = CalculateFeetToInches(height)
	Dim mheight As Int
	Dim remainder As Double
	mheight = inches / 12
	remainder = (inches Mod 12) + shoe
	If remainder > 12 Then
		Dim addition As Int = remainder / 12
		Dim remainder2 As Double = remainder Mod 12
		height = (mheight + addition) & "-" & remainder2
	Else
		height = mheight & "-" & (inches Mod 12)
	End If
	
	
	'''	If shoe <> Null Then
	'''		height = height + shoe
	'''	End If
	Dim realheight As String
	realheight = ConvertToFeetAndInches(height)

	lblHeightValue.Text = realheight
	lblHeightValue.font = myfont2
	lblHeightValue.TextSize = 14
	lblHeightValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblShouldersValue.Text = ConvertToInches(elbowwidth)
	lblShouldersValue.font = myfont2
	lblShouldersValue.TextSize = 14
	lblShouldersValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblHipValue.Text = ConvertToInches(hip)
	lblHipValue.font = myfont2
	lblHipValue.TextSize = 14
	lblHipValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblElbowValue.Text = ConvertToInches(armRestHeight)
	lblElbowValue.font = myfont2
	lblElbowValue.TextSize = 14
	lblElbowValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblLumbarValue.Text = ConvertToInches(lumbarSupportheight)
	lblLumbarValue.font = myfont2
	lblLumbarValue.TextSize = 14
	lblLumbarValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	'''lblButtocksKnee.Text = ConvertToInches(NumberFormat((buttocks - knee), 0, 2)) + 2.6))
	lblButtocksKneeValue.Text = ConvertToInches(NumberFormat((buttocks - knee) + 2.6, 0, 2))
	lblButtocksKneeValue.font = myfont2
	lblButtocksKneeValue.TextSize = 14
	lblButtocksKneeValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblFloorKneeValue.Text = ConvertToInches(knee)
	lblFloorKneeValue.font = myfont2
	lblFloorKneeValue.TextSize = 14
	lblFloorKneeValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	Catch
		Log("error retrieving values from database")
	End Try
	progressdialog.Hide
	
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

Sub ConvertToFeetAndInches(height As String)As String
	Dim realheight As String
	If height.Length > 2 Then
		Dim split() As String = Regex.Split("-", height.Trim)
		For i = 0 To split.Length - 1
			If i = 0 Then
				realheight = split(0) & $"' "$
			Else
				realheight = realheight & split(i)
			End If
			
		Next
		realheight = realheight & $"""$
	Else
		realheight = realheight & $"'"$
	End If
	Return realheight
End Sub

Sub ConvertToInches(height As String) As String
	Dim realheight As String
	If height.Length > 0 Then
		realheight = height & $"""$
	Else
		realheight = $"0""$
	End If
	Return realheight
End Sub

private Sub CalculateFeetToInches(feet As String)As Double
	Dim ft As Double
	Dim inches As Double
	Dim split() As String
	split = Regex.Split("-", feet)
	ft = split(0)
	inches = split(1)
	ft = ft * 12
	ft = ft + inches
	ft = ft + Starter.sHeight
	Log("feet to inches: " & ft)
	Return ft
End Sub


Sub btnContinue_Click
	'''Activity.Finish
	'''B4XPages.ClosePage(Me)
	Common.fromSummary = True
	'''StartActivity(PairDevice)
	'''B4XPages.ShowPage("PairDevice")
	B4XPages.GetPage("PairDevice").As(PairDevice).AnimateFromLeft
	B4XPages.ShowPageAndRemovePreviousPages("PairDevice")
End Sub


Sub btnDone_Click
	'''Activity.Finish
	'''B4XPages.ClosePage(Me)
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
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
	'''StartActivity(MainMenu)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_highlighted.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''B4XPages.ShowPage("MainMenu")
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab2Click
	Log("profile clicked")
	'''StartActivity(Profile2)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''B4XPages.ShowPage("Profile2")
	B4XPages.ShowPageAndRemovePreviousPages("Profile2")
	B4XPages.GetPage("Profile2").As(Profile2).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab3Click
	Log("help clicked")
	'''StartActivity(helpMenu)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''B4XPages.ShowPage("helpMenu")
	B4XPages.ShowPageAndRemovePreviousPages("helpMenu")
	B4XPages.GetPage("helpMenu").As(helpMenu).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab4Click
	Log("shopping clicked")
	''https://stromergonomics.com/
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_highlighted.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(49, 211, 184)
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Sub B4XPage_Appear
	LogColor("Summary just appeared....", Colors.Blue)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_highlighted.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	'''ASBottomMenu1.CurrentTab = 2
	'''ASBottomMenu1_Tab2Click
End Sub

Sub B4XPage_Disappear
	Log("Summary disappeared...")
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return False
End Sub
