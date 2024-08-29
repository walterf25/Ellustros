B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.85
@EndOfDesignText@
#Region Shared Files
''#CustomBuildAction: folders ready, %WINDIR%\System32\Robocopy.exe,"..\..\Shared Files" "..\Files"
'Ctrl + click to sync files: ide://run?file=%WINDIR%\System32\Robocopy.exe&args=..\..\Shared+Files&args=..\Files&FilesSync=True
#End Region

'Ctrl + click to export as zip: ide://run?File=%B4X%\Zipper.jar&Args=Project.zip

Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	
	Private imgBackground As B4XView
	Private btnSignUp As B4XView
	Private txtUserName As B4XView
	Private txtPinNumber As B4XView
	Private btnLogin As B4XView
	Private uname, pin As String
	'''Private ime As IME
	Private lblWelcome As B4XView
	Private Font1 As B4XFont
	Private imgIcon As B4XView
	'''	Private fa As FirebaseAnalytics
	
	'''Private ph As SensorExtender
	Private Dialog As B4XDialog
	Private lbltext As B4XView
	Private imgsplash As B4XView
	Private splashtimer As Timer
	Private pnlToolBar As B4XView
	Private lblTitle As B4XView
	Private lblSubtitle As B4XView
	Private lblusername As B4XView
	Private lblPinNumber As B4XView
	
	Private Size As Float
	Private pnlmain As B4XView
	
	Dim myfont As B4XFont
	Dim myfont2 As B4XFont
	#If B4A
	Private progressdialog As CustomProgressDialog
	#Else
	Private progressdialog As HUD
	#End If
	Private lblForgotPassword As B4XView
	
	Public mSignUp As SignUp
	Public mMainMenu As MainMenu
	Public mPairDevice As PairDevice
	Public mProfile2 As Profile2
	Public mRecommendations As Recommendations
	Public mManualSettings As ManualSettings
	Public mStartExperience As StartExperience
	Public mPlayTutorial As PlayTutorial
	Public mPictureScreen As PictureScreen
	Public mOnboardingSteps As OnboardingSteps
	Public mMeasurementsDone As MeasurementsDone
	Public mSummary As Summary
	Public mChairOptimal As ChairOptimal
	Public mPersonalInfo As PersonalInfo
	Public mhelpMenu As helpMenu
	Public mResetPassword As ResetPassword
	Public mContact As ContactInfo
	Public mSeating As Seating
	Public mStanding As Standing
	
	Public auth As FirebaseAuth
	Public authREST As FirebaseAuthREST
	Public authHELPER As FirebaseAuthRESTHelper
	Public Manager As KeyValueStore
	Public projectID As String = "strom-ergonomics"
	Public store As Firestore
	Private Token_ID As String
	''Private ir As ReleaseLogger
End Sub

Public Sub Initialize
	B4XPages.GetManager.LogEvents = True
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'''Root.LoadLayout("MainPage")
	authREST.Initialize
	authHELPER.Initialize(Me,"authHelper")
	'''auth.Initialize("auth")
	#if b4a
	Manager.Initialize(File.DirInternal,"data.db")
	#Else
	Manager.Initialize(File.DirTemp,"data.db")
	#End If
	#If B4A
	B4XPages.GetManager.TransitionAnimationDuration = 0
	#End If
	#If B4i
	Common.CheckDBConnection
	#End If
	Root.LoadLayout("splash")
	splashtimer.Initialize("splashtimer", 4000)
	splashtimer.Enabled = True
	mSignUp.Initialize
	mMainMenu.Initialize
	mPairDevice.Initialize
	mProfile2.Initialize
	mRecommendations.Initialize
	mManualSettings.Initialize
	mStartExperience.Initialize
	mPlayTutorial.Initialize
	mPictureScreen.Initialize
	mOnboardingSteps.Initialize
	mMeasurementsDone.Initialize
	mSummary.Initialize
	mChairOptimal.Initialize
	mPersonalInfo.Initialize
	mhelpMenu.Initialize
	mResetPassword.Initialize
	mContact.Initialize
	mSeating.Initialize
	mStanding.Initialize
	B4XPages.AddPage("SignUp", mSignUp)
	B4XPages.AddPage("MainMenu", mMainMenu)
	B4XPages.AddPage("PairDevice", mPairDevice)
	B4XPages.AddPage("Profile2", mProfile2)
	B4XPages.AddPage("Recommendations", mRecommendations)
	B4XPages.AddPage("Seating", mSeating)
	B4XPages.AddPage("Standing", mStanding)
	B4XPages.AddPage("ManualSettings", mManualSettings)
	B4XPages.AddPage("StartExperience", mStartExperience)
	B4XPages.AddPage("PlayTutorial", mPlayTutorial)
	B4XPages.AddPage("PictureScreen", mPictureScreen)
	B4XPages.AddPage("OnboardingSteps", mOnboardingSteps)
	B4XPages.AddPage("MeasurementsDone", mMeasurementsDone)
	B4XPages.AddPage("Summary", mSummary)
	B4XPages.AddPage("ChairOptimal", mChairOptimal)
	B4XPages.AddPage("PersonalInfo", mPersonalInfo)
	B4XPages.AddPage("helpMenu", mhelpMenu)
	B4XPages.AddPage("ResetPassword", mResetPassword)
	B4XPages.AddPage("ContactInfo", mContact)
	'''FillImageToView(LoadBitmap(File.DirAssets, "main_logo.png"), imgsplash)
	'''imgsplash.SetLayoutAnimated(1000, -100%x/2, -100%y/2, 100%x, 100%y)
	''imgsplash.SetBackgroundImage(LoadBitmap(File.DirAssets, "Final Strom Logo.png"))
	imgsplash.SetBitmap(xui.LoadBitmapResize(File.DirAssets, "Ellustros_Final_Logo.png", imgsplash.Width, imgsplash.Height, True))
	'''imgsplash.SetLayoutAnimated(1000,  , -50%y/2, 50%x, 50%y)
	'''pnlmain.SetLayoutAnimated(1000, 0, 0, 100%x, 100%y)
	pnlmain.SetVisibleAnimated(1800, True)
	Sleep(1800)
	ResumeLayout

	'''GetCrashlytics.RunMethod("log", Array As String("inside B4XMainPage..."))
End Sub

