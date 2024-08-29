B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private frontCamera As Boolean = False
	Private VideoMode As Boolean = False
	Private VideoFileDir, VideoFileName As String
	Private MyTaskIndex As Int
	Private rp As RuntimePermissions
	
	Private cam As CamEx2
	Private pnlCamera As B4XView


	Private retries As Int = 0
	Private btnTakePicture As B4XView
	
	'''	Private sensor1 As PhoneSensors
	'''	Private sensor2 As PhoneSensors
	
	Private mGravity() As Float
	Private mMagnetic() As Float
	Private value(3) As Float
	Private sm As JavaObject
	
	Private DEG_TO_RADIANS = 0.017453292519943295769236907684886127134428718885417 As Float
	Private RAD_TO_DEGREES = 57.29577951308232087679815481410517033240547246656432 As Double
	Private AngleA As Double = 0.0
	Private AngleB As Double = 0.0
	Private h As Double = 48.0
	Private HH As Double = 0.0
	Private D As Double = 0.0
	Private X1, X2 As Float
	Private L As Double = 0.0
	Private imgOverlay As B4XView
	Private pnlImageTaken As B4XView
	Private btnSave As B4XView
	Private btnRetake As B4XView
	
	'''Private xml As XmlLayoutBuilder
	Private picName As String
	
	Private imgOverlay2 As B4XView
	Private imgY As B4XView
	Private bitmapY As B4XView
	Private bitmapX As B4XView
	Private canvasY As B4XCanvas
	Private canvasX As B4XCanvas
	Private recntangleY As B4XRect
	Private rectangleX As B4XRect
	Private thetaY As Double
	Private thetaX As Double
	Private ph As SensorExtender
	Private po As SensorExtender
	Private Grav As Double = 9.81
	Private MIN_DEGREE As Double = -20
	Private MAX_DEGREE As Double = 20
	Private imgX As B4XView
	Private accValues() As Float
	Private magValues() As Float
	Private orientation2 As Float
	Private ASOnboarding1 As ASOnboarding
	Private Imgy2 As B4XView
	Private lblTitle As B4XView
	Private btnBack As B4XView
	Private pnlGoodJob As B4XView
	Private lblGoodJob As B4XView
	Private imgGoodJob As B4XView
	Private btnGoodJob As B4XView
	
	Private segmenter As Segmentation
	
	Private imgImageTaken As B4XImageView
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
End Sub

Sub LoadLayout
	Root.LoadLayout("picturetake")
	'''Activity.LoadLayout("picturetake")
	'''ACToolBarLight1.InitMenuListener
	'''ABHelper.Initialize
	'''ABHelper.ShowUpIndicator = False
	'''imgOverlay.Bitmap = LoadBitmap(File.DirAssets, "Take a Picture_Artboard 1 .png")
	segmenter.Initialize
	FillImageToView(LoadBitmap(File.DirAssets, "front_pic.png"), imgOverlay)
	FillImageToView(LoadBitmap(File.DirAssets, "side_pic.png"), imgOverlay2)
	imgOverlay2.Visible = False
	'''Dim cd As ColorDrawable
	'''cd.Initialize2(xui.Color_ARGB(255, 49, 211, 184), 22, 0, Colors.white)
	'''btnSave.Background = Common.LightBlueColor
	'''btnRetake.Background = Common.LightBlueColor
	
	Common.LightBlueColor(btnSave)
	Common.LightBlueColor(btnRetake)

	'''btnTakePicture.Color = Colors.Black
	'''ACToolBarLight1.title = "Take Picture"
	'''btnTakePicture.Color = Colors.RGB(164, 212, 232)
	
	VideoFileDir = rp.GetSafeDirDefaultExternal("")
	VideoFileName = "1.mp4"
	ASOnboarding1.BaseView.Visible = False
	
	'''	Dim myfont As Typeface = Typeface.LoadFromAssets("Cera Pro Bold.otf")
	lblTitle.font = Common.myfont
	lblTitle.TextSize = 20
	lblTitle.TextColor = xui.Color_RGB(28, 30, 36)
	lblTitle.Text = "Take a back-view photo"
	btnBack.Color = xui.Color_Transparent
	
	btnSave.font = Common.myfont
	btnSave.TextSize = 16
	btnSave.TextColor = xui.Color_White
	
	btnRetake.font = Common.myfont
	btnRetake.TextSize = 16
	btnRetake.TextColor = xui.Color_White
	
	lblGoodJob.font = Common.myfont
	lblGoodJob.TextSize = 24
	lblGoodJob.Text = "Good job!"
	lblGoodJob.TextColor = xui.Color_ARGB(229, 28, 30, 36)
	
	btnGoodJob.font = Common.myfont
	btnGoodJob.TextColor = xui.Color_White
	btnGoodJob.TextSize = 16
	'''btnGoodJob.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnGoodJob.Background = Common.LightBlueColor
	Common.LightBlueColor_2(btnGoodJob)
	btnGoodJob.Text = "Next"
	btnGoodJob.font = Common.myfont
	btnGoodJob.TextColor = xui.Color_White
	btnGoodJob.TextSize = 16
	
	'''imgGoodJob.SetBackgroundImage(LoadBitmap(File.DirAssets, "goodjob.png")).Gravity = Gravity.FILL
	imgGoodJob.SetBitmap(LoadBitmap(File.DirAssets, "success.png"))
	#if B4A
	imgGoodJob.As(ImageView).Gravity = Gravity.FILL
	#End If
	If imgGoodJob.Visible Then imgGoodJob.Visible = False
	sm.InitializeStatic("android.hardware.SensorManager")
	'''	Dim As As Int = "abcd"
	ph.Initialize(ph.TYPE_ACCELEROMETER)
	po.Initialize(ph.TYPE_ORIENTATION)
	'''bitmapY.InitializeMutable(50dip, 200dip)
	'''bitmapX.InitializeMutable(200dip, 50dip)
	Dim p1 As B4XView = xui.CreatePanel("")
	Dim p2 As B4XView = xui.CreatePanel("")
	p1.Width = 50
	p1.Height = 200
	p2.Width = 200
	p2.Height = 50
	canvasY.Initialize(p1)
	canvasX.Initialize(p2)
	bitmapX = canvasX.CreateBitmap
	bitmapY = canvasY.CreateBitmap
	'''	canvasY.DrawColor(Colors.LightGray)
	'''	canvasX.DrawColor(Colors.LightGray)
	'''	recntangleY.Initialize(0, 0, canvasY.Bitmap.Width, canvasY.Bitmap.Height)
	'''rectangleX.Initialize(0, 0, canvasX.Bitmap.Width, canvasX.Bitmap.Height)
	
	recntangleY.Initialize(0, 0, canvasY.TargetView.GetBitmap.Width, canvasY.TargetView.GetBitmap.Height)
	rectangleX.Initialize(0, 0, canvasX.TargetView.GetBitmap.Width, canvasX.TargetView.GetBitmap.Height)
	
	sm.InitializeStatic("android.hardware.SensorManager")
	
	ph.StartListening("ph")
	po.StartListening("ph")
	
	'''btnTakePicture.Visible = True
	btnTakePicture.BringToFront
	btnTakePicture.Enabled = True
	
