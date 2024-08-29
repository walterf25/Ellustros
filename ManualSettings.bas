B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private lblArmRestHeight As B4XView
	Private lblArmrestWidth As B4XView
	Private lblBackRestAngle As B4XView
	Private lblLumbarHeight As B4XView
	Private lblSeatDepth As B4XView
	Private lblSeatheight As B4XView
	Private lblSeatTilt As B4XView
	Private imgBackground As B4XView
	Private lblValArmRestHeight As B4XView
	Private lblValArmRestWidth As B4XView
	Private lblValBackRestAngle As B4XView
	Private lblValDepth As B4XView
	Private lblValHeight As B4XView
	Private lblValLumbarHeight As B4XView
	Private lblValTilt As B4XView
	Private lbllumbarcushiondesnsity As B4XView
	Private lblvalinflatablelumbarsupport As B4XView
	Private imgIcon As B4XView
	Private lblSeatWidth As B4XView
	Private lblValSeatWidth As B4XView
	Private MiniMumVal As Int = 12
	Private minArmRestHeight As Int = 20
	Private maxSeatHeight As Int = 27
	Private maxSeatDepth As Int = 24
	Private maxArmRestWidth As Int = 26
	Private maxArmRestHeight As Int = 38
	Private minLumbarSupportHeight As Int = 18
	Private maxLumbarSupportHeight As Int = 36
	Private minSeatTilt As Int = -10
	Private maxSeatTilt As Int = 10
	Private minBackRestAngle As Int = 100
	Private maxBackRestAngle As Int = 130
	Private minLumbarCushionDensity As Int = 0
	Private maxLumbarcushionDensity As Int = 100
	Private blbSeatheight As B4XBubbleSeeker
	Private blbseatwidth As B4XBubbleSeeker
	Private blbseatdepth As B4XBubbleSeeker
	Private blblarmrestwidth As B4XBubbleSeeker
	Private blbarmrestheight As B4XBubbleSeeker
	Private blblumarheight As B4XBubbleSeeker
	Private blbseattilt As B4XBubbleSeeker
	Private blbinflatableLumbarSupport As B4XBubbleSeeker
	Private blbBackRestAngle As B4XBubbleSeeker
	Private lbltitle As B4XView
	Private ASBottomMenu1 As ASBottomMenu
	Private btnDone As B4XView
	Private progressdialog As CustomProgressDialog
	
	Private tiltAngle As Double
	Private heightadd As Double
	
	Private height, lumbar, knee, elbow, buttocks, hip, elbowwidth, shoe, positionpref As String
	Private seatheight, seatdepth, armrestwidth, armrestheight, lumbarsupportheight, seattilt, backrestangle, lumbardensity As Double
	Private lblChairState As B4XView
	Private bleservice As StromService
	Private dialog As B4XDialog
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("manualsettings")
	bleservice.Initialize
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets, "home_highlighted.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	
	ASBottomMenu1.PartinglineVisible = False
	ASBottomMenu1.UnderlineVisible = False

	ASBottomMenu1.SelectedPageIconColor = Common.LightBlueColors
	ASBottomMenu1.MiddleButtonVisible = False
	ASBottomMenu1.BadgetColor1 = xui.color_Black
	ASBottomMenu1.BadgetColor2 = xui.color_Black
	ASBottomMenu1.BadgetColor4 = xui.color_Black

	lbltitle.font = Common.myfont
	lbltitle.TextColor = xui.color_Black
	lbltitle.TextSize = 20
	lbltitle.Text = "Comfort settings"

	Common.LightBlueColor(btnDone)
	btnDone.font = Common.btnFont
	btnDone.TextSize = 16
	btnDone.TextColor = xui.color_White
	btnDone.Text = "Done"

	lblSeatheight.Font = Common.btnFont
	lblSeatheight.TextColor = xui.color_rgb(28, 30, 36)
	lblSeatheight.TextSize = 16
	lblSeatWidth.Font = Common.btnFont
	lblSeatWidth.TextColor = xui.color_rgb(28, 30, 36)
	lblSeatWidth.TextSize = 16
	lblSeatDepth.Font = Common.btnFont
	lblSeatDepth.TextColor = xui.color_rgb(28, 30, 36)
	lblSeatDepth.TextSize = 16
	lblArmrestWidth.Font = Common.btnFont
	lblArmrestWidth.TextColor = xui.color_rgb(28, 30, 36)
	lblArmrestWidth.TextSize = 16
	lblArmRestHeight.Font = Common.btnFont
	lblArmRestHeight.TextColor = xui.color_rgb(28, 30, 36)
	lblArmRestHeight.TextSize = 16
	lblLumbarHeight.Font = Common.btnFont
	lblLumbarHeight.TextColor = xui.color_rgb(28, 30, 36)
	lblLumbarHeight.TextSize = 16
	lblSeatTilt.Font = Common.btnFont
	lblSeatTilt.TextColor = xui.color_rgb(28, 30, 36)
	lblSeatTilt.TextSize = 16
	lblBackRestAngle.Font = Common.btnFont
	lblBackRestAngle.TextSize = 16
	lblBackRestAngle.TextColor = xui.color_rgb(28, 30, 36)
	lbllumbarcushiondesnsity.Font = Common.btnFont
	lbllumbarcushiondesnsity.TextColor = xui.color_rgb(28, 30, 36)
	lbllumbarcushiondesnsity.TextSize = 16
	
	progressdialog.Initialize(Root, 400dip, -1, -1, "", "", Common.LightBlueColors, xui.Color_White, "DEFAULT", True)
	
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

