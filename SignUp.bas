B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private btnDOB As B4XView
	Private imgBackground As B4XView
	Private txtDOB1 As B4XView
	Private txtFirstName As B4XView
	Private txtLastName As B4XView
	Private txtUserName As B4XView
	Private txtPin As B4XView
	
	Private xui As XUI
	'''Private Dialog As B4XDialog
	Private Base As B4XView
	Private btnSignUp As B4XView
	
	Private fname, lname, uname, dob, pin As String
	Private sex As String
	Private height As String
	Private ft, inch As String
	
	'''Private connection As MLwifi
	'''Private ime As IME
	Private lbl As B4XView
	'''Dim spnr As ACSpinner
	Private pnlToolBar As B4XView
	Private lblTitle As B4XView
	Private lblSubtitle As B4XView
	Private imgLogo As B4XView
	Private lblWelcome As B4XView
	
	Private ASBottomMenu1 As ASBottomMenu
	Private txtSex As B4XView
	Private txtHeightft As B4XView
	Private txtheightin As B4XView
	Private Size As Float
	Private sb As StringBuilder
	
	Private pnlBottom As B4XView
	Private Overlay As B4XView
	Private Overlay2 As B4XView
	Private Overlay3 As B4XView
	Private OverlayVisible As Boolean
	Private OverlayVisible2 As Boolean
	Private OverlayVisible3 As Boolean
	
	#If B4A
	Private whlDate As ClsWheel
	Private whlCustom As ClsWheel
	#End If
	
	Private pnlOverText As B4XView
	Private btnBackSignup As B4XView
	''Private ime As IME
	Private pnlOverHeight As B4XView
	Private pnlBottom2 As B4XView
	Private heightftin As String
	Private pnlBottom3 As B4XView
	Private pnlOverSex As B4XView

	Private rdMale As RadioButton
	Private rdFemale As RadioButton
	Private lblsexSelection As B4XView
	Private Dialog As B4XDialog
	Dim myfont As B4XFont
	Private progressdialog As CustomProgressDialog
	Private dynamictoast As DynamicToast
	Private txtEmail As B4XView
	Private email As String
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	
	Root.LoadLayout("signup")
	'''ime.Initialize("ime")
	Dim myfont As B4XFont
	Dim myfont2 As B4XFont
'''	myfont = Typeface.LoadFromAssets("Cera Pro Bold.otf")
	'''myfont2 = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf")
	
	myfont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 30)
	myfont2 = xui.CreateFont(Typeface.LoadFromAssets("cera pro medium.otf"), 18)
	lblTitle.Font = myfont
	lblTitle.TextColor = Colors.rgb(28, 30, 36)
	lblTitle.TextSize = 18
	lblTitle.Text = "Sign up"
	lblWelcome.font = myfont2
	lblWelcome.TextColor = Colors.rgb(73, 75, 79)
	lblWelcome.TextSize = 20
	lblWelcome.Text = "Create an account to" & CRLF & "begin your fully automated" & CRLF & "ergonomic experience"
	dynamictoast.Initialize
	progressdialog.Initialize(Root, 400dip, -1, -1, "", "", Common.LightBlueColors, xui.Color_White, "DEFAULT", True)
	
'''	myfont = Typeface.LoadFromAssets("Cera Pro Black.otf")

	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets, "home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.PartinglineVisible = False
	ASBottomMenu1.UnderlineVisible = False
	ASBottomMenu1.SelectedPageIconColor = Colors.Black
	ASBottomMenu1.MiddleButtonVisible = False
	ASBottomMenu1.BadgetColor1 = Colors.Black
	ASBottomMenu1.BadgetColor2 = Colors.Black
	ASBottomMenu1.BadgetColor4 = Colors.Black
	
	ASBottomMenu1.Base.Visible = False

	'''txtDOB1.Format = "MM/DD/YYYY ##/##/####"
	btnBackSignup.Color = xui.Color_Transparent
	
	Common.txtViewBackground(txtPin)
	Common.txtViewBackground(txtSex)
	Common.txtViewBackground(txtFirstName)
	Common.txtViewBackground(txtLastName)
	Common.txtViewBackground(txtUserName)
	Common.txtViewBackground(txtHeightft)
	Common.txtViewBackground(txtDOB1)
	Common.txtViewBackground(txtEmail)
	
	
	
	#If B4A
	txtDOB1.As(EditText).InputType = txtDOB1.As(EditText).INPUT_TYPE_DECIMAL_NUMBERS
	txtDOB1.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtPin.As(EditText).InputType = txtPin.As(EditText).INPUT_TYPE_DECIMAL_NUMBERS
	txtEmail.As(EditText).InputType = txtEmail.As(EditText).INPUT_TYPE_TEXT
	txtPin.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtEmail.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtSex.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtHeightft.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtheightin.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtFirstName.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtLastName.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtUserName.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtDOB1.As(EditText).HintColor = xui.color_argb(63, 28, 30, 36)
	txtHeightft.As(EditText).InputType = txtHeightft.As(EditText).INPUT_TYPE_TEXT
	txtheightin.As(EditText).InputType = txtheightin.As(EditText).INPUT_TYPE_TEXT
	#else
	
	#End If
	
	
	txtDOB1.TextSize = 20
	txtDOB1.TextColor = Colors.Black
	
	txtPin.TextColor = Colors.Black
	txtPin.TextSize = 20
	txtEmail.TextColor = Colors.Black
	txtEmail.TextSize = 20

	
	txtSex.TextSize = 20
	txtSex.TextColor = Colors.Black
	
	txtHeightft.TextColor = Colors.Black
	txtHeightft.TextSize = 20
	
	txtheightin.TextColor = Colors.Black
	txtheightin.TextSize = 20
	
	'''txtHeight.Format = $"# ft ## in"$
	txtFirstName.TextSize = 20
	
	txtFirstName.TextColor = Colors.Black
	txtLastName.TextSize = 20
	
	txtLastName.TextColor = Colors.Black
	txtUserName.TextSize = 20
	
	txtUserName.TextColor = Colors.Black
	btnSignUp.TextSize = 20
	
	
	txtFirstName.font = myfont2
	txtLastName.font = myfont2
	txtUserName.font = myfont2
	txtDOB1.font = myfont2
	txtPin.font = myfont2
	txtSex.font = myfont2
	txtEmail.font = myfont2
	txtHeightft.font = myfont2
	txtheightin.font = myfont2
	btnSignUp.font = Common.btnFont
	btnSignUp.Text = "Sign up"
	btnSignUp.TextSize = 16
	'''btnSignUp.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2@2x.png"))
	
	Common.LightBlueColor(btnSignUp)
	btnSignUp.TextColor = xui.Color_White
	'''btnSignUp.Background = Common.LightBlueColor
	'''txtPin.Format = "# # # #"
	'''txtPin.EnableFloatingHint
	'''	LogColor("asbottommenu top: " & ASBottomMenu1.Base.Top, Colors.Blue)
	'''	LogColor("txtheightft bottom: " & (txtHeightft.Top+txtHeightft.Height), Colors.Blue)
	'''btnSignUp.Top = ASBottomMenu1.Base.top -  (ASBottomMenu1.Base.Top - (txtHeightft.Top+txtHeightft.Height))/2 - btnSignUp.Height/2 ''' - btnSignUp.Height/2)
	
	Size=txtFirstName.TextSize       'Original Size Defined In Designer
	SetHintSize(txtFirstName)
	SetHintSize(txtLastName)
	SetHintSize(txtUserName)
	'''SetHintSize2(txtEmail)
	SetHintSize2(txtPin)
	SetHintSize2(txtDOB1)
	SetHintSize2(txtSex)
	SetHintSize2(txtHeightft)
	SetHintSize2(txtheightin)
	SetHintSize2(txtEmail)
	sb.Initialize
	
	'''RemoveAllCaps(Activity)
	
	Overlay = xui.CreatePanel("overlay")
	Overlay.Visible = False
	Dim p As Panel = Overlay
	p.Elevation = 10dip
	Root.AddView(Overlay, 0, 0, 100%x, 100%y)
	Overlay.LoadLayout("Overlay")
	pnlBottom.SetColorAndBorder(xui.Color_White, 0, 0, 15dip)
	
	Overlay2 = xui.CreatePanel("overlay2")
	Overlay2.Visible = False
	Dim p2 As Panel = Overlay2
	p2.Elevation = 10dip
	Root.AddView(Overlay2, 0, 0, 100%x, 100%y)
	Overlay2.LoadLayout("overlay2")
	pnlBottom2.SetColorAndBorder(xui.Color_White, 0, 0, 15dip)
	
	Overlay3 = xui.CreatePanel("overlay3")
	Overlay3.Visible = False
	Dim p3 As Panel = Overlay3
	p3.Elevation = 10dip
	Root.AddView(Overlay3, 0, 0, 100%x, 100%y)
	Overlay3.LoadLayout("overlay3")
	pnlBottom3.LoadLayout("sexlayout")
	rdMale.typeface = myfont2.ToNativeFont
	rdFemale.Typeface = myfont2.ToNativeFont
	lblsexSelection.font = myfont2
	lblsexSelection.TextColor = Colors.rgb(28, 30, 36)
	lblsexSelection.TextSize = 18
	rdMale.TextColor = xui.Color_Black
	rdFemale.TextColor = xui.Color_Black
	'''SetRadioButtonDrawable(rdMale, Common.LightBlueColors, 40dip, Common.LightBlueColors, xui.Color_DarkGray, 2dip)
	'''SetRadioButtonDrawable(rdFemale, Common.LightBlueColors, 40dip, Common.LightBlueColors, xui.Color_DarkGray, 2dip)
	pnlBottom3.SetColorAndBorder(xui.Color_White, 0, 0, 15dip)
	
	InitWheelData
	InitCustomWheel
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