'''	Dim rp As RuntimePermissions
'''	rp.CheckAndRequest(rp.PERMISSION_WRITE_EXTERNAL_STORAGE)
'''	Wait For Activity_PermissionResult (Permission As String, Result As Boolean)
'''	If Result Then
'''		'access here
'''	Else
'''		'no permission
'''	End If
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

Sub B4XPage_Appear
	LoadLayout
	pnlCamera.Visible = True
	pnlCamera.Color = xui.Color_White
	cam.Initialize(pnlCamera)
	OpenCamera(frontCamera)
End Sub

Sub OpenCamera (front As Boolean)
	rp.CheckAndRequest(rp.PERMISSION_CAMERA)
	'''Wait For Activity_PermissionResult (Permission As String, Result As Boolean)
	Wait For B4XPage_PermissionResult (Permission As String, Result As Boolean)
	If Result = False Then
		ToastMessageShow("No permission!", True)
		Return
	End If
	'''cam.Initialize(pnlCamera)
	'''	SetState(False, False, VideoMode)
	If retries > 0 And retries = 2 Then Return
	Wait For (cam.OpenCamera(front)) Complete (TaskIndex As Int)
	If TaskIndex > 0 Then
		MyTaskIndex = TaskIndex 'hold this index. It will be required in later calls.
		Wait For(PrepareSurface) Complete (Success As Boolean)
		Log($"starter.picturenumber ${Starter.pictureNumber}"$)
		If Starter.pictureNumber = 1 Then
			lblTitle.Text = "Take a back-view photo"
			If lblTitle.Visible = False Then lblTitle.Visible = True
		Else
			lblTitle.Text = "Take a side-view photo"
			If lblTitle.Visible = False Then lblTitle.Visible = True
		End If
	Else
		
		OpenCamera(frontCamera)
		retries = retries + 1
		LogColor("retries: " & retries, xui.Color_Blue)
	End If
	Log("Start success: " & Success)
	'''	SetState(Success, False, VideoMode)
	If Success = False Then
		ToastMessageShow("Failed to open camera", True)
	End If'''
End Sub

Sub PrepareSurface As ResumableSub
	'''SetState(False, busystate, VideoMode)
	'sizes can be modified here
	If VideoMode Then
		cam.PreviewSize.Initialize(640, 480)
		'Using a temporary file to store the video.
		Wait For (cam.PrepareSurfaceForVideo(MyTaskIndex, VideoFileDir, "temp-" & VideoFileName)) Complete (Success As Boolean)
	Else
		cam.PreviewSize.Initialize(1920, 1080)
		Wait For (cam.PrepareSurface(MyTaskIndex)) Complete (Success As Boolean)
	End If
	If Success Then cam.StartPreview(MyTaskIndex, VideoMode)
	'''	SetState(Success, busystate, VideoMode)
	Return Success
End Sub

Sub ShakeView (View As B4XView, Duration As Int)
	Dim Left As Int = View.Left
	Dim Delta As Int = 20dip
	For i = 1 To 4
		View.SetLayoutAnimated(Duration / 5, Left + Delta, View.Top, View.Width, View.Height)
		Delta = -Delta
		Sleep(Duration / 5)
	Next
	View.SetLayoutAnimated(Duration/5, Left, View.Top, View.Width, View.Height)
End Sub

Private Sub GenImageViews(ImageName As String) As B4XView
	Private ImageView1 As ImageView
	ImageView1.Initialize("")
	Private iv As B4XView = ImageView1
	iv.SetLayoutAnimated(0,0,0,pnlCamera.Width,pnlCamera.Height*0.75)
	'''iv.SetBitmap(xui.LoadBitmap(File.DirAssets,ImageName))
	FillImageToView(xui.LoadBitmap(File.DirAssets, ImageName), ImageView1)
	Return iv