private Sub InitializeSliders
	Try

		Common.SEAT_HEIGHT_MIN = Common.SEAT_HEIGHT_MIN / Common.mmConstant
		Common.SEAT_HEIGHT_MAX = Common.SEAT_HEIGHT_MAX / Common.mmConstant
	
		blbSeatheight.Min = Common.SEAT_HEIGHT_MIN	'''MiniMumVal
		blbSeatheight.Max = Common.SEAT_HEIGHT_MAX	'''maxSeatHeight
		If Common.SeatHeight <= Common.SEAT_HEIGHT_MIN Then
			Common.SeatHeight = Common.SEAT_HEIGHT_MIN
			blbSeatheight.Value = Common.SEAT_HEIGHT_MIN	'''Common.SeatHeight
		else if Common.SeatHeight >= Common.SEAT_HEIGHT_MAX Then
			Common.SeatHeight = Common.SEAT_HEIGHT_MAX
			blbSeatheight.Value = Common.SEAT_HEIGHT_MAX	'''Common.SeatHeight
		Else
			blbSeatheight.Value = Common.SeatHeight '''(Common.SEAT_HEIGHT_MAX - Common.SEAT_HEIGHT_MIN) / 2	'''Common.SeatHeight
		End If
	
		Common.SEAT_DEPTH_MIN = Common.SEAT_DEPTH_MIN / Common.mmConstant
		Common.SEAT_DEPTH_MAX = Common.SEAT_DEPTH_MAX / Common.mmConstant
	
		blbseatdepth.Min = Common.SEAT_DEPTH_MIN '''MiniMumVal
		blbseatdepth.max = Common.SEAT_DEPTH_MAX '''maxSeatDepth
		If Common.SeatDepth <= Common.SEAT_DEPTH_MIN Then
			Common.SeatDepth = Common.SEAT_DEPTH_MIN '''MiniMumVal
			blbseatdepth.Value = Common.SEAT_DEPTH_MIN '''Common.SeatDepth
		else if Common.SeatDepth >= Common.SEAT_DEPTH_MAX Then
			Common.SeatDepth = Common.SEAT_DEPTH_MAX '''maxSeatDepth
			blbseatdepth.Value = Common.SEAT_DEPTH_MAX '''Common.SeatDepth
		Else
			blbseatdepth.Value = Common.SeatDepth'''(Common.SEAT_DEPTH_MAX - Common.SEAT_DEPTH_MIN) / 2 '''Common.SeatDepth
		End If
	
		Common.ARMREST_HEIGHT_MIN = Common.ARMREST_HEIGHT_MIN / Common.mmConstant
		Common.ARMREST_HEIGHT_MAX = Common.ARMREST_HEIGHT_MAX / Common.mmConstant
	
		blbarmrestheight.Min = Common.ARMREST_HEIGHT_MIN '''minArmRestHeight
		blbarmrestheight.Max = Common.ARMREST_HEIGHT_MAX '''maxArmRestHeight
	
		If Common.ArmRestHeight <= Common.ARMREST_HEIGHT_MIN Then '''minArmRestHeight Then
			Common.ArmRestHeight = Common.ARMREST_HEIGHT_MIN '''minArmRestHeight
			blbarmrestheight.Value = Common.ARMREST_HEIGHT_MIN '''Common.ArmRestHeight
		else if Common.ArmRestHeight >= Common.ARMREST_HEIGHT_MAX Then
			Common.ArmRestHeight = Common.ARMREST_HEIGHT_MAX
			blbarmrestheight.Value = Common.ARMREST_HEIGHT_MAX
		Else
			blbarmrestheight.Value = Common.ArmRestHeight '''(Common.ARMREST_HEIGHT_MAX - Common.ARMREST_HEIGHT_MIN) / 2 '''Common.ArmRestHeight
		End If
	
		Common.ARMREST_WIDTH_MIN = Common.ARMREST_WIDTH_MIN / Common.mmConstant
		Common.ARMREST_WIDTH_MAX = Common.ARMREST_WIDTH_MAX / Common.mmConstant
	
		blblarmrestwidth.Min = Common.ARMREST_WIDTH_MIN '''MiniMumVal
		blblarmrestwidth.Max = Common.ARMREST_WIDTH_MAX '''maxArmRestWidth
		If Common.ArmRestWidth <= Common.ARMREST_WIDTH_MIN Then
			Common.ArmRestWidth = Common.ARMREST_WIDTH_MIN
			blblarmrestwidth.Value = Common.ARMREST_WIDTH_MIN	'''(Common.ARMREST_WIDTH_MAX - Common.ARMREST_WIDTH_MIN) / 2 '''Common.ArmRestWidth
		else if Common.ArmRestWidth >= Common.ARMREST_WIDTH_MAX Then
			Common.ArmRestWidth = Common.ARMREST_WIDTH_MAX '''maxArmRestWidth
			blblarmrestwidth.Value = Common.ARMREST_WIDTH_MAX '''Common.ArmRestWidth
		Else
			blblarmrestwidth.Value = Common.ArmRestWidth '''(Common.ARMREST_WIDTH_MAX - Common.ARMREST_WIDTH_MIN) / 2 '''Common.ArmRestWidth
		End If
	
		Common.BACKREST_HEIGHT_MIN = Common.BACKREST_HEIGHT_MIN / Common.mmConstant
		Common.BACKREST_HEIGHT_MAX = Common.BACKREST_HEIGHT_MAX / Common.mmConstant
	
		blblumarheight.Min = Common.BACKREST_HEIGHT_MIN '''minLumbarSupportHeight
		blblumarheight.Max = Common.BACKREST_HEIGHT_MAX '''maxLumbarSupportHeight
		If Common.LumbarHeight <= Common.BACKREST_HEIGHT_MIN Then
			Common.LumbarHeight = Common.BACKREST_HEIGHT_MIN '''minLumbarSupportHeight
			blblumarheight.Value = Common.BACKREST_HEIGHT_MIN '''Common.LumbarHeight
		else if Common.LumbarHeight >= Common.BACKREST_HEIGHT_MAX Then
			Common.LumbarHeight = Common.BACKREST_HEIGHT_MAX '''maxLumbarSupportHeight
			blblumarheight.Value = Common.BACKREST_HEIGHT_MAX '''Common.LumbarHeight
		Else
			blblumarheight.Value = Common.LumbarHeight '''(Common.BACKREST_HEIGHT_MAX - Common.BACKREST_HEIGHT_MIN) / 2'''Common.LumbarHeight
		End If
	
		Common.SEAT_TILT_MIN = Common.centertilt_slope * (Common.SEAT_TILT_MIN * 10)+Common.centertilt_intercept
		Common.SEAT_TILT_MAX = Common.centertilt_slope * (Common.SEAT_TILT_MAX * 10)+Common.centertilt_intercept
	
		blbseattilt.Min = Round(Common.SEAT_TILT_MIN) '''minSeatTilt
		blbseattilt.Max = Round(Common.SEAT_TILT_MAX) '''maxSeatTilt
	
		'''Common.SeatTilt = (Common.centertilt_slope*Common.SeatTilt)+Common.centertilt_intercept
	
		If Common.SeatTilt <= Common.SEAT_TILT_MIN Then
			Common.SeatTilt = Common.SEAT_TILT_MIN '''(Common.centertilt_slope*Common.SEAT_TILT_MIN)+Common.centertilt_intercept '''minSeatTilt
			blbseattilt.Value = Common.SEAT_TILT_MIN'''Common.SeatTilt
		else if Common.SeatTilt >= Common.SEAT_TILT_MAX Then
			Common.SeatTilt = Common.SEAT_TILT_MAX '''(Common.centertilt_slope*Common.SEAT_TILT_MAX)+Common.centertilt_intercept '''maxSeatTilt
			blbseattilt.Value = Common.SEAT_TILT_MAX'''Common.SeatTilt
		Else
			blbseattilt.Value = Common.SeatTilt '''(Common.centertilt_slope*Common.SeatTilt)+Common.centertilt_intercept '''(Common.SEAT_TILT_MAX - Common.SEAT_TILT_MIN) / 2 '''Common.SeatTilt
		End If
	
		Common.BACKREST_TILT_MIN =  Common.backrest_angle_slope * (Common.BACKREST_TILT_MIN * 10)+Common.backrest_angle_intercept
		Common.BACKREST_TILT_MAX =  Common.backrest_angle_slope * (Common.BACKREST_TILT_MAX * 10)+Common.backrest_angle_intercept
	
		blbBackRestAngle.Min = Round(Common.BACKREST_TILT_MIN) '''100
		blbBackRestAngle.Max = Round(Common.BACKREST_TILT_MAX) '''130
		If Common.BackRestAngle <= Common.BACKREST_TILT_MIN Then
			Common.BackRestAngle = Common.BACKREST_TILT_MIN '''100
			blbBackRestAngle.Value = Common.BACKREST_TILT_MIN '''Common.BackRestAngle
		else if Common.BackRestAngle >= Common.BACKREST_TILT_MAX Then
			Common.BackRestAngle = Common.BACKREST_TILT_MAX '''130
			blbBackRestAngle.Value = Common.BACKREST_TILT_MIN'''Common.BackRestAngle
		Else
			LogColor("setting backrest angle value to: " & Common.BackRestAngle, xui.Color_Magenta)
			blbBackRestAngle.Value = Common.BackRestAngle '''(Common.BACKREST_TILT_MAX - Common.BACKREST_TILT_MIN) / 2 '''Common.BackRestAngle
			LogColor("retrieving backrest angle: " & blbBackRestAngle.value, xui.Color_Red)
		End If

		blbinflatableLumbarSupport.Min = Common.LUMBAR_INFLATION_MIN
		blbinflatableLumbarSupport.Max = Common.LUMBAR_INFLATION_MAX
		blbinflatableLumbarSupport.Value = Common.InflatableLumbarSupport '''Common.LUMBAR_INFLATION_MAX / 2
	Catch
		Log("Error retrieving ManualSettings from table")
	End Try
	
	Dim notify As Boolean
	notify = Common.manager.SetNotify(bleservice.ChairControlService,  bleservice.ChairMotionRespCharacteristic, True)
	LogColor("setNotify Set: " & notify, xui.color_blue)
