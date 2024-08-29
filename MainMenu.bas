B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Public Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private imgLogo As B4XView
	Private lblTitle As B4XView
	Private btnPosPreference As B4XView
	Private btnMeasureMe As B4XView
	Private btnProfile As B4XView
	Private ASBottomMenu1 As ASBottomMenu
	Private lblSubtitle As B4XView
	Private closecounter As Int = 0
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("mainmenu")
	
	FillImageToView(LoadBitmap(File.DirAssets, "Group 7191@3x.png"), imgLogo)
	Dim myfont As B4XFont
	Dim myfont2 As B4XFont
	Dim myfont3 As B4XFont
	#if B4A
	myfont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 30)
	myfont2 = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 18)
	myfont3 = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Bold.otf"), 17)
	#Else
	
	#End If
	lblTitle.font = Common.myfont
	lblTitle.TextColor = Common.TitleColor '''Colors.RGB(28, 30, 36)
	lblTitle.TextSize = 36
	#If default
	lblTitle.Text = "STRÖM Bespoke"
	#else if lite
	lblTitle.Text = Common.ellustros & " Bespoke"
	#End If
	lblSubtitle.font = Common.myfont2
	lblSubtitle.TextColor = Common.SubTitleColor
	lblSubtitle.TextSize = 18
	lblSubtitle.Text = "Your fully automated" & CRLF &  "ergonomic experience"
	
	'''	Dim cd1, cd2, cd3 As ColorDrawable
	'''	cd1.Initialize2(Colors.RGB(242,242,242), 12dip, 0dip, Colors.Black)
	'''	cd2.Initialize2(Colors.RGB(242,242,242), 12dip, 0dip, Colors.Black)
	'''	cd3.Initialize2(Colors.RGB(242,242,242), 12dip, 0dip, Colors.Black)
	'''	btnPosPreference.Background = cd1
	'''	btnMeasureMe.Background = cd2
	'''	btnProfile.Background = cd2

	'''	btnViewMeasurements.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2.png"))
	'''	btnOptimalPosition.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle2_75.png"))
	'''	btnViewPersonalInfo.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle2_50.png"))

	'''btnPosPreference.Background = Common.LightBlueColor
	'''btnMeasureMe.Background = Common.LightBlueColor2
	'''btnProfile.Background = Common.LightBlueColor3
	
	#If default
	Common.LightBlueColor_2(btnPosPreference)
	Common.LightBlueColor2_2(btnMeasureMe)
	Common.LightBlueColor3_2(btnProfile)
	#else if lite
	btnPosPreference.Visible = False
	btnMeasureMe.Top = btnPosPreference.Top
	btnProfile.Top = btnPosPreference.Top + btnPosPreference.Height + 15dip
	Common.LightBlueColor_2(btnMeasureMe)
	Common.LightBlueColor2_2(btnProfile)
	#End If
	
	btnPosPreference.font = Common.btnFont
	btnMeasureMe.font = Common.btnFont
	btnProfile.font = Common.btnFont
	'''btnPosPreference.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2.png"))
	
	btnPosPreference.TextColor = xui.color_rgb(255, 255, 255)
	btnMeasureMe.TextColor = xui.color_rgb(255, 255, 255)
	btnProfile.TextColor = xui.color_rgb(255, 255, 255)
	'''btnProfile.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle2_50.png"))
	'''btnMeasureMe.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle2_75.png"))
	
	btnPosPreference.TextSize = 18
	btnMeasureMe.TextSize = 18
	btnProfile.TextSize = 18
	
	#If default
	btnPosPreference.Text = "Position my STRÖM SMARTChair"
	btnMeasureMe.Text = "Take my measurements"
	btnProfile.Text = "View my profile"
	#Else if lite
	btnMeasureMe.Text = "Take my measurements"
	btnProfile.Text = "View my recommendations"
	'''btnProfile.Text = "View my profile"
	#End If
	
	'''ASBottomMenu1.Base.SetBitmap(LoadBitmap(File.DirAssets, "Rectangle 60@2x.png"))
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_highlighted.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	
	ASBottomMenu1.PartinglineVisible = False
	ASBottomMenu1.UnderlineVisible = False
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	ASBottomMenu1.MiddleButtonVisible = False
	'''ASBottomMenu1.TabBackgroundColor = Colors.White
	ASBottomMenu1.BadgetColor1 = Colors.Black
	ASBottomMenu1.BadgetColor2 = Colors.Black
	ASBottomMenu1.BadgetColor3 = Colors.Black
	ASBottomMenu1.BadgetColor4 = Colors.Black
End Sub

Public Sub loadpageinadvance
	'we call this sub to reload data here and make the transition with the correct loading layout
	Root.Color = xui.Color_White
	'...