private Sub ResumeLayout
	If imgsplash.IsInitialized Then
		'''	Log("removing splashscreen")
		'''	imgsplash.RemoveView
		imgsplash.RemoveViewFromParent
	End If
	Root.LoadLayout("Layout")
	#If B4A
	progressdialog.Initialize(Root, 400dip, -1, -1, "", "", Common.LightBlueColors, xui.Color_White, "DEFAULT", True)
	#Else
	''no initialization required.
	#End If
	'''lblWelcome.Text = "STRÖM" & CRLF & "Ergonomics"
	'''Font1.LoadFromAssets("Sen-Regular.otf")
	lblWelcome.font = Common.myfont
	'''Dim bmp As B4XBitmap = LoadBitmap(File.DirAssets, "chair.PNG")
	'''FillImageToView(CreateBitmapWithAlpha(bmp, 75), imgBackground)
	'''Dim bmp As B4XBitmap = LoadBitmap(File.DirAssets, "background_noicon.png")
	'''	If GetDeviceLayoutValues.ApproximateScreenSize < 5 Then
	imgIcon.Visible = False
	'''imgIcon.SetBackgroundImage(LoadBitmap(File.DirAssets, "Strom Icon-Android.png"))
	'''		imgBackground.SetBitmap(bmp)
	'''	Else
	'''		FillImageToView(bmp, imgBackground)
	'''	End If
	

	'''Dim myfont3 As Typeface
	#If B4A
	myfont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 20)
	myfont2 = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 20)
	#else
	myfont = Common.CreateB4XFont("CeraPro-Black", 20, 20)
	myfont2 = Common.CreateB4XFont("CeraPro-Medium", 20, 20)
	#End If
	
	lblTitle.Font = Common.myfont
	lblSubtitle.Font = Common.myfont2
	lblTitle.TextColor = Common.TitleColor		'''Colors.rgb(28, 30, 36)
	lblSubtitle.TextColor = Common.SubTitleColor	'''Colors.rgb(73, 75, 79)
	lblTitle.TextSize = 36
	lblSubtitle.TextSize = 20
	#If Default
	lblTitle.Text = "Welcome to" & CRLF & "STRÖM Bespoke"
	lblSubtitle.Text = "Your fully automated" & CRLF &  "ergonomic experience"
	#If B4i
		lblSubtitle.As(Label).Multiline = True
	#End If
	#Else If Lite
		lblTitle.Text = "Welcome to" & CRLF & Common.ellustros & " Bespoke"
		lblSubtitle.Text = "Your fully automated" & CRLF &  "ergonomic experience"
	#End If
	lblusername.TextColor = xui.Color_Black'''Colors.Black
	lblPinNumber.TextColor = xui.Color_Black'''Colors.Black
	'''lblusername.Text = "USERNAME*"
	'''lblPinNumber.Text = "PASSWORD*"
	'''lblusername.Typeface = myfont
	'''lblPinNumber.Typeface = myfont
	
	Dim cs As CSBuilder
	#if B4A
	lblForgotPassword.Text = cs.Initialize.Color(xui.color_rgb(87, 87, 87)).Underline.Append("forgot my PIN").PopAll       ''''"forgot my PIN"
	#Else
	lblForgotPassword.As(Label).AttributedText = cs.Initialize.Color(xui.color_rgb(87, 87, 87)).Alignment("ALIGN_CENTER").Underline.Append("forgot my PIN").PopAll
	#End If
	lblForgotPassword.Font = myfont2
	lblForgotPassword.TextSize = 16
	lblForgotPassword.TextColor = xui.Color_Black
	#If B4A
	lblForgotPassword.As(Label).Gravity = Gravity.CENTER_HORIZONTAL
	#End If
	'''lblForgotPassword.Typeface = Typeface.CreateNew(myfont2, Typeface.
	
	btnLogin.font = Common.btnFont
	btnSignUp.font = Common.btnFont
	txtUserName.font = myfont2
	txtPinNumber.font = myfont2
	txtUserName.EditTextHint = "Enter username"
	txtPinNumber.EditTextHint = "Enter 4-digit PIN"
	
	txtUserName.TextColor = xui.Color_Black
	txtPinNumber.TextColor = xui.Color_Black
	#If B4A
	txtUserName.As(EditText).HintColor = xui.Color_ARGB(255, 157, 161, 136)'''Colors.argb(255, 157, 161, 136)
	txtPinNumber.As(EditText).HintColor = xui.Color_ARGB(255, 157, 161, 136)'''Colors.argb(255, 157, 161, 136)
	txtPinNumber.As(EditText).InputType = txtPinNumber.As(EditText).INPUT_TYPE_NUMBERS
	txtPinNumber.As(EditText).ForceDoneButton = True
	#End if
	txtUserName.TextSize = 20
	txtPinNumber.TextSize = 20

	
	txtUserName.SetColorAndBorder(xui.Color_RGB(244, 248, 249), 0, xui.Color_Black, 0dip)
	txtPinNumber.SetColorAndBorder(xui.Color_RGB(244, 248, 249), 0, xui.Color_Black, 0dip)

	btnLogin.SetColorAndBorder(xui.Color_RGB(164, 212, 232), 0, xui.Color_Transparent, 35dip)
	
	btnSignUp.SetColorAndBorder(xui.Color_RGB(73, 75, 79), 0, xui.Color_Transparent, 35dip)
	btnLogin.TextColor = xui.Color_White	''Colors.white
	btnSignUp.TextColor = xui.Color_White'''Colors.white
	
	btnLogin.Text = "Log in"
	btnSignUp.Text = "Sign up"
	
	'''auth.SignOutFromGoogle
	
	'''ime.Initialize("ime")
	
	Size=txtUserName.TextSize       'Original Size Defined In Designer
	SetHintSize(txtUserName)
	SetHintSize(txtPinNumber)

	''RemoveAllCaps(Root.Parent)
	
	#if B4A
	txtPinNumber.As(EditText).PasswordMode = True
	#else
	
	#End If
	
	'''auth.SignInWithGoogle
	authHELPER.GetAccessToken
	
End Sub

'''private Sub auth_SignedIn (User As FirebaseUser)
'''	Log("user signed in: " & User.DisplayName & " / " & User.Email)
'''	auth.GetUserTokenId(User, True)
'''End Sub

private Sub auth_TokenAvailable (User As FirebaseUser, Success As Boolean, TokenID As String)
'''	Log("token_id: " & TokenID)
'''	If Success Then
'''		Manager.Put("token",TokenID)
'''		store.Initialize("Firestore",Me,TokenID,"(default)",projectID)
'''		Log("farh_AccessTokenAvailable")
'''		
'''		
'''		Dim fields As Map
'''		fields.Initialize
'''		fields.Put("ArmRestHeight", 13.8)
'''		fields.Put("ArmRestWidth", 23.6)
'''		fields.Put("BackRestAngle", 90)
'''		fields.Put("EMAIL", "walter@adwayusa.com")
'''		fields.Put("InflatableLumbarSupport", 70)
'''		fields.Put("LumbarHeight", 23.5)
'''		fields.Put("Password", "0905")
'''		fields.Put("SeatDepth", 16.5)
'''		fields.Put("SeatHeight", 18.4)
'''		fields.Put("SeatTilt", -6)
'''		fields.Put("SeatWidth", 23.6)
'''		fields.Put("UserName", "walterf25")
'''		wait for (store.UpdateDocument("StromDB", "ManualSettings", fields)) Complete(results As Map)
'''	'''Else
'''		'''authHELPER.GetAccessToken
'''	End If
End Sub

private Sub auth_SignError (Error As Exception)
	Log("Error: " & Error.Message)
End Sub

#Region AUTH
Private Sub authHelper_Authenticate
'''	Wait For (authREST.signInAnonymously(True)) complete (Data As Map)
'''	If Data.ContainsKey("idToken") Then
'''		Manager.Put("token",Data.Get("idToken"))
'''		Manager.Put("refreshToken",Data.Get("refreshToken"))
'''		store.Initialize("Firestore",Me,Data.Get("idToken"),"(default)",projectID)
''''''		Wait For(store.GetCollection("ManualSettings")) Complete(Map As Map)
''''''		Log(Map)
'''		Dim fields As Map
'''		fields.Initialize
'''		fields.Put("ArmRestHeight", 13.6)
'''		fields.Put("ArmRestWidth", 23.6)
'''		fields.Put("BackRestAngle", 90)
'''		fields.Put("EMAIL", "walterf252000@yahoo.com")
'''		fields.Put("InflatableLumbarSupport", 70)
'''		fields.Put("LumbarHeight", 23.5)
'''		fields.Put("Password", "0902")
'''		fields.Put("SeatDepth", 16.5)
'''		fields.Put("SeatHeight", 18.4)
'''		fields.Put("SeatTilt", -6)
'''		fields.Put("SeatWidth", 23.6)
'''		fields.Put("UserName", "walterf25")
'''		wait for (store.UpdateDocument("ManualSettings", "ManualSetting", fields)) Complete(results As Map)
'''		Log("updated doc: " & results)
'''	Else
'''		Log("ErrorCode: " & authREST.getErrorCode(Data))
'''		Log("ErrorMessage: " & authREST.getErrorMessage(Data))
'''		Log("Reason: " & authREST.getErrorMap(Data).Get("reason"))
'''		Log("Domain: " & authREST.getErrorMap(Data).Get("domain"))
'''		Log("Message: " & authREST.getErrorMap(Data).Get("message"))
'''	End If
'''	wait for (authREST.signInWithOauthCredentials(Token_ID))Complete(data As Map)
	'''	Log("data: " & data)
	Wait For (authREST.signInAnonymously(True)) complete (Data As Map)
	'''Log("token_id: " & TokenID)
	If Data.ContainsKey("idToken") Then
		Token_ID = Data.Get("idToken")
		Manager.Put("token",Token_ID)
		store.Initialize("Firestore",Me,Token_ID,"(default)",projectID)
		Log("farh_AccessTokenAvailable")
		
		
'''		Dim fields As Map
'''		fields.Initialize
'''		fields.Put("ArmRestHeight", 13.8)
'''		fields.Put("ArmRestWidth", 23.6)
'''		fields.Put("BackRestAngle", 90)
'''		fields.Put("EMAIL", "walter@adwayusa.com")
'''		fields.Put("InflatableLumbarSupport", 70)
'''		fields.Put("LumbarHeight", 23.5)
'''		fields.Put("Password", "0905")
'''		fields.Put("SeatDepth", 16.5)
'''		fields.Put("SeatHeight", 18.4)
'''		fields.Put("SeatTilt", -6)
'''		fields.Put("SeatWidth", 23.6)
'''		fields.Put("UserName", "walterf25")
'''		
'''		wait for (store.UpdateDocument("StromDB", "ManualSettings", fields)) Complete(results As Map)
		'''Else
		'''authHELPER.GetAccessToken
	End If
End Sub

Private Sub authHelper_AccessTokenAvailable (Success As Boolean, Token As String)
	Log("farh_AccessTokenAvailable")
	Log("Success: " & Success)
	Log("Token: " & Token)
	If Success Then
		Manager.Put("token",Token)
		store.Initialize("Firestore",Me,Token,"(default)",projectID)
		Log("farh_AccessTokenAvailable")
	Else
		authHELPER.GetAccessToken
	End If
End Sub

Private Sub authHelper_RefreshToken(RefreshToken As String)
	Log("RefreshToken: " & RefreshToken)
	If RefreshToken.EqualsIgnoreCase("") == True And RefreshToken.EqualsIgnoreCase(Null) == True Then
		Log("farh_RefreshToken empty")
		authHELPER.GetAccessToken
	Else
		Log("farh_RefreshToken not empty")
		Wait For (authREST.refreshToken("refresh_token",RefreshToken)) complete (Data As Map)
		If Data.Size > 0 Then
			Manager.Put("token",Data.Get("id_token"))
			Manager.Put("refreshToken",Data.Get("refresh_token"))
			Manager.Put("uid",Data.Get("user_id"))
			store.Initialize("Firestore",Me,Data.Get("id_token"),"(default)",projectID)
			Log("farh_RefreshToken")
		Else
			Log("farh_RefreshToken failed")
			authHELPER.GetAccessToken
		End If
	End If
End Sub
#End Region

'''private Sub auth_TokenAvailable (User As FirebaseUser, Success As Boolean, TokenId As String)
'''	LogColor("token: " & User.DisplayName & " " & "Sucess: " & Success & " TokenId: " & TokenId, xui.Color_Blue)
'''	Dim store As Firestore
'''	store.Initialize("store", Me, TokenId, "", "strom-ergonomics")
'''	store.OfflineMode = False
''''''	wait for (store.GetDocument("ManualSettings", "ManualSetting")) Complete(Map As Map)
''''''	Log("document: " & Map)
'''	
''''''	Dim fields As List
''''''	fields.Initialize
''''''	fields.AddAll(Array As String("20.2", "9.6", "90", "walterf252000@gmail.com", "50", "25.7", "0902", "13.2", "17.5", "-6", "11", "walterf25"))
'''	Dim fields As Map
'''	fields.Initialize
'''	fields.Put("ArmRestHeight", "12.5")
'''	fields.Put("ArmRestWidth", "10.3")
'''	fields.Put("BackRestAngle", "90")
'''	fields.Put("EMAIL", "walterf252000@gmail.com")
'''	fields.Put("InflatableLumbarSupport", "100")
'''	fields.Put("LumbarHeight", "13.6")
'''	fields.Put("Password", "0902")
'''	fields.Put("SeatDepth", "11.7")
'''	fields.Put("SeatHeight", "13.4")
'''	fields.Put("SealtTilt", "-6")
'''	fields.Put("SeatWidth", "10.8")
'''	fields.Put("UserName", "walterf25")
'''	wait for (store.UpdateDocument("ManualSettings", "ManualSetting", fields)) Complete(Map As Map)
'''	LogColor("updated document: " & Map, xui.Color_Blue)
'''End Sub

private Sub store_Ready
	Log("firestore ready")
End Sub

Private Sub store_DocumentChanged(Data As Map)
	Log("document changed: " & Data)
End Sub

Private Sub store_CollectionChanged(Data As Map)
	Log("collection changed: " & Data)
End Sub

Private Sub GetCrashlytics As JavaObject
	Dim jo As JavaObject
	jo = jo.InitializeStatic("com.google.firebase.crashlytics.FirebaseCrashlytics").RunMethod("getInstance", Null)
	Return jo
End Sub

'''Sub RemoveAllCaps (Parent As Panel)
'''	For Each v As View In Parent.GetAllViewsRecursive
'''		'''		Log("v is: " & GetType(v))
'''		If GetType(v) = "android.support.v7.widget.AppCompatButton" Then
'''			Dim jo As JavaObject = v
'''			jo.RunMethod("setAllCaps", Array(False))
'''		else if GetType(v) = "androidx.appcompat.widget.AppCompatButton" Then
'''			Dim jo As JavaObject = v
'''			jo.RunMethod("setAllCaps", Array(False))
'''		else if GetType(v) = "androidx.appcompat.widget.AppCompatEditText" Then
'''			Dim jo As JavaObject = v
'''			jo.RunMethod("setAllCaps", Array(False))
'''		End If
'''	Next
'''End Sub

Sub splashtimer_Tick
	'''	ResumeLayout
	splashtimer.Enabled = False
End Sub

Sub SetHintSize(edt As B4XView)
	''Dim cd1 As ColorDrawable
	''cd1.Initialize2(Colors.rgb(249, 250, 253), 0, 0dip, Colors.Black)
	edt.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Transparent, 0dip)
	''edt.Background = cd1
	'''edt.TextColor=Colors.Blue
	If edt.Text.Trim()="" Then
		edt.TextSize=14''Size * .60
	Else
		edt.TextSize=Size
	End If
End Sub

Sub btnSignUp_Click
	'''StartActivity(SignUp)
	'''StartActivity(ShoeHeight)
	'''StartActivity(ManualSettings)
	'''StartActivity(PictureScreen)
	'''StartActivity(Measurements)
	B4XPages.ShowPage("SignUp")
