B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private txtEmail As B4XView
	Private btnSubmit As B4XView
	Private myfont As B4XFont
	Private myfont2 As B4XFont
	Private lblTitle As B4XView
	Private rdusername As RadioButton
	Private rdpin As RadioButton
	Private option As String
	Private resetpasswordurl As String = "http://www.stromergonomics.com/passwordreset.php?"
	Private email As String = ""
	Private dialog As B4XDialog
	Private dialog2 As B4XDialog
	'''	Dim I As Intent
	'''	Dim URI As String
	Private lblPinChange As B4XView
	Private txtPinChange As B4XView
	Private btnPinChange As B4XView
	Private pin As String
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("passwordreset")
	
	
	
	myfont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 30)
	lblTitle.font = myfont
	lblTitle.TextColor = Colors.rgb(28, 30, 36)
	lblTitle.Text = "Enter email and choose option below to retrieve username or reset PIN."
	lblTitle.TextSize = 25
	myfont2 = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 16)
	txtEmail.font = myfont2
	btnSubmit.font = Common.btnFont
	
	txtEmail.TextColor = Colors.Black
	#if B4A
	txtEmail.As(EditText).HintColor = Colors.argb(63, 28, 30, 36)
	txtEmail.As(EditText).Hint = "Enter email address"
	#Else
	
	#End If
	'''btnSubmit.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2@2x.png"))
	'''btnSubmit.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSubmit)
	btnSubmit.TextColor = xui.Color_White
	btnSubmit.TextSize = 16
	btnSubmit.font = Common.btnFont
	btnSubmit.Text = "SUBMIT"
	
	rdusername.Typeface = myfont2.ToNativeFont
	rdpin.Typeface = myfont2.ToNativeFont
	rdusername.TextColor = Colors.rgb(28, 30, 36)
	rdpin.TextColor = Colors.rgb(28, 30, 36)
	#If B4A
	SetButtonTintList(rdusername, Colors.LightGray, Common.LightBlueColors)
	SetButtonTintList(rdpin, Colors.LightGray, Common.LightBlueColors)
	#End If
	
	txtEmail.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0)
	
	'''txtEmail.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0)
End Sub

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Sub SetButtonTintList(View As View, Disabled As Int, Enabled As Int)
	Dim States(2,1) As Int
	Dim sd As StateListDrawable 'ignore
	States(0, 0) = sd.State_Enabled
	States(1, 0) = sd.State_Disabled
	Dim Color(2) As Int = Array As Int(Enabled, Disabled)
	Dim CSL As JavaObject
	CSL.InitializeNewInstance("android.content.res.ColorStateList",Array(States,Color))
	Dim jo As JavaObject
	jo.InitializeStatic("android.support.v4.widget.CompoundButtonCompat")
	jo.RunMethod("setButtonTintList", Array(View, CSL))
End Sub

Private Sub txtEmail_TextChanged (Old As String, New As String)
	email = New.Trim
End Sub

Private Sub btnSubmit_Click
	If email.Length > 0 And (rdusername.Checked = True Or rdpin.Checked = True) Then
		'''If Starter.kvs.ContainsKey("token") And Starter.kvs.ContainsKey("expirationdate") Then
		'''if a token has already been generated and we have an expiration date, let's check if the expiration date is still within the allowed 5 minutes, otherwise lets ask for a new one to verify.
		'''Else
		Dim rstpassword As HttpJob
		rstpassword.Initialize("rstpassword", Me)
		rstpassword.Download(resetpasswordurl & $"option=${option}&email=${email}"$)
		wait for JobDone(Job As HttpJob)
		'''End If
		If Job.Success Then
			''Log("string: " & Job.GetString)
			Dim j As JSONParser
			j.Initialize(Job.GetString)
			Dim m As Map = j.NextObject
			Log("result: " & m)
			'''			If m.ContainsKey("username") Then
			Dim resultss As String = m.GetKeyAt(0)
			If resultss.Contains("noemailfound") Or resultss.contains("nouser") Then
				dialog.Initialize(Root)
				dialog.BorderCornersRadius = 20
				dialog.BorderWidth = 0dip
				dialog.Title = "No information found"
				dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
				dialog.ButtonsTextColor = xui.Color_White
				dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
				dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
				dialog.TitleBarColor = xui.Color_Transparent
				dialog.BackgroundColor = xui.Color_White
				dialog.BodyTextColor = xui.Color_Black
				''rgba(49, 211, 184, 1)
				Dim sf As Object = dialog.Show("Email does not match any of our records, please try again!", "OK", "", "Cancel")
				'''dialog.TitleBar.GetView(0).SetColorAndBorder(xui.Color_ARGB(255, 49, 211, 184), 0, xui.Color_Black, 5dip)
				dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
				dialog.TitleBar.GetView(0).Height = dialog.TitleBar.GetView(0).Height + 10dip
				dialog.mParent.Color = xui.Color_Transparent
				Dim btnOK As B4XView = dialog.GetButton(DialogResponse.POSITIVE)
				Dim btncnl As B4XView = dialog.GetButton(DialogResponse.CANCEL)
				btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
				btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
				wait for (sf) Complete(result As Int)
				If result = DialogResponse.POSITIVE Then
					
				End If
				Return
			End If
			If option = "username" Then
				dialog.Initialize(Root)
				dialog.BorderCornersRadius = 20
				dialog.BorderWidth = 0dip
				dialog.Title = "Username retrieved"
				dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
				dialog.ButtonsTextColor = xui.Color_White
				dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
				dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
				dialog.TitleBarColor = xui.Color_Transparent
				dialog.BackgroundColor = xui.Color_White
				dialog.BodyTextColor = xui.Color_Black
				''rgba(49, 211, 184, 1)
				Dim sf As Object = dialog.Show("Your username is " & m.Get("username") & " would you like to login?", "OK", "", "Cancel")
				'''dialog.TitleBar.GetView(0).SetColorAndBorder(xui.Color_ARGB(255, 49, 211, 184), 0, xui.Color_Black, 5dip)
				dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
				dialog.TitleBar.GetView(0).Height = dialog.TitleBar.GetView(0).Height + 10dip
				dialog.mParent.Color = xui.Color_Transparent
				Dim btnOK As B4XView = dialog.GetButton(DialogResponse.POSITIVE)
				Dim btncnl As B4XView = dialog.GetButton(DialogResponse.CANCEL)
				btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
				btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
				'''dialog.mParent.Color = xui.Color_Transparent
				''Dialog.ButtonsColor = xui.Color_White
				
				wait for (sf) Complete(result As Int)
				If result = DialogResponse.POSITIVE Then
					'''Activity.Finish
					'''StartActivity(Main)
					B4XPages.ClosePage(Me)
					Dim mainpageID As String = B4XPages.GetPageId(B4XPages.MainPage)
					B4XPages.ShowPage(mainpageID)
				End If
			Else If option = "PIN" Then
				Dim token As String = m.Get("token")
				Dim query As String = "SELECT expirationdate FROM PASSWORD_RESET WHERE email = " & "'"&email&"'" & " AND token=" & "'"&token&"'"
				Dim db As DBTransactions
				db.Initialize(Me)
				db.ExecuteRemoteQuery(query, "SELECTCOLUMNS")
				wait for QueryResults(results As List)
				Log("results: " & results)
				Dim expdate As Map = results.Get(0)
				Dim exptime As Long = expdate.Get("expirationdate")
'''				Starter.kvs.Put("token", token)
'''				Starter.kvs.Put("expirationdate", exptime)
				ShowResetDialog
'''				Dim now As Long = DateTime.now
'''				Dim p As Period
'''				p = DateUtils.PeriodBetween(now, exptime)
'''				Log("time elapsed: " & p.Minutes & " seconds: " & p.Seconds)
'''				Log("time now: " & DateTime.Time(now))
'''				Log("expiration time: " & DateTime.Time(exptime))
					
				'''LogColor("expirationdate: " & DateTime.Time(exptime), Colors.Blue)
			End If
			'''			Else
			'''				dialog.Initialize(Activity)
			'''				dialog.BorderCornersRadius = 35
			'''				dialog.BorderWidth = 0dip
			'''				dialog.Title = "No email"
			'''				dialog.TitleBarFont = xui.CreateFont(myfont, 17)
			'''				dialog.ButtonsTextColor = xui.Color_White
			'''				dialog.ButtonsFont = xui.CreateFont(myfont, 17)
			'''				dialog.TitleBarColor = xui.Color_Transparent
			'''				dialog.BackgroundColor = xui.Color_White
			'''				dialog.BodyTextColor = xui.Color_Black
			'''				''rgba(49, 211, 184, 1)
			'''				Dim sf As Object = dialog.Show("email does not match any of our records, please try again!", "OK", "", "Cancel")
			'''				dialog.TitleBar.GetView(0).SetColorAndBorder(xui.Color_ARGB(255, 49, 211, 184), 0, xui.Color_Black, 5dip)
			'''				'''dialog.mParent.Color = xui.Color_Transparent
			'''				''Dialog.ButtonsColor = xui.Color_White
			'''
			'''				wait for (sf) Complete(result As Int)
			'''				If result = DialogResponse.POSITIVE Then
			'''					''Activity.Finish
			'''					''StartActivity(Main)
			'''				End If
			'''			End If
		End If
		Job.Release
	Else
		dialog.Initialize(Root)
		dialog.BorderCornersRadius = 20
		dialog.BorderWidth = 0dip
		dialog.Title = "Empty fields"
		dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
		dialog.ButtonsTextColor = xui.Color_White
		dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
		dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
		dialog.TitleBarColor = xui.Color_Transparent
		dialog.BackgroundColor = xui.Color_White
		dialog.BodyTextColor = xui.Color_Black
		''rgba(49, 211, 184, 1)
		Dim sf As Object = dialog.Show("Please enter email address and select one of the options", "OK", "", "Cancel")
		'''dialog.TitleBar.GetView(0).SetColorAndBorder(xui.Color_ARGB(255, 49, 211, 184), 0, xui.Color_Black, 5dip)
		dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
		dialog.TitleBar.GetView(0).Height = dialog.TitleBar.GetView(0).Height + 10dip
		dialog.mParent.Color = xui.Color_Transparent
		Dim btnOK As B4XView = dialog.GetButton(DialogResponse.POSITIVE)
		Dim btncnl As B4XView = dialog.GetButton(DialogResponse.CANCEL)
		btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
		btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
		'''dialog.mParent.Color = xui.Color_Transparent
		''Dialog.ButtonsColor = xui.Color_White
		txtEmail.As(EditText).Hint = "Enter email address"
		txtEmail.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0)
		wait for (sf) Complete(result As Int)
		Log("result dialog: " & result)
