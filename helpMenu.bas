B4i=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.1
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private imgLogo As B4XView
	Private lblTitle As B4XView
	Private lblSubtitle As B4XView
	Private btnWatchTutorial As B4XView
	Private btnContact As B4XView
	Private ASBottomMenu1 As ASBottomMenu
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("helpmenu")
	
	FillImageToView(LoadBitmap(File.DirAssets, "Group 7191@3x.png"), imgLogo)
	Dim myfont As B4XFont
	Dim myfont2 As B4XFont
	Dim myfont3 As B4XFont
	myfont = Common.CreateB4XFont("Cera Pro Black.otf", 30, 30)	'''Typeface.LoadFromAssets("Cera Pro Black.otf")
	myfont2 = Common.CreateB4XFont("Cera Pro Medium.otf", 16, 16)	'''Typeface.LoadFromAssets("Cera Pro Medium.otf")
	myfont3 = Common.CreateB4XFont("Cera Pro Bold.otf", 18, 18)	'''Typeface.LoadFromAssets("Cera Pro Bold.otf")
	lblTitle.font = myfont
	lblTitle.TextColor = Common.TitleColor
	lblTitle.TextSize = 36
	#if Lite
	lblTitle.Text = Common.ellustros & " Bespoke"
	#else
	lblTitle.Text = "STRÖM Bespoke"
	#End If
	
	lblSubtitle.font = myfont2
	lblSubtitle.TextColor = Common.SubTitleColor
	lblSubtitle.TextSize = 18
	lblSubtitle.Text = "Your fully automated" & CRLF &  "ergonomic experience"
	
	btnWatchTutorial.font = myfont3
	btnContact.font = myfont3
	'''btnWatchTutorial.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2.png"))
	'''btnWatchTutorial.Background = Common.LightBlueColor
	Common.LightBlueColor_2(btnWatchTutorial)
	btnWatchTutorial.TextSize = 16
	btnWatchTutorial.Text = "Watch tutorial"
	
	
	'''btnWatchTutorial.TextColor = xui.Color_White
	'''btnContact.TextColor = xui.color_white
	'''Common.SetButtonTextColor(btnWatchTutorial, xui.Color_White, 0)
	'''Common.SetButtonTextColor(btnContact, xui.Color_White, 0)
	'''btnContact.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle2_75.png"))
	'''btnContact.Background = Common.LightBlueColor3
	btnWatchTutorial.TextColor = xui.Color_White
	btnContact.TextColor = xui.Color_White
	Common.LightBlueColor3_2(btnContact)
	btnContact.TextSize = 16
	btnContact.Text = "Contact us"
	
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	
	ASBottomMenu1.PartinglineVisible = False
	ASBottomMenu1.UnderlineVisible = False
	ASBottomMenu1.SelectedPageIconColor = Common.LightBlueColors
	ASBottomMenu1.MiddleButtonVisible = False
	'''ASBottomMenu1.TabBackgroundColor = Colors.White
	ASBottomMenu1.BadgetColor1 = Colors.Black
	ASBottomMenu1.BadgetColor2 = Colors.Black
	ASBottomMenu1.BadgetColor4 = Colors.Black
	
	ASBottomMenu1.CurrentTab = 3
	ASBottomMenu1_Tab3Click
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

Private Sub btnMenu_Click
	Dim btn As Button = Sender
	Select btn.Tag
		Case "tutorial"
			
		Case "contact"
			'''StartActivity(Contact)
			'''B4XPages.ShowPage("ContactInfo")
			B4XPages.ShowPageAndRemovePreviousPages("ContactInfo")
			B4XPages.GetPage("ContactInfo").As(ContactInfo).AnimateFromRight
	End Select
End Sub

Sub ASBottomMenu1_Tab1Click
	Log("home clicked")
	'''Activity.Finish
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
	'''Activity.Finish
	'''StartActivity(Profile2)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''B4XPages.ShowPage("Profile2")
	#if Lite
	B4XPages.ShowPageAndRemovePreviousPages("Recommendations")
	B4XPages.GetPage("Recommendations").As(Recommendations).AnimateFromLeft
	#else
	B4XPages.ShowPageAndRemovePreviousPages("Profile2")
	B4XPages.GetPage("Profile2").As(Profile2).AnimateFromLeft
	#End If
End Sub

Sub ASBottomMenu1_Tab3Click
	Log("help clicked")
	'''StartActivity(helpMenu)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
End Sub

Sub ASBottomMenu1_Tab4Click
	Log("shopping clicked")
	''https://stromergonomics.com/
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_highlighted.png")
	ASBottomMenu1.SelectedPageIconColor = Common.LightBlueColors
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
'''	If Main.App.CanOpenURL("https://stromergonomics.com/") Then
'''		Main.App.OpenURL("https://stromergonomics.com/")
'''	End If
End Sub

Sub B4XPage_Appear
	LogColor("helpMenu just appeared....", Colors.Blue)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.CurrentTab = 3
	ASBottomMenu1_Tab3Click
	'''ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	
	Return False
End Sub