Sub SetHintSize(edt As B4XView)
	edt.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0dip)
	If edt.Text.Trim()="" Then
		edt.TextSize=14''Size * .60
	Else
		edt.TextSize=Size
	End If
	'''	Log("edt final size: " & edt.TextSize & " tag: " & edt.Tag)
End Sub

Sub SetHintSize2(edt As B4XView)
	edt.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_black, 0dip)
	'''edt.TextColor=Colors.Blue
	'''	Log("edt2 initial size: " & edt.TextSize & " tag: " & edt.Tag)
	If edt.Text.Trim()="" Then
		edt.TextSize=14''Size * .60
		'''		If edt.Tag = "pin" Then
		'''			txtPin.Format = ""
		'''			edt.PasswordMode = False
		'''		End If
	Else
		'''		If edt.Tag = "pin" Then
		'''			edt.PasswordMode = True
		'''		End If
		edt.TextSize=Size
	End If
	'''	Log("edt2 final size: " & edt.TextSize & " tag: " & edt.Tag)
End Sub

Sub InitWheelData
	Dim lstDate(2) As List
	lstDate(0).Initialize
	lstDate(1).Initialize
	
	whlDate.Initialize(Me, pnlBottom, "", 3, Null, 24, 0, True, 60dip)
'	whlDate.Initialize(Me, Activity, "Enter date, date, date, date, date, date, date", 3, Null, 24, 0, True)
	whlDate.FirstYear = 1940
	Dim tmpYear As Int = DateTime.GetYear(DateTime.Now) - whlDate.FirstYear
	whlDate.NumberOfYears = tmpYear + 1  'until current year
End Sub

Sub InitCustomWheel
	Dim lstheight(2) As List
	lstheight(0).Initialize
	lstheight(1).Initialize
	
	lstheight(0).AddAll(Array As String("4", "5", "6", "7", "8"))
	lstheight(1).AddAll(Array As String("0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11"))
	
	whlCustom.Initialize(Me, pnlBottom2, "", 2, lstheight, 24, 4, True, 140dip)
	whlCustom.Width = pnlBottom.Width * 0.8
	whlCustom.setunits(True)
	whlCustom.SepText = "/"
End Sub

Sub ToggleDrawerState
	Dim Duration As Int = 300
	OverlayVisible = Not(OverlayVisible)
	Overlay.SetVisibleAnimated(Duration, OverlayVisible)
	Dim pnlBottomVisibleHeight As Int = pnlBottom.Height - 8dip 'hide bottom round corners
	If OverlayVisible Then
		pnlBottom.SetLayoutAnimated(0, 0, pnlBottom.Parent.Height, pnlBottom.Width, pnlBottom.Height)
		pnlBottom.SetLayoutAnimated(Duration, 0, pnlBottom.Parent.Height - pnlBottomVisibleHeight, pnlBottom.Width, pnlBottom.Height)
	Else
		pnlBottom.SetLayoutAnimated(0, 0, pnlBottom.Parent.Height - pnlBottomVisibleHeight, pnlBottom.Width, pnlBottom.Height)
		pnlBottom.SetLayoutAnimated(Duration, 0, pnlBottom.Parent.Height, pnlBottom.Width, pnlBottom.Height)
	End If
End Sub

Sub ToggleDrawerState2
	Dim Duration As Int = 300
	OverlayVisible2 = Not(OverlayVisible2)
	Overlay2.SetVisibleAnimated(Duration, OverlayVisible2)
	Dim pnlBottomVisibleHeight As Int = pnlBottom2.Height - 8dip 'hide bottom round corners
	If OverlayVisible2 Then
		pnlBottom2.SetLayoutAnimated(0, 0, pnlBottom2.Parent.Height, pnlBottom2.Width, pnlBottom2.Height)
		pnlBottom2.SetLayoutAnimated(Duration, 0, pnlBottom2.Parent.Height - pnlBottomVisibleHeight, pnlBottom2.Width, pnlBottom2.Height)
	Else
		pnlBottom2.SetLayoutAnimated(0, 0, pnlBottom2.Parent.Height - pnlBottomVisibleHeight, pnlBottom2.Width, pnlBottom2.Height)
		pnlBottom2.SetLayoutAnimated(Duration, 0, pnlBottom2.Parent.Height, pnlBottom2.Width, pnlBottom2.Height)
	End If
End Sub

Sub ToggleDrawerState3
	Dim Duration As Int = 300
	OverlayVisible3 = Not(OverlayVisible3)
	Overlay3.SetVisibleAnimated(Duration, OverlayVisible3)
	Dim pnlBottomVisibleHeight As Int = pnlBottom3.Height - 8dip 'hide bottom round corners
	If OverlayVisible3 Then
		pnlBottom3.SetLayoutAnimated(0, 0, pnlBottom3.Parent.Height, pnlBottom3.Width, pnlBottom3.Height)
		pnlBottom3.SetLayoutAnimated(Duration, 0, pnlBottom3.Parent.Height - pnlBottomVisibleHeight, pnlBottom3.Width, pnlBottom3.Height)
	Else
		pnlBottom3.SetLayoutAnimated(0, 0, pnlBottom3.Parent.Height - pnlBottomVisibleHeight, pnlBottom3.Width, pnlBottom3.Height)
		pnlBottom3.SetLayoutAnimated(Duration, 0, pnlBottom3.Parent.Height, pnlBottom3.Width, pnlBottom3.Height)
	End If
End Sub

Sub Overlay_Click
	'''	Log("overlay clicked")
	If OverlayVisible = False Then Return
	ToggleDrawerState