'''		If result = DialogResponse.POSITIVE Then
'''			txtEmail.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0)
'''			txtEmail.As(EditText).Hint = "Enter email address"
'''			Common.txtViewBackground(txtEmail)
'''			Else
'''			txtEmail.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0)
'''			txtEmail.As(EditText).Hint = "Enter email address"
'''			Common.txtViewBackground(txtEmail)
'''		End If
		'''Common.txtViewBackground(txtEmail)
		'''txtEmail.SetColorAndBorder(xui.Color_Yellow, 0, xui.Color_Black, 0)
		
	End If
End Sub

Private Sub rdusername_CheckedChange(Checked As Boolean)
	If Checked Then
		option = "username"
	End If
End Sub

Private Sub rdpin_CheckedChange(Checked As Boolean)
	If Checked Then
		option = "PIN"
	End If
End Sub

Sub ShowResetDialog
	dialog.Initialize(Root)
	dialog.BorderCornersRadius = 20
	dialog.BorderWidth = 0dip
	dialog.Title = "Reset PIN"
	dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
	dialog.ButtonsTextColor = xui.Color_White
	dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
	dialog.ButtonsColor = xui.Color_ARGB(180, 28, 30, 36)
	dialog.TitleBarColor = xui.Color_Transparent
	dialog.BackgroundColor = xui.Color_White
	dialog.BodyTextColor = xui.Color_Black
	Dim p As B4XView = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0, 85%x, 60%y) 'set the content size
	p.LoadLayout("PinChange")
	lblPinChange.TextColor = xui.Color_Black
	txtPinChange.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0)
	txtPinChange.As(EditText).HintColor = xui.Color_ARGB(63, 28, 30, 36)
	lblPinChange.font = myfont2
	lblPinChange.TextColor = Colors.rgb(28, 30, 36)
	lblPinChange.TextSize = 25
	#if B4A
	txtPinChange.As(EditText).HintColor = Colors.argb(63, 28, 30, 36)
	#End If
	txtPinChange.TextColor = xui.Color_Black
	txtPinChange.font = myfont2
	'''btnPinChange.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2@2x.png"))
	Common.LightBlueColor(btnPinChange)
	btnPinChange.font = myfont2
	Dim rs As ResumableSub = dialog.ShowCustom(p, "", "", "")
	
	'''	Wait For (rs) Complete (Result As Int)
	'''	If Result = xui.DialogResponse_Positive Then
	'''		'do something
	'''
	'''	End If
End Sub

Private Sub txtPinChange_TextChanged (Old As String, New As String)
	pin = New.Trim
End Sub

Private Sub btnPinChange_Click
	If txtPinChange.Text.Length > 0 Then
		Dim db As DBTransactions
		Dim updatequery As String = "UPDATE Registrations SET PinNumber = " & "'"&pin&"'" & " WHERE EMAIL = " & "'"&email&"'"
		db.Initialize(Me)
		db.ExecuteRemoteQuery(updatequery, "UPDATE")
		wait for QueryResults(Results As List)
		Log("updated Registrations PIN: " & Results)
		db.Initialize(Me)
		updatequery = "UPDATE ManualSettings SET Password = " & "'"&pin&"'" & " WHERE EMAIL = " & "'"&email&"'"
		db.ExecuteRemoteQuery(updatequery, "UPDATE")
		Log("updated ManualSettings PIN: " & Results)
		txtPinChange.Text = ""
		dialog.Close(-1)
		dialog2.Initialize(Root)
		dialog2.BorderCornersRadius = 20
		dialog2.BorderWidth = 0dip
		dialog2.Title = "PIN changed"
		dialog2.BackgroundColor = xui.Color_White
		dialog2.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
		dialog2.ButtonsTextColor = xui.Color_White
		dialog2.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
		dialog2.TitleBarColor = xui.Color_Transparent
		'''Dialog.BackgroundColor = xui.Color_White
		dialog2.BodyTextColor = xui.Color_Black
		'''Dialog.OverlayColor = xui.Color_ARGB(180, 88, 85, 85)
		''Dialog.BlurBackground = True
		''rgba(49, 211, 184, 1)
		Dim sf As Object = dialog2.Show("Your PIN has been updated successfully, would you like to login?", "OK", "", "Cancel")
		'''dialog2.TitleBar.GetView(0).SetColorAndBorder(xui.Color_ARGB(255, 49, 211, 184), 0, xui.Color_Black, 5dip)
		dialog2.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
		dialog2.TitleBar.GetView(0).Height = dialog.TitleBar.GetView(0).Height + 10dip
		dialog2.mParent.Color = xui.Color_Transparent
		Dim btnOK As B4XView = dialog2.GetButton(DialogResponse.POSITIVE)
		Dim btncnl As B4XView = dialog2.GetButton(DialogResponse.CANCEL)
		btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
		btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
		'''dialog.mParent.Color = xui.Color_Transparent
		''Dialog.ButtonsColor = xui.Color_White
				
		wait for (sf) Complete(result As Int)
		If result = DialogResponse.POSITIVE Then
			txtEmail.Text = ""
			txtPinChange.Text = ""
			'''Activity.Finish
			'''StartActivity(Main)
			'''B4XPages.ClosePage(Me)
			'''B4XPages.ShowPage(B4XPages.GetPageId(B4XPages.MainPage))
			B4XPages.MainPage.AnimateFromLeft
			B4XPages.ShowPageAndRemovePreviousPages(B4XPages.GetPageId(B4XPages.MainPage))
		End If
	Else
		dialog.Initialize(Root)
		dialog.BorderCornersRadius = 20
		dialog.BorderWidth = 0dip
		dialog.Title = "Empty field"
		''dialog.TitleBarFont = myfont '''xui.CreateFont(myfont, 17)
		dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
		dialog.ButtonsTextColor = xui.Color_White
		dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 17)
		''dialog.ButtonsTextColor = xui.Color_White
		dialog.BackgroundColor = xui.Color_White
		''dialog.ButtonsFont = myfont '''xui.CreateFont(myfont, 17)
		dialog.TitleBarColor = xui.Color_Transparent
		'''Dialog.BackgroundColor = xui.Color_White
		dialog.BodyTextColor = xui.Color_Black
		'''Dialog.OverlayColor = xui.Color_ARGB(180, 88, 85, 85)
		''Dialog.BlurBackground = True
		''rgba(49, 211, 184, 1)
		Dim sf As Object = dialog.Show("Please enter new PIN", "OK", "", "Cancel")
		'''dialog.TitleBar.GetView(0).SetColorAndBorder(xui.Color_ARGB(255, 49, 211, 184), 0, xui.Color_Black, 5dip)
		dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
		dialog.TitleBar.GetView(0).Height = dialog.TitleBar.GetView(0).Height + 10dip
		dialog.mParent.Color = xui.Color_Transparent
		Dim btnOK As B4XView = dialog.GetButton(DialogResponse.POSITIVE)
		Dim btncnl As B4XView = dialog.GetButton(DialogResponse.CANCEL)
		btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
		btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
		'''dialog.mParent.Color = xui.Color_Transparent
		''Dialog.ButtonsColor = xui.Color_White
				
		wait for (sf) Complete(result As Int)
		If result = DialogResponse.POSITIVE Then
			''no need to catch response
			txtEmail.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0)
			txtEmail.As(EditText).Hint = "Enter email address"
			Else
			''no need to catch response	
			txtEmail.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0)
			txtEmail.As(EditText).Hint = "Enter email address"
		End If
	End If
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return True
End Sub