End Sub

private Sub GenGifView(gifName As String) As B4XView
	Dim gif As B4XGifView
	Dim lbl As Label
	Dim m As Map
	lbl.Initialize("")
	m.Initialize
	Dim pnl As B4XView = xui.CreatePanel("")
	gif.Initialize(Me, "gif")
	pnl.SetLayoutAnimated(0,0,0, pnlCamera.Width, pnlCamera.Height*0.65)
	gif.DesignerCreateView(pnl, lbl, m)
	'''pnl.AddView(gif.GifDrawable, 0, 0, pnl.Width, pnl.Height)
	gif.SetGif(File.DirAssets, gifName)
	Return pnl
End Sub

private Sub GenAPNGView(png As String) As B4XView
	Dim gif As APNGView
	Dim lbl As Label
	Dim m As Map
	lbl.Initialize("")
	m.Initialize
	Dim pnl As B4XView = xui.CreatePanel("")
	gif.Initialize(Me, "gif")
	pnl.SetLayoutAnimated(0,0,0, pnlCamera.Width, pnlCamera.Height*0.75)
	gif.DesignerCreateView(pnl, lbl, m)
	'''pnl.AddView(gif.GifDrawable, 0, 0, pnl.Width, pnl.Height)
	gif.SetData(File.ReadBytes(File.DirAssets, "ezgif.com-gif-maker.png"))
	Return pnl
