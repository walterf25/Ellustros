B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
#IgnoreWarnings: 2
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	Private timeoutTimer As Timer
	
	Private ProgressBar1 As ProgressBar
	Private lblMessage As B4XView
	Private ASBottomMenu1 As ASBottomMenu
	Private gif As B4XGifView
	Private imgSuccess As B4XView
	Private lblsuccess As B4XView
	Private btnTryAgain As B4XView
	Private btnShopping As B4XView
	Private btnPairScan As B4XView
	
'''	#if B4A
'''	Private manager As BleManager2
'''	Private rp As RuntimePermissions
'''	#else if B4i
'''	Private manager As BleManager
'''	#end if
	#if B4A
	Private rp As RuntimePermissions
	#End If
	
	Private dialog As B4XDialog
	
	Private currentStateText As String = "UNKNOWN"
	Private currentState As Int
	Private connected As Boolean = False
	Private ConnectedName As String
	Private ConnectedServices As List
	Private clv As CustomListView
	Private clv2 As CustomListView
	
	Private ble As BLEConnection
	Public bleservice As StromService
	Private btnInitializeChair As B4XView
	Private lblChairState As B4XView
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	bleservice.Initialize
	dialog.Initialize(Root)
	gif.Initialize(Me, "gif")
	'''manager.Initialize("manager")
	ble.Initialize(Me, "ble")
End Sub

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

private Sub LoadAssets
	Root.RemoveAllViews
	Root.LoadLayout("pairdevice")
	Dim myfont As B4XFont
	myfont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Bold.otf"), 17)
	
	'''imgSuccess.SetBackgroundImage(LoadBitmap(File.DirAssets, "success.png"))
	imgSuccess.SetBitmap(LoadBitmapResize(File.DirAssets, "success.png", 64dip, 64dip, True))
	If imgSuccess.Visible = True Then imgSuccess.Visible = False
	
	Common.LightBlueColor(btnPairScan)
	btnPairScan.Font = Common.btnFont
	btnPairScan.Text = "Scan BLE Devices"
	btnPairScan.TextColor = xui.Color_White
	
	Common.LightBlueColor2(btnInitializeChair)
	btnInitializeChair.Font = myfont
	btnInitializeChair.Text = "Initialize Chair"
	btnInitializeChair.TextColor = xui.Color_White
	
	timeoutTimer.Initialize("timeout", 2500)
	timeoutTimer.Enabled = False
	
	'''gif.SetGif(File.DirAssets, "spinner2-1s-200px.gif")
	'''gif.mBase.Visible = True
	lblMessage.Font = myfont
	lblChairState.Font = myfont
	lblChairState.TextSize = 24
	lblChairState.TextColor = Colors.rgb(28, 30, 36)
	lblChairState.Visible = False
'''	lblMessage.TextColor = Colors.Black
'''	lblMessage.TextSize = 18
'''	lblMessage.Text = "Connecting to your" & CRLF & "STRÖM SMARTChair…"
	lblsuccess.Font = myfont
	lblsuccess.TextColor = Colors.rgb(28, 30, 36)
	lblsuccess.TextSize = 24
	lblsuccess.Text = "Successfully paired!"
	If lblsuccess.Visible = True Then lblsuccess.Visible = False
	LogColor("common.BLEConnected: " & Common.BLEConnected, xui.Color_Blue)
	If Common.BLEConnected = True Then
		''if bluetooth is already connected, adjust chair with optimar chair values or read values from chair
		gif.SetGif(File.DirAssets, "spinner2-1s-200px.gif")
		gif.mBase.Visible = True
		lblMessage.Font = Common.btnFont
		lblMessage.Visible = True
		lblMessage.Text = "Please wait while your STRÖM" & CRLF & "SMARTChair adjusts to your" & CRLF & "optimal ergonomic position."
		btnPairScan.Visible = False
		Else	
	End If
	
	Dim bc As ByteConverter
	Dim m As Map
	m.Initialize
	bc.LittleEndian = True
'''	''Dim s As String = "0100"
	Dim b(32) As Byte
	b(0) = 0x10
	b(1) = 0x00
	b(2) = 0x0E
	b(3) = 0x06
	b(4) = 0x10
	b(5) = 0x00
	b(6) = 0x9F
	b(7) = 0x03
	b(8) = 0x21
	b(9) = 0x00
	b(10) = 0xC1
	b(11) = 0x04
	b(12) = 0x0A
	b(13) = 0x00
	b(14) = 0x2B
	b(15) = 0x01
	b(16) = 0x0A
	b(17) = 0x00
	b(18) = 0x90
	b(19) = 0x00
	b(20) = 0x05
	b(21) = 0x00
	b(22) = 0x92
	b(23) = 0x04
	b(24) = 0x05
	b(25) = 0x00
	b(26) = 0x92
	b(27) = 0x04
	b(28) = 0x07
	b(29) = 0x00
	b(30) = 0xB2
	b(31) = 0x04
	
	Dim h As String = bc.HexFromBytes(b)
	Log("h: " & h)
	
	lblChairState.Visible = False
	
'''	Dim shorts() As Short = bc.ShortsFromBytes(b)
'''	For Each sh As Short In shorts
'''		Log("byte : " & sh)
'''	Next
'''	''
'''	m.Put(bleservice.AxesRangeCharacteristic, b)
'''	ble_DataAvailable(bleservice.ChairInformationService, m)
'''	
'''	Sleep(1000)
'''	
'''	Dim b2(2) As Byte
'''	b2(0) = 0x02
'''	b2(1) = 0x00
'''	
'''	Dim m2 As Map
'''	m2.Initialize
'''	m2.Put(bleservice.ChairStateCharacteristic, b2)
'''	ble_DataAvailable(bleservice.ChairControlService, m2)
End Sub

