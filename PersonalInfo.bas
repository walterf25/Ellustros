B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private ASBottomMenu1 As ASBottomMenu
	Private btnBack As B4XView
	Private lbl4DigitPin As B4XView
	Private lbl4DigitPinValue As B4XView
	Private lblBirthDate As B4XView
	Private lblBirthDateValue As B4XView
	Private lblGender As B4XView
	Private lblGenderValue As B4XView
	Private lblHeight As B4XView
	Private lblHeightValue As B4XView
	Private lblTitle As B4XView
	Private lblUserName As B4XView
	Private lblUserNameValue As B4XView
	Private pnl4DigitPin As B4XView
	Private pnlBirthDate As B4XView
	Private pnlGender As B4XView
	Private pnlHeight As B4XView
	Private pnlUserName As B4XView
	Private btnSave As B4XView
	Private btnSignOut As B4XView
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
	Root.LoadLayout("personalinfo")
	
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
	
	Dim myfont As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Bold.otf"), 30)
	
'''	Dim cd1, cd2, cd3, cd4, cd5 As ColorDrawable
'''	cd1.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
'''	cd2.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
'''	cd3.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
'''	cd4.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
'''	cd5.Initialize2(xui.Color_ARGB(8, 28, 30, 36), 4dip, 0, xui.Color_Transparent)
	
	'''btnSave.SetBackgroundImage(LoadBitmap(File.DirAssets, "btnSave.png"))
	'''btnSave.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2@2x.png"))
	'''btnSave.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSave)
	btnSave.Text = "Save"
	btnSave.TextColor = xui.Color_White
	btnSave.font = Common.btnFont
	btnSave.TextSize = 16
	'''btnBack.Color = xui.Color_Transparent
	
	''	Dim cd1 As ColorDrawable
	''	cd1.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 20dip, 0, xui.Color_Transparent)
	'''btnSignOut.SetColorAndBorder(Common.DarkGrayColor, 0, xui.Color_Transparent, 30dip)
	'''btnSignOut.As(Button).Background = Common.DarkGrayColor
	Common.DarkGrayColor(btnSignOut)
	btnSignOut.TextSize = 16
	'''btnSignOut.Font = xui.CreateFont(myfont, 18)
	btnSignOut.Font = Common.btnFont
	btnSignOut.TextColor = xui.Color_White
	btnSignOut.Text = "Sign out"
	
	btnBack.Color = xui.Color_Transparent
	
	lblTitle.font = Common.myfont
	lblTitle.TextSize = 22
	lblTitle.TextColor = xui.Color_ARGB(204, 28, 30, 36)
	

	pnlUserName.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	pnl4DigitPin.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	pnlBirthDate.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	pnlGender.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	pnlHeight.SetColorAndBorder(xui.Color_ARGB(8, 28, 30, 36), 0, xui.Color_Transparent, 4dip)
	
	lblUserName.Text = "Username:"
	lblUserName.font = myfont
	lblUserName.TextSize = 14
	lblUserName.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	
	lblUserNameValue.font = myfont
	lblUserNameValue.TextSize = 14
	lblUserNameValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lbl4DigitPin.Text = "4-digit PIN:"
	lbl4DigitPin.font = myfont
	lbl4DigitPin.TextSize = 14
	lbl4DigitPin.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	
	lbl4DigitPinValue.font = myfont
	lbl4DigitPinValue.TextSize = 14
	lbl4DigitPinValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblBirthDate.Text = "Birthdate:"
	lblBirthDate.font = myfont
	lblBirthDate.TextSize = 14
	lblBirthDate.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	
	lblBirthDateValue.font = myfont
	lblBirthDateValue.TextSize = 14
	lblBirthDateValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblGender.Text = "Sex:"
	lblGender.font = myfont
	lblGender.TextSize = 14
	lblGender.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	
	lblGenderValue.font = myfont
	lblGenderValue.TextSize = 14
	lblGenderValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
	lblHeight.Text = "Height:"
	lblHeight.font = myfont
	lblHeight.TextSize = 14
	lblHeight.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	
	lblHeightValue.font = myfont
	lblHeightValue.TextSize = 14
	lblHeightValue.TextColor = xui.Color_ARGB(127, 28, 30, 36)
	
'''	Dim query As String = "SELECT FirstName, UserName, PinNumber, DOB, Sex, Height FROM Registrations WHERE UserName = " & "'"&Starter.userName&"'" & " AND PinNumber = " & "'"&Starter.pinNumber&"'"
'''	Dim db As DBTransactions
	Dim height, fname, uname, pin, dob, sex As String
'''	db.Initialize(Me)
	'''ProgressDialogShow2("Retrieving personal info!", False)
	progressdialog.Initialize(Root, 400dip, -1, -1, "", "", Common.LightBlueColors, xui.Color_White, "DEFAULT", True)
	progressdialog.Show("Retrieving personal info!", xui.Color_White)
	
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
				fname = val.Get("FirstName")
				uname = val.Get("UserName")
				pin = val.Get("PinNumber")
				dob = val.Get("DOB")
				sex = val.Get("Sex")
			Next
		Catch
			Log(LastException)
		End Try
	
	End If
	
'''	db.ExecuteRemoteQuery(query, "SELECTCOLUMNS")
'''	
'''	wait for QueryResults(Results As List)
'''	Log("results size: " & Results.Size & " -- " & Results)
'''	For i = 0 To Results.Size - 1
'''		Dim m As Map
'''		m = Results.Get(i)
'''		height = m.GetDefault("Height", $"0""$)
'''		fname = m.GetDefault("FirstName", $""$)
'''		uname = m.GetDefault("UserName", $""$)
'''		pin = m.GetDefault("PinNumber", $""$)
'''		dob = m.GetDefault("DOB", $""$)
'''		sex = m.GetDefault("Sex", $""$)
'''	Next

'''	Dim SenderFilter As Object = Common.mysql.ExecQueryAsync("Registration", query, Null)
'''	Wait For (SenderFilter) Registration_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''	If Success Then
'''		Do While rs.NextRow
'''			'''Log(rs.GetInt2(0))
'''			height = rs.GetString("Height")
'''			fname = rs.GetString("FirstName")
'''			uname = rs.GetString("UserName")
'''			pin = rs.GetString("PinNumber")
'''			dob = rs.GetString("DOB")
'''			sex = rs.GetString("Sex")
'''		Loop
'''		rs.Close
'''	Else
'''		Log(LastException)
'''	End If
	
	lblTitle.Text = "Welcome " & fname & "!"
	lblUserNameValue.Text = uname
	lbl4DigitPinValue.Text = pin
	lblBirthDateValue.Text = dob
	lblGenderValue.Text = sex
	Dim s2() As String = Regex.Split("-", height)
	lblHeightValue.Text = s2(0)&"ft" & " " & s2(1)&"in"
	'''ProgressDialogHide
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

Private Sub btnSave_Click
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
	#If Lite
	B4XPages.ShowPageAndRemovePreviousPages("Recommendations")
	B4XPages.GetPage("Recommendations").As(Recommendations).AnimateFromLeft
	#Else
	B4XPages.ShowPageAndRemovePreviousPages("Profile2")
	B4XPages.GetPage("Profile2").As(Profile2).AnimateFromLeft
	#End If
End Sub

Sub ASBottomMenu1_Tab1Click
	Log("home clicked")
	'''Activity.Finish
	'''StartActivity(MainMenu)
'''	B4XPages.ClosePage(Me)
'''	B4XPages.ShowPage("MainMenu")
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab2Click
	Log("profile clicked")
	'''Activity.Finish
	'''StartActivity(Profile2)
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
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(49, 211, 184)
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Private Sub btnSignOut_Click
'''	Activity.Finish
'''	StartActivity(Main)
	''B4XPages.ClosePage(Me)
	Dim mainpageID As String = B4XPages.GetPageId(B4XPages.MainPage)
	'''B4XPages.ShowPage(mainpageID)
	B4XPages.ShowPageAndRemovePreviousPages(mainpageID)
	B4XPages.MainPage.AnimateFromLeft
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return False
End Sub