End Sub

Private Sub GenImageViews_1(ImageName As String) As B4XView
	Private ImageView1 As ImageView
	ImageView1.Initialize("")
	Private iv As B4XView = ImageView1
	iv.SetLayoutAnimated(0,0,0,pnlCamera.Width/2,pnlCamera.Height/2)
	'''iv.SetBitmap(xui.LoadBitmap(File.DirAssets,ImageName))
	FillImageToView(xui.LoadBitmap(File.DirAssets, ImageName), ImageView1)
	Return iv
End Sub

Private Sub GenImageViews2(ImageName1 As String, ImageName2 As String) As B4XView
	
	Private ImageView1 As ImageView
	Private ImageView2 As ImageView
	ImageView1.Initialize("")
	ImageView2.Initialize("")
	Private iv As B4XView = ImageView1
	Private iv2 As B4XView = ImageView2
	Private headerlayout As B4XView
	iv.SetLayoutAnimated(0,0,0,pnlCamera.Width/2,pnlCamera.Height/2)
	iv2.SetLayoutAnimated(0,pnlCamera.Width/2, 0, pnlCamera.Width/2, pnlCamera.Height/2)
	headerlayout = xui.CreatePanel("")
	headerlayout.SetLayoutAnimated(0,0,0,pnlCamera.Width, pnlCamera.Height/2)
	headerlayout.AddView(iv, 0, 0, pnlCamera.Width/2, pnlCamera.Height/2)
	headerlayout.AddView(iv2,iv.Left+iv.Width,0,pnlCamera.Width/2, pnlCamera.Height/2)
	FillImageToView(xui.LoadBitmap(File.DirAssets, ImageName1), ImageView1)
	FillImageToView(xui.LoadBitmap(File.DirAssets, ImageName2), ImageView2)
	Return headerlayout
End Sub

Private Sub GenImageViews3(ImageName As String) As B4XView
	Private ImageView1 As ImageView
	ImageView1.Initialize("")
	Private iv As B4XView = ImageView1
	Dim img As ImageView
	img.Initialize("")
	'''Imgy2.Initialize("")
	Imgy2 = img
	Private pnl As B4XView = xui.CreatePanel("")
	pnl.SetLayoutAnimated(0,0,0,pnlCamera.Width, pnlCamera.Height/2)
	iv.SetLayoutAnimated(0,0,0,pnlCamera.Width/2,pnlCamera.Height/2)
	pnl.AddView(iv, pnl.Width/2 - iv.Width/2, 0, pnl.Width/2, pnl.Height)
	Log("pnl.height = " & pnl.Height)
	Log("pnlCamera.height = " & pnlCamera.Height)
	pnl.AddView(Imgy2, 5dip, pnl.Height/2 - 200/2, 50dip, 200dip)
	FillImageToView(xui.LoadBitmap(File.DirAssets, ImageName), ImageView1)
	Return pnl
End Sub

Sub AsOnboarding1_PageChange(Page As Int)
	If Page = 4 Then
		Sleep(500)
		Dim v As B4XView = Imgy2
		v.SetRotationAnimated(Rnd(300, 800), 360)
	End If
End Sub

Sub AsOnboarding1_GetStartedButtonClick
	ASOnboarding1.BaseView.Visible = False
End Sub