Public Sub SendResponse
	Dim m As Map
	Dim b() As Byte
'''	b(0) = 0x02
'''	b(1) = 0x00
	m.Initialize
	m.Put(bleservice.ChairMotionRespCharacteristic, b)
	ble_DataAvailable(bleservice.ChairControlService, m) 
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

Sub timeout_Tick
	timeoutTimer.Enabled = False
	ProgressBar1.Visible = False

	'''gif.mBase.Visible = False
	If Common.BLEConnected Then
		'''btnInitializeChair.SetVisibleAnimated(1500, True)
		imgSuccess.SetBitmap(LoadBitmapResize(File.DirAssets, "success.png", 64dip, 64dip, True))
		lblsuccess.Text = "Successfully paired!"
		lblsuccess.SetVisibleAnimated(1500, True)
		imgSuccess.SetVisibleAnimated(1500, True)
		lblMessage.Font = Common.btnFont
		lblMessage.Visible = True
		lblMessage.Text = "Please wait while your STRÖM" & CRLF & "SMARTChair adjusts to your" & CRLF & "optimal ergonomic position."

		If gif.GifDrawable.IsInitialized=True Then
			gif.mBase.GetView(0).SetBitmap(Null)
			gif.GifDrawable.RunMethod("recycle",Null)
			gif.GifDrawable=Null
		End If
		Sleep(2500)
		'''Activity.Finish
		'''B4XPages.ClosePage(Me)
		Common.SeatTilt = 5
		'''StartActivity(ManualSettings)
		'''B4XPages.ShowPage("ManualSettings")
		'''B4XPages.ShowPageAndRemovePreviousPages("PairDevice")
'''		B4XPages.ShowPage("ManualSettings")
'''		B4XPages.GetPage("ManualSettings").As(ManualSettings).AnimateFromRight
		lblsuccess.Visible = False
		imgSuccess.Visible = False
		gif.SetGif(File.DirAssets, "spinner2-1s-200px.gif")
		gif.mBase.Visible = True
		
		'''At this point code to adjust chair needs to be inserted.
		'''Initialize button only needs to be visible if the chair has not yet been initialized
		''otherwise button does not need to be visible, and the Manual_settings screen needs to be called.
		
		Else
		imgSuccess.SetBitmap(xui.LoadBitmap(File.DirAssets, "Ellipse 11@3x.png"))
			#If B4A
		imgSuccess.As(ImageView).Gravity = Gravity.FILL
			#Else
	
			#End If
		lblsuccess.Text = "Could not pair"
		lblsuccess.SetVisibleAnimated(1500, True)
		imgSuccess.SetVisibleAnimated(1500, True)
		lblMessage.Text = "Please ensure your STRÖM" & CRLF & "SMARTChair is turned on and" & CRLF & "discoverable"
		btnPairScan.SetVisibleAnimated(1500, True)
		If gif.GifDrawable.IsInitialized=True Then
			gif.mBase.GetView(0).SetBitmap(Null)
			gif.GifDrawable.RunMethod("recycle",Null)
			gif.GifDrawable=Null
		End If
	End If
	
	Retrieve_Measurements
End Sub

Sub btnTryAgain_Click
	Common.random = Rnd(0,2)
	timeoutTimer.Initialize("timeout", 3000)
	timeoutTimer.Enabled = True
	LoadAssets
End Sub

Sub btnShopping_Click
	'''Activity.Finish
	B4XPages.ClosePage(Me)
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Sub B4XPage_Appear
	GetCrashlytics.RunMethod("log", Array("PairDevice B4XPage_Appear"))
	LogColor("inside B4XPage_Appear", xui.Color_Blue)
	'''Dim a As Int = "abc"
	LoadAssets
	'''timeoutTimer.Initialize("timeout", 3000)
	'''timeoutTimer.Enabled = True
	Common.PairDeviceActive = True
End Sub

Sub B4XPage_Disappear
	'''B4XPages.ClosePage(Me)
	timeoutTimer.Enabled = False
	Common.PairDeviceActive = False
	'''If connected Then ble.AsBleManager.Disconnect
End Sub

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

Sub B4XPage_Background
	Log("PairDevice page is in the background..")
End Sub

Private Sub btnPairScan_Click
	
	lblsuccess.Visible = False
	lblsuccess.SetVisibleAnimated(0, False)
	imgSuccess.SetVisibleAnimated(0, False)
	lblMessage.Text = "Please ensure your STRÖM" & CRLF & "SMARTChair is turned on and" & CRLF & "discoverable"
	
	Dim p As B4XView = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0, 80%x, 65%y)
	p.LoadLayout("BLEDevices")
	p.Color = xui.Color_White
	clv.GetBase.Color = xui.Color_White
	dialog.BorderCornersRadius = 35
	dialog.BorderWidth = 0dip
	dialog.Title = "Select device to connect to"
	dialog.TitleBarFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)			'''xui.CreateFont(myfont, 17)
	dialog.ButtonsFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Black.otf"), 17)
	dialog.ButtonsTextColor = xui.Color_White
	
	'''Dialog.ButtonsColor = xui.Color_ARGB(51, 28, 30, 36)
	dialog.TitleBarColor = xui.Color_Transparent
	dialog.BackgroundColor = xui.Color_White
	dialog.BodyTextColor = xui.Color_Black
	Dim rs As ResumableSub = dialog.ShowCustom(p, "", "", "Close")
	dialog.TitleBar.GetView(0).SetColorAndBorder(Common.LightBlueColors, 0, xui.Color_Black, 5dip) '''xui.Color_ARGB(255, 49, 211, 184)
	dialog.TitleBar.GetView(0).Height = dialog.TitleBar.GetView(0).Height + 10dip
	dialog.mParent.Color = xui.Color_Transparent
	'''Dim btnOK As B4XView = dialog.GetButton(xui.DialogResponse_Positive)
	Dim btncnl As B4XView = dialog.GetButton(xui.DialogResponse_Cancel)
	'''btnOK.SetColorAndBorder(Common.LightBlueColors, 0dip, xui.Color_Transparent, 18dip)
	btncnl.SetColorAndBorder(Common.DarkGrayColors, 0dip, xui.Color_Transparent, 18dip)
	'''btnOK.Top = btnOK.Top + 7dip
	btncnl.Top = btncnl.Top + 7dip
	'''btnOK.Left = (dialog.Base.Width - (btnOK.Width + btncnl.Width) + 5dip)/2
	btncnl.Left = dialog.Base.Width/2 - btncnl.Width/2'''btnOK.Left+btnOK.Width + 5dip
	StartScan
	
	wait for (rs) Complete(result As Int)
	If result = xui.DialogResponse_Positive Then
		dialog.Close(xui.DialogResponse_Positive)
		Common.manager.StopScan
'''		btnShopping.SetVisibleAnimated(1500, True)
'''		If gif.GifDrawable.IsInitialized=True Then
'''			gif.mBase.GetView(0).SetBitmap(Null)
'''			gif.GifDrawable.RunMethod("recycle",Null)
'''			gif.GifDrawable=Null
'''		End If
		btnPairScan.Visible = False
		'''lblMessage.Visible = False
		'''gif.mBase.Visible = False
		btnShopping.Visible = False
	else if result = xui.DialogResponse_Cancel Then
		dialog.Close(xui.DialogResponse_Cancel)
		lblsuccess.Visible = False
		imgSuccess.Visible = False
		Common.manager.StopScan
		btnShopping.SetVisibleAnimated(1500, True)
		If gif.GifDrawable.IsInitialized=True Then
			gif.mBase.GetView(0).SetBitmap(Null)
			gif.GifDrawable.RunMethod("recycle",Null)
			gif.GifDrawable=Null
		End If
		btnPairScan.Visible = True
		lblMessage.Visible = False
		gif.mBase.Visible = False
		btnShopping.Visible = False
	End If
	
'''	B4XPages.ShowPage("ManualSettings")
'''	B4XPages.GetPage("ManualSettings").As(ManualSettings).AnimateFromRight
'''	lblsuccess.Visible = False
'''	imgSuccess.Visible = False
End Sub

#Region BLEScan
Sub CreateServiceItem (service As String) As Panel
	Dim pnl As B4XView = xui.CreatePanel("")
	pnl.Color = Common.LightBlueColors'''0xFF808080
	pnl.SetLayoutAnimated(0, 0, 0, clv.AsView.Width, 30dip)
	Dim lbl As B4XView = XUIViewsUtils.CreateLabel
	lbl.Font = Common.btnFont
	lbl.Text = service
	lbl.SetTextAlignment("CENTER", "CENTER")
	lbl.Font = xui.CreateDefaultBoldFont(14)
	pnl.AddView(lbl, 5dip, 0, clv.AsView.Width - 10dip, 30dip)
	Return pnl
