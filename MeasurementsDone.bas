B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private btnPositionChair As B4XView
	Private btnViewProfile As B4XView
	Private imgMeasurementsDone As B4XView
	Private lblMeasurementsDone As B4XView
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("measurementsdone")
	
	'''Dim myfont As Typeface = Typeface.LoadFromAssets("Cera Pro Bold.otf")
	'''imgMeasurementsDone.SetBackgroundImage(LoadBitmap(File.DirAssets, "success.png"))
	imgMeasurementsDone.SetBitmap(LoadBitmap(File.DirAssets, "success.png"))
	#If B4A
	imgMeasurementsDone.As(ImageView).Gravity = Gravity.FILL
	#End If
	lblMeasurementsDone.font = Common.myfont
	lblMeasurementsDone.TextSize = 24
	lblMeasurementsDone.Text = "You did it!"
	lblMeasurementsDone.TextColor = xui.Color_ARGB(229, 28, 30, 36)
	
	'''btnPositionChair.SetBackgroundImage(LoadBitmap(File.DirAssets, "positionchair2.png"))
	'''btnViewProfile.SetBackgroundImage(LoadBitmap(File.DirAssets, "viewprofile2.png"))
	btnPositionChair.font = Common.btnFont
	'''btnPositionChair.Background = Common.LightBlueColor
	Common.LightBlueColor(btnPositionChair)
	btnPositionChair.TextColor = xui.Color_White
	#If default
	btnPositionChair.Text = "Position my STRÖM SMARTChair"
	#Else If lite
	btnPositionChair.Text = "View my recommendations"
	#End If
	
	btnViewProfile.Font = Common.btnFont
	'''btnViewProfile.Background = Common.DarkGrayColor
	Common.DarkGrayColor(btnViewProfile)
	btnViewProfile.TextColor = xui.Color_White
	btnViewProfile.Text = "View my profile"
End Sub

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.
#if default
Sub btnPositionChair_Click
'''	Activity.Finish
'''	StartActivity(PairDevice)
'''	B4XPages.ClosePage(Me)
'''	B4XPages.ShowPage("PairDevice")
	B4XPages.ShowPageAndRemovePreviousPages("PairDevice")
	B4XPages.GetPage("PairDevice").As(PairDevice).AnimateFromLeft
End Sub
#else if lite
Sub btnPositionChair_Click
	'''	Activity.Finish
	'''	StartActivity(PairDevice)
	'''	B4XPages.ClosePage(Me)
	'''	B4XPages.ShowPage("PairDevice")
	'''B4XPages.ShowPageAndRemovePreviousPages("PairDevice")
	'''B4XPages.GetPage("PairDevice").As(PairDevice).AnimateFromLeft
	B4XPages.ShowPageAndRemovePreviousPages("Recommendations")
	B4XPages.GetPage("Recommendations").As(Recommendations).AnimateFromLeft
End Sub
#End If

Sub btnViewProfile_Click
	'''StartActivity(Profile2)
	'''B4XPages.ShowPage("Profile2")
	B4XPages.ShowPageAndRemovePreviousPages("Profile2")
	B4XPages.GetPage("Profile2").As(Profile2).AnimateFromLeft
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

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return False
End Sub