Sub ph_SensorChanged (Values() As Float)
	
	Dim se As SensorExtender
	se = Sender
	Select se.GetType
		
		Case se.TYPE_ACCELEROMETER
			accValues = Values
			Dim gx As Double
			Dim gy As Double
			Dim gz As Double
			If Values(0) > Grav Then
				gx = Grav
			Else
				gx = Values(0)
			End If
			If Values(1) > Grav Then
				gy = Grav
			Else
				gy = Values(1)
			End If
			gz = Values(2)
	
			'''gx = gx < -Gravity ? -Gravity : gx;
			'''gy = gy < -Gravity ? -Gravity : gy;
	
			If gx < -Grav Then
				gx = -Grav
			Else
				gx = gx
			End If
	
			If gy < -Grav Then
				gy = -Grav
				'''Log("setting gy to -Grav")
			Else
				'''Log("setting gy to gy")
				gy = gy
			End If
			'''Log("inside type acceleromter...")
			thetaY = toDegrees(ASin(gx/Grav))
			thetaX = toDegrees(ASin(gy/Grav))
			canvasY.DrawRect(recntangleY, Colors.Yellow, True, 2dip)
			canvasY.DrawLine(0, getLineLocation(MAX_DEGREE), canvasY.TargetView.GetBitmap.Width, getLineLocation(MAX_DEGREE), Colors.Black, 2dip)
			canvasY.DrawLine(0, getLineLocation(MIN_DEGREE), canvasY.TargetView.GetBitmap.Width, getLineLocation(MIN_DEGREE), Colors.Black, 2dip)
			
			Dim limit As Float
			If orientation2 <= 0 Then
				canvasY.DrawLine(0, Normalize(thetaX, 90, 0), canvasY.TargetView.GetBitmap.Width, Normalize(thetaX, 90, 0), Colors.green, 2dip)
				limit = Normalize(thetaX, 90, 0)
			Else
				canvasY.DrawLine(0, (Abs(Normalize(thetaX, 200, 100))+100), canvasY.TargetView.GetBitmap.Width, (Abs(Normalize(thetaX, 200, 100))+100), Colors.Green, 2dip)
				limit = (Abs(Normalize(thetaX, 200, 100))+100)
			End If

			Dim normalized As Double
	
			If limit > 77 And limit < 130 And pnlImageTaken.Visible = False Then
				'''btnTakePicture.Color = Colors.Green
				btnTakePicture.Visible = True
			Else
				'''btnTakePicture.Color = Colors.Red
				btnTakePicture.Visible = False
			End If

			If ASOnboarding1.BaseView.Visible = False Then
				'''imgY.Bitmap = bitmapY
				imgY.SetBitmap(bitmapY)
			Else
				'''Imgy2.Bitmap = bitmapY
				Imgy2.SetBitmap(bitmapY)
			End If
			'''imgX.Bitmap = bitmapX
			imgX.SetBitmap(bitmapX)
	
		Case se.TYPE_ORIENTATION
			magValues = Values
			Dim rotationMatrix(0) As Float
			If accValues.Length = 0 Or magValues.Length = 0 Then Return
			Dim R(9), I(9) As Float
			Dim success As Boolean = sm.RunMethod("getRotationMatrix", Array(R, I, accValues, magValues))
			If success Then
				Dim orientation(3) As Float
				sm.RunMethod("getOrientation", Array(R, orientation))
				'''Log("orientation: " & (orientation(0) * 180 / cPI + 360) Mod 360))
				orientation2 = (orientation(0) * 180) / (cPI + 360)
'''				Log("orientation: " & orientation2)
			End If
			'''Log("values(0): " & Values(0) & " values(1): " & Values(1) & " values(2): " & Values(2))
	End Select
End Sub

private Sub toDegrees(Radians As Double)As Double
	Return (Radians*RAD_TO_DEGREES)
End Sub

private Sub Normalize(val As Double, max1 As Double, min1 As Double)As Double
	Return (val - min1) / (max1 - min1) * (200/2)
End Sub
	
private Sub getLineLocation(angle As Double) As Int
	Dim val As Double = (-angle + 90) * 1.111
	Return val
End Sub

private Sub getLineLocation2(angle As Double) As Int
	Dim val As Double = (-angle + 90) * 1.111
	Return val
End Sub

Sub btnTakePicture_Click
	TakePicture
End Sub

Sub HandleError (Error As Exception)
	Log("Error: " & Error)
	ToastMessageShow(Error, True)
	OpenCamera(frontCamera)
End Sub

Sub TakePicture
	If Starter.pictureNumber > 2 Then Starter.pictureNumber = 1
	Try
		'''	SetState(openstate, True, VideoMode)
		Wait For(cam.FocusAndTakePicture(MyTaskIndex)) Complete (Data() As Byte)
		'''	SetState(openstate, False, VideoMode)
		lblTitle.Visible = False
		If Starter.pictureNumber = 1 Then picName = "frontpic.jpg"
		If Starter.pictureNumber = 2 Then picName = "sidepic.jpg"
		'''cam.DataToFile(Data, VideoFileDir, picName)
		Dim bmp As Bitmap = cam.DataToBitmap(Data).Rotate(90)
		Dim bmp2 As B4XBitmap
		bmp2 = bmp
		'''File.OpenOutput(VideoFileDir, picName, False)
		'''	Log("Picture taken: " & bmp) 'ignore
		pnlImageTaken.SetVisibleAnimated(100, True)
		'''pnlImageTaken.SetBackgroundImage(bmp.Resize(pnlImageTaken.Width, pnlImageTaken.Height, True)).Gravity = Gravity.CENTER
		wait for (segmenter.Process(bmp2, False, xui.Color_ARGB(80, 108, 246, 71))) Complete (Result As SegmentationResult)
		If Result.Success Then
		'''pnlImageTaken.SetBitmap(bmp.Resize(pnlImageTaken.Width, pnlImageTaken.Height, True))
			'''pnlImageTaken.SetBitmap(Result.ForegroundBitmap.Resize(pnlImageTaken.Width, pnlImageTaken.Height, True))
			Dim outp As OutputStream
			outp = File.OpenOutput(VideoFileDir, picName, False)
			Result.ForegroundBitmap.WriteToStream(outp, 100, "JPEG")
			outp.Close
			imgImageTaken.Bitmap = Result.ForegroundBitmap
		End If
		'''''btnTakePicture.Visible = False
		btnTakePicture.Visible = True
		btnSave.Visible = True
		btnRetake.Visible = True
		Starter.PictureTaken = True
		cam.Stop
		Dim columnname As String
		If Starter.pictureNumber = 1 Then
			columnname = "FRONTIMAGE"
		Else
			columnname = "SIDEIMAGE"
		End If
		'''CallSubDelayed3(Me, "SaveBlob", columnname, Data)
	Catch
		HandleError(LastException)
	End Try
End Sub

#IgnoreWarnings: 7
private Sub SaveBlob(Column As String, data() As Byte)
	Dim base64 As StringUtils
	Dim encoded As String
	encoded = base64.EncodeBase64(data)
	''"'"&encoded&"'"
	'''Common.UpdateRecord("Registrations", Column, "base64 string", CreateMap("UserName": Starter.userName, "PinNumber": Starter.pinNumber))
	Dim db As DBTransactions
	Dim query As String = $"UPDATE Registrations SET ${Column} = ${"'"&encoded&"'"} WHERE UserName = ${"'"&Starter.userName&"'"} AND PinNumber = ${"'"&Starter.pinNumber&"'"}"$