End Sub

Sub CreateCharacteristicItem(Id As String, Data() As Byte) As Panel
	Dim pnl As B4XView = xui.CreatePanel("")
	pnl.SetLayoutAnimated(0, 0, 0, clv.AsView.Width, 40dip)
	pnl.Color = Colors.White
	Dim lbl As B4XView = XUIViewsUtils.CreateLabel
	lbl.Text = Id
	lbl.Font = Common.btnFont
	pnl.AddView(lbl, 5dip, 0, clv.AsView.Width, 35dip)
	Dim lbl2 As B4XView = XUIViewsUtils.CreateLabel
	lbl2.Font = Common.btnFont
	Try
		lbl2.Text = BytesToString(Data, 0, Data.Length, "UTF8")
	Catch
		Log(LastException)
		lbl2.Text = "Error reading data as string"
	End Try
	lbl2.TextColor = 0xFF909090
	lbl2.TextSize = 14
	pnl.AddView(lbl2, 5dip, 25dip, clv.AsView.Width - 10dip, 35dip)
	Return pnl
End Sub

Sub CreateDevicesFound(Name As String, Id As String) As B4XView
	Dim pnl As B4XView = xui.CreatePanel("")
	pnl.SetLayoutAnimated(0, 0, 0, dialog.Base.Width, 40dip)
	pnl.Color = xui.Color_White
	Dim lbl As B4XView = XUIViewsUtils.CreateLabel
	lbl.Text = Name & "-" & Id
	lbl.TextColor = xui.Color_Black
	lbl.Font = Common.myfont
	lbl.TextSize = 14
	pnl.AddView(lbl, 0, 0, clv.AsView.Width, 40dip)
	Return pnl
End Sub


Sub ble_StateChanged (State As Int)
	Select State
		Case ble.AsBleManager.STATE_POWERED_OFF
			currentStateText = "POWERED OFF"
		Case ble.AsBleManager.STATE_POWERED_ON
			currentStateText = "POWERED ON"
		Case ble.AsBleManager.STATE_UNSUPPORTED
			currentStateText = "UNSUPPORTED"
	End Select
	currentState = State
End Sub

Sub ble_DeviceFound (Name As String, DeviceId As String)
	Log("Found: " & Name & ", " & DeviceId) 'ignore
	clv.Add(CreateDevicesFound(Name, DeviceId), DeviceId)