End Sub

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

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Sub FillImageToView(bmp As B4XBitmap, ImageView As B4XView)
	Dim bmpRatio As Float = bmp.Width / bmp.Height
	Dim viewRatio As Float = ImageView.Width / ImageView.Height
	If viewRatio > bmpRatio Then
		Dim NewHeight As Int = bmp.Width / viewRatio
		bmp = bmp.Crop(0, bmp.Height / 2 - NewHeight / 2, bmp.Width, NewHeight)
	Else if viewRatio < bmpRatio Then
		Dim NewWidth As Int = bmp.Height * viewRatio
		bmp = bmp.Crop(bmp.Width / 2 - NewWidth / 2, 0, NewWidth, bmp.Height)
	End If
	Dim scale As Float = 1
    #if B4i
    scale = GetDeviceLayoutValues.NonnormalizedScale
    #End If
	ImageView.SetBitmap(bmp.Resize(ImageView.Width * scale, ImageView.Height * scale, True))
End Sub

Sub btnMenu_Click
	Dim btn As Button = Sender
	Log("btn.tag: " & btn.Tag)
	Select btn.Tag
		Case "posPreference"
			'''			Dim cd1 As ColorDrawable
			'''			Dim cd2 As ColorDrawable
			'''			cd1.Initialize2(Colors.RGB(166,166,166), 12dip, 0dip, Colors.Transparent)
			'''			cd2.Initialize2(Colors.RGB(242,242,242), 12dip, 0dip, Colors.Black)
			'''			btn.Background = cd1
			'''			btn.TextColor = Colors.White
			'''			btnMeasureMe.Background = cd2
			'''			btnMeasureMe.TextColor = Colors.Black
			'''			btnProfile.Background = cd2
			'''			btnProfile.TextColor = Colors.Black
			Sleep(500)
			Common.random = Rnd(0,2)
			LogColor($"random number ${Common.random}"$, Colors.Blue)
			'''StartActivity(PairDevice)
			'''B4XPages.ShowPage("PairDevice")
			B4XPages.ShowPageAndRemovePreviousPages("PairDevice")
			B4XPages.GetPage("PairDevice").As(PairDevice).AnimateFromRight
			'''B4XPages.ShowPageAndRemovePreviousPages("PairDevice")
		Case "MeasureMe"
			'''StartActivity(StartExperience)
			B4XPages.ShowPageAndRemovePreviousPages("StartExperience")
			B4XPages.GetPage("StartExperience").As(StartExperience).AnimateFromRight
			'''			Dim cd1 As ColorDrawable
			'''			Dim cd2 As ColorDrawable
			'''			cd1.Initialize2(Colors.RGB(166,166,166), 12dip, 0dip, Colors.Transparent)
			'''			cd2.Initialize2(Colors.RGB(242,242,242), 12dip, 0dip, Colors.Black)
			'''			btn.Background = cd1
			'''			btn.TextColor = Colors.White
			'''			btnPosPreference.Background = cd2
			'''			btnPosPreference.TextColor = Colors.Black
			'''			btnProfile.Background = cd2
			'''			btnProfile.TextColor = Colors.Black
		Case "Profile"
			'''StartActivity(Profile2)
			'''B4XPages.ClosePage(Me)
			'''B4XPages.ShowPage("Profile2")
			#If default
			B4XPages.ShowPageAndRemovePreviousPages("Profile2")
			B4XPages.GetPage("Profile2").As(Profile2).AnimateFromRight
			#Else if lite
			'''To do here, need to add another page to show recommendations.
			B4XPages.ShowPageAndRemovePreviousPages("Recommendations")
			B4XPages.GetPage("Recommendations").As(Recommendations).AnimateFromRight
'''			B4XPages.ShowPageAndRemovePreviousPages("Profile2")
'''			B4XPages.GetPage("Profile2").As(Profile2).AnimateFromRight
			#End if

	End Select
End Sub

Sub ASBottomMenu1_Tab1Click
	Log("home clicked")
	'''StartActivity(Main)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_highlighted.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
End Sub

Sub ASBottomMenu1_Tab2Click
	Log("profile clicked")
	'''Activity.Finish
	'''StartActivity(Profile2)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''B4XPages.ClosePage(Me)
	'''B4XPages.ShowPage("Profile2")
	#If Lite
	B4XPages.ShowPageAndRemovePreviousPages("PersonalInfo")
	B4XPages.GetPage("PersonalInfo").As(PersonalInfo).AnimateFromLeft
	#else
	B4XPages.ShowPageAndRemovePreviousPages("Profile2")
	B4XPages.GetPage("Profile2").As(Profile2).AnimateFromRight
	#End If
End Sub

Sub ASBottomMenu1_Tab3Click
	Log("help clicked")
	'''Activity.Finish
	'''StartActivity(helpMenu)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
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
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Sub B4XPage_Appear
	LogColor("MainMenu just appeared....", Colors.Blue)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_highlighted.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.CurrentTab = 1
	ASBottomMenu1_Tab1Click
End Sub

Sub B4XPage_Disappear
	Log("MainMenu disappeared...")
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	ToastMessageShow("Press back key again if you want to exit", True)
	closecounter = closecounter + 1
	If closecounter = 2 Then
		closecounter = 1
		 B4XPages.ClosePage(Me)
		 ExitApplication
		 Common.manager.Disconnect
	End If
	
	Return False
End Sub