End Sub

Sub txtUserName_TextChanged (Old As String, New As String)
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize(txtUserName)
	End If
	uname = New.Trim
	''Starter.userName = New.Trim
End Sub

Sub txtPinNumber_TextChanged (Old As String, New As String)
	If (Old.Trim="") <> (New.Trim="") Then
		SetHintSize(txtPinNumber)
	End If
	pin = New.Trim
	''Starter.pinNumber = New.Trim
End Sub

Sub btnLogin_Click
	'''ime.HideKeyboard
	'''commenting out temporarily to enable intertia faster testing.
	If uname.Length > 0 And pin.Length > 0 Then
	''' temporarily assigning value to uname variable and pin variable
'''		uname = "walterf25"
'''		pin = "0902"
		#If B4A
		progressdialog.Show("Verifying UserName and Pin Number", xui.Color_White)
		#Else
		progressdialog.ProgressDialogShow("Verifying UserName and Pin Number")
		#end If
		'''Dim loginQuery As String = "SELECT PinNumber FROM Registrations WHERE UserName = "&"'"&uname&"'"
		'''wait for (Starter.Connect) Complete (Success As Boolean)
		'''Wait For (CallSub(Starter, "Connect")) Complete (Success As Boolean)
		''LogColor("connected to db : " & Success, Colors.Blue)
		