End Sub

Public Sub StartScan
	Dim Permissions As List
	Dim phone As Phone
	If phone.SdkVersion >= 31 Then
		Permissions = Array("android.permission.BLUETOOTH_SCAN", "android.permission.BLUETOOTH_CONNECT", rp.PERMISSION_ACCESS_FINE_LOCATION)
	Else
		Permissions = Array(rp.PERMISSION_ACCESS_FINE_LOCATION)
	End If
	For Each per As String In Permissions
		rp.CheckAndRequest(per)
		Wait For B4XPage_PermissionResult (Permission As String, Result As Boolean)
		If Result = False Then
			ToastMessageShow("No permission: " & Permission, True)
			Return
		End If
	Next
	
	If ble.AsBleManager.State <> ble.AsBleManager.STATE_POWERED_ON Then
	'''If manager.State <> manager.STATE_POWERED_ON Then
		Log("Not powered on.")
	Else
		'''manager.Scan2(Null, False)
		gif.mBase.Visible = True
		gif.SetGif(File.DirAssets, "spinner2-1s-200px.gif")
		lblMessage.Visible = True
		btnPairScan.Visible = False
		ble.AsBleManager.Scan2(Null, False)
	End If
End Sub

Sub ble_DataAvailable (ServiceId As String, Characteristics As Map)
	'''clv2.Add(CreateServiceItem(ServiceId), "")
	For Each id As String In Characteristics.Keys
		Dim datacontent() As Byte
		Log("ID: " & id)
		If id = bleservice.ChairStateCharacteristic Then
			datacontent = Characteristics.Get(id)
			lblChairState.Visible = False
			Dim bc As ByteConverter
			bc.LittleEndian = True
			Dim shorts() As Short = bc.ShortsFromBytes(datacontent)
			'''Dim pg As ManualSettings = B4XPages.GetPage("ManualSettings")
			'''Dim mcall As Object = B4XPages.GetPage("PairDevice")
			'''CallSubDelayed2(mcall, "ChairState", shorts)
			If shorts.Length > 0 Then
			'''B4XPages.GetPage("ManualSettings").As(ManualSettings).ChairState(shorts)
			If Common.ManualSettingsActive = True Then
			Dim mcall As Object = B4XPages.GetPage("ManualSettings")
			CallSubDelayed2(mcall, "ChairState", shorts)
			End If
			If shorts(0) = Common.NOT_INITIALIZED Then
				'''pg.UpdateChairState("Chair State: NOT INITIALIZED")
				'''btnInitializeChair.Visible = True
				lblChairState.Text = "Chair State: NOT INITIALIZED"
'''					If Common.ManualSettingsActive = True Then
'''						Dim mcall As Object = B4XPages.GetPage("ManualSettings")
'''						CallSubDelayed2(mcall, "ChairState", shorts)
'''					End If
			else if shorts(0) = Common.INITIALIZING Then
				'''pg.UpdateChairState("Chair State: INITIALIZING..")
				btnInitializeChair.Visible = False
				lblChairState.Text = "Chair State: INITIALIZING..."
				LogColor("Chair State INITIALIZING...", xui.Color_Red)
			else if shorts(0) = Common.IDLE Then
				'''pg.UpdateChairState("Chair State: IDLE")
				'''lblChairState.Text = "Chair State: IDLE"
				LogColor("Chair State IDLE", xui.Color_Red)
				''write code to start moving chair to wanted positionsl
				''need to retrieve measurement values before.
					'''CallSubDelayed(Me, "Retrieve_Measurements")
					If Common.ManualSettingsActive = False And Common.InitialStateRequest = False Then
						lblChairState.Text = "Chair State: IDLE"
						LogColor("Chair State IDLE", xui.Color_Red)
						Sleep(1000)
						If gif.GifDrawable.IsInitialized=True Then
							gif.mBase.GetView(0).SetBitmap(Null)
							gif.GifDrawable.RunMethod("recycle",Null)
							gif.GifDrawable=Null
						End If
						Common.fromChairOptimal = False
						B4XPages.ShowPageAndRemovePreviousPages("ManualSettings")
						B4XPages.GetPage("ManualSettings").As(ManualSettings).AnimateFromLeft
					'''Else
					End If
					If Common.InitialStateRequest = True Then Common.InitialStateRequest = False
			else if shorts(0) = Common.MOVING Then
				'''pg.UpdateChairState("Chair State: MOVING..")
				LogColor("Chair State MOVING...", xui.Color_Red)
				lblChairState.Text = "Chair State: MOVING..."
			else if shorts(0) = Common.FAULT Then
				'''pg.UpdateChairState("Chair State: FAULT")
				LogColor("Chair State FAULT", xui.Color_Red)
				lblChairState.Text = "Chair State: FAULT"
			End If
			'''Else
			'''	ToastMessageShow("No Incoming Data from chair Response...", True)
			End If
		else if id = bleservice.AxesCurPosCharacteristic Then
			datacontent = Characteristics.Get(id)
			Dim bc As ByteConverter
			bc.LittleEndian = True
			Dim shorts() As Short = bc.ShortsFromBytes(datacontent)
		else if id = bleservice.ChairMotionRespCharacteristic Then
			datacontent = Characteristics.Get(id)
			Dim bc As ByteConverter
			bc.LittleEndian = True
			Dim shorts() As Short = bc.ShortsFromBytes(datacontent)
			Dim resp As Int = shorts(0)
			'''Log("calling ChairCMDResponse from PairDevice page...")
			'''GetCrashlytics.RunMethod("log", Array As String("Calling ChairCMDResponse sub in ManualSettings Page"))
			'''Dim mcall As Object = B4XPages.GetManager.GetTopPage.B4XPage

			
			Dim mcall As Object = B4XPages.GetPage("ManualSettings")

			LogColor("response from chaircmdresponse: " & resp, xui.Color_Blue)
			If shorts.Length > 0 Then
			If shorts(0) = 0 Then
				If Common.ManualSettingsActive = True Then
				CallSubDelayed2(mcall, "ChairCMDResponse", resp)
				End If
				'''B4XPages.GetPage("ManualSettings").As(ManualSettings).ChairCMDResponse(resp)
				
				lblChairState.Visible = False
				lblChairState.Text = "Chair Response OK"
			Else
				lblChairState.Visible = False
				lblChairState.Text = "Chair Response ERROR"
				If Common.ManualSettingsActive = True Then
				CallSubDelayed2(mcall, "ChairCMDResponse", -1)
				Else
					'''Common.manager.Disconnect
						If gif.GifDrawable.IsInitialized=True Then
							gif.mBase.GetView(0).SetBitmap(Null)
							gif.GifDrawable.RunMethod("recycle",Null)
							gif.GifDrawable=Null
						End If
						lblMessage.Visible = False
						lblsuccess.Visible = False
						btnPairScan.Visible = True
						lblChairState.Visible = False
					'''	Sleep(1000)
						
						Dim sf As Object = xui.Msgbox2Async("An error occured please make sure the chair is Initialized!", "E R R O R", "OK", "", "", Null)
						Wait For (sf) Msgbox_Result (Result As Int)
						If Result = xui.DialogResponse_Positive Then
							Log("")
						End If
						Common.manager.Disconnect
				'''	LoadAssets
				End If
				
			End If
			
			Else if shorts = Null Or shorts.Length = 0 Then
				'''ToastMessageShow("No incoming Data from chair motion response characteristic...", True)
				If Common.ManualSettingsActive = True Then
				CallSubDelayed2(mcall, "ChairCMDResponse", 0)
				End If
			End If
			
		else if id = bleservice.AxesRangeCharacteristic Then
			'''receiving data from AXES_RANGE
			LogColor("Received AxesRangeCharaceristics from Chair", xui.Color_Blue)
			datacontent = Characteristics.Get(id)
			lblChairState.Visible = False
			lblChairState.Text = "Received AXES_RANGE Data..."
			Dim bc As ByteConverter
			bc.LittleEndian = True
			Dim shorts() As Short = bc.ShortsFromBytes(datacontent)
			If shorts.Length > 0 Then
			Common.SEAT_HEIGHT_MIN = shorts(0) / 10
			Common.SEAT_HEIGHT_MAX = shorts(1) / 10
			Common.ARMREST_WIDTH_MIN = shorts(2) / 10
			Common.ARMREST_WIDTH_MAX = shorts(3) / 10
			Common.SEAT_DEPTH_MIN = shorts(4) / 10
			Common.SEAT_DEPTH_MAX = shorts(5) / 10
			Common.BACKREST_TILT_MIN = shorts(6) / 10
			Common.BACKREST_TILT_MAX = shorts(7) / 10
			Common.SEAT_TILT_MIN = shorts(8) / 10
			Common.SEAT_TILT_MAX = shorts(9) / 10
			Common.ARMREST_HEIGHT_MIN = shorts(10) / 10
			Common.ARMREST_HEIGHT_MAX = shorts(11) / 10
			Common.BACKREST_HEIGHT_MIN = shorts(14) / 10
			Common.BACKREST_HEIGHT_MAX = shorts(15) / 10
			Log("##########################################################################")
			Log("SEAT_HEIGHT_MIN = " & Common.SEAT_HEIGHT_MIN)
			Log("SEAT_HEIGHT_MAX = " & Common.SEAT_HEIGHT_MAX)
			Log("ARMREST_WIDTH_MIN = " & Common.ARMREST_WIDTH_MIN)
			Log("ARMREST_WIDTH_MAX = " & Common.ARMREST_WIDTH_MAX)
			Log("SEAT_DEPTH_MIN = " & Common.SEAT_DEPTH_MIN)
			Log("SEAT_DEPTH_MAX = " & Common.SEAT_DEPTH_MAX)
			Log("BACK_REST_TILT_MIN = " & Common.BACKREST_TILT_MIN)
			Log("BACK_REST_TLT_MAX = " & Common.BACKREST_TILT_MAX)
			Log("SEAT_TILT_MIN = " & Common.SEAT_TILT_MIN)
			Log("SEAT_TILT_MAX = " & Common.SEAT_TILT_MAX)
			Log("ARMREST_HEIGHT_MIN = " & Common.ARMREST_HEIGHT_MIN)
			Log("ARMREST_HEIGHT_MAX = " & Common.ARMREST_HEIGHT_MAX)
			Log("BACKREST_HEIGHT_MIN = " & Common.BACKREST_HEIGHT_MIN)
			Log("BACKREST_HEIGHT_MAX = " & Common.BACKREST_HEIGHT_MAX)
			Log("##########################################################################")
			'''Else
				'''ToastMessageShow("no Incoming Data from Axes Range Characteristic...", True)
			End If
		
		End If
	Next
End Sub

Public Sub Retrieve_Measurements
	LogColor("inside Retrieve_Measurements sub", xui.Color_Blue)
	If Common.PairDeviceActive Then
'''	Dim count As Int = 0
'''	Dim query As String = "SELECT count(*) FROM ManualSettings WHERE UserName = " & "'"&Starter.userName&"'" & " AND Password = " & "'"&Starter.pinNumber&"'"
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
'''	db.ExecuteRemoteQuery(query, "UPDATETABLE")
'''	Log("select count query: " & query)
'''	wait for QueryResults(Results2 As List)
'''	Log("after select count query: " & Results2)
'''	For i = 0 To Results2.Size - 1
'''	Dim m As Map
'''	m = Results2.Get(i)
'''	'''		Log("m: " & m.GetKeyAt(0) & " -- " & m.GetValueAt(0))
'''	Try
'''		count = m.Get("count(*)")
'''	Catch
'''		count = 0
'''	End Try
'''	Next
	