End Sub

Sub Overlay2_Click
	'''	Log("overlay2 clicked")
	If OverlayVisible2 = False Then Return
	ToggleDrawerState2
End Sub

Sub Overlay3_Click
	'''	Log("overlay3 clicked")
	If OverlayVisible3 = False Then Return
	ToggleDrawerState3
End Sub

Sub txtDOB1_TextChanged(Old As String, New As String)
	dob = New.Trim
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize2(txtDOB1)
	End If
End Sub

Sub txtUserName_TextChanged (Old As String, New As String)
	uname = New
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize(txtUserName)
	End If
End Sub

Sub txtpin_TextChanged (Old As String, New As String)
	
	'''	If (Old.Trim="") <> (New.Trim="") Then
	'''		txtPin.Format = "# # # #"
	'''		txtPin.PasswordMode = True
	'''		SetHintSize2(txtPin)
	'''	End If
	pin = New.Trim
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize2(txtPin)
	End If
End Sub

Sub txtpin_FocusChanged(HasFocus As Boolean)
	Log("txtpin has focus: " & HasFocus)
	'''	If HasFocus Then
	'''		Log("txt pin text lenght: " & txtPin.Text.Length)
	'''		setSelection(txtPin, 0, 1)
	'''	End If
	If HasFocus = False Then
		Log("pin: " & pin)
	End If
End Sub

Sub txtLastName_TextChanged (Old As String, New As String)
	lname = New
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize2(txtLastName)
	End If
End Sub

Sub txtFirstName_TextChanged (Old As String, New As String)
	fname = New
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize2(txtFirstName)
	End If
End Sub

Sub txtHeightft_TextChanged(Old As String, New As String)
	height = New.Trim
	ft = New
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize2(txtHeightft)
	End If
End Sub

Sub txtheightin_TextChanged(Old As String, New As String)
	inch = New
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize2(txtheightin)
	End If
End Sub

Sub txtSex_TextChanged(Old As String, New As String)
	If New.StartsWith("m") Or New.StartsWith("M") Then
		sex = "Male"
	else if New.StartsWith("f") Or New.StartsWith("F") Then
		sex = "Female"
	Else
		sex = ""
	End If
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize2(txtSex)
	End If
End Sub

Private Sub txtEmail_TextChanged (Old As String, New As String)
	Common.EMAIL = New.Trim
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize2(txtEmail)
	End If
End Sub

Sub rdMale_CheckedChange(Checked As Boolean)
	If Checked Then
		sex = "Male"
	End If
End Sub

Sub rdFemale_CheckedChange(Checked As Boolean)
	If Checked Then
		sex = "Female"
	End If
End Sub


Sub btnSignUp_Click
	Dim exists As Boolean
	Dim regdate As Long = DateTime.now/1000
	Dim today As String = regdate
	If txtEmail.Text.Length > 0 And txtFirstName.Text.Length > 0 And txtLastName.Text.Length > 0 And txtUserName.Text.Length > 0 And txtPin.Text.Length > 0 And txtDOB1.Text.Length > 0 And txtSex.Text.Length > 0 And txtHeightft.Text.Length > 0 Then
		dob = dob.Replace("/", "-")
		Log("dob: " & dob)
		Dim data As Map
		data.Initialize
		data.Put("SignUpDate", today)
		data.Put("FirstName", fname)
		data.Put("LastName", lname)
		data.Put("EMAIL", Common.EMAIL)
		data.Put("UserName", uname)
		data.Put("PinNumber", pin)
		data.put("DOB", dob.Replace("/", "-"))
		data.Put("Sex", sex)
		data.put("Height", heightftin)
		
'''			Dim db As DBTransactions
'''			Dim existsQuery As String = "SELECT count(*) FROM Registrations WHERE FirstName = " & "'"&fname&"' AND LastName = " & "'"&lname&"' AND UserName = " & "'"&uname&"' AND  Sex = "&"'"&sex&"'"
'''			db.Initialize(Me)
'''			db.ExecuteRemoteQuery(existsQuery, "EXISTS")
'''			wait for QueryResults(Results As List)
'''			For i = 0 To Results.Size - 1
'''				Dim m As Map
'''				m = Results.Get(i)
'''				exists = m.Get("count(*)")
'''			Next

			wait for (B4XPages.MainPage.store.GetCollection("StromDB/Registrations/Users")) Complete(coll As Map)
			Dim users As List = coll.Get("documents")
			For Each doc As Map In users
				Log("doc: " & doc)
				Dim pass As String = doc.Get("PinNumber")
				Dim username As String = doc.Get("UserName")
				'''Dim requiredpin As Int = pass
				'''Dim generatedpin As String = pin
'''				pin = $""${pin}""$
'''				 = $""${}""$
				Log("isequal: " & (pass == pin))
				Log("isequal: " & (username == uname))
			If username == uname And pass == pin Then
				LogColor("remote record already exists, skipping!", Colors.Red)
				'''				Dim sf As Object = XUI.Msgbox2Async("A record with the First Name, Last Name and User Name already exists", "User Exists", "OK", "Cancel", "", Null)
				'''				Wait For (sf) Msgbox_Result (Result As Int)
				'''				If Result = XUI.DialogResponse_Positive Then
				'''					'''Log("Deleted!!!")
				'''					Activity.Finish
				'''					StartActivity(Main)
				'''				End If
				Dialog.Initialize(Root)
				Dialog.BorderCornersRadius = 20
				Dialog.BorderWidth = 0dip
				Dialog.Title = "User Exists"
				Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
				Dialog.ButtonsTextColor = xui.Color_White
				Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
				Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
				Dialog.TitleBarColor = xui.Color_Transparent
				Dialog.BackgroundColor = xui.Color_White
				Dialog.BodyTextColor = xui.Color_Black
				''rgba(49, 211, 184, 1)
				Dim sf As Object = Dialog.Show("A record with the First Name, Last Name and User Name already exists", "OK", "", "Cancel")
				Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip) ''''XUI.Color_ARGB(255, 49, 211, 184)
				Dialog.TitleBar.GetView(0).Height = Dialog.TitleBar.GetView(0).Height + 10dip
				Dialog.mParent.Color = xui.Color_Transparent
				Dim btnOK As B4XView = Dialog.GetButton(DialogResponse.POSITIVE)
				Dim btncnl As B4XView = Dialog.GetButton(DialogResponse.CANCEL)
				btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
				btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
				wait for (sf) Complete(result As Int)
				LogColor("signup sf results: " & result, Colors.Blue)
				If result = DialogResponse.POSITIVE Then
					'''Activity.Finish
					'''StartActivity(Main)
					'''B4XPages.ClosePage(Me)
					ClearAllFields
				End If
				Return
				End If
			Next
			'''Log("collections: " & coll)
			