'''	File.WriteString(rp.GetSafeDirDefaultExternal("logs"), "logs.txt", query)
	'''dim query as String = Common.UpdateRecord("Registration", Column, encoded, CreateMap("UserName": Starter.userName, "PinNumber": Starter.pinNumber))
	Log(query)
	db.Initialize(Me)
	db.ExecuteRemoteQuery(query, "UPDATE")
	wait for QueryResults(Results As List)
	LogColor("saving image results: " & Results, xui.Color_Blue)
	For i = 0 To Results.Size - 1
		Dim m As Map = Results.Get(i)
		Log("updated picture to db: " & m)
	Next
'''	Common.mysql.AddNonQueryToBatch(query, Null)
'''	Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("SQL")
'''	Wait For (SenderFilter) SQL_NonQueryComplete (Success As Boolean)
'''	Log("pictured saved: " & Success)
End Sub

Sub magnetic_SensorChanged (Values() As Float)
	mMagnetic = Values
	'''	Log("magnetic: " & Values(0))
End Sub

Sub accelerometer_SensorChanged (Values() As Float)
	mGravity = Values
	'''	Log("accelerometer: " & Values(0))
End Sub

#IgnoreWarnings: 9
private Sub getDirection As Float
	Dim b As Boolean
	Dim Rot(9), Incline(9) As Float
	b = sm.RunMethod("getRotationMatrix", Array As Object(Rot, Incline, mGravity, mMagnetic))
	'''R.RunStaticMethod("android.hardware.SensorManager", "remapCoordinateSystem", Array As Object(Rot, 1, 3, Incline), Array As String("java.lang.float", "java.lang.int", "java.lang.int", "java.lang.float"))
	'''R.RunStaticMethod("android.hardware.SensorManager", "getOrientation", Array As Object(Incline, value), Array As String("java.lang.float", "java.lang.float"))
	sm.RunMethod("remapCoordinateSystem", Array As Object(Rot, 1, 3, Incline))
	sm.RunMethod("getOrientation", Array As Object(Incline, value))
	Log("Direction: " & value(1))
	Return value(1)
