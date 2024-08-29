B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI '
	
	Private btnBack As B4XView
	Private imgLogo As B4XView
	Private lblTitle As B4XView
	Private lblWebsite As B4XView
	Private lblEmail As B4XView
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
	Root.LoadLayout("contactinfo")
	
	btnBack.Color = xui.Color_Transparent
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	
	ASBottomMenu1.PartinglineVisible = False
	ASBottomMenu1.UnderlineVisible = False
	'''ASBottomMenu1.SelectedPageIconColor = Common.LightBlueColors
	ASBottomMenu1.MiddleButtonVisible = False
	ASBottomMenu1.BadgetColor1 = Colors.Black
	ASBottomMenu1.BadgetColor2 = Colors.Black
	ASBottomMenu1.BadgetColor4 = Colors.Black
	'''imgLogo.SetBackgroundImage(LoadBitmap(File.DirAssets, "group 7191@3x.png"))
	imgLogo.SetBitmap(LoadBitmapResize(File.DirAssets, "group 7191@3x.png", 128dip, 128dip, True))
	#If B4A
	imgLogo.As(ImageView).Gravity = Gravity.FILL
	#Else
	
	#End If
	Dim myfont, myfont2 As B4XFont
	'''myfont = Typeface.LoadFromAssets("Cera Pro Bold.otf")
	'''myfont2 = Typeface.LoadFromAssets("Cera Pro Medium.otf")
	myfont = Common.CreateB4XFont("Cera Pro Bold.otf", 30, 30)
	myfont2 = Common.CreateB4XFont("Cera Pro Medium.otf", 16, 16)
	
	lblTitle.Font = myfont
	lblTitle.TextSize = 24
	lblTitle.TextColor = xui.Color_ARGB(255, 28, 30, 36)
	lblTitle.Text = "Contact info:"
	
	Dim cs As CSBuilder
	Dim cs1 As CSBuilder
	cs.Initialize
	cs1.Initialize
	lblWebsite.font = myfont2
	lblWebsite.TextSize = 18
	lblWebsite.TextColor = Common.LightBlueColors
	
	lblEmail.font = myfont2
	lblEmail.TextSize = 18
	lblEmail.TextColor = Common.LightBlueColors
	'''	Sub Activity_Create(FirstTime As Boolean)
	'''	Dim lbl As Label
	'''	lbl.Initialize("")
	'''	Activity.AddView(lbl, 0, 20dip, 100%x, 50dip)
	'''	Dim cs As CSBuilder
	'''	cs.Initialize.Size(20).Append("Click on underine word: ")
	'''	cs.Clickable("cs", 1).Underline.Append("One").Pop.Pop
	'''	cs.Append(", ").Clickable("cs", 2).Underline.Append("Two").PopAll
	'''	cs.EnableClickEvents(lbl)
	'''	lbl.Text = cs
	'''stromergonomics@gmail.com
	cs.Size(18).Clickable("website", 1).Underline.Append("https://ellustros.com/").PopAll
	cs.EnableClickEvents(lblWebsite)
	lblWebsite.Text = cs
	
	cs1.Size(18).Clickable("email", 2).Underline.Append("info@ellustros.com").PopAll
	cs1.EnableClickEvents(lblEmail)
	lblEmail.Text = cs1
	
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


Sub website_Click(Tag As Object)
	'''Log("clicked website label")
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Sub email_Click(Tag As Object)
	Log("clicked email label")
	Dim email As Email
	email.Subject = Common.ellustros & " info"
	email.To = Array As String("info@ellustros.com")
	StartActivity(email.GetIntent)
End Sub


Private Sub btnBack_Click
	'''Activity.Finish
	'''B4XPages.ClosePage(Me)
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End Sub

'''Private Sub lblWebsite_Click
'''	
'''End Sub
'''
'''Private Sub lblEmail_Click
'''	
'''End Sub

Sub ASBottomMenu1_Tab1Click
	Log("home clicked")
'''	Activity.Finish
	'''	StartActivity(MainMenu)
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
'''	Activity.Finish
	'''	StartActivity(Profile2)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
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

Sub ASBottomMenu1_Tab3Click
	Log("help clicked")
	'''StartActivity(Contact)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
	'''B4XPages.ClosePage(Me)
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
	ASBottomMenu1.SelectedPageIconColor = Common.LightBlueColors
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Sub B4XPage_Appear
	LogColor("ContactIfo just appeared....", Colors.Blue)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
End Sub

Sub B4XPage_Disappear
	Log("ContactInfo disappeared...")
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return False
End Sub