'''			Dim fand As FieldFilter
'''			fand.Initialize.EqualTo("UserName", uname).EqualTo("EMAIL", Common.EMAIL).EqualTo("UserName", uname).EqualTo("Sex", sex)
'''			Dim filter As CompositeFilter
'''			filter.Initialize.Filters(fand)
'''			Dim qry As Query
'''			Dim p As PathBuilder
'''			p.Initialize
'''			p.Collection("StromDB").Document("Registrations")
'''			Log("path: " & p.Complete)
'''			qry.Initialize.From("StromDB").From("Registrations").From("Users").Where(filter)
'''			wait for (B4XPages.MainPage.store.RunQuery(qry)) Complete(Map As Map)
'''			Log("map is initialized: " & Map.IsInitialized)
'''			Log("map size: " & Map.Size)
'''			Log("accounts found: " & Map)	
'''			Dim json As JSONParser
'''			Dim s As String = Map.Get("documents")
'''			json.Initialize(s)
'''			Dim l As List = json.NextArray
'''			For Each val As Map In l
'''				Log("val: " & val)
'''				If val.ContainsKey("id") Then
'''					exists = True
'''				End If
'''			Next
'''			Log("m: " & l)
'''			If exists Then
'''				LogColor("remote record already exists, skipping!", Colors.Red)
'''				'''				Dim sf As Object = XUI.Msgbox2Async("A record with the First Name, Last Name and User Name already exists", "User Exists", "OK", "Cancel", "", Null)
'''				'''				Wait For (sf) Msgbox_Result (Result As Int)
'''				'''				If Result = XUI.DialogResponse_Positive Then
'''				'''					'''Log("Deleted!!!")
'''				'''					Activity.Finish
'''				'''					StartActivity(Main)
'''				'''				End If
'''				Dialog.Initialize(Root)
'''				Dialog.BorderCornersRadius = 20
'''				Dialog.BorderWidth = 0dip
'''				Dialog.Title = "User Exists"
'''				Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
'''				Dialog.ButtonsTextColor = xui.Color_White
'''				Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
'''				Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
'''				Dialog.TitleBarColor = xui.Color_Transparent
'''				Dialog.BackgroundColor = xui.Color_White
'''				Dialog.BodyTextColor = xui.Color_Black
'''				''rgba(49, 211, 184, 1)
'''				Dim sf As Object = Dialog.Show("A record with the First Name, Last Name and User Name already exists", "OK", "", "Cancel")
'''				Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip) ''''XUI.Color_ARGB(255, 49, 211, 184)
'''				Dialog.TitleBar.GetView(0).Height = Dialog.TitleBar.GetView(0).Height + 10dip
'''				Dialog.mParent.Color = xui.Color_Transparent
'''				Dim btnOK As B4XView = Dialog.GetButton(DialogResponse.POSITIVE)
'''				Dim btncnl As B4XView = Dialog.GetButton(DialogResponse.CANCEL)
'''				btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
'''				btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
'''				wait for (sf) Complete(result As Int)
'''				LogColor("signup sf results: " & result, Colors.Blue)
'''				If result = DialogResponse.POSITIVE Then
'''					'''Activity.Finish
'''					'''StartActivity(Main)
'''					'''B4XPages.ClosePage(Me)
'''					ClearAllFields
'''				End If
'''			Else
				'''ProgressDialogShow2("Creating UserName, please wait!", False)
				progressdialog.Show("Creating UserName, please wait!", xui.Color_White)
				Starter.userName = uname.Trim
				Starter.pinNumber = pin.Trim