End Sub

#IgnoreWarnings: 12
Sub toRadians(degrees As Double) As Double
	Return degrees * DEG_TO_RADIANS
End Sub


Sub btnSave_Click
	Starter.pictureNumber = Starter.pictureNumber + 1
	btnSave.Visible = False
	btnRetake.Visible = False
	pnlImageTaken.Visible = False
	'''OpenCamera(False)
	If Starter.pictureNumber = 1 Then
		imgOverlay.Visible = True
		imgOverlay2.Visible = False
		lblTitle.Visible = True
		lblTitle.Text = "Take a back-view photo"
	else if Starter.pictureNumber = 2 Then
		imgOverlay.Visible = False
		imgOverlay2.Visible = True
		OpenCamera(False)
		btnTakePicture.Visible = True
		lblTitle.Text = "Take a side-view photo"
		lblTitle.Visible = True
	End If
	If Starter.pictureNumber > 2 Then
		ph.StopListening
		po.StopListening
		imgOverlay2.Visible = False
		imgOverlay.Visible = True
		btnTakePicture.Visible = False
		btnSave.Visible = False
		btnRetake.Visible = False
		pnlCamera.Visible = False
		btnTakePicture.Visible = False
		Starter.pictureNumber = 1
		lblTitle.Text = "Take a back-view photo"
		lblTitle.Visible = True
		pnlGoodJob.Visible = True
		imgGoodJob.SetVisibleAnimated(800, True)
		btnBack.Visible = False
		cam.Camera.Stop
	'''StartActivity(Measurements)
	End If
End Sub

Sub btnRetake_Click
	If Starter.pictureNumber > 2 Then Starter.pictureNumber = Starter.pictureNumber - 1
	btnSave.Visible = False
	btnRetake.Visible = False
	pnlImageTaken.Visible = False
	btnTakePicture.Visible = True
	OpenCamera(False)
End Sub

Sub btnBack_Click
	'''Activity.Finish
	'''StartActivity(PlayTutorial)
	'''B4XPages.ClosePage(Me)
	'''B4XPages.ShowPage("PlayTutorial")
	B4XPages.ShowPageAndRemovePreviousPages("MainMenu")
	B4XPages.GetPage("MainMenu").As(MainMenu).AnimateFromLeft
End Sub

Sub btnGoodJob_Click
	'''Activity.Finish
	'''B4XPages.ClosePage(Me)
	'''StartActivity(OnboardingSteps)
	'''B4XPages.ShowPage("OnboardingSteps")
	B4XPages.ShowPageAndRemovePreviousPages("OnboardingSteps")
	B4XPages.GetPage("OnboardingSteps").As(OnboardingSteps).AnimateFromRight
	pnlGoodJob.Visible = False
End Sub

Sub B4XPage_Disappear
	cam.Stop
	ph.StopListening
	po.StopListening
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return False
End Sub