'''				Dim query As String = "SELECT * FROM ManualSettings WHERE UserName = " & "'"&Starter.userName&"'" & " AND Password = " & "'"&Starter.pinNumber&"'"
'''				Dim db As DBTransactions
'''				db.Initialize(Me)
'''				db.ExecuteRemoteQuery(query, "SELECTCOLUMNS")
'''				Log("select count query: " & query)
		'''				wait for QueryResults(Results2 As List)
			
		Dim path As PathBuilder
		path.Initialize
		path.Document("StromDB/ManualSettings/")
		Log("path: " & path.Complete)
		Dim fand As CompositeFilter
		Dim filter As FieldFilter
		filter.Initialize.EqualTo("UserName", Common.userName).EqualTo("Password", Common.pinNumber)
		fand.Initialize.Filters(filter)
		Dim qry As Query
		qry.Initialize.From("Measurements").Where(fand).OrderBy("UserName", qry.ASCENDING).CollectionIn(path)
		'''qry.Initialize.OrderBy("UserName", qry.ASCENDING).From("Measurements").Where(fand)
		wait for (B4XPages.MainPage.store.RunQuery(qry)) Complete(results As Map)
		Log("results: " & results)
		Dim json As JSONParser
		Dim s As String = results.Get("documents")
		Dim l As List
			
		Log($"QueryResults: ${results}"$)
		If s <> "" Then
			json.Initialize(s)
			l = json.NextArray
				For Each m As Map In l
				Dim tilt As Double = m.Get("SeatTilt")
				Dim backrestangle As Double = m.Get("BackRestAngle")
				
				Dim SEND_CMD(9) As Short
				SEND_CMD(0) = (m.Get("SeatHeight") * Common.mmConstant * 10) '''Common.SeatHeight * 10
				SEND_CMD(1) = (m.Get("ArmRestWidth") * Common.mmConstant * 10) '''Common.armrestwidth * 10
				SEND_CMD(2) = (m.Get("SeatDepth") * Common.mmConstant* 10) '''Common.seatdepth * 10
				SEND_CMD(3) = Round((backrestangle - Common.backrest_angle_intercept)/Common.backrest_angle_slope)''''(m.Get("BackRestAngle") * Common.mmConstant)   '''Common.backrestangle * 10

					
				SEND_CMD(4) = Round((tilt - Common.centertilt_intercept)/Common.centertilt_slope) '''(m.Get("SeatTilt") * Common.mmConstant)  '''Common.seattilt * 10
				SEND_CMD(5) = (m.Get("ArmRestHeight") * Common.mmConstant * 10)  '''Common.armrestheight * 10
				SEND_CMD(6) = (m.Get("ArmRestHeight") * Common.mmConstant * 10)   '''Common.armrestheight * 10
				SEND_CMD(7) = (m.Get("LumbarHeight") * Common.mmConstant * 10)  ''''Common.LumbarHeight * 10
				SEND_CMD(8) = (m.Get("InflatableLumbarSupport"))   '''Common.InflatableLumbarSupport
					
				Dim CMDS() As Byte
				Dim bc As ByteConverter
				bc.LittleEndian = True
				CMDS = bc.ShortsToBytes(SEND_CMD)
				Dim hexString As String = bc.HexFromBytes(CMDS)
				Log("hexString: " & hexString)
					
					Common.SeatHeight = m.Get("SeatHeight") '''* Common.mmConstant) / 10)  / Common.mmConstant
					Common.SeatWidth = m.Get("SeatWidth") '''* Common.mmConstant) / 10) / Common.mmConstant
					Common.SeatDepth = m.Get("SeatDepth") '''* Common.mmConstant) / 10) / Common.mmConstant
					Common.ArmRestHeight = m.Get("ArmRestHeight") '''* Common.mmConstant) / 10) / Common.mmConstant
					Common.ArmRestWidth = m.Get("ArmRestWidth") '''* Common.mmConstant) / 10) / Common.mmConstant
					Common.LumbarHeight = m.Get("LumbarHeight") '''* Common.mmConstant) / 10) / Common.mmConstant
					Common.SeatTilt = tilt'''((bckrsttilt * Common.mmConstant) / 10) / Common.mmConstant '''(m.Get("SeatTilt") / 10) / Common.mmConstant
					Common.BackRestAngle = backrestangle '''m.Get("BackRestAngle") '''* Common.mmConstant) / 10) / Common.mmConstant
					'''Need to check the value below to make sure this is not causing the chair to overshoot the max or min ranges.
					Common.InflatableLumbarSupport = m.Get("InflatableLumbarSupport") '''* Common.mmConstant
				Common.EMAIL = m.Get("EMAIL")
			Next
				
		Try
				
		If (SEND_CMD(0) > (Common.SEAT_HEIGHT_MAX*10)) Or (SEND_CMD(0) < (Common.SEAT_HEIGHT_MIN*10)) Or (SEND_CMD(1) > (Common.ARMREST_WIDTH_MAX*10)) Or (SEND_CMD(1) < (Common.ARMREST_WIDTH_MIN*10)) Or  _
		(SEND_CMD(2) > (Common.SEAT_DEPTH_MAX*10)) Or (SEND_CMD(2) < (Common.SEAT_DEPTH_MIN*10)) Or (SEND_CMD(3) > (Common.BACKREST_TILT_MAX*10)) _
		 Or (SEND_CMD(3) < (Common.BACKREST_TILT_MIN*10)) Or (SEND_CMD(4) > (Common.SEAT_TILT_MAX*10)) Or (SEND_CMD(4) < (Common.SEAT_TILT_MIN*10)) Or _
		 (SEND_CMD(5) > (Common.ARMREST_HEIGHT_MAX*10)) Or (SEND_CMD(5) < (Common.ARMREST_HEIGHT_MIN*10)) Or (SEND_CMD(6) > (Common.ARMREST_HEIGHT_MAX*10)) Or _
		 (SEND_CMD(6) < (Common.ARMREST_HEIGHT_MIN*10)) Or (SEND_CMD(7) > (Common.BACKREST_HEIGHT_MAX*10)) Or (SEND_CMD(7) < (Common.BACKREST_HEIGHT_MIN*10)) Or _
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
			'''progressdialog.Hide
			Return
				End If
				
				Dim notify As Boolean
				notify = Common.manager.SetNotify(bleservice.ChairControlService,  bleservice.ChairMotionRespCharacteristic, True)
				LogColor("setNotify Set for ChairMotionRespCharacteristic: " & notify, xui.color_blue)
				GetCrashlytics.RunMethod("setCustomKey", Array("WritingData to Chair", bleservice.ChairControlService & " / " & bleservice.AxesCMDCharacteristic))
				Common.manager.WriteData(bleservice.ChairControlService, bleservice.AxesCMDCharacteristic, CMDS)
				Common.manager.WriteData(bleservice.ChairControlService, bleservice.ChairMotionCMDCharacterstic, Array As Byte(0x01))
				LogColor("Sending position to chair...", xui.Color_Blue)
			Catch
				If LastException.IsInitialized Then
					GetCrashlytics.RunMethod("recordException", Array(LastException))
				End If
				Log("error writing optimal values to chair: " & LastException)
			End Try
				
		End If

			Log("################################################################################")
			LogColor("SeatHeight: " & Common.SeatHeight, xui.Color_Magenta)
			LogColor("ArmRestWidth: " & Common.ArmRestWidth, xui.Color_Magenta)
			LogColor("SeatDepth: " & Common.SeatDepth, xui.Color_Magenta)
			LogColor("BackRestAngle: " & Common.BackRestAngle, xui.Color_Magenta)
			LogColor("SeatTilt: " & Common.SeatTilt, xui.Color_Magenta)
			LogColor("ArmRestHeight: " & Common.ArmRestHeight, xui.Color_Magenta)
			LogColor("LumbarHeight: " & Common.LumbarHeight, xui.Color_Magenta)
			LogColor("InflatableLumbarSupport: " & Common.InflatableLumbarSupport, xui.Color_Magenta)
			Log("################################################################################")
							
		End If
	
		timeoutTimer.Enabled = False
End Sub

Sub ToUnsigned(b As Byte) As Int
	Return Bit.And(0xFF, b)
End Sub

Sub PrintCharProperties(Characteristic As String, Properties As Int) As String
	Log($"${Characteristic} Properties:"$)
	Dim props As Map = CreateMap(1: "Broadcast", 2: "Read", 4: "WriteWithoutResponse", 8: "Write", _
     0x10: "Notify")
	For Each key As Int In props.Keys
		If Bit.And(Properties, key) <> 0 Then
			 Log(props.Get(key))
			 Return props.Get(key)
		End If
	Next
End Sub

Sub ble_Disconnected
	Log("Disconnected")
	ble.AsBleManager.StopScan
	''timeoutTimer.Enabled = False
	btnInitializeChair.Visible = False
	lblChairState.Visible = False
	Common.BLEConnected = False
	Common.manager.Disconnect
	timeout_Tick
End Sub

Sub ble_Connected (Services As List)
	Log("Connected")
	Common.BLEConnected = True
	ConnectedServices = Services
	clv2.Clear
	btnPairScan.Visible = False
	lblChairState.Visible = False
	lblChairState.Text = "Chair State:"
	''checking the status of the chair, whether chair is initialized or not.
	Try
		GetCrashlytics.RunMethod("setCustomKey", Array("SetNotify", bleservice.ChairInformationService & " / " & bleservice.ChairStateCharacteristic))
		Common.manager.SetNotify(bleservice.ChairInformationService, bleservice.ChairStateCharacteristic, True)
		Sleep(1000)
		Common.manager.ReadData2(bleservice.ChairInformationService, bleservice.ChairStateCharacteristic)
	wait for ble_DataAvailable (ServiceId As String, Characteristics As Map)
	LogColor("received data: " & ServiceId & " / " & Characteristics, xui.Color_Blue)
	For Each id As String In Characteristics.Keys
			Log("ID: " & id)
			Dim datacontent() As Byte
			datacontent = Characteristics.Get(id)
			Dim bc As ByteConverter
			bc.LittleEndian = True
			Dim shorts() As Short = bc.ShortsFromBytes(datacontent)
		If shorts.Length > 0 Then
		Dim status As Int = shorts(0)
		If id = bleservice.ChairStateCharacteristic Then
			LogColor("chair State: " & status, xui.Color_Magenta)
			Select status
				Case Common.NOT_INITIALIZED
					
				Case Common.INITIALIZING
					
				Case Common.MOVING
					'''Common.manager.WriteData(bleservice.ChairControlService, bleservice.ChairMotionCMDCharacterstic, Array As Byte(0x00))
				Case Common.IDLE
					Common.InitialStateRequest = True
				Case Common.FAULT
			End Select	
		End If
		End If
	Next
	Catch
		If LastException.IsInitialized Then
			GetCrashlytics.RunMethod("recordException", Array(LastException))
		End If
		Log("error setting notify: " & LastException)
		'''Starter.fb.SendEvent("setting notify for chairstate: ", CreateMap("error": LastException.Message))
	End Try
	
'''	Try
'''		Common.manager.SetNotify(bleservice.ChairInformationService, bleservice.AxesCurPosCharacteristic, True)
'''	Catch
'''		Log("error setting notication for AxesCurrentPositions: " & LastException)
'''	End Try
	
	lblMessage.Visible = True
	Sleep(100)
	''checking for Min and Max values for all axes.
	Try
	GetCrashlytics.RunMethod("setCustomKey", Array("Reading Min and Max Values from all Axes", bleservice.ChairInformationService & " / " & bleservice.AxesRangeCharacteristic))
	Common.manager.ReadData2(bleservice.ChairInformationService, bleservice.AxesRangeCharacteristic)
	Catch
		If LastException.IsInitialized Then
			GetCrashlytics.RunMethod("recordException", Array(LastException))
		End If
		Log("error Reading Min and Max values from all axes.: " & LastException)
	End Try
	
	Sleep(100)
	''setting notification for chair command responses.
	Try
		GetCrashlytics.RunMethod("setCustomKey", Array("Setting notification for chair command Response Characterisitic", bleservice.ChairControlService & " / " & bleservice.ChairMotionRespCharacteristic))
		Common.manager.SetNotify(bleservice.ChairControlService, bleservice.ChairMotionRespCharacteristic, True)	
	Catch
		If LastException.IsInitialized Then
			GetCrashlytics.RunMethod("recordException", Array(LastException))
		End If
		Log("error setting notification for chair command response characteristic: " & LastException)
	End Try
	
	'''btnInitializeChair.Visible = True
	
	''may not need timer anymore
	timeoutTimer.Enabled = True
	
End Sub

'utility to convert short UUIDs to long format on Android
Private Sub UUID(id As String) As String 'ignore
#if B4A
	Return "0000" & id.ToLowerCase & "-0000-1000-8000-00805f9b34fb"
#else if B4I
	Return id.ToUpperCase
#End If
End Sub

#End Region

Sub clv_ItemClick (Index As Int, Value As Object)
	Log("item clicked: " & Index & " with value: " & Value)
	Dim v As B4XView = clv.GetPanel(Index)
	For Each vv As View In v.GetAllViewsRecursive
		If vv Is Label Then
			Dim l As Label = vv
			Dim name() As String = Regex.Split("-", l.Text)
		End If
	Next
	ble.AsBleManager.Connect2(Value, False)
		Log("name found: " & name(0).Trim)
		ConnectedName = name(0).Trim
		'''manager.StopScan
		ble.AsBleManager.StopScan
		clv2.GetBase.Visible = True
		clv2.AsView.Visible = True
		btnPairScan.Visible = False
		dialog.Close(xui.DialogResponse_Positive)
		'''timeoutTimer.Enabled = True
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	clv2.Clear
	clv2.GetBase.Visible = False
	btnPairScan.Visible = True
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
	Common.PairDeviceActive = False
	Return True
End Sub

Sub clv2_ItemClick (Index As Int, Value As Object)
	Log("item clicked: " & Index & " value: " & Value)
	If Value = "ef680301-9b35-4933-9b10-52ffa9740042" Then
		'''item clicked: 36 value: ef680301-9b35-4933-9b10-52ffa9740042
		'''manager.ReadData2("ef680300-9b35-4933-9b10-52ffa9740042", "ef680301-9b35-4933-9b10-52ffa9740042")
		'''Sleep(1000)
		Dim clr As Int = Rnd(1, 8)
		Dim colorData() As Byte = Array As Byte(2, clr, 56, 50, 0)
		'''manager.WriteData("ef680300-9b35-4933-9b10-52ffa9740042", "ef680301-9b35-4933-9b10-52ffa9740042", colorData)
		ble.AsBleManager.WriteData("ef680300-9b35-4933-9b10-52ffa9740042", "ef680301-9b35-4933-9b10-52ffa9740042", colorData)
	else if Value = "ef680201-9b35-4933-9b10-52ffa9740042" Then
		ble.AsBleManager.SetNotify("ef680200-9b35-4933-9b10-52ffa9740042", "ef680201-9b35-4933-9b10-52ffa9740042", True)
	End If
End Sub

Sub ble_WriteComplete (Characteristic As String, Status As Int)
	Log("write complete: " & Characteristic & " Status: " & Status)
End Sub

Private Sub get_Type(formatType As Int) As Int
	Return Bit.And(formatType, 0xF)
End Sub


Private Sub btnInitializeChair_Click
	'initialize chair command
'''	Try
'''	GetCrashlytics.RunMethod("setCustomKey", Array("Writing to Initialize Chair", bleservice.ChairControlService & " / " & bleservice.ChairMotionCMDCharacterstic))
'''	Common.manager.WriteData(bleservice.ChairControlService, bleservice.ChairMotionCMDCharacterstic, Array As Byte(0x02))
'''	Catch
'''		If LastException.IsInitialized Then
'''			GetCrashlytics.RunMethod("recordException", Array(LastException))
'''		End If
'''		Log("error Writing to Chair Initialization: " & LastException)
'''	End Try
	B4XPages.ShowPageAndRemovePreviousPages("ManualSettings")
	B4XPages.GetPage("ManualSettings").As(ManualSettings).AnimateFromLeft
End Sub