End Sub

'''Public Sub LogException(Exception As Object)
''' #If Release
'''	CL.RunMethod("logException", Array(Exception))
''' #End If
'''End Sub

'''Private Sub GetCrashlytics As JavaObject
'''#if Release   
'''	Dim jo As JavaObject
'''	jo = jo.InitializeStatic("com.google.firebase.crashlytics.FirebaseCrashlytics").RunMethod("getInstance", Null)
'''	Return jo
'''#end if
'''End Sub
'''Public Sub SetKey(Key As String, Value As String)
'''#if Release
'''	GetCrashlytics.RunMethod("setCustomKey", Array(Key, Value))
'''#end if
'''End Sub

Private Sub GetCrashlytics As JavaObject
	Dim jo As JavaObject
	jo = jo.InitializeStatic("com.google.firebase.crashlytics.FirebaseCrashlytics").RunMethod("getInstance", Null)
	Return jo
End Sub

Public Sub SetKey(Key As String, Value As String)
#if Release
    GetCrashlytics.RunMethod("setCustomKey", Array(Key, Value))
#end if
End Sub


'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Sub btnDone_Click
	progressdialog.Show("Setting optimal chair values, please wait!", xui.Color_White)
	SaveSettings
End Sub

Sub ASBottomMenu1_Tab1Click
	Log("home clicked")
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab2Click
	Log("profile clicked")
	B4XPages.ShowPageAndRemovePreviousPages("Profile2")
	B4XPages.GetPage("Profile2").As(Profile2).AnimateFromLeft
End Sub

Sub ASBottomMenu1_Tab3Click
	Log("help clicked")
	B4XPages.ShowPageAndRemovePreviousPages("helpMenu")
	B4XPages.GetPage("helpMenu").As(helpMenu).AnimateFromRight
End Sub

Sub ASBottomMenu1_Tab4Click
	Log("shopping clicked")
	''https://stromergonomics.com/
	'''Common.manager.Disconnect
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_highlighted.png")
	ASBottomMenu1.SelectedPageIconColor = Common.LightBlueColors '''Colors.RGB(49, 211, 184)
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

private Sub SaveSettings
	
	seatheight = blbSeatheight.Value
	seatdepth = blbseatdepth.Value
	armrestwidth = blblarmrestwidth.Value
	armrestheight = blbarmrestheight.Value
	lumbarsupportheight = blblumarheight.Value
	seattilt = blbseattilt.Value
	backrestangle = blbBackRestAngle.Value
	lumbardensity = blbinflatableLumbarSupport.Value
	
	Log("seatheight: " & seatheight)
	Log("armrestwidth: " & armrestwidth)
	Log("seatdepth: " & seatdepth)
	Log("backrestangle: " & backrestangle)
	Log("seattilt: " & seattilt)
	Log("l_armrestheight: " & armrestheight)
	Log("r_armrestheight: " & armrestheight)
	Log("lumbarsupportheight: " & lumbarsupportheight)
	Log("lumbardensity: " & lumbardensity)
	
'''	SEAT_HEIGHT_CMD
'''	ARMREST_WIDTH_CMD
'''	SEAT_DEPTH_CMD
'''	BACKREST_TILT_CMD
'''	SEAT_TILT_CMD
'''	LEFT_ARMREST_HEIGHT_CMD
'''	RIGHT_ARMREST_HEIGHT_CMD
'''	BACKREST_HEIGHT_CMD
'''	LUMBAR_CMD
	
	Dim SEND_CMD(9) As Short
	SEND_CMD(0) = Round(seatheight * Common.mmConstant * 10)
	SEND_CMD(1) = Round(armrestwidth * Common.mmConstant * 10)
	SEND_CMD(2) = Round(seatdepth * Common.mmConstant * 10)
	SEND_CMD(3) = (backrestangle - Common.backrest_angle_intercept)/Common.backrest_angle_slope '''Round(backrestangle * Common.mmConstant * 10)
	SEND_CMD(4) = (seattilt - Common.centertilt_intercept)/Common.centertilt_slope '''Round(seattilt * Common.mmConstant * 10)
	SEND_CMD(5) = Round(armrestheight * Common.mmConstant * 10)
	SEND_CMD(6) = Round(armrestheight * Common.mmConstant * 10)
	SEND_CMD(7) = Round(lumbarsupportheight * Common.mmConstant * 10)
	SEND_CMD(8) = Round(lumbardensity) '''* Common.mmConstant
	
	Dim CMDS() As Byte
	Dim bc As ByteConverter
	bc.LittleEndian = True
	CMDS = bc.ShortsToBytes(SEND_CMD)
	Dim hexString As String = bc.HexFromBytes(CMDS)
	Log("hexString: " & hexString)
	
	Dim movechair(1) As Byte
	movechair(0) = 0x01
	'''(degrees - intercept)/slope
	Dim seat_height_max As Int = Round((Common.SEAT_HEIGHT_MAX*10*Common.mmConstant))
	Dim seat_height_min As Int = Round((Common.SEAT_HEIGHT_MIN*10*Common.mmConstant))
	Dim armrest_width_max As Int = Round((Common.ARMREST_WIDTH_MAX*10*Common.mmConstant))
	Dim armrest_width_min As Int = Round((Common.ARMREST_WIDTH_MIN*10*Common.mmConstant))
	Dim seat_depth_max As Int = Round((Common.SEAT_DEPTH_MAX*10*Common.mmConstant))
	Dim seat_depth_min As Int = Round((Common.SEAT_DEPTH_MIN*10*Common.mmConstant))
	'''(Common.BACKREST_TILT_MAX-Common.backrest_angle_intercept)/Common.backrest_angle_slope)
	Dim backrest_tilt_max As Int = Round((Common.BACKREST_TILT_MAX-Common.backrest_angle_intercept)/Common.backrest_angle_slope)
	Dim backrest_tilt_min As Int = Round((Common.BACKREST_TILT_MIN-Common.backrest_angle_intercept)/Common.backrest_angle_slope)
	'''(Common.SEAT_TILT_MAX-Common.centertilt_intercept/Common.centertilt_slope)
	Dim seat_tilt_max As Int = Round((Common.SEAT_TILT_MAX-Common.centertilt_intercept)/Common.centertilt_slope)
	Dim seat_tilt_min As Int = Round((Common.SEAT_TILT_MIN-Common.centertilt_intercept)/Common.centertilt_slope)
	Dim armrest_height_max As Int = Round((Common.ARMREST_HEIGHT_MAX*10*Common.mmConstant))
	Dim armrest_height_min As Int = Round((Common.ARMREST_HEIGHT_MIN*10*Common.mmConstant))
	Dim backrest_height_max As Int = Round((Common.BACKREST_HEIGHT_MAX*10*Common.mmConstant))
	Dim backrest_height_min As Int = Round((Common.BACKREST_HEIGHT_MIN*10*Common.mmConstant))
	
	
	If (SEND_CMD(0) > seat_height_max) Or (SEND_CMD(0) < seat_height_min) Or (SEND_CMD(1) > armrest_width_max) Or (SEND_CMD(1) < armrest_width_min) Or  _
	(SEND_CMD(2) > seat_depth_max) Or (SEND_CMD(2) < seat_depth_min) Or (SEND_CMD(3) > backrest_tilt_max) _
	 Or (SEND_CMD(3) < backrest_tilt_min) Or (SEND_CMD(4) > seat_tilt_max) Or (SEND_CMD(4) < seat_tilt_min) Or _
	 (SEND_CMD(5) > armrest_height_max) Or (SEND_CMD(5) < armrest_height_min) Or (SEND_CMD(6) > armrest_height_max) Or _
	 (SEND_CMD(6) < armrest_height_min) Or (SEND_CMD(7) > backrest_height_max) Or (SEND_CMD(7) < backrest_height_min) Or _
	 (SEND_CMD(8) > Common.LUMBAR_INFLATION_MAX) Or (SEND_CMD(8) < Common.LUMBAR_INFLATION_MIN) Then
		dialog.Initialize(Root)
		dialog.BorderCornersRadius = 20
		dialog.BorderWidth = 0dip
		dialog.Title = "Login Error"
				#If B4A
		dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)			'''xui.CreateFont(myfont, 17)
		dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)
				#Else
				Dialog.TitleBarFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
				Dialog.ButtonsFont = xui.CreateFont(Font.CreateNew2("CeraPro-Black", 17), 17)
				#End If
		dialog.ButtonsTextColor = xui.Color_White
		'''xui.CreateFont(myfont, 17)
		dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
		dialog.TitleBarColor = xui.Color_Transparent
		dialog.BackgroundColor = xui.Color_White
		dialog.BodyTextColor = xui.Color_Black
		'''Dialog.OverlayColor = xui.Color_ARGB(180, 88, 85, 85)
		''Dialog.BlurBackground = True
		''rgba(49, 211, 184, 1)
		Dim sf As Object = dialog.Show("One or more values are out of range, please check slide values and try again!", "OK", "", "Cancel")
		dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip)
		dialog.TitleBar.GetView(0).Height = dialog.TitleBar.GetView(0).Height + 10dip
		dialog.mParent.Color = xui.Color_Transparent
		''Dialog.ButtonsColor = xui.Color_White
		Dim btnOK As B4XView = dialog.GetButton(xui.DialogResponse_Positive)
		Dim btncnl As B4XView = dialog.GetButton(xui.DialogResponse_Cancel)
		btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
		btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
		wait for (sf) Complete(result As Int)
		Log("dialog result: " & result)
		progressdialog.Hide
		Return
	End If 
		
	
		'send values of sliders to chair.
			Try
				GetCrashlytics.RunMethod("log", Array As String("We are trying to write Slider values to the chair: " & CMDS.Length & " " & hexString))
				GetCrashlytics.RunMethod("setCustomKey", Array("Saving Data and Writing to chair", bleservice.ChairControlService & " / " & bleservice.AxesCMDCharacteristic))
				Common.manager.WriteData(bleservice.ChairControlService, bleservice.AxesCMDCharacteristic, CMDS)
				Catch
				If LastException.IsInitialized Then
				GetCrashlytics.RunMethod("recordException", Array(LastException))
				End If
				Log("error writing sliders values to chair: " & LastException)
				progressdialog.Hide
			End Try
					
		Try
				GetCrashlytics.RunMethod("log", Array As String("We are writing the command 0x01 to the chair after sending slider values"))
				GetCrashlytics.RunMethod("setCustomKey", Array("WritingData to Chair, Move to command Position sent", bleservice.ChairControlService & " / " & bleservice.AxesCMDCharacteristic))
				Common.manager.WriteData(bleservice.ChairControlService, bleservice.ChairMotionCMDCharacterstic, movechair)
		wait for ChairCMDResponse(response As Int)
		LogColor("chair response: " & response, Colors.Red)
		'''progressdialog.Hide
		If response = 0 Then
			Log("data sent to chair successfully!")
			ToastMessageShow("Response from chair Received with a Zero value!", True)
		Else
			ToastMessageShow("Response from chair Recieved with a NON Zero value!", True)
		End If
		'''progressdialog.hide
		'''wait for chair to be idle so we can proceed!
		Dim idle As Boolean = False
		Do While idle = False
			Common.manager.ReadData2(bleservice.ChairInformationService, bleservice.ChairStateCharacteristic)
			wait for ChairState(State() As Short)
			LogColor("State: " & State(0), xui.Color_Green)
			Dim resp As Short = State(0)
			Select resp
				Case Common.NOT_INITIALIZED
					LogColor("chair is not initialized", xui.Color_blue)
				Case Common.INITIALIZING
					LogColor("chair initializing...", xui.Color_Blue)
				Case Common.MOVING
					'''LogColor("Chair is moving....", xui.Color_Blue)
				Case Common.IDLE
					'''LogColor("Chair is in IDLE mode", xui.Color_Blue)
					idle = True
			End Select
			Sleep(100)
		Loop
		Catch
				If LastException.IsInitialized Then
					GetCrashlytics.RunMethod("recordException", Array(LastException))
				End If
				Log("error setting command to move chair: " & LastException)
				progressdialog.Hide
		End Try
	
	