'''				Dim insertQuery As String = "INSERT INTO Registrations (SignUpDate, FirstName, LastName, EMAIL, UserName, PinNumber, DOB, Sex, Height) VALUES " & "(" & "'"&today&"',  "&"'"&fname&"', " & "'"&lname&"', " & "'" & Common.EMAIL & "', " & "'"&uname&"', " & "'"&pin&"', " & "'"&dob&"', " & "'"&sex&"', " & "'"&heightftin&"')"
'''			'''	db.ExecuteRemoteQuery(insertQuery, "INSERT")
'''				wait for QueryResults(Results As List)
'''				For i = 0 To Results.Size - 1
'''					Dim m As Map
'''					m = Results.Get(i)
'''					Log("records inserted: " & m)
'''				Next
				Dim insertFields As Map
				insertFields.Initialize
				insertFields.Put("SignUpDate", today)
				insertFields.Put("FirstName", fname)
				insertFields.Put("LastName", lname)
				insertFields.Put("EMAIL", Common.EMAIL)
				insertFields.Put("UserName", uname)
				insertFields.Put("PinNumber", pin)
				insertFields.Put("DOB", dob)
				insertFields.Put("Sex", sex)
				insertFields.Put("Height", heightftin)
				
				''wait for (B4XPages.MainPage.store.InsertData("StromDB", "Registrations", insertFields)) Complete(results As Map)
				'''wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations", "new", insertFields)) Complete(results As Map)
				
				Dim path As PathBuilder
				path.Initialize
				path.Collection("StromDB").Document("Registrations").Collection("Users")
				wait for (B4XPages.MainPage.store.CreateDocument(path.Complete, "", insertFields)) Complete(results As Map)
				Log("Inserted records into Registrations collection: " & results)
				ClearAllFields
				progressdialog.hide
				'''				Dim sf As Object = XUI.Msgbox2Async("UserName and Pin have been created, would you like to Login?", "Registration Completed", "Yes", "Cancel", "No", Null)
				'''				Wait For (sf) Msgbox_Result (result As Int)
				'''				If result = XUI.DialogResponse_Positive Then
				'''					'''Log("Deleted!!!")
				'''					'''StartActivity(PosReference)
				'''					StartActivity(MainMenu)
				'''				Else
				Dialog.Initialize(Root)
				Dialog.BorderCornersRadius = 20
				Dialog.BorderWidth = 0dip
				Dialog.Title = "Registration Completed"
				Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
				Dialog.ButtonsTextColor = xui.Color_White
				Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
				Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
				Dialog.TitleBarColor = xui.Color_Transparent
				Dialog.BackgroundColor = xui.Color_White
				Dialog.BodyTextColor = xui.Color_Black
				''rgba(49, 211, 184, 1)
				Dim sf As Object = Dialog.Show("Username and PIN have been created, would you like to Login?", "OK", "", "Cancel")
				Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip) '''XUI.Color_ARGB(255, 49, 211, 184)
				Dialog.TitleBar.GetView(0).Height = Dialog.TitleBar.GetView(0).Height + 10dip
				Dialog.mParent.Color = xui.Color_Transparent
				Dim btnOK As B4XView = Dialog.GetButton(DialogResponse.POSITIVE)
				Dim btncnl As B4XView = Dialog.GetButton(DialogResponse.CANCEL)
				btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
				btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
				wait for (sf) Complete(result As Int)
				'''LogColor("signup sf results: " & result, Colors.Blue)
				If result = DialogResponse.POSITIVE Then
					'''Activity.Finish
					'''StartActivity(MainMenu)
					'''B4XPages.ShowPage("MainMenu")
					'''B4XPages.MainPage.mMainMenu.Initialize
					'''B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
					'''B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
					B4XPages.ShowPageAndRemovePreviousPages("mainpage")
					B4XPages.GetPage("mainpage").As(B4XMainPage).AnimateFromLeft
				End If
				Log("canceled, or No pressed")
				'''End If
				'''	Sleep(500)
			'''End If
