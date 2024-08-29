B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private btnOptimalPosition As B4XView
	Private btnViewMeasurements As B4XView
	Private btnViewPersonalInfo As B4XView
	Private imgLogo As B4XView
	Private lblTitle As B4XView
	Private ASBottomMenu1 As ASBottomMenu
	Private btnDone As B4XView
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
	Private lblSubtitle As B4XView
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("profile2")
	
	
'''	Dim myfont As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 30)
'''	Dim myfont2 As B4XFont = Typeface.LoadFromAssets("Cera Pro Bold.otf")
'''	Dim myfont3 As B4XFont = Typeface.LoadFromAssets("Cera Pro Medium.otf")
	lblTitle.font = Common.myfont
	lblTitle.TextSize = 36
	'''lblTitle.Text = "STRÖM Bespoke"
	lblTitle.Text = Common.ellustros & " Bespoke"
	lblTitle.TextColor = Common.TitleColor
	
	lblSubtitle.font = Common.myfont2
	lblSubtitle.TextColor = Common.SubTitleColor
	lblSubtitle.TextSize = 18
	lblSubtitle.Text = "Your fully automated" & CRLF &  "ergonomic experience"
	
	'''imgLogo.SetBackgroundImage(LoadBitmap(File.DirAssets, "group 7191@3x.png"))
	imgLogo.SetBitmap(LoadBitmap(File.DirAssets, "group 7191@3x.png"))
	#If B4A
	imgLogo.As(ImageView).Gravity = Gravity.FILL
	#End If
	'''btnViewMeasurements.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2.png"))
	'''btnViewMeasurements.Background = Common.LightBlueColor
	Common.LightBlueColor_2(btnViewMeasurements)
	btnViewMeasurements.font = Common.btnFont
	btnViewMeasurements.TextColor = xui.Color_White
	btnViewMeasurements.Text = "View my measurements"
	'''btnOptimalPosition.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle2_75.png"))
	'''btnOptimalPosition.Background = Common.LightBlueColor2
	Common.LightBlueColor2_2(btnOptimalPosition)
	btnOptimalPosition.font = Common.btnFont
	btnOptimalPosition.TextColor = xui.Color_White
	btnOptimalPosition.Text = "View my optimal chair position"
	
	'''btnViewPersonalInfo.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle2_50.png"))
	'''btnViewPersonalInfo.Background = Common.LightBlueColor3
	Common.LightBlueColor3_2(btnViewPersonalInfo)
	btnViewPersonalInfo.font = Common.btnFont
	btnViewPersonalInfo.TextColor = xui.Color_White
	btnViewPersonalInfo.Text = "View my personal information"
	'''btnOptimalPosition.SetBackgroundImage(CreateBitmapWithAlpha(LoadBitmap(File.DirAssets, "Rectangle 2@2x.png"), 191))
	'''btnViewPersonalInfo.SetBackgroundImage(CreateBitmapWithAlpha(LoadBitmap(File.DirAssets, "Rectangle 2@2x.png"), 127))
	
	'''btnViewMeasurements.Typeface = myfont2
	btnViewMeasurements.TextSize = 16

	
	btnOptimalPosition.TextSize = 16


	btnViewPersonalInfo.TextSize = 16
	
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
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
	
	ASBottomMenu1.CurrentTab = 2
	ASBottomMenu1_Tab2Click
	
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

Sub btnViewMeasurements_Click
	'''StartActivity(Summary)
	
	'''B4XPages.ShowPage("Summary")
	B4XPages.ShowPageAndRemovePreviousPages("Summary")
	B4XPages.GetPage("Summary").As(Summary).AnimateFromRight
	
End Sub

Sub btnOptimalPosition_Click
	'''StartActivity(ChairOptimal)
	'''B4XPages.ShowPage("ChairOptimal")
	B4XPages.ShowPageAndRemovePreviousPages("ChairOptimal")
	B4XPages.GetPage("ChairOptimal").As(ChairOptimal).AnimateFromRight
End Sub

Sub btnViewPersonalInfo_Click
	'''StartActivity(PersonalInfo)
	'''B4XPages.ShowPage("PersonalInfo")
	B4XPages.ShowPageAndRemovePreviousPages("PersonalInfo")
	B4XPages.GetPage("PersonalInfo").As(PersonalInfo).AnimateFromRight
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
	'''B4XPages.ClosePage(Me)
	'''B4XPages.ShowPage("MainMenu")
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab2Click
	Log("profile clicked")
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''StartActivity(Profile2)
End Sub

Sub ASBottomMenu1_Tab3Click
	Log("help clicked")
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''Activity.Finish
	'''StartActivity(helpMenu)
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
	'''ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Sub B4XPage_Appear
	LogColor("MainMenu just appeared....", Colors.Blue)
'''	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
'''	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
'''	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
'''	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.CurrentTab = 2
	ASBottomMenu1_Tab2Click
	'''ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return False
End Sub