Try
		'''Dim email As String

'''Dim queryemail As String = "SELECT EMAIL FROM Registrations WHERE UserName = " & "'"&Starter.userName&"'" & " AND PinNumber = " & "'"&Starter.pinNumber&"'"
'''Dim db As DBTransactions
'''db.Initialize(Me)
'''db.ExecuteRemoteQuery(queryemail, "SELECTCOLUMNS")
'''wait for QueryResults(Results2 As List)
'''If Results2.Size > 0 Then
'''	Dim m As Map = Results2.Get(0)
'''	Common.EMAIL = m.Get("EMAIL")
'''	progressdialog.Show("Retrieved EAMIL: " & Common.EMAIL, xui.Color_Blue)
'''Else
'''	Log(LastException)
'''	If LastException.IsInitialized Then
'''	GetCrashlytics.RunMethod("recordException", Array(LastException))
		'''	End If
		'''End If

		Dim path As PathBuilder
		path.Initialize
		path.Document("StromDB/Registrations/")
		Log("path: " & path.Complete)
		Dim fand As CompositeFilter
		Dim filter As FieldFilter
		filter.Initialize.EqualTo("UserName", Common.userName).EqualTo("PinNumber", Common.pinNumber)
		fand.Initialize.Filters(filter)
		Dim qry As Query
		qry.Initialize.From("Users").OrderBy("UserName", qry.ASCENDING).CollectionIn(path).Where(fand)
		wait for (B4XPages.MainPage.store.RunQuery(qry)) Complete(results As Map)
		Log("results: " & results)
		Dim json As JSONParser
		Dim s As String = results.Get("documents")
		Dim l As List
		
		If s <> "" Then
		json.Initialize(s)
			Try
				l = json.NextArray
				For Each val As Map In l
					Common.EMAIL = val.Get("EMAIL")
					progressdialog.Show("Retrieved EAMIL: " & Common.EMAIL, xui.Color_Blue)
				Next
			Catch
				GetCrashlytics.RunMethod("recordException", Array(LastException))
				Log(LastException)
			End Try
		End If
		
		
		Dim path As PathBuilder
		path.Initialize
		path.Document("StromDB/ManualSettings/")
		Log("path: " & path.Complete)
		Dim fand As CompositeFilter
		Dim filter As FieldFilter
		filter.Initialize.EqualTo("UserName", Common.userName).EqualTo("Password", Common.pinNumber)
		fand.Initialize.Filters(filter)
		Dim qry As Query
		qry.Initialize.From("Measurements").OrderBy("UserName", qry.ASCENDING).CollectionIn(path).Where(fand)
		wait for (B4XPages.MainPage.store.RunQuery(qry)) Complete(results As Map)
		Log("results: " & results)
		Dim json As JSONParser
		Dim s As String = results.Get("documents")
		Dim l As List
	If s <> "" Then
		json.Initialize(s)

	Dim count As Int = 0