'''		Else
'''			Starter.kvs.Put(fname&"-"&lname&"-"&uname, data)
'''			'''ToastMessageShow("No Internet connection detected, Please try again!", True)
'''			dynamictoast.ErrorMessageToast = "No Internet connection detected, please try again!"
'''		End If
		'''DBUtils.InsertMaps(Starter.customers, "SignUps", Array(data))
		'''wait for QueryResults(Results As List)
		'''LogColor("Records Inserted into Remote DB: " & Results, Colors.Green)
		'''End If
	Else
		'''		Dim sf As Object = XUI.Msgbox2Async("Please Fill out all required fields!", "E R R O R", "OK", "Cancel", "", Null)
		'''		Wait For (sf) Msgbox_Result (result As Int)
		'''		If result = XUI.DialogResponse_Positive Then
		'''			'''Log("Deleted!!!")
		'''
		'''		End If
		Dialog.Initialize(Root)
		Dialog.BorderCornersRadius = 20
		Dialog.BorderWidth = 0dip
		Dialog.Title = "E R R O R"
		Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)'''xui.CreateFont(myfont, 17)
		Dialog.ButtonsTextColor = xui.Color_White
		Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
		Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
		Dialog.TitleBarColor = xui.Color_Transparent
		Dialog.BackgroundColor = xui.Color_White
		Dialog.BodyTextColor = xui.Color_Black
		''rgba(49, 211, 184, 1)
		Dim sf As Object = Dialog.Show("Please fill out all required fields!", "OK", "", "Cancel")
		Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)  '''XUI.Color_ARGB(255, 49, 211, 184)
		Dialog.TitleBar.GetView(0).Height = Dialog.TitleBar.GetView(0).Height + 10dip
		Dialog.mParent.Color = xui.Color_Transparent
		Dim btnOK As B4XView = Dialog.GetButton(DialogResponse.POSITIVE)
		Dim btncnl As B4XView = Dialog.GetButton(DialogResponse.CANCEL)
		btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
		btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
		'''btnOK.Color = Common.LightBlueColors
		'''btncnl.color = Common.DarkGrayColors
		wait for (sf) Complete(result As Int)
		LogColor("signup sf results: " & result, Colors.Blue)
		If result = DialogResponse.POSITIVE Then
			'''			Activity.Finish
			'''			StartActivity(Main)
	End If
	End If
End Sub

Private Sub txtDOB1_FocusChanged(HasFocus As Boolean)
	'''	If HasFocus Then
	'''		ToggleDrawerState
	'''	End If