'''		Dim DBVersion As Int
'''		'''Dim rs As ResumableSub = GetDBVersion
'''		wait for (Starter.GetDBVersion) Complete (version As Int)
'''		Log("version: " & version)

'''
'''		Dim db As DBTransactions
		Dim remotePin As String
		Dim username As String
'''		db.Initialize(Me)
'''		db.ExecuteRemoteQuery(loginQuery, "LOGIN")
'''		wait for QueryResults(Results As List)
'''	Dim senderfilter As Object = Common.mysql.ExecQueryAsync("LOGIN", loginQuery, Null)
'''	Wait For (senderfilter) LOGIN_QueryComplete (Success As Boolean, rs As JdbcResultSet)
	'''If Success Then
	
		'{"structuredQuery":{"from":[{"collectionId":"Users","allDescendants":false}],"orderBy":[{"field":{"fieldPath":"UserName"}}]}}
	
		Dim path As PathBuilder
		path.Initialize
		path.Document("StromDB/Registrations/")
		Log("path: " & path.Complete)
		Dim fand As CompositeFilter
		Dim filter As FieldFilter
		filter.Initialize.EqualTo("UserName", uname).EqualTo("PinNumber", pin)
		fand.Initialize.Filters(filter)
		Dim qry As Query
		qry.Initialize.From("Users").OrderBy("UserName", qry.ASCENDING).CollectionIn(path).Where(fand)
		wait for (store.RunQuery(qry)) Complete(results As Map)
		Log("results: " & results)
		Dim json As JSONParser
		Dim s As String = results.Get("documents")
		Dim l As List
		If s <> "" Then
		json.Initialize(s)
		
			Try
				'''Dim m2 As Map = json.NextObject
				'''Log("m2: " & m2)
				l = json.NextArray
				Starter.userName = uname
				Starter.pinNumber = pin
				For Each val As Map In l
					'''Dim val As Map = l.Get(0)
					Log("pinNumber: " & val.Get("PinNumber"))
					remotePin = val.Get("PinNumber").As(String)
					username = val.Get("UserName").As(String)
					Common.Collection = val.Get("id")
					Common.EMAIL = val.Get("EMAIL")
				Next
			If remotePin = pin.Trim And username = uname.trim Then
						Common.pinNumber = remotePin
						Common.userName = uname
