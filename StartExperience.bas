B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private btnBack As B4XView
	Private imgLogo As B4XView
	Private lbltitle As B4XView
	Private lblSubtitle As B4XView
	Private btnStart As B4XView
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
	Root.LoadLayout("experiencestart")
	btnBack.Color = xui.Color_Transparent
	#if B4A
'''	Dim myfont As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 30)
'''	Dim myfont2 As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 18)
	Dim myfont3 As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Bold.otf"), 16)
	#else
	Dim myfont As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 30)
	Dim myfont2 As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 18)
	Dim myfont3 As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Bold.otf"), 16)
	#End If
	
	lbltitle.TextSize = 36
	lbltitle.TextColor = Common.TitleColor ''xui.Color_RGB(28, 30, 36)
	#If default
	lbltitle.Text = "STRÖM Bespoke"
	#Else If lite
	lbltitle.Text = Common.ellustros & " Bespoke"
	#End If
	lbltitle.font = Common.myfont
	
	lblSubtitle.TextSize = 18
	#If default
	lblSubtitle.Text = "STRÖM Bespoke will guide you to" & CRLF & "determine your optimal ergonomic" & CRLF & "seated position"
	#Else If lite
	lblSubtitle.Text = Common.ellustros & " Bespoke will guide you to" & CRLF & "determine your optimal ergonomic" & CRLF & "seated position"
	#End If
	lblSubtitle.TextColor = Common.SubTitleColor ''''xui.Color_RGB(28, 30, 36)
	lblSubtitle.font = Common.myfont2
	
	'''btnStart.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 2.png"))
	'''btnStart.Background = Common.LightBlueColor
	Common.LightBlueColor_2(btnStart)
	btnStart.Text = "Start my experience"
	btnStart.TextColor = xui.Color_White
	btnStart.TextSize = 16
	btnStart.font = Common.btnFont
	
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
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

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Public Sub AnimateFromRight
    #if B4A
	Root.Left = -100%x
	Root.SetLayoutAnimated(300, 0, 0, Root.Width, Root.Height)
    #End If
End Sub

Public Sub AnimateFromLeft
    #if B4A
	Root.Left = -100%x
	Root.SetLayoutAnimated(300, 0, 0, Root.Width, Root.Height)
    #End If
End Sub

Sub btnBack_Click
	'''Activity.Finish
	'''B4XPages.ClosePage(Me)
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End Sub

Sub btnStart_Click
	'''StartActivity(PlayTutorial)
	B4XPages.ShowPage("PlayTutorial")
	B4XPages.GetPage("PlayTutorial").As(PlayTutorial).AnimateFromRight
End Sub

Sub ASBottomMenu1_Tab1Click
	Log("home clicked")
	'''StartActivity(Main)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_highlighted.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''B4XPages.ShowPage("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
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
	B4XPages.ShowPageAndRemovePreviousPages("Profile2")
	B4XPages.GetPage("Profile2").As(Profile2).AnimateFromLeft
	
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
	LogColor("StartExperience just appeared....", Colors.Blue)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_highlighted.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	'''ASBottomMenu1.CurrentTab = 1
	'''ASBottomMenu1_Tab1Click
End Sub

Sub B4XPage_Disappear
	Log("StartExperience disappeared...")
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return False
End Sub