End Sub

Private Sub pnlOverText_Click
	'''ime.HideKeyboard
	'''	Overlay2.Visible = False
	ToggleDrawerState
	'''whlDate.Show(txtDOB1, "")
	whlDate.Show2("whlDate", "")
	whlDate.SetBackgroundColor(Colors.white)
	whlDate.SetWindowLineColor(Colors.LightGray)
	whlDate.SetWindowColor(Colors.ARGB(0, 255, 255, 255)) '''96, 0, 0, 255
End Sub

Sub whlDate_Closed(Canceled As Boolean, Selection As String)
	If Canceled = False Then
		'''Activity.Title = Selection
		Log("Selection " & Selection.Replace("/", "-"))
		txtDOB1.Text = Selection
		ToggleDrawerState
	Else
		Log("Selection " & Selection)
		txtDOB1.Text = Selection
		ToggleDrawerState
	End If
End Sub

Private Sub btnBackSignup_Click
	'''Activity.Finish
	'''StartActivity(Main)
	B4XPages.ClosePage(Me)
End Sub

Private Sub pnlOverHeight_Click
	'''ime.HideKeyboard
	'''	Overlay.Visible = False
	ToggleDrawerState2
	whlCustom.Show2("whlCustom", "")
	whlCustom.SetBackgroundColor(Colors.white)
	whlCustom.SetWindowLineColor(Colors.LightGray)
	whlCustom.SetWindowColor(Colors.ARGB(0, 255, 255, 255)) '''96, 0, 0, 255