'''				#If B4A	
'''						ProgressDialogHide
'''						Exit
'''					End If
'''				Next
'''				#Else
'''				progressdialog.ProgressDialogHide
'''				#End If
						Dim height, lumbar, knee, elbow, buttocks, hip, elbowwidth, shoe As String
						'''			Dim querycheck As String = "SELECT Height, LUMBARHEIGHT, KNEEHEIGHT, ELBOWWIDTH, BUTTOCKSHEIGHT, HIPWIDTH, ELBOWHEIGHT, SHOEHEIGHT FROM Registrations WHERE UserName = " & "'"&Common.userName&"'" & " AND PinNumber = " & "'"&Common.pinNumber&"'"
						'''			Dim db As DBTransactions
						'''			db.Initialize(Me)
						'''			db.ExecuteRemoteQuery(querycheck, "SELECTCOLUMNS")
						'''wait for QueryResults(results As List)
			
						'''			Dim senderfilter As Object = Common.mysql.ExecQueryAsync("COLS", querycheck, Null)
						'''			Wait For (senderfilter) COLS_QueryComplete (Success As Boolean, rs2 As JdbcResultSet)
						'''If Success Then
						If results.Size > 0 Then
							Log("map: " & val)
							height = val.Get("Height")
							lumbar = val.Get("LUMBARHEIGHT")
							knee = val.Get("KNEEHEIGHT")
							elbow = val.Get("ELBOWHEIGHT")
							buttocks = val.Get("BUTTOCKSHEIGHT")
							hip = val.Get("HIPWIDTH")
							elbowwidth = val.Get("ELBOWWIDTH")
							shoe = val.Get("SHOEHEIGHT")
						Else
							Log(LastException)
						End If
			
						'''			Log("results size: " & Results.Size & " -- " & Results)
						'''			For i = 0 To Results.Size - 1
						'''				Dim m As Map
						'''				m = Results.Get(i)
						'''			Next
						'''
						'''			'''For Each key As String In m.Keys
						'''			height = m.Get("Height")
						'''			lumbar = m.Get("LUMBARHEIGHT")
						'''			knee = m.Get("KNEEHEIGHT")
						'''			elbow = m.Get("ELBOWHEIGHT")
						'''			buttocks = m.Get("BUTTOCKSHEIGHT")
						'''			hip = m.Get("HIPWIDTH")
						'''			elbowwidth = m.Get("ELBOWWIDTH")
						'''			shoe = m.Get("SHOEHEIGHT")
				 	
						If (height.Length > 0 And lumbar.Length > 0 And knee.Length > 0 And elbow.Length > 0 And buttocks.Length > 0 And hip.Length > 0 And elbowwidth.Length > 0 And shoe.Length > 0 )Then
							'''show dialog to ask whether to show measurements or to start re-taking all the measurements.
							'''ShowDialog
							'''StartActivity(MainMenu)
							'''mMainMenu.loadpageinadvance
							'''B4x_Transition.PrepareTransition_SlideOut(xui, Root.Width, Root.Height, Root, mMainMenu.Root, "RIGHT")
							'''B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
				#if B4A
							'''mMainMenu.AnimateFromRight
							Common.Measurements_Done = True
							B4XPages.ShowPage("MainMenu")
							B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromRight
				#else
				B4XPages.ShowPage("MainMenu")
				#End If
						Else
							'''StartActivity(MainMenu)
							'''B4XPages.ShowPage("MainMenu")
							'''B4x_Transition.PrepareTransition_SlideOut(xui, Root.Width, Root.Height, Root, mMainMenu.Root, "RIGHT")
							'''B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
				#If B4A
							B4XPages.ShowPage("MainMenu")
							mMainMenu.AnimateFromRight
							Common.Measurements_Done = False
				#else
							'''B4XPages.ShowPage("MainMenu")
				B4XPages.ShowPage("MainMenu")
				#End If
							'''ShowDialog
						End If
						'''Next
				#If B4A
						Starter.userName = uname
						Starter.pinNumber = pin
				#Else
				Common.userName = uname
				Common.pinNumber = pin
				#End If
						txtUserName.Text = ""
						txtPinNumber.Text = ""
				#If B4A
						progressdialog.Hide
				#Else
				progressdialog.ProgressDialogHide
				#End If
					Else
						'''ProgressDialogHide
				#If B4A
						progressdialog.Hide
				#Else
				progressdialog.ProgressDialogHide
				#End If
						'''				Dim sf As Object = xui.Msgbox2Async("Pin Number does not match, please try Again!", "Login Error", "OK", "Cancel", "", Null)
						'''				Wait For (sf) Msgbox_Result (Result As Int)
						'''				If Result = xui.DialogResponse_Positive Then
						'''					'''Log("Deleted!!!")
						'''					'''StartActivity(Summary)
						'''				'''Else
						'''					'''StartActivity(PosReference)
						'''				End If
						'''Wait For (Dialog.ShowTemplate(TimedTemplate, "OK", "", "CANCEL")) Complete (Result As Int)
						Dialog.Initialize(Root)
						Dialog.BorderCornersRadius = 20
						Dialog.BorderWidth = 0dip
						Dialog.Title = "Login Error"
				#If B4A
						Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)			'''xui.CreateFont(myfont, 17)
						Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)
				#Else
				Dialog.TitleBarFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
				Dialog.ButtonsFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
				#End If
						Dialog.ButtonsTextColor = xui.Color_White
						'''xui.CreateFont(myfont, 17)
						Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
						Dialog.TitleBarColor = xui.Color_Transparent
						Dialog.BackgroundColor = xui.Color_White
						Dialog.BodyTextColor = xui.Color_Black
						'''Dialog.OverlayColor = xui.Color_ARGB(180, 88, 85, 85)
						''Dialog.BlurBackground = True
						''rgba(49, 211, 184, 1)
						Dim sf As Object = Dialog.Show("Incorrect username or PIN, please try again!", "OK", "", "Cancel")
						Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
						Dialog.TitleBar.GetView(0).Height = Dialog.TitleBar.GetView(0).Height + 10dip
						Dialog.mParent.Color = xui.Color_Transparent
						''Dialog.ButtonsColor = xui.Color_White
						Dim btnOK As B4XView = Dialog.GetButton(xui.DialogResponse_Positive)
						Dim btncnl As B4XView = Dialog.GetButton(xui.DialogResponse_Cancel)
						btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
						btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
						wait for (sf) Complete(result As Int)
						Log("dialog result: " & result)
			#If B4A
						Starter.userName = uname
						Starter.pinNumber = pin
			#Else
			common.userName = uname
			Common.pinNumber = pin
			#End If
						txtUserName.Text = ""
						txtPinNumber.Text = ""
				
					End If
				
			Catch
				Log(LastException.Message)
				progressdialog.Hide
				Dialog.Initialize(Root)
				Dialog.BorderCornersRadius = 20
				Dialog.BorderWidth = 0dip
				Dialog.Title = "Login Error"
				#If B4A
				Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)			'''xui.CreateFont(myfont, 17)
				Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)
				#Else
				Dialog.TitleBarFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
				Dialog.ButtonsFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
				#End If
				Dialog.ButtonsTextColor = xui.Color_White
				'''xui.CreateFont(myfont, 17)
				Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
				Dialog.TitleBarColor = xui.Color_Transparent
				Dialog.BackgroundColor = xui.Color_White
				Dialog.BodyTextColor = xui.Color_Black
				'''Dialog.OverlayColor = xui.Color_ARGB(180, 88, 85, 85)
				''Dialog.BlurBackground = True
				''rgba(49, 211, 184, 1)
				Dim sf As Object = Dialog.Show("Incorrect username or PIN, please try again!", "OK", "", "Cancel")
				Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
				Dialog.TitleBar.GetView(0).Height = Dialog.TitleBar.GetView(0).Height + 10dip
				Dialog.mParent.Color = xui.Color_Transparent
				''Dialog.ButtonsColor = xui.Color_White
				Dim btnOK As B4XView = Dialog.GetButton(xui.DialogResponse_Positive)
				Dim btncnl As B4XView = Dialog.GetButton(xui.DialogResponse_Cancel)
				btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
				btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
				wait for (sf) Complete(result As Int)
				Log("dialog result: " & result)
				
			#If B4A
				Starter.userName = uname
				Starter.pinNumber = pin
			#Else
			common.userName = uname
			Common.pinNumber = pin
			#End If
				txtUserName.Text = ""
				txtPinNumber.Text = ""
				Return
		End Try
