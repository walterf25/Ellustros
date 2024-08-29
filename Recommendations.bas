B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	Private imgLogo As B4XView
	Private lblTitle As B4XView
	Private lblSubtitle As B4XView
	Private btnViewStading As B4XView
	Private btnViewSeating As B4XView
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
	Root.LoadLayout("recommendations")
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
	
	Common.LightBlueColor2_2(btnViewStading)
	btnViewStading.font = Common.btnFont
	btnViewStading.TextColor = xui.Color_White
	btnViewStading.TextSize = 18
	btnViewStading.Text = "View my standing position"
	'''btnOptimalPosition.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle2_75.png"))
	'''btnOptimalPosition.Background = Common.LightBlueColor2
	Common.LightBlueColor_2(btnViewSeating)
	btnViewSeating.font = Common.btnFont
	btnViewSeating.TextColor = xui.Color_White
	btnViewSeating.TextSize = 18
	btnViewSeating.Text = "View my seated position"
	
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

Private Sub btnViewOptimal_Click
	Dim btn As Button = Sender
	Log("button pressed: " & btn.Tag)
	Select btn.Tag
		Case "Seating"
			B4XPages.ShowPageAndRemovePreviousPages("Seating")
			B4XPages.GetPage("Seating").As(Seating).AnimateFromRight
		Case "Standing"
			B4XPages.ShowPageAndRemovePreviousPages("Standing")
			B4XPages.GetPage("Standing").As(Standing).AnimateFromLeft
	End Select
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
	LogColor("Recommendations just appeared....", Colors.Blue)
	'''	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	'''	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	'''	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	'''	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.CurrentTab = 2
	ASBottomMenu1_Tab2Click
	'''ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
End Sub