End Sub

Sub whlCustom_Closed(Canceled As Boolean, Selection As String)
	If Canceled = False Then
		'''Activity.Title = Selection
		Log("Selection " & Selection)
		Dim sel() As String = Regex.Split("/", Selection)
		heightftin = sel(0)&"-"&sel(1)
		txtHeightft.Text = sel(0) & " ft" & "   " & sel(1) & " in"
		ToggleDrawerState2
	Else
		Log("Selection " & Selection)
		Dim sel() As String = Regex.Split("/", Selection)
		txtHeightft.Text = sel(0) & " ft" & "   " & sel(1) & " in"
		ToggleDrawerState2
	End If
End Sub

Private Sub pnlOverSex_Click
	'''ime.HideKeyboard
	ToggleDrawerState3
End Sub

Private Sub rdSex_CheckedChange(Checked As Boolean)
	Dim rd As RadioButton = Sender
	If rd.Tag = "Male" Then
		txtSex.Text = "Male"
	else if rd.Tag = "Female" Then
		txtSex.Text = "Female"
	End If
	ToggleDrawerState3
End Sub

Private Sub ClearAllFields
	txtFirstName.Text = ""
	txtLastName.Text = ""
	txtUserName.Text = ""
	txtPin.Text = ""
	txtDOB1.Text = ""
	txtSex.Text = ""
	txtHeightft.Text = ""
	txtEmail.Text = ""
End Sub