'''		Do While rs.NextRow
'''			remotePin = rs.GetString("PinNumber")
'''		Loop
'''		rs.Close
'''		Log("results: " & results)
		'''Dim m As Map = results.Get(0)
	Else
		#If B4A
		progressdialog.Hide
		#Else
		progressdialog.ProgressDialogHide
		#End If
		''			Dim sf As Object = xui.Msgbox2Async("User Name does not exists, please Sign Up", "Login Error", "OK", "Cancel", "", Null)
		''			Wait For (sf) Msgbox_Result (result As Int)
		''			If result = xui.DialogResponse_Positive Then
		''				'''Log("Deleted!!!")
		''
		''			End If
		'''Dialog.Initialize(Activity)
		Dialog.Initialize(Root)
		Dialog.BorderCornersRadius = 20
		Dialog.BorderWidth = 0dip
		Dialog.Title = "Login Error"
			#If B4A
		Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)			'''xui.CreateFont(myfont, 17)
		Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)
			#Else
			Dialog.TitleBarFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
			Dialog.ButtonsFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
			#End If
		Dialog.ButtonsTextColor = xui.Color_White
			
		Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
		Dialog.TitleBarColor = xui.Color_Transparent
		Dialog.BackgroundColor = xui.Color_White
		Dialog.BodyTextColor = xui.Color_Black
		''rgba(49, 211, 184, 1)
		Dim sf As Object = Dialog.Show("Username does not exist, please Sign Up", "OK", "", "Cancel")
		Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
		Dialog.TitleBar.GetView(0).Height = Dialog.TitleBar.GetView(0).Height + 10dip
		Dialog.mParent.Color = xui.Color_Transparent
		''Dialog.ButtonsColor = xui.Color_White
		Dim btnOK As B4XView = Dialog.GetButton(xui.DialogResponse_Positive)
		Dim btncnl As B4XView = Dialog.GetButton(xui.DialogResponse_Cancel)
		btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
		btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
		wait for (sf) Complete(result As Int)
		Log("dialog result: " & result)
			#If B4A
		Starter.userName = uname
		Starter.pinNumber = pin
			#Else
			Common.userName = uname
			Common.pinNumber = pin
			#End If
		txtUserName.Text = ""
		txtPinNumber.Text = ""
		Log(LastException)
	End If	
	'''commenting out temporarily
	Else
			#If B4A
		progressdialog.hide
			#Else
			progressdialog.ProgressDialogHide
			#End If
		'''		Dim sf As Object = xui.Msgbox2Async("Please Enter User Name and Pin Number", "Login Error", "OK", "Cancel", "", Null)
		'''		Wait For (sf) Msgbox_Result (result As Int)
		'''		If result = xui.DialogResponse_Positive Then
		'''			'''Log("Deleted!!!")
		'''
		'''		End If
		'''Dialog.Initialize(Activity)
		Dialog.Initialize(Root)
		Dialog.BorderCornersRadius = 20
		Dialog.BorderWidth = 0dip
		Dialog.Title = "Login Error"
			#If B4A
		Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)			'''xui.CreateFont(myfont, 17)
		Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)
			#Else
			Dialog.TitleBarFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
			Dialog.ButtonsFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
			#End If
		Dialog.ButtonsTextColor = xui.Color_White
	
		'''Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
		Dialog.TitleBarColor = xui.Color_Transparent
		Dialog.BackgroundColor = xui.Color_White
		Dialog.BodyTextColor = xui.Color_Black
		''rgba(49, 211, 184, 1)
		Dim sf As Object = Dialog.Show("Please enter username and Pin number", "OK", "", "Cancel")
		Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip) '''xui.Color_ARGB(255, 49, 211, 184)
		Dialog.TitleBar.GetView(0).Height = Dialog.TitleBar.GetView(0).Height + 10dip
		
		Dialog.mParent.Color = xui.Color_Transparent
		''Dialog.ButtonsColor = xui.Color_White
		Dim btnOK As B4XView = Dialog.GetButton(xui.DialogResponse_Positive)
		Dim btncnl As B4XView = Dialog.GetButton(xui.DialogResponse_Cancel)
		btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
		btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
		wait for (sf) Complete(result As Int)
		Log("dialog result: " & result)
		#If B4A
		Starter.userName = uname
		Starter.pinNumber = pin
			#Else
			Common.userName = uname
			Common.pinNumber = pin
			#End If
		txtUserName.Text = ""
		txtPinNumber.Text = ""
	End If
		
'''		Dim sf As Object = Starter.mysql.ExecQueryAsync("mysql", loginQuery, Null)
'''		wait for (sf) mysql_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'		If Results.Size > 0 Then
''''			For i = 0 To Results.Size - 1
''''				Dim m As Map
''''				m = Results.Get(i)
''''				remotePin = m.Get("PinNumber")
''''			Next
'				'''remotePin = rs.GetString("PinNumber")
'			If remotePin = pin.Trim Then
'				Common.pinNumber = remotePin
'				Common.userName = uname
'				#If B4A
'				ProgressDialogHide
'				#Else
'				progressdialog.ProgressDialogHide
'				#End If
'				Dim height, lumbar, knee, elbow, buttocks, hip, elbowwidth, shoe As String
'				Dim querycheck As String = "SELECT Height, LUMBARHEIGHT, KNEEHEIGHT, ELBOWWIDTH, BUTTOCKSHEIGHT, HIPWIDTH, ELBOWHEIGHT, SHOEHEIGHT FROM Registrations WHERE UserName = " & "'"&Common.userName&"'" & " AND PinNumber = " & "'"&Common.pinNumber&"'"
'				''				Dim db As DBTransactions
'				db.Initialize(Me)
'				db.ExecuteRemoteQuery(querycheck, "SELECTCOLUMNS")
'				wait for QueryResults(Results As List)
'				Log("results size: " & Results.Size & " -- " & Results)
'				For i = 0 To Results.Size - 1
'					Dim m As Map
'					m = Results.Get(i)
'				Next
'				
'				'''For Each key As String In m.Keys
'				height = m.Get("Height")
'				lumbar = m.Get("LUMBARHEIGHT")
'				knee = m.Get("KNEEHEIGHT")
'				elbow = m.Get("ELBOWHEIGHT")
'				buttocks = m.Get("BUTTOCKSHEIGHT")
'				hip = m.Get("HIPWIDTH")
'				elbowwidth = m.Get("ELBOWWIDTH")
'				shoe = m.Get("SHOEHEIGHT")
'				 	
'				If (height.Length > 0 And lumbar.Length > 0 And knee.Length > 0 And elbow.Length > 0 And buttocks.Length > 0 And hip.Length > 0 And elbowwidth.Length > 0 And shoe.Length > 0 )Then
'					'''show dialog to ask whether to show measurements or to start re-taking all the measurements.
'					'''ShowDialog
'					'''StartActivity(MainMenu)
'					'''mMainMenu.loadpageinadvance
'					'''B4x_Transition.PrepareTransition_SlideOut(xui, Root.Width, Root.Height, Root, mMainMenu.Root, "RIGHT")
'					'''B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
'					#if B4A
'					'''mMainMenu.AnimateFromRight
'					Common.Measurements_Done = True
'					B4XPages.ShowPage("MainMenu")
'					B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromRight
'					#else
'					B4XPages.ShowPage("MainMenu")
'					#End If
'				Else
'					'''StartActivity(MainMenu)
'					'''B4XPages.ShowPage("MainMenu")
'					'''B4x_Transition.PrepareTransition_SlideOut(xui, Root.Width, Root.Height, Root, mMainMenu.Root, "RIGHT")
'					'''B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
'					#If B4A
'					B4XPages.ShowPage("MainMenu")
'					mMainMenu.AnimateFromRight
'					Common.Measurements_Done = False
'					#else
'					'''B4XPages.ShowPage("MainMenu")
'						B4XPages.ShowPage("MainMenu")
'					#End If
'					'''ShowDialog
'				End If
'				'''Next
'				#If B4A
'				Starter.userName = uname
'				Starter.pinNumber = pin
'				#Else
'				Common.userName = uname
'				Common.pinNumber = pin
'				#End If
'				txtUserName.Text = ""
'				txtPinNumber.Text = ""
'				#If B4A
'				progressdialog.Hide
'				#Else
'				progressdialog.ProgressDialogHide
'				#End If
'			Else
'				'''ProgressDialogHide
'				#If B4A
'				progressdialog.Hide
'				#Else
'				progressdialog.ProgressDialogHide
'				#End If
'				'''				Dim sf As Object = xui.Msgbox2Async("Pin Number does not match, please try Again!", "Login Error", "OK", "Cancel", "", Null)
'				'''				Wait For (sf) Msgbox_Result (Result As Int)
'				'''				If Result = xui.DialogResponse_Positive Then
'				'''					'''Log("Deleted!!!")
'				'''					'''StartActivity(Summary)
'				'''				'''Else
'				'''					'''StartActivity(PosReference)
'				'''				End If
'				'''Wait For (Dialog.ShowTemplate(TimedTemplate, "OK", "", "CANCEL")) Complete (Result As Int)
'				Dialog.Initialize(Root)
'				Dialog.BorderCornersRadius = 35
'				Dialog.BorderWidth = 0dip
'				Dialog.Title = "Login Error"
'				#If B4A
'				Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)			'''xui.CreateFont(myfont, 17)
'				Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)
'				#Else
'				Dialog.TitleBarFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
'				Dialog.ButtonsFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
'				#End If
'				Dialog.ButtonsTextColor = xui.Color_White
'						'''xui.CreateFont(myfont, 17)
'				Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
'				Dialog.TitleBarColor = xui.Color_Transparent
'				Dialog.BackgroundColor = xui.Color_White
'				Dialog.BodyTextColor = xui.Color_Black
'				'''Dialog.OverlayColor = xui.Color_ARGB(180, 88, 85, 85)
'				''Dialog.BlurBackground = True
'				''rgba(49, 211, 184, 1)
'				Dim sf As Object = Dialog.Show("Incorrect username or PIN, please try again!", "OK", "", "Cancel")
'				Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
'				
'				Dialog.mParent.Color = xui.Color_Transparent
'				''Dialog.ButtonsColor = xui.Color_White
'				Dim btnOK As B4XView = Dialog.GetButton(xui.DialogResponse_Positive)
'				Dim btncnl As B4XView = Dialog.GetButton(xui.DialogResponse_Cancel)
'				btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
'				btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
'				wait for (sf) Complete(result As Int)
'				Log("dialog result: " & result)
'				#If B4A
'				Starter.userName = uname
'				Starter.pinNumber = pin
'				#Else
'				Common.userName = uname
'				Common.pinNumber = pin
'				#End If
'				txtUserName.Text = ""
'				txtPinNumber.Text = ""
'				
'			End If
'		Else
'			#If B4A
'			progressdialog.Hide
'			#Else
'			progressdialog.ProgressDialogHide
'			#End If
'			''			Dim sf As Object = xui.Msgbox2Async("User Name does not exists, please Sign Up", "Login Error", "OK", "Cancel", "", Null)
'			''			Wait For (sf) Msgbox_Result (result As Int)
'			''			If result = xui.DialogResponse_Positive Then
'			''				'''Log("Deleted!!!")
'			''
'			''			End If
'			'''Dialog.Initialize(Activity)
'			Dialog.Initialize(Root)
'			Dialog.BorderCornersRadius = 35
'			Dialog.BorderWidth = 0dip
'			Dialog.Title = "Login Error"
'			#If B4A
'			Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)			'''xui.CreateFont(myfont, 17)
'			Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)
'			#Else
'			Dialog.TitleBarFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
'			Dialog.ButtonsFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
'			#End If
'			Dialog.ButtonsTextColor = xui.Color_White
'			
'			Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
'			Dialog.TitleBarColor = xui.Color_Transparent
'			Dialog.BackgroundColor = xui.Color_White
'			Dialog.BodyTextColor = xui.Color_Black
'			''rgba(49, 211, 184, 1)
'			Dim sf As Object = Dialog.Show("Username does not exist, please Sign Up", "OK", "", "Cancel")
'			Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
'			Dialog.mParent.Color = xui.Color_Transparent
'			''Dialog.ButtonsColor = xui.Color_White
'			Dim btnOK As B4XView = Dialog.GetButton(xui.DialogResponse_Positive)
'			Dim btncnl As B4XView = Dialog.GetButton(xui.DialogResponse_Cancel)
'			btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
'			btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
'			wait for (sf) Complete(result As Int)
'			Log("dialog result: " & result)
'			#If B4A
'			Starter.userName = uname
'			Starter.pinNumber = pin
'			#Else
'			Common.userName = uname
'			Common.pinNumber = pin
'			#End If
'			txtUserName.Text = ""
'			txtPinNumber.Text = ""
'		End If
'''commenting out temporarily
'''	Else
'''		#If B4A
'''		progressdialog.hide
'''		#Else
'''		progressdialog.ProgressDialogHide
'''		#End If
'''		'''		Dim sf As Object = xui.Msgbox2Async("Please Enter User Name and Pin Number", "Login Error", "OK", "Cancel", "", Null)
'''		'''		Wait For (sf) Msgbox_Result (result As Int)
'''		'''		If result = xui.DialogResponse_Positive Then
'''		'''			'''Log("Deleted!!!")
'''		'''
'''		'''		End If
'''		'''Dialog.Initialize(Activity)
'''		Dialog.Initialize(Root)
'''		Dialog.BorderCornersRadius = 35
'''		Dialog.BorderWidth = 0dip
'''		Dialog.Title = "Login Error"
'''		#If B4A
'''		Dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)			'''xui.CreateFont(myfont, 17)
'''		Dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)
'''		#Else
'''		Dialog.TitleBarFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
'''		Dialog.ButtonsFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
'''		#End If
'''		Dialog.ButtonsTextColor = xui.Color_White
'''		
'''		'''Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
'''		Dialog.TitleBarColor = xui.Color_Transparent
'''		Dialog.BackgroundColor = xui.Color_White
'''		Dialog.BodyTextColor = xui.Color_Black
'''		''rgba(49, 211, 184, 1)
'''		Dim sf As Object = Dialog.Show("Please enter username and Pin number", "OK", "", "Cancel")
'''		Dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip) '''xui.Color_ARGB(255, 49, 211, 184)
'''		Dialog.mParent.Color = xui.Color_Transparent
'''		''Dialog.ButtonsColor = xui.Color_White
'''		Dim btnOK As B4XView = Dialog.GetButton(xui.DialogResponse_Positive)
'''		Dim btncnl As B4XView = Dialog.GetButton(xui.DialogResponse_Cancel)
'''		btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
'''		btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
'''		wait for (sf) Complete(result As Int)
'''		Log("dialog result: " & result)
'''		#If B4A
'''		Starter.userName = uname
'''		Starter.pinNumber = pin
'''		#Else
'''		Common.userName = uname
'''		Common.pinNumber = pin
'''		#End If
'''		txtUserName.Text = ""
'''		txtPinNumber.Text = ""
'''	End If
End Sub

Private Sub lblForgotPassword_Click
	'''StartActivity(ResetPassword)
	B4XPages.ShowPage("ResetPassword")
End Sub

Sub B4XPage_Appear
	Log("B4XMainPage just appeared...")
	#If B4i
	Main.App.IdleTimerDisabled = True
	#End If
End Sub

Sub B4XPage_Disappear
	Log("B4XMainPage just disppeared...")
End Sub

#If B4i
Sub B4XPage_Background
	Log("B4XMainpage is in the background...")
	Common.MainPageisInBackground = True
End Sub
#End If

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

Sub IME_HeightChanged (NewHeight As Int, OldHeight As Int)
	Log("newheight: " & NewHeight & " --- " & " OldHeight: " & OldHeight)
	Root.Height = NewHeight
	Log("root.height: " & Root.Height)
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Return True
End Sub