'''Dim query As String = "SELECT count(*) FROM ManualSettings WHERE UserName = " & "'"&Starter.userName&"'" & " AND Password = " & "'"&Starter.pinNumber&"'"
''''''count = Common.mysql.ExecQuerySingleResult(query)
'''Dim db As DBTransactions
'''db.Initialize(Me)
'''db.ExecuteRemoteQuery(query, "SELECTCOLUMNS")
'''wait for QueryResults(Results2 As List)
'''Dim m As Map = Results2.Get(0)
'''count = m.Get("count(*)")
	Try
		l = json.NextArray
		Dim val As Map = l.Get(0)
		If val.IsInitialized And val.ContainsKey("id") Then
			Common.ManualSettingsCollectionID = val.Get("id")
			count = 1
		Else 
			count = 0
		End If
	Catch
		Log(LastException)
	End Try
	
	progressdialog.Show("Found username count: " & count, xui.Color_Blue)
	Sleep(500)
If count > 0 Then
	progressdialog.Show("SAVING DATA to Backend...", xui.color_blue)
'''	Dim updateQuery As String = "UPDATE ManualSettings SET SeatHeight = " & "'"&seatheight&"'" & " ,SeatWidth = " & "'"&blbseatwidth.Value&"'"& " ,SeatDepth = " & "'"&seatdepth&"'" & " ,SeatTilt="&"'"&seattilt&"'" & " ,ArmRestWidth="&"'"&armrestwidth&"'" & _
'''			" ,ArmRestHeight="&"'"&armrestheight&"'" & " ,LumbarHeight="&"'"&lumbarsupportheight&"'" & " ,BackRestAngle="&"'"&backrestangle&"'" & " ,InflatableLumbarSupport="&"'"&lumbardensity&"'" & _
'''			" WHERE UserName = " &"'"&Starter.userName&"'" & " AND Password = " & "'"&Starter.pinNumber&"'"
'''			
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
'''	db.ExecuteRemoteQuery(updateQuery, "UPDATE")
'''	wait for QueryResults(Results2 As List)
'''	'''Log("NonQuery: " & Success)
'''	LogColor("Update ManualSettings:  Success", Colors.Blue)
	wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/ManualSettings/Measurements", Common.ManualSettingsCollectionID, CreateMap("SeatHeight":seatheight, _
	"SeatWidth":blbseatwidth.Value, "SeatDepth":seatdepth, "SeatTilt":seattilt, "ArmRestWidth":armrestwidth, _
	"ArmRestHeight":armrestheight, "LumbarHeight":lumbarsupportheight, "BackRestAngle":backrestangle, "InflatableLumbarSupport":lumbardensity))) Complete(results As Map)
	LogColor("Updated ManualSettings: " & results, xui.Color_Blue)
	progressdialog.Show("Updated ManualSettings table successfully!", xui.Color_White)
	
	
	Common.ArmRestHeight = 0
	Common.ArmRestWidth = 0
	Common.BackRestAngle = 0
	Common.LumbarHeight = 0
	Common.SeatDepth = 0
	Common.SeatHeight = 0
	Common.SeatTilt = 0
	Common.SeatWidth = 0
	Common.InflatableLumbarSupport = 0
	
	Sleep(1000)
	progressdialog.hide
	
	'''wait for 
	Common.manager.Disconnect

	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
'''Else
'''	Dim insertQuery As String = "INSERT INTO ManualSettings (UserName, EMAIL,  Password, SeatHeight, SeatWidth, SeatDepth, SeatTilt, ArmRestWidth, ArmRestHeight, LumbarHeight, BackRestAngle, InflatableLumbarSupport) VALUES " & "(" & "'"&Starter.userName&"'" & "," & " '"&Common.EMAIL&"',  " & "'"&Starter.pinNumber&"'" & "," & "'"&seatheight&"',  " & "'"&NumberFormat(elbowwidth, 0, 1)&"', " &"'"&seatdepth&"', " & "'"&seattilt&"', " & "'"& armrestwidth &"', " & "'"&armrestheight&"', " & "'"&lumbarsupportheight&"', " & "'"&backrestangle&"', " & "'"&lumbardensity&"')"
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
'''	db.ExecuteRemoteQuery(insertQuery, "INSERT")
'''	wait For QueryResults(Results2 As List)
'''
'''	LogColor("new record inserted into ManualSettings:  Success", Colors.Blue)
'''			'''ProgressDialogHide
'''	Common.ArmRestHeight = 0
'''	Common.ArmRestWidth = 0
'''	Common.BackRestAngle = 0
'''	Common.LumbarHeight = 0
'''	Common.SeatDepth = 0
'''	Common.SeatHeight = 0
'''	Common.SeatTilt = 0
'''	Common.SeatWidth = 0
'''	Common.InflatableLumbarSupport = 0
'''	progressdialog.Hide
'''	Common.mysql.Close
'''	Sleep(1000)
'''
'''	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
'''	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End If
End If
Catch
progressdialog.Hide
If LastException.IsInitialized Then
	GetCrashlytics.RunMethod("recordException", Array(LastException))
End If
Log("error trying to save settings: " & LastException.Message)
End Try
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Common.ManualSettingsActive = False
	Return False
End Sub

Sub B4XPage_Disappear
	'''Common.manager.Disconnect
	Common.ManualSettingsActive = False
End Sub

Sub ChairCMDResponse(resp As Int)
	
End Sub

Sub ChairState(State() As Short)
	LogColor("inside ChairState Sub", xui.Color_Magenta)
End Sub

Sub B4XPage_Appear
	InitializeSliders
	Common.ManualSettingsActive = True
	Common.PairDeviceActive = False
End Sub