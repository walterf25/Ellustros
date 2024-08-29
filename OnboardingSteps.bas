B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private ASViewPager1 As ASViewPager
	
	Private lblPosTitle As B4XView
	Private pnlNeutral As B4XView
	Private imgneutral As B4XView
	Private lblNeutral As B4XView
	Private pnlPerch As B4XView
	Private imgPerch As B4XView
	Private lblPerch As B4XView
	Private pnlRecline As B4XView
	Private imgRecline As B4XView
	Private lblRecline As B4XView
	Private ASBottomMenu1 As ASBottomMenu
	
	Private xui As XUI
	Private lblshoeTitle As B4XView
	Private btnZero As B4XView
	Private btnless1 As B4XView
	Private btnsole2 As B4XView
	Private btnheels3 As B4XView
	Private btnheels4 As B4XView
	Private btnheels5 As B4XView
	Private btnNextPosition As B4XView
	Private btnNextShoe As B4XView
	Private imgMain As B4XView
	Private imgBack_ As B4XView
	Private rp As RuntimePermissions
	Private H1 As HorizontalLine
	Private H2 As HorizontalLine
	'''Private swipe As CLVSwipe
	
	Private markerSelected As Boolean = False
	Private markerSelected2 As Boolean = False
	Private markerSelected3 As Boolean = False
	Private hMarkersSet As Boolean = False
	Private Master As HorizontalLine
	Private personHeight As Double
	
	Private pixelMetric As Double = 0
	Private btnSave As B4XView
	Private VV1 As VerticalLine
	Private VV2 As VerticalLine
	Private pnlMainShoulders As B4XView
	Private btnSaveShoulders As B4XView
	Private pnlMainHips As B4XView
	Private V1 As VerticalLine
	Private V2 As VerticalLine
	Private btnSaveHips As B4XView
	Private imgMainShoulders As B4XView
	Private imgMainHips As B4XView
	Dim myfont As B4XFont
	Dim pospref As B4XView
	Dim shoeheightlayout As B4XView
	Dim imgFront As B4XView
	Dim measshoulders As B4XView
	Dim meaships As B4XView
	Dim imgBack As B4XView
	Dim imgsideheight As B4XView
	Dim imgelbowheight As B4XView
	Dim imglumbarheight As B4XView
	Dim imgbuttocksheight As B4XView
	Dim imgkneeheight As B4XView
	Dim imgeyeheight As B4XView
	Private pnlMain As B4XView
	Private pnlMainShoulders As B4XView
	Private pnlMainHips As B4XView
	Private btnBackheight As B4XView
	Private btnBackShoulders As B4XView
	Private btnBackHips As B4XView
	Private lblTitleHeight As B4XView
	Private lblTitleHips As B4XView
	Private lblTitleShoulders As B4XView
	Private btnBackShoes As B4XView
	Private btnBackSideHeight As B4XView
	Private btnSaveSideHeight As B4XView
	Private H1SideHeight As HorizontalLine
	Private H2SideHeight As HorizontalLine
	Private imgMainSideHeight As B4XView
	Private lblTitleSideHeight As B4XView
	Private pnlMainSideHeight As B4XView
	Private btnBackShoeheight As B4XView
	Private btnBackElbowHeight As B4XView
	Private btnSaveElbowHeight As B4XView
	Private H1ElbowHeight As HorizontalLine
	Private H2ElbowHeight As HorizontalLine
	Private imgMainElbowHeight As B4XView
	Private lblTitleElbowHeight As B4XView
	Private pnlMainElbowHeight As B4XView
	Private btnBackLumbarHeight As B4XView
	Private btnSaveLumbarHeight As B4XView
	Private H1LumbarHeight As HorizontalLine
	Private H2LumbarHeight As HorizontalLine
	Private imgMainLumbarHeight As B4XView
	Private lblTitleLumbarHeight As B4XView
	Private pnlMainLumbarHeight As B4XView
	
	Private btnBackKneeHeight As B4XView
	Private btnSaveKneeHeight As B4XView
	Private H1KneeHeight As HorizontalLine
	Private H2KneeHeight As HorizontalLine
	Private imgMainKneeHeight As B4XView
	Private lblTitleKneeHeight As B4XView
	Private pnlMainKneeHeight As B4XView
	Private btnBackButtocksHeight As B4XView
	Private lblTitleButtocksHeight As B4XView
	Private H1ButtocksHeight As HorizontalLine
	Private imgMainButtocksHeight As B4XView
	Private pnlMainButtocksHeight As B4XView
	Private H2ButtocksHeight As HorizontalLine
	Private btnSaveButtocksHeight As B4XView
	Private PrefPosition As String
	Private shoeSelection As Int = -1
	Dim dv, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11, dv12, dv13, dv14, dv15, dv16, dv17, dv18, dv19, dv20 As DraggableView
	Private progressdialog As CustomProgressDialog
	
	Private height, lumbar, knee, elbow, buttocks, hip, elbowwidth, shoe, positionpref As String
	Private tiltangle As Double
	Private heightadd As Double
	Private coldoc As String = ""
	
	'''Added July 29th, 2024
	Private imgeyeheight As B4XView
	Private btnBackEyeHeight As B4XView
	Private lblTitleEyeHeight As B4XView
	Private btnSaveEyeHeight As B4XView
	Private H1EyeHeight As HorizontalLine
	Private H2EyeHeight As HorizontalLine
	Private pnlMainEyeHeight As Panel
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	
	
	myfont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Bold.otf"), 30)
	Dim myfont2 As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 16)
	Root.LoadLayout("mAIN")
	Root.Color = xui.Color_White
	pospref = xui.CreatePanel("")
	shoeheightlayout= xui.CreatePanel("")
	imgFront = xui.CreatePanel("")
	measshoulders = xui.CreatePanel("")
	meaships = xui.CreatePanel("")
	imgBack= xui.CreatePanel("")
	imgsideheight = xui.CreatePanel("")
	imgeyeheight = xui.CreatePanel("")
	imgelbowheight = xui.CreatePanel("")
	imglumbarheight = xui.CreatePanel("")
	imgbuttocksheight = xui.CreatePanel("")
	imgkneeheight = xui.CreatePanel("")
	pospref.Color = xui.Color_White
	shoeheightlayout.Color = xui.Color_White
	imgFront.Color = xui.Color_White
	measshoulders.Color = xui.Color_White
	meaships.Color = xui.Color_White
	imgBack.Color = xui.Color_White
	imgsideheight.Color = xui.Color_White
	imgeyeheight.Color = xui.Color_White
	imgelbowheight.Color = xui.Color_White
	imglumbarheight.Color = xui.Color_White
	imgbuttocksheight.Color = xui.Color_White
	imgkneeheight.Color = xui.Color_white

	ASViewPager1.setMeasuringFront(True)
	pospref.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width,ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	shoeheightlayout.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width,ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	imgFront.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width,ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	imgFront.Color = xui.color_white
	measshoulders.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width,ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	meaships.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width,ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	imgBack.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width,ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	imgsideheight.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width,ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	imgeyeheight.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width,ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	imgelbowheight.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width, ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	imglumbarheight.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width, ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	imgbuttocksheight.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width, ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	imgkneeheight.SetLayoutAnimated(0,0,0,ASViewPager1.Base.Width, ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 150dip))
	ASViewPager1.AddPage(pospref, "pospref")
	ASViewPager1.AddPage(shoeheightlayout, "shoelayout")
	ASViewPager1.AddPage(imgFront, "imgFront")
	ASViewPager1.AddPage(measshoulders, "measuringshoulders")
	ASViewPager1.AddPage(meaships, "measuringhips")
	ASViewPager1.AddPage(imgsideheight, "measuringsideheight")
	ASViewPager1.AddPage(imgeyeheight, "measureeyeheight")
	ASViewPager1.AddPage(imgelbowheight, "measuringelbowheight")
	ASViewPager1.AddPage(imglumbarheight, "measuringlumbarheight")
	ASViewPager1.AddPage(imgbuttocksheight, "measuringbuttockheight")
	ASViewPager1.AddPage(imgkneeheight, "measuringkneeheight")
	ASViewPager1.CurrentIndex = 0
	ASViewPager1.IndicatorActiveColor = Common.LightBlueColors
	'''ASViewPager1.AddPage(imgBack, "imgBack")
	pospref.LoadLayout("tutorialsteps")
	shoeheightlayout.LoadLayout("shoeheight")
	imgFront.LoadLayout("measuring")
	imgFront.Color = xui.Color_White
	imgFront.Parent.Color = xui.Color_White
	imgFront.Parent.Parent.Color = xui.color_white
	btnBackheight.Color = xui.Color_Transparent
	measshoulders.LoadLayout("shoulderMeasurements")
	meaships.LoadLayout("measuringHips")
	imgsideheight.LoadLayout("sideHeightMeasurement")
	imgeyeheight.LoadLayout("eyeheightlayout")
	imgelbowheight.LoadLayout("ElbowHeightMeasurement")
	imglumbarheight.LoadLayout("LumbarHeightMeasurement")
	imgbuttocksheight.LoadLayout("ButtocksHeightMeasurement")
	imgkneeheight.LoadLayout("KneeHeightMeasurement")
	btnBackHips.Color = xui.Color_Transparent
	btnBackShoulders.Color = xui.Color_Transparent
	btnBackShoes.Color = xui.Color_Transparent
	btnBackSideHeight.Color = xui.Color_Transparent
	btnBackEyeHeight.Color = xui.Color_Transparent
	btnBackShoeheight.Color = xui.Color_Transparent
	btnBackElbowHeight.Color = xui.Color_Transparent
	btnBackLumbarHeight.Color = xui.Color_Transparent
	btnBackKneeHeight.Color = xui.Color_Transparent
	btnBackButtocksHeight.Color = xui.Color_Transparent
	'''imgBack.LoadLayout("measurementsBack")
	btnSaveShoulders.font = Common.btnFont
	btnSaveShoulders.TextSize = 18
	btnSaveShoulders.TextColor = xui.Color_White
	'''btnSave.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSave.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSave)
	btnSave.TextColor = xui.Color_White
	btnSave.Text = "Next " & UnicodeToString(0x2192)
	'''imgMain.SetBackgroundImage(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "frontpic.jpg").Rotate(90))
	imgMain.SetBitmap(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "frontpic.jpg"))'''.Rotate(90))
	ScaleImage(imgMain.GetBitmap, imgMain)
	imgMainShoulders.SetBitmap(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "frontpic.jpg"))'''.Rotate(90))
	imgMainHips.SetBitmap(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "frontpic.jpg"))'''.Rotate(90))
	imgMainSideHeight.SetBitmap(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "sidepic.jpg"))'''.Rotate(90))
	imgeyeheight.SetBitmap(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "sidepic.jpg"))'''.Rotate(90))
	imgMainElbowHeight.SetBitmap(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "sidepic.jpg"))'''.Rotate(90))
	imgMainLumbarHeight.SetBitmap(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "sidepic.jpg"))'''.Rotate(90))
	imgMainButtocksHeight.SetBitmap(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "sidepic.jpg"))'''.Rotate(90))
	imgMainKneeHeight.SetBitmap(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "sidepic.jpg"))'''.Rotate(90))
	'''imgBack_.SetBackgroundImage(LoadBitmap(rp.GetSafeDirDefaultExternal(""), "sidepic.jpg").Rotate(90))
	
	btnSaveSideHeight.font = Common.btnFont
	btnSaveSideHeight.TextSize = 18
	btnSaveSideHeight.TextColor = xui.Color_White
	'''btnSaveSideHeight.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSaveButtocksHeight.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSaveSideHeight.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSaveSideHeight)
	btnSaveSideHeight.TextColor = xui.Color_White
	btnSaveSideHeight.Text = "Next " & UnicodeToString(0x2192)
	btnSaveSideHeight.font = Common.btnFont
	
	Common.LightBlueColor(btnSaveEyeHeight)
	btnSaveEyeHeight.TextColor = xui.Color_White
	btnSaveEyeHeight.Text = "Next " & UnicodeToString(0x2192)
	btnSaveEyeHeight.Font = Common.btnFont
	
	'''btnSaveButtocksHeight.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSaveButtocksHeight)
	btnSaveButtocksHeight.TextColor = xui.Color_White
	btnSaveButtocksHeight.Text = "Next " & UnicodeToString(0x2192)
	btnSaveButtocksHeight.TextSize = 18
	btnSaveButtocksHeight.font = Common.btnFont
	
	dv.Initialize(Me, "H1", Root, H1.GetBase, False)
	dv.setHorizontal(True)
	dv2.Initialize(Me, "H2", Root, H2.GetBase, False)
	dv2.setHorizontal(True)
	dv3.Initialize(Me, "VV1", Root, VV1.GetBase, False)
	dv3.setHorizontal(False)
	dv4.Initialize(Me, "VV2", Root, VV2.GetBase, False)
	dv4.setHorizontal(False)
	dv5.Initialize(Me, "V1", Root, V1.GetBase, False)
	dv5.setHorizontal(False)
	dv6.Initialize(Me, "V2", Root, V2.GetBase, False)
	dv6.setHorizontal(False)
	
	
	dv7.Initialize(Me, "H1SideHeight", Root, H1SideHeight.GetBase, False)
	dv7.setHorizontal(True)
	dv8.Initialize(Me, "H2SideHeight", Root, H2SideHeight.GetBase, False)
	dv8.setHorizontal(True)
	dv9.Initialize(Me, "H1ElbowHeight", Root, H1ElbowHeight.GetBase, False)
	dv9.setHorizontal(True)
	dv10.Initialize(Me, "H2ElbowHeight", Root, H2ElbowHeight.GetBase, False)
	dv10.setHorizontal(True)
	dv11.Initialize(Me, "H1LumbarHeight", Root, H1LumbarHeight.GetBase, False)
	dv11.setHorizontal(True)
	dv12.Initialize(Me, "H2LumbarHeight", Root, H2LumbarHeight.GetBase, False)
	dv12.setHorizontal(True)
	dv13.Initialize(Me, "H1KneeHeight", Root, H1KneeHeight.GetBase, False)
	dv13.setHorizontal(True)
	dv14.Initialize(Me, "H2KneeHeight", Root, H2KneeHeight.GetBase, False)
	dv14.setHorizontal(True)
	dv15.Initialize(Me, "H1ButtocksHeight", Root, H1ButtocksHeight.GetBase, False)
	dv15.setHorizontal(True)
	dv16.Initialize(Me, "H2ButtocksHeight", Root, H2ButtocksHeight.GetBase, False)
	dv16.setHorizontal(True)
	dv17.Initialize(Me, "H1EyeHeight", Root, H1EyeHeight.GetBase, False)
	dv17.sethorizontal(True)
	dv18.Initialize(Me, "H2EyeHeight", Root, H2EyeHeight.GetBase, False)
	dv18.setHorizontal(True)
	
	Dim su As StringUtils
	
	lblTitleHeight.Font = myfont2
	lblTitleHeight.TextSize = 16
	lblTitleHeight.TextColor = xui.Color_White'''xui.Color_ARGB(229, 28, 30, 36)
	lblTitleHeight.Text = "Using the sliders, locate the top of" &  CRLF &  "your head and where your heels meet the floor"
	lblTitleHeight.Height = su.MeasureMultilineTextHeight(lblTitleHeight, lblTitleHeight.Text)
	
	lblTitleShoulders.Font = myfont2
	lblTitleShoulders.TextSize = 16
	lblTitleShoulders.TextColor = xui.Color_White'''xui.Color_ARGB(229, 28, 30, 36)
	lblTitleShoulders.Text = "Locate the widest part of your shoulders"
	lblTitleShoulders.Height = su.MeasureMultilineTextHeight(lblTitleShoulders, lblTitleShoulders.Text)
	
	lblTitleHips.Font = myfont2
	lblTitleHips.TextSize = 16
	lblTitleHips.TextColor = xui.Color_White''xui.Color_ARGB(229, 28, 30, 36)
	lblTitleHips.Text = "Locate the widest part of your hips"
	lblTitleHips.Height = su.MeasureMultilineTextHeight(lblTitleHips, lblTitleHips.Text)
	
	lblTitleSideHeight.Font = myfont2
	lblTitleSideHeight.TextSize = 16
	lblTitleSideHeight.TextColor = xui.Color_white'''xui.Color_ARGB(229, 28, 30, 36)
	lblTitleSideHeight.Text = "Locate the top of your head and where" & CRLF &  "your heels meet the floor"
	lblTitleSideHeight.Height = su.MeasureMultilineTextHeight(lblTitleSideHeight, lblTitleSideHeight.Text)
	
	lblTitleEyeHeight.Font = myfont2
	lblTitleEyeHeight.TextSize = 16
	lblTitleEyeHeight.TextColor = xui.color_White
	lblTitleEyeHeight.Text = "Locate center of eye"
	lblTitleEyeHeight.Height = su.MeasureMultilineTextHeight(lblTitleEyeHeight, lblTitleEyeHeight.Text)
	
	lblTitleElbowHeight.Font = myfont2
	lblTitleElbowHeight.TextSize = 16
	lblTitleElbowHeight.TextColor = xui.Color_White
	lblTitleElbowHeight.Text = "Locate your elbow"
	lblTitleElbowHeight.Height = su.MeasureMultilineTextHeight(lblTitleElbowHeight, lblTitleElbowHeight.Text)
	
	lblTitleLumbarHeight.Font = myfont2
	lblTitleLumbarHeight.textsize = 16
	lblTitleLumbarHeight.TextColor = xui.Color_White
	lblTitleLumbarHeight.Text = "Locate the middle of your lumbar curve"
	lblTitleLumbarHeight.Height = su.MeasureMultilineTextHeight(lblTitleLumbarHeight, lblTitleLumbarHeight.Text)
	
	
	lblTitleButtocksHeight.Font = myfont2
	lblTitleButtocksHeight.TextSize = 16
	lblTitleButtocksHeight.TextColor = xui.Color_White
	lblTitleButtocksHeight.Text = "Locate the most protruding part of your buttocks"
	lblTitleButtocksHeight.Height = su.MeasureMultilineTextHeight(lblTitleButtocksHeight, lblTitleButtocksHeight.Text)
	
	lblTitleKneeHeight.Font = myfont2
	lblTitleKneeHeight.TextSize = 16
	lblTitleKneeHeight.TextColor = xui.Color_White
	lblTitleKneeHeight.Text = "Locate the base of your kneecap"
	lblTitleKneeHeight.Height = su.MeasureMultilineTextHeight(lblTitleKneeHeight, lblTitleKneeHeight.Text)
	
	imgneutral.SetBitmap(LoadBitmap(File.DirAssets, "neutral2.png"))
	#If B4A
	imgneutral.As(ImageView).Gravity = Gravity.FILL
	#End If
	lblNeutral.font = myfont
	lblNeutral.TextSize = 18
	lblNeutral.Text = "Neutral"
	lblNeutral.TextColor = xui.Color_White
	imgPerch.SetBitmap(LoadBitmap(File.DirAssets, "perch2.png"))
	#If B4A
	imgPerch.As(ImageView).Gravity = Gravity.FILL
	#End If
	lblPerch.font = myfont
	lblPerch.TextSize = 18
	lblPerch.Text = "Perch"
	lblPerch.TextColor = xui.Color_White
	imgRecline.SetBitmap(LoadBitmap(File.DirAssets, "recline2.png"))
	#If B4A
	imgRecline.As(ImageView).Gravity = Gravity.FILL
	#End If
	lblRecline.font = myfont
	lblRecline.TextSize = 18
	lblRecline.Text = "Recline"
	lblRecline.TextColor = xui.Color_White
	'''btnNextPosition.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnNextPosition.Background = Common.LightBlueColor
	Common.LightBlueColor(btnNextPosition)
	btnNextPosition.font = Common.btnFont
	btnNextPosition.Text = "Next " & UnicodeToString(0x2192)
	btnNextPosition.TextSize = 18
	btnNextPosition.TextColor = xui.Color_White
	
	'''btnSaveElbowHeight.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSaveLumbarHeight.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSaveElbowHeight.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSaveElbowHeight)
	btnSaveElbowHeight.TextColor = xui.Color_White
	btnSaveElbowHeight.Text = "Next " & UnicodeToString(0x2192)
	btnSaveElbowHeight.TextSize = 18
	btnSaveElbowHeight.font = Common.btnFont
	'''btnSaveLumbarHeight.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSaveLumbarHeight)
	btnSaveLumbarHeight.TextColor = Colors.White
	btnSaveLumbarHeight.Text = "Next " & UnicodeToString(0x2192)
	btnSaveLumbarHeight.TextSize = 18
	btnSaveLumbarHeight.font = Common.btnFont
	lblPosTitle.font = myfont
	lblPosTitle.Text = "Which position are you" & CRLF & "most comfortable in?"
	lblPosTitle.TextSize = 20
	lblPosTitle.TextColor = xui.Color_ARGB(229, 28, 30, 36)
	
	pnlNeutral.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
	pnlPerch.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
	pnlRecline.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
	
	'################################ShoeHeight Section####################################
	lblshoeTitle.font = myfont
	lblshoeTitle.TextSize = 20
	lblshoeTitle.Text = "Current footwear"
	lblshoeTitle.TextColor = xui.Color_ARGB(229, 28, 30, 36)
	
	
	btnZero.font = myfont
	btnZero.TextSize = 18
	btnZero.Text = "No shoes"
	btnZero.TextColor = xui.Color_White
	'''btnZero.Background = cd4
	btnZero.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
	
	btnless1.font = myfont
	btnless1.TextSize = 18
	btnless1.Text = "Flat shoes <1”"
	btnless1.TextColor = xui.Color_White
	'''btnless1.Background = cd5
	btnless1.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
	
	btnsole2.font = myfont
	btnsole2.TextSize = 18
	btnsole2.Text = "Thick sole 2”"
	btnsole2.TextColor = xui.Color_White
	'''btnsole2.Background = cd6
	btnsole2.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
	
	btnheels3.font = myfont
	btnheels3.TextSize = 18
	btnheels3.Text = "High heels 3”"
	btnheels3.TextColor = xui.Color_White
	'''btnheels3.Background = cd7
	btnheels3.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
	
	btnheels4.font = myfont
	btnheels4.TextSize = 18
	btnheels4.Text = "High heels 4”"
	btnheels4.TextColor = xui.Color_White
	'''btnheels4.Background = cd8
	btnheels4.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
	
	btnheels5.font = myfont
	btnheels5.TextSize = 18
	btnheels5.Text = "High heels 5”"
	btnheels5.TextColor = xui.Color_White
	'''btnheels5.Background = cd9
	btnheels5.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
	'''btnNextShoe.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	
	'''btnNextShoe.Background = Common.LightBlueColor
	Common.LightBlueColor(btnNextShoe)
	btnNextShoe.font = Common.btnFont
	btnNextShoe.TextColor = xui.Color_White
	btnNextShoe.TextSize = 18
	btnNextShoe.Text = "Next " & UnicodeToString(0x2192)
	'################################End ShoeHeight Section####################################
	'''btnZero.Color = xui.Color_ARGB(51, 28, 30, 36)
	
	'''btnSave.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSave.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSave)
	btnSave.font = Common.btnFont
	'''btnSave.Text = "Set height"
	btnSave.TextColor = xui.Color_White
	btnSave.TextSize = 18
	
	'''btnSaveShoulders.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSaveShoulders.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSaveShoulders)
	btnSaveShoulders.font = Common.btnFont
	btnSaveShoulders.TextColor = xui.Color_White
	btnSaveShoulders.Text = "Next " & UnicodeToString(0x2192)
	btnSaveShoulders.TextSize = 18
	
	'''btnSaveHips.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSaveHips.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSaveHips)
	btnSaveHips.font = Common.btnFont
	btnSaveHips.TextColor = xui.Color_White
	btnSaveHips.TextSize = 18
	btnSaveHips.Text = "Next " & UnicodeToString(0x2192)
	
	'''btnSaveKneeHeight.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSaveKneeHeight.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSaveKneeHeight)
	btnSaveKneeHeight.font = Common.btnFont
	btnSaveKneeHeight.TextColor = xui.Color_White
	btnSaveKneeHeight.Text = "Next " & UnicodeToString(0x2192)
	btnSaveKneeHeight.TextSize = 18
	
	'''btnSaveButtocksHeight.SetBackgroundImage(LoadBitmap(File.DirAssets, "next.png"))
	'''btnSaveButtocksHeight.Background = Common.LightBlueColor
	Common.LightBlueColor(btnSaveButtocksHeight)
	btnSaveButtocksHeight.font = Common.btnFont
	btnSaveButtocksHeight.TextColor = xui.Color_White
	btnSaveButtocksHeight.Text = "Next " & UnicodeToString(0x2192)
	btnSaveButtocksHeight.TextSize = 18
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets, "home_highlighted.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	
	ASBottomMenu1.PartinglineVisible = False
	ASBottomMenu1.UnderlineVisible = False
	'''ASBottomMenu1.SelectedPageIconColor = Colors.Black
	ASBottomMenu1.SelectedPageIconColor = Common.LightBlueColors
	ASBottomMenu1.MiddleButtonVisible = False
	'''ASBottomMenu1.TabBackgroundColor = Colors.White
	ASBottomMenu1.BadgetColor1 = xui.Color_Black
	ASBottomMenu1.BadgetColor2 = xui.Color_Black
	ASBottomMenu1.BadgetColor4 = xui.Color_Black
	
	progressdialog.Initialize(Root, 400dip, -1, -1, "", "", xui.Color_RGB(164, 212, 232), xui.Color_White, "DEFAULT", True)
	progressdialog.Show("Retrieving user's information", xui.Color_White)
	
	Dim path As PathBuilder
	path.Initialize
	path.Document("StromDB/Registrations/")
	Log("path: " & path.Complete)
	Dim fand As CompositeFilter
	Dim filter As FieldFilter
	filter.Initialize.EqualTo("UserName", Starter.userName).EqualTo("PinNumber", Starter.pinNumber)
	fand.Initialize.Filters(filter)
	Dim qry As Query
	qry.Initialize.From("Users").OrderBy("UserName", qry.ASCENDING).CollectionIn(path).Where(fand)
	wait for (B4XPages.MainPage.store.RunQuery(qry)) Complete(results As Map)
	Log("results: " & results)
	
''	Dim db As DBTransactions
''	db.Initialize(Me)
''	Dim query As String = $"SELECT HEIGHT, SHOEHEIGHT FROM Registrations WHERE UserName = ${"'"&Starter.userName&"'"} AND PinNumber = ${"'"&Starter.pinNumber&"'"}"$
	LogColor("starter.username = " & Starter.userName & " starter.pinNumber = " & Starter.pinNumber, Colors.blue)
	'''ProgressDialogShow2("Retrieving user's information", False)
	
	Dim json As JSONParser
	Dim s As String = results.Get("documents")
	'''Dim m As Map
	Dim l As List
	If s <> "" Then
	json.Initialize(s)
	
	Try
		l = json.NextArray
		If l.Size > 0 Then
			For Each val As Map In l
				Starter.pHeight = val.Get("Height")
				Dim sheight As String = val.GetDefault("SHOEHEIGHT", 0)
				If sheight.Length = 0 Then
					Starter.sHeight = 0
				Else
					Starter.sHeight = sheight
				End If
			Next
		End If
	Catch
		Log(LastException)
	End Try
	End If

'''	db.ExecuteRemoteQuery(query, "SELECTCOLUMNS")
'''	wait for QueryResults(Results2 As List)
'''	LogColor("results2: " & Results2, Colors.Blue)
'''	For i = 0 To Results2.Size - 1
'''		Dim m As Map
'''		m = Results2.Get(i)
'''		Starter.pHeight = m.Get("HEIGHT")
'''		LogColor("loaded m.get(HEIGHT): " & Starter.pHeight, Colors.Blue)
'''		'''Starter.sHeight = m.GetDefault("SHOEHEIGHT", 0)
'''		Dim sheight As String = m.GetDefault("SHOEHEIGHT", 0)
'''		If sheight.Length = 0 Then
'''			Starter.sHeight = 0
'''			Log($"ShoeHeight: ${m.GetDefault("SHOEHEIGHT", 0)}"$)
'''		Else
'''			Starter.sHeight = sheight
'''			Log($"ShoeHeight: ${m.GetDefault("SHOEHEIGHT", 0)}"$)
'''		End If
'''	Next

	''	Dim SenderFilter As Object = Common.mysql.ExecQueryAsync("SQL", query, Null)
'''	Wait For (SenderFilter) SQL_QueryComplete (Success As Boolean, rs As JdbcResultSet)
'''	If Success Then
'''		Do While rs.NextRow
'''			'''Log(rs.GetInt2(0))
'''			Starter.pHeight = rs.GetString("Height")
'''			Dim shoeheight As String = rs.GetString("SHOEHEIGHT")
'''			If shoeheight.Length = 0 Then
'''				Starter.sHeight = 0
'''			Else
'''				Starter.sHeight = shoeheight
'''			End If
'''		Loop
'''		rs.Close
'''	Else
'''		Log(LastException)
'''	End If
	
	progressdialog.hide
	
	Common.ACTION_DOWN = B4XPages.GetNativeParent(Me).ACTION_DOWN
	Common.ACTION_MOVE = B4XPages.GetNativeParent(Me).ACTION_MOVE
	Common.ACTION_UP = B4XPages.GetNativeParent(Me).ACTION_UP
	
	'''btnSave.Top = Root.Height - btnSave.Height - 30dip
	'''H2.GetBase.Top = btnSave.Top - 20dip
	''dv2.Base.Top = btnSave.Top - 20dip
	'''H2.GetBase.BringToFront
	
	ASViewPager1.setMeasuringFront(True)
	
	dv.Base.Visible = False
	dv2.Base.Visible = False
	dv3.Base.Visible = False
	dv4.Base.Visible = False
	dv5.Base.Visible = False
	dv6.Base.Visible = False
	dv7.Base.Visible = False
	dv8.Base.Visible = False
	dv9.Base.Visible = False
	dv10.Base.Visible = False
	dv11.Base.Visible = False
	dv12.Base.Visible = False
	dv13.Base.Visible = False
	dv14.Base.Visible = False
	dv15.Base.Visible = False
	dv16.Base.Visible = False
	dv17.Base.Visible = False
	dv18.Base.Visible = False
			
	dv.Base.Enabled = False
	dv2.Base.Enabled = False
	dv3.Base.Enabled = False
	dv4.Base.Enabled = False
	dv5.Base.Enabled = False
	dv6.Base.Enabled = False
	dv7.Base.Enabled = False
	dv8.Base.Enabled = False
	dv9.Base.Enabled = False
	dv10.Base.Enabled = False
	dv11.Base.Enabled = False
	dv12.Base.Enabled = False
	dv13.Base.Enabled = False
	dv14.Base.Enabled = False
	dv15.Base.Enabled = False
	dv16.Base.Enabled = False
	dv17.Base.Enabled = False
	dv18.Base.Enabled = False
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

Sub UnicodeToString (code As Int) As String
	Dim bc As ByteConverter
	Dim b() As Byte = bc.IntsToBytes(Array As Int(code))
	Return BytesToString(b, 0, 4, "UTF32")
End Sub

Public Sub ScaleImage(Bmd As Bitmap, V As View)
	Dim bmp As Bitmap
	Dim hgt, wid As Int
	Dim scale As Float
	Dim ls As Boolean
	Dim cw, ch As Int
 
	wid = Root.Width	'''Activity.width
	hgt = Root.height
 
	ls = wid > hgt
	bmp = Bmd
	scale = bmp.width / bmp.height
 
	If ls Then
		cw = hgt * scale
		ch = hgt
	Else
		cw = wid
		ch = wid * scale
	End If
 
	V.width = cw
	V.height = ch
 
End Sub

Sub ASViewPager1_PageChanged (index As Int)
	Log("PageChanged: " & index)
	Select index
		Case 0
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = True
			Log("ASViewPager1 height: " & ASViewPager1.Base.Height)
			ASViewPager1.Base.Height = 100%y '''- (ASBottomMenu1.Base.Height - 10dip) '''ASViewPager1.Base.Height - (ASBottomMenu1.Base.Height - 1000dip)
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			ASBottomMenu1.Base.Visible = True
			Log("ASViewPager height after: " & ASViewPager1.Base.Height)
			'''H1.GetBase.Visible = False
			'''H2.GetBase.Visible = False
			Common.SlidersActive = False
			ASBottomMenu1.Base.BringToFront
			Log("ASBottomMenu1 top: " & ASBottomMenu1.Base.Top)
'''			dv.Base.Visible = False
'''			dv2.Base.Visible = False
'''			dv3.Base.Visible = False
'''			dv4.Base.Visible = False
'''			dv5.Base.Visible = False
'''			dv6.Base.Visible = False
'''			dv7.Base.Visible = False
'''			dv8.Base.Visible = False
'''			dv9.Base.Visible = False
'''			dv10.Base.Visible = False
'''			dv11.Base.Visible = False
'''			dv12.Base.Visible = False
'''			dv13.Base.Visible = False
'''			dv14.Base.Visible = False
'''			dv15.Base.Visible = False
'''			dv16.Base.Visible = False
'''			
'''			dv.Base.Enabled = False
'''			dv2.Base.Enabled = False
'''			dv3.Base.Enabled = False
'''			dv4.Base.Enabled = False
'''			dv5.Base.Enabled = False
'''			dv6.Base.Enabled = False
'''			dv7.Base.Enabled = False
'''			dv8.Base.Enabled = False
'''			dv9.Base.Enabled = False
'''			dv10.Base.Enabled = False
'''			dv11.Base.Enabled = False
'''			dv12.Base.Enabled = False
'''			dv13.Base.Enabled = False
'''			dv14.Base.Enabled = False
'''			dv15.Base.Enabled = False
'''			dv16.Base.Enabled = False
		Case 1
			'''swipe.ScrollingEnabled = True
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = True
			Log("ASViewPager1 height: " & ASViewPager1.Base.Height)
			ASViewPager1.Base.Height = 100%y
			shoeheightlayout.Height = 100%y
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			'''ASBottomMenu1.Base.Top = ASViewPager1.Base.Height - ASBottomMenu1.Base.Height
			ASBottomMenu1.Base.Visible = True
			'''H1.GetBase.Visible = False
			'''H2.GetBase.Visible = False
			Common.SlidersActive = False
			ASBottomMenu1.Base.BringToFront
			
			''ASBottomMenu1.Base.BringToFront
			'''ASViewPager1.Base.SendToBack
			Log("ASBottomMenu1 top: " & ASBottomMenu1.Base.Top)
			dv.Base.Visible = False
			dv2.Base.Visible = False
			dv3.Base.Visible = False
			dv4.Base.Visible = False
			dv5.Base.Visible = False
			dv6.Base.Visible = False
			dv7.Base.Visible = False
			dv8.Base.Visible = False
			dv9.Base.Visible = False
			dv10.Base.Visible = False
			dv11.Base.Visible = False
			dv12.Base.Visible = False
			dv13.Base.Visible = False
			dv14.Base.Visible = False
			dv15.Base.Visible = False
			dv16.Base.Visible = False
			
			dv.Base.Enabled = False
			dv2.Base.Enabled = False
			dv3.Base.Enabled = False
			dv4.Base.Enabled = False
			dv5.Base.Enabled = False
			dv6.Base.Enabled = False
			dv7.Base.Enabled = False
			dv8.Base.Enabled = False
			dv9.Base.Enabled = False
			dv10.Base.Enabled = False
			dv11.Base.Enabled = False
			dv12.Base.Enabled = False
			dv13.Base.Enabled = False
			dv14.Base.Enabled = False
			dv15.Base.Enabled = False
			dv16.Base.Enabled = False
		Case 2
			'''swipe.ScrollingEnabled = True
			ASBottomMenu1.Base.Visible = False
			ASViewPager1.setMeasuringFront(True)
			imgFront.Height = 100%y
			imgMain.Height = 100%y
			'''			ScaleImage(imgFront.GetBitmap, imgFront)
			'''ScaleImage(imgMain.Background, imgFront)
			FillImageToView(imgMain.GetBitmap, imgMain)
			ASViewPager1.Base.Height = 100%y
			pnlMain.Height = 100%y
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			ASViewPager1.Base.Color = xui.Color_White
			ASViewPager1.Base.Parent.Color = xui.Color_White
			H1.GetBase.Visible = True
			H2.GetBase.Visible = True
			'''Common.SlidersActive = True
			'''			dv.setActive(True)
			'''			dv2.setActive(True)
			'''			dv3.setActive(False)
			'''			dv4.setActive(False)
			'''			dv5.setActive(False)
			'''			dv6.setActive(False)
			'''			dv7.setActive(False)
			'''			dv8.setActive(False)
			'''			dv9.setActive(False)
			'''			dv10.setActive(False)
			'''			dv11.setActive(False)
			'''			dv12.setActive(False)
			'''			dv13.setActive(False)
			'''			dv14.setActive(False)
			'''			dv15.setActive(False)
			'''			dv16.setActive(False)
			dv.Active = True
			dv2.Active = True
			''********************************
			dv3.Active = False
			dv4.Active = False
			dv5.Active = False
			dv6.Active = False
			dv7.Active = False
			dv8.Active = False
			dv9.Active = False
			dv10.Active = False
			dv11.Active = False
			dv12.Active = False
			dv13.Active = False
			dv14.Active = False
			dv15.Active = False
			dv16.Active = False
			''*******************************
			dv.Base.Enabled = True
			dv2.Base.Enabled = True
			dv3.Base.Enabled = False
			dv4.Base.Enabled = False
			dv5.Base.Enabled = False
			dv6.Base.Enabled = False
			dv7.Base.Enabled = False
			dv8.Base.Enabled = False
			dv9.Base.Enabled = False
			dv10.Base.Enabled = False
			dv11.Base.Enabled = False
			dv12.Base.Enabled = False
			dv13.Base.Enabled = False
			dv14.Base.Enabled = False
			dv15.Base.Enabled = False
			dv16.Base.Enabled = False
			
			dv.Base.Visible = True
			dv2.Base.Visible = True
			dv3.Base.Visible = False
			dv4.Base.Visible = False
			dv5.Base.Visible = False
			dv6.Base.Visible = False
			dv7.Base.Visible = False
			dv8.Base.Visible = False
			dv9.Base.Visible = False
			dv10.Base.Visible = False
			dv11.Base.Visible = False
			dv12.Base.Visible = False
			dv13.Base.Visible = False
			dv14.Base.Visible = False
			dv15.Base.Visible = False
			dv16.Base.Visible = False
			
			dv.Base.Top = H1.GetBase.Top
			dv2.Base.Top = H2.GetBase.top
		Case 3
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = False
			ASViewPager1.setMeasuringFront(True)
			imgMainShoulders.Height = 100%y
			ASViewPager1.Base.Height = 100%y
			pnlMainShoulders.Height = 100%y
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			FillImageToView(imgMainShoulders.getBitmap, imgMainShoulders)
			ASViewPager1.Base.Color = xui.Color_White
			'''ShowElobwMarkers
			'''H1.GetBase.Visible = False
			'''H2.GetBase.Visible = False
			VV1.GetBase.Visible = True
			VV2.GetBase.Visible = True
			dv.Active = False
			dv2.Active = False
			dv3.Active = True
			dv4.Active = True
			dv5.Active = False
			dv6.Active = False
			dv7.Active = False
			dv8.Active = False
			dv9.Active = False
			dv10.Active = False
			dv11.Active = False
			dv12.Active = False
			dv13.Active = False
			dv14.Active = False
			dv15.Active = False
			dv16.Active = False
			
			dv.Base.Enabled = False
			dv2.Base.Enabled = False
			dv3.Base.Enabled = True
			dv4.Base.Enabled = True
			
			dv.Base.Visible = False
			dv2.Base.Visible = False
			dv3.Base.Visible = True
			dv4.Base.Visible = True
			dv5.Base.Visible = False
			dv6.Base.Visible = False
			dv7.Base.Visible = False
			dv8.Base.Visible = False
			dv9.Base.Visible = False
			dv10.Base.Visible = False
			dv11.Base.Visible = False
			dv12.Base.Visible = False
			dv13.Base.Visible = False
			dv14.Base.Visible = False
			dv15.Base.Visible = False
			dv16.Base.Visible = False
			
			dv3.Base.Left = VV1.GetBase.Left
			dv4.Base.Left = VV2.GetBase.Left
		Case 4
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = False
			imgMainHips.Height = 100%y
			ASViewPager1.Base.Height = 100%y
			pnlMainHips.Height = 100%y
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			FillImageToView(imgMainHips.getBitmap, imgMainHips)
			ASViewPager1.Base.Color = xui.Color_White
			'''showHipMarkers
			V1.GetBase.Visible = True
			V2.GetBase.Visible = True
			'''Common.SlidersActive = True
			dv.Active = False
			dv2.Active = False
			dv3.Active = False
			dv4.Active = False
			dv5.Active = True
			dv6.Active = True
			dv7.Active = False
			dv8.Active = False
			dv9.Active = False
			dv10.Active = False
			dv11.Active = False
			dv12.Active = False
			dv13.Active = False
			dv14.Active = False
			dv15.Active = False
			dv16.Active = False
			
			dv.Base.Visible = False
			dv2.Base.Visible = False
			dv3.Base.Visible = False
			dv4.Base.Visible = False
			dv5.Base.Visible = True
			dv6.Base.Visible = True
			dv7.Base.Visible = False
			dv8.Base.Visible = False
			dv9.Base.Visible = False
			dv10.Base.Visible = False
			dv11.Base.Visible = False
			dv12.Base.Visible = False
			dv13.Base.Visible = False
			dv14.Base.Visible = False
			dv15.Base.Visible = False
			dv16.Base.Visible = False
			
			dv5.Base.Enabled = True
			dv6.Base.Enabled = True
			
			dv5.Base.Left = V1.GetBase.Left
			dv6.Base.Left = V2.GetBase.Left
		Case 5
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = False
			imgsideheight.Height = 100%y
			imgMainSideHeight.Height = 100%y
			ASViewPager1.Base.Height = 100%y
			pnlMainSideHeight.Height = 100%y
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			FillImageToView(imgMainSideHeight.getBitmap, imgMainSideHeight)
			ASViewPager1.Base.Color = xui.Color_White
			'''Common.SlidersActive = True
			H1SideHeight.GetBase.Visible = True
			H2SideHeight.GetBase.Visible = True
			'''H1ButtocksHeight.GetBase.Visible = False
			'''H2ButtocksHeight.GetBase.Visible = False
			H1SideHeight.GetBase.BringToFront
			H2SideHeight.GetBase.BringToFront
			
			dv.Active = False
			dv2.Active = False
			dv3.Active = False
			dv4.Active = False
			dv5.Active = False
			dv6.Active = False
			dv7.Active = True
			dv8.Active = True
			dv9.Active = False
			dv10.Active = False
			dv11.Active = False
			dv12.Active = False
			dv13.Active = False
			dv14.Active = False
			dv15.Active = False
			dv16.Active = False
			
			dv.Base.Visible = False
			dv2.Base.Visible = False
			dv3.Base.Visible = False
			dv4.Base.Visible = False
			dv5.Base.Visible = False
			dv6.Base.Visible = False
			dv7.Base.Visible = True
			dv8.Base.Visible = True
			dv9.Base.Visible = False
			dv10.Base.Visible = False
			dv11.Base.Visible = False
			dv12.Base.Visible = False
			dv13.Base.Visible = False
			dv14.Base.Visible = False
			dv15.Base.Visible = False
			dv16.Base.Visible = False
			
			dv7.Base.Enabled = True
			dv8.Base.Enabled = True
			
			dv7.Base.Top = H1SideHeight.GetBase.Top
			dv8.Base.Top = H2SideHeight.GetBase.Top
		Case 6
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = False
			'''imgelbowheight.Height = 100%y
			imgEyeHeight.Height = 100%y
			'''imgEyeHeight.Color = xui.Color_White
			ASViewPager1.Base.Height = 100%y
			pnlMainEyeHeight.Height = 100%y
			pnlMainEyeHeight.Color = xui.Color_White
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			FillImageToView(imgEyeHeight.getBitmap, imgEyeHeight)
			Log("imgEyeHeight parent: " & imgEyeHeight.Parent)
			imgEyeHeight.Parent.Color = xui.Color_white
			ASViewPager1.Base.Color = xui.Color_White
			'''imgEyeHeight.Color = xui.color_white
			'''Common.SlidersActive = True
			H2EyeHeight.GetBase.Top = Common.H2SideHeightPosition
			dv.setActive(False)
			dv2.setActive(False)
			dv3.setActive(False)
			dv4.setActive(False)
			dv5.setActive(False)
			dv6.setActive(False)
			dv7.setActive(False)
			dv8.setActive(False)
			dv9.setActive(False)
			dv10.setActive(False)
			dv11.setActive(False)
			dv12.setActive(False)
			dv13.setActive(False)
			dv14.setActive(False)
			dv15.setActive(False)
			dv16.setActive(False)
			dv17.setActive(True)
			dv18.setactive(True)
			
			dv.Base.Visible = False
			dv2.Base.Visible = False
			dv3.Base.Visible = False
			dv4.Base.Visible = False
			dv5.Base.Visible = False
			dv6.Base.Visible = False
			dv7.Base.Visible = False
			dv8.Base.Visible = False
			dv9.Base.Visible = False
			dv10.Base.Visible = False
			dv11.Base.Visible = False
			dv12.Base.Visible = False
			dv13.Base.Visible = False
			dv14.Base.Visible = False
			dv15.Base.Visible = False
			dv16.Base.Visible = False
			dv17.Base.Visible = True
			
			dv17.Base.Enabled = True
			dv17.Base.Top = H1EyeHeight.GetBase.Top
		Case 7
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = False
			imgelbowheight.Height = 100%y
			imgMainElbowHeight.Height = 100%y
			ASViewPager1.Base.Height = 100%y
			pnlMainElbowHeight.Height = 100%y
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			FillImageToView(imgMainElbowHeight.getBitmap, imgMainElbowHeight)
			ASViewPager1.Base.Color = xui.Color_White
			'''Common.SlidersActive = True
			H2ElbowHeight.GetBase.Top = Common.H2SideHeightPosition
			dv.setActive(False)
			dv2.setActive(False)
			dv3.setActive(False)
			dv4.setActive(False)
			dv5.setActive(False)
			dv6.setActive(False)
			dv7.setActive(False)
			dv8.setActive(False)
			dv9.setActive(True)
			dv10.setActive(True)
			dv11.setActive(False)
			dv12.setActive(False)
			dv13.setActive(False)
			dv14.setActive(False)
			dv15.setActive(False)
			dv16.setActive(False)
			
			dv.Base.Visible = False
			dv2.Base.Visible = False
			dv3.Base.Visible = False
			dv4.Base.Visible = False
			dv5.Base.Visible = False
			dv6.Base.Visible = False
			dv7.Base.Visible = False
			dv8.Base.Visible = False
			dv9.Base.Visible = True
			dv10.Base.Visible = False
			dv11.Base.Visible = False
			dv12.Base.Visible = False
			dv13.Base.Visible = False
			dv14.Base.Visible = False
			dv15.Base.Visible = False
			dv16.Base.Visible = False
			
			dv9.Base.Enabled = True
			dv9.Base.Top = H1ElbowHeight.GetBase.Top
		Case 8
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = False
			imglumbarheight.Height = 100%y
			imgMainLumbarHeight.Height = 100%y
			ASViewPager1.Base.Height = 100%y
			pnlMainLumbarHeight.Height = 100%y
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			FillImageToView(imgMainLumbarHeight.getBitmap, imgMainLumbarHeight)
			ASViewPager1.Base.Color = xui.Color_White
			'''Common.SlidersActive = True
			H2LumbarHeight.GetBase.Top = Common.H2SideHeightPosition
			dv.setActive(False)
			dv2.setActive(False)
			dv3.setActive(False)
			dv4.setActive(False)
			dv5.setActive(False)
			dv6.setActive(False)
			dv7.setActive(False)
			dv8.setActive(False)
			dv9.setActive(False)
			dv10.setActive(False)
			dv11.setActive(True)
			dv12.setActive(True)
			dv13.setActive(False)
			dv14.setActive(False)
			dv15.setActive(False)
			dv16.setActive(False)
			
			dv.Base.Visible = False
			dv2.Base.Visible = False
			dv3.Base.Visible = False
			dv4.Base.Visible = False
			dv5.Base.Visible = False
			dv6.Base.Visible = False
			dv7.Base.Visible = False
			dv8.Base.Visible = False
			dv9.Base.Visible = False
			dv10.Base.Visible = False
			dv11.Base.Visible = True
			dv12.Base.Visible = False
			dv13.Base.Visible = False
			dv14.Base.Visible = False
			dv15.Base.Visible = False
			dv16.Base.Visible = False
			
			dv11.Base.Enabled = True
			
			dv11.Base.Top = H1LumbarHeight.GetBase.Top
		Case 9
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = False
			imgbuttocksheight.Height = 100%y
			imgMainButtocksHeight.Height = 100%y
			ASViewPager1.Base.Height = 100%y
			pnlMainButtocksHeight.Height = 100%y
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			FillImageToView(imgMainButtocksHeight.getBitmap, imgMainButtocksHeight)
			ASViewPager1.Base.Color = xui.Color_White
			'''Common.SlidersActive = True
			H1ButtocksHeight.GetBase.Visible = True
			H2ButtocksHeight.GetBase.Top = Common.H2SideHeightPosition
			dv.setActive(False)
			dv2.setActive(False)
			dv3.setActive(False)
			dv4.setActive(False)
			dv5.setActive(False)
			dv6.setActive(False)
			dv7.setActive(False)
			dv8.setActive(False)
			dv9.setActive(False)
			dv10.setActive(False)
			dv11.setActive(False)
			dv12.setActive(False)
			dv13.setActive(False)
			dv14.setActive(False)
			dv15.setActive(True)
			dv16.setActive(True)
			
			dv.Base.Visible = False
			dv2.Base.Visible = False
			dv3.Base.Visible = False
			dv4.Base.Visible = False
			dv5.Base.Visible = False
			dv6.Base.Visible = False
			dv7.Base.Visible = False
			dv8.Base.Visible = False
			dv9.Base.Visible = False
			dv10.Base.Visible = False
			dv11.Base.Visible = False
			dv12.Base.Visible = False
			dv13.Base.Visible = False
			dv14.Base.Visible = False
			dv15.Base.Visible = True
			dv16.Base.Visible = False
			
			dv15.Base.Enabled = True
			dv15.Base.Top = H1ButtocksHeight.GetBase.Top
		Case 10
			ASViewPager1.setMeasuringFront(True)
			ASBottomMenu1.Base.Visible = False
			imgkneeheight.Height = 100%y
			imgMainKneeHeight.Height = 100%y
			ASViewPager1.Base.Height = 100%y
			pnlMainKneeHeight.Height = 100%y
			ASViewPager1.Base_Resize(ASViewPager1.Base.Width, ASViewPager1.Base.Height)
			FillImageToView(imgMainKneeHeight.getBitmap, imgMainKneeHeight)
			ASViewPager1.Base.Color = xui.Color_White
			'''Common.SlidersActive = True
			H2KneeHeight.GetBase.Top = Common.H2SideHeightPosition
			dv.setActive(False)
			dv2.setActive(False)
			dv3.setActive(False)
			dv4.setActive(False)
			dv5.setActive(False)
			dv6.setActive(False)
			dv7.setActive(False)
			dv8.setActive(False)
			dv9.setActive(False)
			dv10.setActive(False)
			dv11.setActive(False)
			dv12.setActive(False)
			dv13.setActive(True)
			dv14.setActive(False)
			dv15.setActive(False)
			dv16.setActive(False)
			
			dv.Base.Visible = False
			dv2.Base.Visible = False
			dv3.Base.Visible = False
			dv4.Base.Visible = False
			dv5.Base.Visible = False
			dv6.Base.Visible = False
			dv7.Base.Visible = False
			dv8.Base.Visible = False
			dv9.Base.Visible = False
			dv10.Base.Visible = False
			dv11.Base.Visible = False
			dv12.Base.Visible = False
			dv13.Base.Visible = True
			dv14.Base.Visible = False
			dv15.Base.Visible = False
			dv16.Base.Visible = False
			
			dv13.Base.Enabled = True
			
			dv13.Base.Top = H1KneeHeight.GetBase.Top
	End Select
End Sub

Private Sub ASViewPager1_SwipeOnEndOfPage
	Log("SwipeOnEndOfPage")
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

Sub btnNext_Click
	Log("btnNext_Click")
	If PrefPosition.Length <> 0 Then
		'''ProgressDialogShow2("Saving Selected Position Preference", False)
		progressdialog.Show("Saving selected position preference", xui.Color_White)
		'''ASViewPager1.EnableScrolling(True)
		wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("POSITIONPREF":Common.prefPosition))) Complete(results As Map)
		Log("Updated Registrations: " & results)
		If results.IsInitialized And results.ContainsKey("id") Then
			progressdialog.hide
			ASViewPager1.NextPage2
		Else
			LogColor("could not update Registrations, please try again!", xui.Color_Blue)
		End If
'''		Dim query As String = "UPDATE Registrations SET POSITIONPREF = " & "'"&Common.prefPosition&"'" & " WHERE UserName = " & "'"&Starter.userName&"'" & " AND PinNumber = " & "'"&Starter.pinNumber&"'"
'''		Log("update query: " & query)
'''		Dim db As DBTransactions
'''		db.Initialize(Me)
'''		db.ExecuteRemoteQuery(query, "UPDATE")
'''		wait for QueryResults(Results2 As List)
'''		For i = 0 To Results2.Size - 1
'''			Dim m As Map
'''			m = Results2.Get(i)
'''			Log("UPDATE FIELD: " & m)
'''			'''version = m.Get("version")
'''			'''exists = m.Get("count(*)")
'''		Next
		
'''		Common.mysql.AddNonQueryToBatch(query, Null)
'''		Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("SQL")
'''		Wait For (SenderFilter) SQL_NonQueryComplete (Success As Boolean)
'''		Log("Updated Registration table, setting new POSITIONPREF: " & Success)
		
'''		progressdialog.hide
'''		ASViewPager1.NextPage2
		'''ASViewPager1.Base.BringToFront
	Else
		Msgbox2Async("Please select a position", "Preferred Position", "OK", "Cancel", "", Null, False)
		Wait For Msgbox_Result (Result As Int)
		If Result = DialogResponse.POSITIVE Then
			'...
		End If
	End If
	'''swipe.ScrollingEnabled = False
End Sub

Sub btnNextShoe_Click
	Log("btnNextShoe_Click")
	'''swipe.ScrollingEnabled = False
	If shoeSelection > -1 Then
		'''ProgressDialogShow2("Saving selected current footwear", False)
		progressdialog.Show("Saving selected current footwear", xui.Color_White)
		'''ASViewPager1.EnableScrolling(True)
'''		Dim query As String = "UPDATE Registrations SET SHOEHEIGHT = " & "'"&Common.ShoeHeightPref&"'" & " WHERE UserName = " & "'"&Starter.userName&"'" & " AND PinNumber = " & "'"&Starter.pinNumber&"'"
'''		Log("update query: " & query)
'''		Dim db As DBTransactions
'''		db.Initialize(Me)
'''		db.ExecuteRemoteQuery(query, "UPDATE")
'''		wait for QueryResults(Results2 As List)
'''		For i = 0 To Results2.Size - 1
'''			Dim m As Map
'''			m = Results2.Get(i)
'''			Log($"UPDATE FIELD ${m}"$)
'''			'''version = m.Get("version")
'''			'''exists = m.Get("count(*)")
'''		Next
		wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("SHOEHEIGHT":Common.ShoeHeightPref))) Complete(results As Map)
		If results.IsInitialized And results.ContainsKey("id") Then
			progressdialog.hide
			ASViewPager1.NextPage2
			ASViewPager1.Base.SendToBack
			pnlMain.BringToFront
			H1.GetBase.BringToFront
			H2.GetBase.BringToFront
		End If

'''		Common.mysql.AddNonQueryToBatch(query, Null)
'''		Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("SHOEHEIGHT")
'''		Wait For (SenderFilter) SHOEHEIGHT_NonQueryComplete (Success As Boolean)
'''		Log("Updated Registration table, setting new SHOEHEIGHT: " & Success)
		

	Else
		Msgbox2Async("Please select a shoe sole size", "Current footwear", "OK", "Cancel", "", Null, False)
		Wait For Msgbox_Result (Result As Int)
		If Result = DialogResponse.POSITIVE Then
			'...
		End If
	End If
	'''swipe.ScrollingEnabled = True
End Sub

Sub pnlMain_Click
	
End Sub

Sub pnlMainShoulders_Click
	
End Sub

Sub ASViewPager1_TouchBegin
	Log("touch begin!!")
	'''	If PrefPosition.Length = 0 Then
	'''		ASViewPager1.setmeasuringfront(True)
	'''		'''ASViewPager1.CurrentIndex = 0
	'''	End If
End Sub

Sub btnZero_Click
	Log("btnZero_Click")
End Sub

Sub swipe_ActionClicked (Index As Int, ActionText As String)
	Log("index: " & Index & " ActionText: " & ActionText)
End Sub

Sub H1_Click
	markerSelected = True
	markerSelected2 = False
	markerSelected3 = False
	Master = H1

End Sub

Sub H1_YPosition (Y As Double)
	'''	If markerSelected Then
	'''		If hMarkersSet = True Then
	'''			Log("H1 Top: " & (H1.GetBase.Top + H1.YPosition))
	'''			Log("H2 Top: " & (H2.GetBase.Top + H2.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1.GetBase.Top+H1.YPosition) - (H2.GetBase.Top+H2.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1.LabelText = distanceString
	'''			LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
	'''	HeightHUD
	'''		End If
	'''	End If
End Sub

Sub H2_Click
	markerSelected = True
	markerSelected2 = False
	markerSelected3 = False
	Master = H2
	'''btnSave.Text = "Set Height"
	'''HHUD2.Visible = False
	'''HHUD2.TextSize = 36
End Sub

Sub H2_YPosition (Y As Double)
	'''	If markerSelected Then
	'''		If hMarkersSet = True Then
	'''			Log("H1 Top: " & (H1.GetBase.Top + H1.YPosition))
	'''			Log("H2 Top: " & (H2.GetBase.Top + H2.YPosition))
	Dim distance As Double
	Dim distanceString  As String
	Dim distance2 As String
	distance = Abs((H1.GetBase.Top+H1.YPosition) - (H2.GetBase.Top+H2.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1.LabelText = distanceString
	'''			LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
	'''			'''HeightHUD
	'''		End If
	'''	End If
End Sub

Sub V1_Click
	markerSelected2 = True
	markerSelected = False
	markerSelected3 = False
End Sub

Sub V2_Click
	markerSelected2 = True
	markerSelected = False
	markerSelected3 = False
End Sub

Sub V1_XPosition (X As Double)
	'''	Log("x: " & X)
	'''	If markerSelected2 Then
	'''		If hMarkersSet = True Then
	'''			Log("V1 Top: " & (V1.GetBase.Left + V1.XPosition))
	'''			Log("V2 Top: " & (V2.GetBase.Left + V2.XPosition))
	Dim distanceString As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((V1.GetBase.Left+V1.XPosition) - (V2.GetBase.Left+V2.XPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	V1.LabelText = distance2
	'''			LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
	'''HeightHUD
	'''	WidthHUD
	'''		End If
	'''	End If
End Sub

Sub V2_XPosition (X As Double)
	'''	If markerSelected2 Then
	'''		If hMarkersSet = True Then
	'''			Log("V1 Top: " & (V1.GetBase.Left + V1.XPosition))
	'''			Log("V2 Top: " & (V2.GetBase.Left + V2.XPosition))
	Dim distance As Double
	Dim distanceString As String
	Dim distance2 As String
	distance = Abs((V1.GetBase.Left+V1.XPosition) - (V2.GetBase.Left+V2.XPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	V1.LabelText = distanceString
	'''			LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
	'''HeightHUD
	'''	WidthHUD
	'''		End If
	'''	End If
End Sub

Sub VV1_Click
	markerSelected = False
	markerSelected2 = False
	markerSelected3 = True
End Sub

Sub VV2_Click
	markerSelected = False
	markerSelected2 = False
	markerSelected3 = True
End Sub

Sub VV1_XPosition (X As Double)
	'''	If markerSelected3 Then
	'''		If hMarkersSet = True Then
	'''			Log("VV1 Top: " & (VV1.GetBase.Left + VV1.XPosition))
	'''			Log("VV2 Top: " & (VV2.GetBase.Left + VV2.XPosition))
	Dim distance As Double
	Dim distanceString As String
	Dim distance2 As String
	distance = Abs((VV1.GetBase.Left+VV1.XPosition) - (VV2.GetBase.Left+VV2.XPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	VV1.LabelText = distanceString
	'''			LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
	'''HeightHUD
	'''widthHUD2
	'''		End If
	'''	End If
End Sub

Sub VV2_XPosition (X As Double)
	'''	If markerSelected3 Then
	'''		If hMarkersSet = True Then
	'''			Log("VV1 Top: " & (VV1.GetBase.Left + VV1.XPosition))
	'''			Log("VV1 Top: " & (VV2.GetBase.Left + VV2.XPosition))
	Dim distance As Double
	Dim distanceString As String
	Dim distance2 As String
	distance = Abs((VV1.GetBase.Left+VV1.XPosition) - (VV2.GetBase.Left+VV2.XPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	VV1.LabelText = distanceString
	'''			LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
	'''HeightHUD
	'''VHUD2.Text = distance2
	'''widthHUD2
	'''		End If
	'''	End If
End Sub

Sub btnSave_Click
	'''If btnSave.Text = "Set height" Then
	Log("btnsave pressed, going to page 3")
	hMarkersSet = True
	LogColor("calculating distance based on height: " & Starter.pHeight, Colors.Blue)
	personHeight = CalculateFeetToInches(Starter.pHeight)
	Dim H1Y As Double = H1.GetBase.Top+H1.YPosition
	Dim H2Y As Double = H2.GetBase.Top+H2.YPosition
	LogColor("difference: " & (H2Y-H1Y), Colors.Blue)
	pixelMetric = personHeight / Abs(H2Y - H1Y)
	Dim distance As Double
	'''Dim distanceString  As String
	Dim distance2 As String
	distance = Abs((H1.GetBase.Top+H1.YPosition) - (H2.GetBase.Top+H2.YPosition)) * pixelMetric
	'''distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	Common.SeatHeight = distance2
	H1.LabelText = distance2
	H1.GetBase.Visible = False
	H2.GetBase.Visible = False
'''	Dim query As String
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
	'''ProgressDialogShow2("Saving Height Measurements to Remote DataBase", False)
	progressdialog.Show("Saving height measurements to remote database", xui.Color_White)
'''	query = $"UPDATE Registrations SET CUSTOMERHEIGHT = ${"'"&H1.LabelText&"'"} WHERE UserName = ${"'"&Starter.userName&"'"} AND PinNumber = ${"'"&Starter.pinNumber&"'"}"$
'''	db.ExecuteRemoteQuery(query, "UPDATE")
'''	wait for QueryResults(Results2 As List)
'''	Log($"updated height measurements: ${Results2}"$)
'''	For i = 0 To Results2.Size - 1
'''		Dim m As Map
'''		m = Results2.Get(i)
'''		'''Starter.pHeight = m.Get("HEIGHT")
'''		'''Starter.sHeight = m.Get("SHOEHEIGHT")
'''		Log("Updating height info: " & m)
'''	Next

	wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("CUSTOMERHEIGHT":H1.LabelText))) Complete(Results As Map)
	If Results.IsInitialized And Results.ContainsKey("id") Then
		Sleep(500)
		progressdialog.hide
		ASViewPager1.NextPage2
	End If
	
'''	Common.mysql.AddNonQueryToBatch(query, Null)
'''	Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("CUSTOMERHEIGHT")
'''	Wait For (SenderFilter) CUSTOMERHEIGHT_NonQueryComplete (Success As Boolean)
'''	Log("Updated Registration table, setting new CUSTOMERHEIGHT: " & Success)


	'''End If
End Sub

Sub btnSaveShoulders_Click
	Log("btnSaveShoulders pressed, going to page 4")
	Dim distance As Double
	Dim distanceString As String
	Dim distance2 As String
	distance = Abs((VV1.GetBase.Left+VV1.XPosition) - (VV2.GetBase.Left+VV2.XPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	Common.SeatWidth = distance2
	VV1.LabelText = distance2
'''	Dim query As String
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
	'''ProgressDialogShow2("Saving Shoulder Measurements to Remote DataBase", False)
	progressdialog.Show("Saving shoulder measurements to remote database", xui.Color_White)
	wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("ELBOWWIDTH":distance2))) Complete(Results As Map)
	If Results.IsInitialized And Results.ContainsKey("id") Then
		Sleep(500)
		progressdialog.hide
		ASViewPager1.NextPage2
	End If
'''	query = $"UPDATE Registrations SET ELBOWWIDTH = ${"'"&distance2&"'"} WHERE UserName = ${"'"&Starter.userName&"'"} AND PinNumber = ${"'"&Starter.pinNumber&"'"}"$
'''	db.ExecuteRemoteQuery(query, "UPDATE")
'''	wait for QueryResults(Results2 As List)
'''	Log($"updated shoulder measurements: ${Results2}"$)
'''	For i = 0 To Results2.Size - 1
'''		Dim m As Map
'''		m = Results2.Get(i)
'''		'''Starter.pHeight = m.Get("HEIGHT")
'''		'''Starter.sHeight = m.Get("SHOEHEIGHT")
'''		Log($"Updating Shoulder width Info ${m}"$)
'''	Next

'''	Common.mysql.AddNonQueryToBatch(query, Null)
'''	Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("ELBOWWIDTH")
'''	Wait For (SenderFilter) ELBOWWIDTH_NonQueryComplete (Success As Boolean)
'''	Log("Updated Registration table, setting new ELBOWWIDTH: " & Success)

'''	progressdialog.hide
'''	ASViewPager1.NextPage2
End Sub

Sub btnSaveHips_Click
	Log("btnSaveHips pressed, going to page 5")
	Dim distanceString As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((V1.GetBase.Left+V1.XPosition) - (V2.GetBase.Left+V2.XPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	Common.SeatWidth = distance2
	V1.LabelText = distance2
'''	Dim query As String
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
	'''ProgressDialogShow2("Saving Hip Measurements to Remote DataBase", False)
	progressdialog.Show("Saving hip measurements to remote database", xui.Color_White)
	wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("HIPWIDTH":distance2))) Complete(Results As Map)
	If Results.IsInitialized And Results.ContainsKey("id") Then
		Sleep(500)
		progressdialog.hide
		pixelMetric = 0.0
		ASViewPager1.NextPage2
	End If
'''	query = $"UPDATE Registrations SET HIPWIDTH = ${"'"&distance2&"'"} WHERE UserName = ${"'"&Starter.userName&"'"} AND PinNumber = ${"'"&Starter.pinNumber&"'"}"$
'''	db.ExecuteRemoteQuery(query, "UPDATE")
'''	wait for QueryResults(Results2 As List)
'''	Log($"updated Hip measurements: ${Results2}"$)
'''	For i = 0 To Results2.Size - 1
'''		Dim m As Map
'''		m = Results2.Get(i)
'''		'''Starter.pHeight = m.Get("HEIGHT")
'''		'''Starter.sHeight = m.Get("SHOEHEIGHT")
'''		Log($"Updating Hip width Info ${m}"$)
'''	Next

'''	Common.mysql.AddNonQueryToBatch(query, Null)
'''	Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("HIPWIDTH")
'''	Wait For (SenderFilter) HIPWIDTH_NonQueryComplete (Success As Boolean)
'''	Log("Updated Registration table, setting new HIPWIDTH: " & Success)


End Sub

Sub btnBackHeight_Click
	Log("btnBackHeight Pressed")
	ASViewPager1.PreviousPage2
End Sub

private Sub ShowElobwMarkers
	VV1.GetBase.SetVisibleAnimated(600, True)
	VV2.GetBase.SetVisibleAnimated(600, True)
End Sub

private Sub showHipMarkers
	V1.GetBase.SetVisibleAnimated(600, True)
	V2.GetBase.SetVisibleAnimated(600, True)
End Sub

#Region Calculations
private Sub CalculateFeetToInches(feet As String)As Double
	Dim ft As Double
	Dim inches As Double
	Dim split() As String
	split = Regex.Split("-", feet)
	ft = split(0)
	inches = split(1)
	ft = ft * 12
	ft = ft + inches
	ft = ft + Starter.sHeight
	Log("feet to inches: " & ft & " " & " added shoe height " & Starter.sHeight)
	Return ft
End Sub
#End Region

Sub btnBackShoulders_Click
	Log("btnBackShoulders pressed")
	ASViewPager1.PreviousPage2
End Sub

Sub btnBackHips_Click
	Log("btnBackHips pressed")
	ASViewPager1.PreviousPage2
End Sub

#Region Select Seating Position
Sub SeatingPos_Click
	Dim pnl As Panel = Sender
	Select pnl.Tag
		Case "Neutral"
'''			Dim pnlbackground As ColorDrawable
'''			Dim unselectedbackground As ColorDrawable
'''			pnlbackground.Initialize2(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			unselectedbackground.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			pnlNeutral.Background = pnlbackground
'''			pnlPerch.Background = unselectedbackground
'''			pnlRecline.Background = unselectedbackground
			
			pnlNeutral.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			pnlPerch.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			pnlRecline.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			Common.prefPosition = "Neutral"
			PrefPosition = "Neutral"
		Case "Perch"
'''			Dim pnlbackground As ColorDrawable
'''			Dim unselectedbackground As ColorDrawable
'''			pnlbackground.Initialize2(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			unselectedbackground.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			pnlPerch.Background = pnlbackground
'''			pnlNeutral.Background = unselectedbackground
'''			pnlRecline.Background = unselectedbackground
			pnlPerch.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			pnlNeutral.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			pnlRecline.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			Common.prefPosition = "Perch"
			PrefPosition = "Perch"
		Case "Recline"
'''			Dim pnlbackground As ColorDrawable
'''			Dim unselectedbackground As ColorDrawable
'''			pnlbackground.Initialize2(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			unselectedbackground.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			pnlRecline.Background = pnlbackground
'''			pnlNeutral.Background = unselectedbackground
'''			pnlPerch.Background = unselectedbackground
			pnlRecline.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			pnlNeutral.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			pnlPerch.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			Common.prefPosition = "Reclined"
			PrefPosition = "Reclined"
	End Select
End Sub
#End Region

#Region Shoe Height Selection
Sub shoeHeight_Click
	Dim btn As Button = Sender
	Select btn.Tag
		Case "Zero"
'''			Dim cd1 As ColorDrawable
'''			Dim cd2 As ColorDrawable
'''			cd1.Initialize2(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			cd2.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			btnZero.Background = cd1
'''			btnless1.Background = cd2
'''			btnsole2.Background = cd2
'''			btnheels3.Background = cd2
'''			btnheels4.Background = cd2
'''			btnheels5.Background = cd2
			
			btnZero.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnless1.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnsole2.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels3.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels4.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels5.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			Common.ShoeHeightPref = 0
			Starter.sHeight = 0
			shoeSelection = 0
			LogColor("common.ShoeHeightPref = " & Common.ShoeHeightPref, Colors.Blue)
			LogColor("Starter.sHeight = " & Starter.sHeight, Colors.Blue)
			LogColor("shoeSelection = " & shoeSelection, Colors.Blue)
		Case "less1"
'''			Dim cd1 As ColorDrawable
'''			Dim cd2 As ColorDrawable
'''			cd1.Initialize2(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			cd2.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			btnless1.Background = cd1
'''			btnZero.Background = cd2
'''			btnsole2.Background = cd2
'''			btnheels3.Background = cd2
'''			btnheels4.Background = cd2
'''			btnheels5.Background = cd2
			
			btnless1.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnZero.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnsole2.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels3.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels4.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels5.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			
			Common.ShoeHeightPref = 1
			Starter.sHeight = 1
			shoeSelection = 1
			LogColor("common.ShoeHeightPref = " & Common.ShoeHeightPref, Colors.Blue)
			LogColor("Starter.sHeight = " & Starter.sHeight, Colors.Blue)
			LogColor("shoeSelection = " & shoeSelection, Colors.Blue)
		Case "sole2"
'''			Dim cd1 As ColorDrawable
'''			Dim cd2 As ColorDrawable
'''			cd1.Initialize2(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			cd2.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			btnsole2.Background = cd1
'''			btnless1.Background = cd2
'''			btnZero.Background = cd2
'''			btnheels3.Background = cd2
'''			btnheels4.Background = cd2
'''			btnheels5.Background = cd2
			
			btnsole2.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnless1.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnZero.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels3.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels4.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels5.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			Common.ShoeHeightPref = 2
			Starter.sHeight = 2
			shoeSelection = 2
			LogColor("common.ShoeHeightPref = " & Common.ShoeHeightPref, Colors.Blue)
			LogColor("Starter.sHeight = " & Starter.sHeight, Colors.Blue)
			LogColor("shoeSelection = " & shoeSelection, Colors.Blue)
		Case "heels3"
'''			Dim cd1 As ColorDrawable
'''			Dim cd2 As ColorDrawable
'''			cd1.Initialize2(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			cd2.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			btnheels3.Background = cd1
'''			btnless1.Background = cd2
'''			btnsole2.Background = cd2
'''			btnZero.Background = cd2
'''			btnheels4.Background = cd2
'''			btnheels5.Background = cd2
			
			btnheels3.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnless1.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnsole2.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnZero.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels4.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels5.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			Common.ShoeHeightPref = 3
			Starter.sHeight = 3
			shoeSelection = 3
			LogColor("common.ShoeHeightPref = " & Common.ShoeHeightPref, Colors.Blue)
			LogColor("Starter.sHeight = " & Starter.sHeight, Colors.Blue)
			LogColor("shoeSelection = " & shoeSelection, Colors.Blue)
		Case "heels4"
'''			Dim cd1 As ColorDrawable
'''			Dim cd2 As ColorDrawable
'''			cd1.Initialize2(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			cd2.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			btnheels4.Background = cd1
'''			btnless1.Background = cd2
'''			btnsole2.Background = cd2
'''			btnheels3.Background = cd2
'''			btnZero.Background = cd2
'''			btnheels5.Background = cd2
			
			btnheels4.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
			btnless1.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
			btnsole2.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
			btnheels3.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
			btnZero.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
			btnheels5.SetColorAndBorder(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
			Common.ShoeHeightPref = 4
			Starter.sHeight = 4
			shoeSelection = 4
			LogColor("common.ShoeHeightPref = " & Common.ShoeHeightPref, Colors.Blue)
			LogColor("Starter.sHeight = " & Starter.sHeight, Colors.Blue)
			LogColor("shoeSelection = " & shoeSelection, Colors.Blue)
		Case "heels5"
'''			Dim cd1 As ColorDrawable
'''			Dim cd2 As ColorDrawable
'''			cd1.Initialize2(xui.Color_ARGB(204, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			cd2.Initialize2(xui.Color_ARGB(51, 28, 30, 36), 10dip, 0, xui.Color_Transparent)
'''			btnheels5.Background = cd1
'''			btnless1.Background = cd2
'''			btnsole2.Background = cd2
'''			btnheels3.Background = cd2
'''			btnheels4.Background = cd2
'''			btnZero.Background = cd2
			
			btnheels5.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnless1.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnsole2.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels3.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnheels4.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			btnZero.SetColorAndBorder(xui.Color_ARGB(204, 28, 30, 36), 0, xui.Color_Transparent, 10dip)
			Common.ShoeHeightPref = 5
			Starter.sHeight = 5
			shoeSelection = 5
			LogColor("common.ShoeHeightPref = " & Common.ShoeHeightPref, Colors.Blue)
			LogColor("Starter.sHeight = " & Starter.sHeight, Colors.Blue)
			LogColor("shoeSelection = " & shoeSelection, Colors.Blue)
	End Select
End Sub
#End Region

Sub btnBackShoes_Click
	Log("btnBackShoes pressed")
	'''ASViewPager1.PreviousPage2
	'''Activity.Finish
	'''B4XPages.ClosePage(Me)
	B4XPages.ShowPageAndRemovePreviousPages("PictureScreen")
	B4XPages.GetPage("PictureScreen").As(PictureScreen).AnimateFromLeft
End Sub


Sub H2SideHeight_YPosition (Y As Double)
	'''	Log("H1 Top: " & (H1SideHeight.GetBase.Top + H1SideHeight.YPosition))
	'''	Log("H2 Top: " & (H2SideHeight.GetBase.Top + H2SideHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1SideHeight.GetBase.Top+H1SideHeight.YPosition) - (H2SideHeight.GetBase.Top+H2SideHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1SideHeight.LabelText = distanceString
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub H1SideHeight_YPosition (Y As Double)
	'''	Log("H1 Top: " & (H1SideHeight.GetBase.Top + H1SideHeight.YPosition))
	'''	Log("H2 Top: " & (H2SideHeight.GetBase.Top + H2SideHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1EyeHeight.GetBase.Top+H1EyeHeight.YPosition) - (H2EyeHeight.GetBase.Top+H2EyeHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1EyeHeight.LabelText = distanceString
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub H2EyeHeight_YPosition (Y As Double)
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1SideHeight.GetBase.Top+H1SideHeight.YPosition) - (H2SideHeight.GetBase.Top+H2SideHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1SideHeight.LabelText = distanceString
End Sub

Sub H1EyeHeight_YPosition (Y As Double)
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1EyeHeight.GetBase.Top+H1EyeHeight.YPosition) - (H2EyeHeight.GetBase.Top+H2EyeHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1EyeHeight.LabelText = distanceString
End Sub

Sub btnSaveSideHeight_Click
	Log("btnSaveSideHeight pressed, going to page 6")
	personHeight = CalculateFeetToInches(Starter.pHeight)
	Dim H1Y As Double = H1SideHeight.GetBase.Top+H1SideHeight.YPosition
	Dim H2Y As Double = H2SideHeight.GetBase.Top+H2SideHeight.YPosition
	LogColor("difference: " & (H2Y-H1Y), Colors.Blue)
	pixelMetric = personHeight / Abs(H2Y - H1Y)
	Dim distance As Double
	'''Dim distanceString  As String
	Dim distance2 As String
	distance = Abs((H1SideHeight.GetBase.Top+H1SideHeight.YPosition) - (H2SideHeight.GetBase.Top+H2SideHeight.YPosition)) * pixelMetric
	'''distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1SideHeight.LabelText = distance2
	Sleep(500)
	Common.H2SideHeightPosition = H2SideHeight.GetBase.Top
	ASViewPager1.NextPage2
End Sub

Sub btnBackSideHeight_Click
	Log("btnBackSideHeight pressed")
	ASViewPager1.PreviousPage2
End Sub

Sub btnBackShoeheight_Click
	Log("btnBackShoeHeight pressed")
	ASViewPager1.PreviousPage2
End Sub

Sub H2ElbowHeight_YPosition (Y As Double)
	'''	Log("H1 Top: " & (H1ElbowHeight.GetBase.Top + H1ElbowHeight.YPosition))
	'''	Log("H2 Top: " & (H2ElbowHeight.GetBase.Top + H2ElbowHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1ElbowHeight.GetBase.Top+H1ElbowHeight.YPosition) - (H2ElbowHeight.GetBase.Top+H2ElbowHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1ElbowHeight.LabelText = distanceString
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub H1ElbowHeight_YPosition (Y As Double)
	'''	Log("H1 Top: " & (H1ElbowHeight.GetBase.Top + H1ElbowHeight.YPosition))
	'''	Log("H2 Top: " & (H2ElbowHeight.GetBase.Top + H2ElbowHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1ElbowHeight.GetBase.Top+H1ElbowHeight.YPosition) - (H2ElbowHeight.GetBase.Top+H2ElbowHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1ElbowHeight.LabelText = distanceString
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub btnSaveElbowHeight_Click
	Log("btnSaveElbowHeight pressed, going to page 7")
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1ElbowHeight.GetBase.Top+H1ElbowHeight.YPosition) - (H2ElbowHeight.GetBase.Top+H2ElbowHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1ElbowHeight.LabelText = distance2
	'''ProgressDialogShow2("Saving Elbow Measurements to Remote DataBase", False)
	progressdialog.Show("Saving elbow measurements to remote database", xui.Color_White)
	wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("ELBOWHEIGHT":distance2))) Complete(Results As Map)
	If Results.IsInitialized And Results.ContainsKey("id") Then
		Sleep(500)
		progressdialog.hide
		ASViewPager1.NextPage2
	End If
End Sub

Private Sub btnSaveEyeHeight_Click
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1EyeHeight.GetBase.Top+H1EyeHeight.YPosition) - (H2EyeHeight.GetBase.Top+H2EyeHeight.YPosition)) * pixelMetric
'''	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1EyeHeight.LabelText = distance2
	'''ProgressDialogShow2("Saving Elbow Measurements to Remote DataBase", False)
	progressdialog.Show("Saving eye height measurements to remote database", xui.Color_White)
	wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("EYEHEIGHT":distance2))) Complete(Results As Map)
	If Results.IsInitialized And Results.ContainsKey("id") Then
		Sleep(500)
		progressdialog.hide
		ASViewPager1.NextPage2
	End If
End Sub

Sub btnBackElbowHeight_Click
	Log("btnBackElbowHeight pressed")
	ASViewPager1.PreviousPage2
End Sub

Private Sub btnBackEyeHeight_Click
	Log("btnBackEyeHeight pressed")
	ASViewPager1.PreviousPage2
End Sub

Sub H2LumbarHeight_Click (Tag As String)
	'''	Log("H1 Top: " & (H1LumbarHeight.GetBase.Top + H1LumbarHeight.YPosition))
	'''	Log("H2 Top: " & (H2LumbarHeight.GetBase.Top + H2LumbarHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1LumbarHeight.GetBase.Top+H1LumbarHeight.YPosition) - (H2LumbarHeight.GetBase.Top+H2LumbarHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1LumbarHeight.LabelText = distanceString
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub H1LumbarHeight_YPosition (Y As Double)
	'''	Log("H1 Top: " & (H1LumbarHeight.GetBase.Top + H1LumbarHeight.YPosition))
	'''	Log("H2 Top: " & (H2LumbarHeight.GetBase.Top + H2LumbarHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1LumbarHeight.GetBase.Top+H1LumbarHeight.YPosition) - (H2LumbarHeight.GetBase.Top+H2LumbarHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1LumbarHeight.LabelText = distanceString
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub btnSaveLumbarHeight_Click
	Log("btnSaveLumbarHeight pressed, going to page 8")
	'''ProgressDialogShow2("Saving Lumbar Height Measurements to DataBase!", False)
	progressdialog.Show("Saving lumbar height measurements to database", xui.Color_White)
	Dim distance As Double
	Dim distanceString As String
	Dim distance2 As String
	distance = Abs((H1LumbarHeight.GetBase.Top+H1LumbarHeight.YPosition) - (H2LumbarHeight.GetBase.Top+H2LumbarHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1LumbarHeight.LabelText = distanceString
	Starter.LUMBAR_HEIGHT = distance2
'''	Dim query As String
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
'''	query = $"UPDATE Registrations SET LUMBARHEIGHT = ${"'"&H1LumbarHeight.LabelText&"'"} WHERE UserName = ${"'"&Starter.userName&"'"} AND PinNumber = ${"'"&Starter.pinNumber&"'"}"$
'''	db.ExecuteRemoteQuery(query, "UPDATE")
'''	wait for QueryResults(Results2 As List)
'''	For i = 0 To Results2.Size - 1
'''		Dim m As Map
'''		m = Results2.Get(i)
'''		'''Starter.pHeight = m.Get("HEIGHT")
'''		'''Starter.sHeight = m.Get("SHOEHEIGHT")
'''		Log($"Updating Lumbar Height info: ${m}"$)
	'''	Next

	wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("LUMBARHEIGHT":H1LumbarHeight.LabelText))) Complete(Results As Map)
	If Results.IsInitialized And Results.ContainsKey("id") Then
		Sleep(500)
		progressdialog.hide
		ASViewPager1.NextPage2
	End If

'''	Common.mysql.AddNonQueryToBatch(query, Null)
'''	Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("LUMBARHEIGHT")
'''	Wait For (SenderFilter) LUMBARHEIGHT_NonQueryComplete (Success As Boolean)
'''	Log("Updated Registration table, setting new LUMBARHEIGHT: " & Success)


End Sub

Sub btnBackLumbarHeight_Click
	Log("btnBackLumbarHeight pressed")
	ASViewPager1.PreviousPage2
End Sub

Sub H2KneeHeight_YPosition (Y As Double)
	'''	Log("H1 Top: " & (H1KneeHeight.GetBase.Top + H1KneeHeight.YPosition))
	'''	Log("H2 Top: " & (H2KneeHeight.GetBase.Top + H2KneeHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1KneeHeight.GetBase.Top+H1KneeHeight.YPosition) - (H2KneeHeight.GetBase.Top+H2KneeHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1KneeHeight.LabelText = distanceString
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub H1KneeHeight_YPosition (Y As Double)
	'''	Log("H1 Top: " & (H1KneeHeight.GetBase.Top + H1KneeHeight.YPosition))
	'''	Log("H2 Top: " & (H2KneeHeight.GetBase.Top + H2KneeHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1KneeHeight.GetBase.Top+H1KneeHeight.YPosition) - (H2KneeHeight.GetBase.Top+H2KneeHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1KneeHeight.LabelText = distanceString
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub btnSaveKneeHeight_Click
	Log("btnSaveKneeHeight pressed, done")
	'''ProgressDialogShow2("Saving Knee Height Measurements to DataBase!", False)
	progressdialog.Show("Saving knee height measurements to database", xui.Color_White)
	Dim distance As Double
	Dim distanceString As String
	Dim distance2 As String
	distance = Abs((H1KneeHeight.GetBase.Top+H1KneeHeight.YPosition) - (H2KneeHeight.GetBase.Top+H2KneeHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1KneeHeight.LabelText = distance2
	Starter.KNEE_HEIGHT = H1KneeHeight.LabelText
'''	Dim query As String
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
'''	query = $"UPDATE Registrations SET KNEEHEIGHT = ${"'"&distance2&"'"} WHERE UserName = ${"'"&Starter.userName&"'"} AND PinNumber = ${"'"&Starter.pinNumber&"'"}"$
'''	db.ExecuteRemoteQuery(query, "UPDATE")
'''	wait for QueryResults(Results2 As List)
'''	For i = 0 To Results2.Size - 1
'''		Dim m As Map
'''		m = Results2.Get(i)
'''		'''Starter.pHeight = m.Get("HEIGHT")
'''		'''Starter.sHeight = m.Get("SHOEHEIGHT")
'''		Log($"Updating Knee height Info: ${m}"$)
	'''	Next

	wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("KNEEHEIGHT":distance2))) Complete(Results As Map)
	If Results.IsInitialized And Results.ContainsKey("id") Then
		Sleep(500)
'''		progressdialog.hide
		'''		ASViewPager1.NextPage2
	End If
	
	
	Dim path As PathBuilder
	path.Initialize
	path.Document("StromDB/Registrations/")
	Log("path: " & path.Complete)
	Dim fand As CompositeFilter
	Dim filter As FieldFilter
	filter.Initialize.EqualTo("UserName", Starter.userName).EqualTo("PinNumber", Starter.pinNumber)
	fand.Initialize.Filters(filter)
	Dim qry As Query
	qry.Initialize.From("Users").OrderBy("UserName", qry.ASCENDING).CollectionIn(path).Where(fand)
	wait for (B4XPages.MainPage.store.RunQuery(qry)) Complete(Results As Map)
	Log("results: " & Results)
	Dim json As JSONParser
	Dim s As String = Results.Get("documents")
	'''Dim m As Map
	Dim l As List
	If s <> "" Then
	json.Initialize(s)
	Try
		l = json.NextArray
		For Each val As Map In l
			height = val.Get("Height")
			lumbar = val.Get("LUMBARHEIGHT")
			knee = val.Get("KNEEHEIGHT")
			elbow = val.Get("ELBOWHEIGHT")
			buttocks = val.Get("BUTTOCKSHEIGHT")
			hip = val.Get("HIPWIDTH")
			elbowwidth = val.Get("ELBOWWIDTH")
			shoe = val.Get("SHOEHEIGHT")
			positionpref = val.Get("POSITIONPREF")
			Common.EMAIL = val.Get("EMAIL")
		Next
	Catch
		Log(LastException)
		End Try
	End If
	
	Dim constant As Int
	If positionpref = "Perch" Then
		constant = -5
		tiltangle = -5
	else if positionpref = "Neutral" Then
		constant = 0
		tiltangle = 0
	else if positionpref = "Reclined" Or positionpref = "Recline" Then
		constant = 5
		tiltangle = 5
	Else
		constant = 0
		tiltangle = 0
	End If
	
	Try
		heightadd = ((Tan(constant*cPI/180))*(elbowwidth-7.14))*(-1)
	Catch
		Log("error performing calculation")
	End Try
	
	Dim path As PathBuilder
	path.Initialize
	path.Document("StromDB/ManualSettings/")
	Log("path: " & path.Complete)
	Dim fand As CompositeFilter
	Dim filter As FieldFilter
	filter.Initialize.EqualTo("UserName", Starter.userName).EqualTo("Password", Starter.pinNumber)
	fand.Initialize.Filters(filter)
	Dim qry As Query
	qry.Initialize.From("Measurements").OrderBy("UserName", qry.ASCENDING).CollectionIn(path).Where(fand)
	wait for (B4XPages.MainPage.store.RunQuery(qry)) Complete(Results As Map)
	Log("results: " & Results)
	Dim json As JSONParser
	Dim s As String = Results.Get("documents")
	Dim l As List
	If s <> "" Then
	json.Initialize(s)
	l = json.NextArray
'''	For Each val As Map In l
	'''If val.ContainsKey("id") Then
	Dim val As Map
	If l.Size > 0 Then
		val = l.Get(0)
		Common.SeatHeight = NumberFormat(knee + heightadd, 0, 1)/Common.mmConstant
		Common.SeatWidth = NumberFormat(elbowwidth, 0, 1)/Common.mmConstant
		Common.SeatDepth = NumberFormat(elbowwidth, 0,1)/Common.mmConstant
		Common.SeatTilt = tiltangle
		Common.ArmRestWidth = NumberFormat(elbowwidth, 0, 1)/Common.mmConstant
		Common.ArmRestHeight = NumberFormat((elbow - buttocks) + knee, 0, 1)/Common.mmConstant
		Common.LumbarHeight = NumberFormat((lumbar - buttocks) + knee, 0, 1)/Common.mmConstant
		Common.BackRestAngle = 100
		Common.InflatableLumbarSupport = 50
		Common.ManualSettingsCollectionID = val.Get("id")
		'''
		'''		Dim updateQuery As String = "UPDATE ManualSettings SET SeatHeight = " & "'"&(NumberFormat(knee + heightadd, 0, 1)/Common.mmConstant)&"'" & " ,SeatWidth = " & "'"&(NumberFormat(elbowwidth, 0, 1)/Common.mmConstant)&"'"& " ,SeatDepth = " & "'"&(NumberFormat(elbowwidth, 0,1)/Common.mmConstant)&"'" & " ,SeatTilt="&"'"&tiltangle&"'" & " ,ArmRestWidth="&"'"&(NumberFormat(elbowwidth, 0, 1)/Common.mmConstant)&"'" & _
		'''		" ,ArmRestHeight="&"'"&(NumberFormat((elbow - buttocks) + knee, 0, 1)/Common.mmConstant)&"'" & " ,LumbarHeight="&"'"&(NumberFormat((lumbar - buttocks) + knee, 0, 1)/Common.mmConstant)&"'" & ", BackRestAngle="&"'"&Common.BackRestAngle&"'" & ", InflatableLumbarSupport=" & "'"&Common.InflatableLumbarSupport&"'" & _
		'''		" WHERE UserName = " &"'"&Starter.userName&"'" & " AND Password = " & "'"&Starter.pinNumber&"'"
		'''		Dim db As DBTransactions
		'''		db.Initialize(Me)
		'''		db.ExecuteRemoteQuery(updateQuery, "UPDATE")
		'''		wait for QueryResults(Results2 As List)
		'''		Dim m As Map = Results2.Get(0)
		'''		LogColor("Updated ManualSettings " & m, xui.Color_Magenta)
		'''		'''progressdialog.hide
		'''		progressdialog.Hide
		'''		Sleep(500)
		wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/ManualSettings/Measurements", Common.ManualSettingsCollectionID, CreateMap("SeatHeight":(NumberFormat(knee + heightadd, 0, 1)/Common.mmConstant), "SeatWidth":(NumberFormat(elbowwidth, 0, 1)/Common.mmConstant), "SeatTilt":tiltangle, "ArmRestWidth":(NumberFormat(elbowwidth, 0, 1)/Common.mmConstant), _
		"ArmRestHeight":NumberFormat((elbow - buttocks) + knee, 0, 1)/Common.mmConstant, "LumbarHeight":(NumberFormat((lumbar - buttocks) + knee, 0, 1)/Common.mmConstant), "BackRestAngle":Common.BackRestAngle, "InflatableLumbarSupport":Common.InflatableLumbarSupport))) Complete(Results As Map)
		
	Else
		Try
			Common.SeatHeight = NumberFormat(knee + heightadd, 0, 1)/Common.mmConstant
			Common.SeatWidth = NumberFormat(elbowwidth, 0, 1)/Common.mmConstant
			Common.SeatDepth = NumberFormat(elbowwidth, 0,1)/Common.mmConstant
			Common.SeatTilt = tiltangle
			Common.ArmRestWidth = NumberFormat(elbowwidth, 0, 1)/Common.mmConstant
			Common.ArmRestHeight = NumberFormat((elbow - buttocks) + knee, 0, 1)/Common.mmConstant
			Common.LumbarHeight = NumberFormat((lumbar - buttocks) + knee, 0, 1)/Common.mmConstant
			Common.BackRestAngle = 100
			Common.InflatableLumbarSupport = 50
			'''Dim insertQuery As String = "INSERT INTO ManualSettings (UserName, EMAIL, Password, SeatHeight, SeatWidth, SeatDepth, SeatTilt, ArmRestWidth, ArmRestHeight, LumbarHeight, BackRestAngle, InflatableLumbarSupport) VALUES " & "(" & "'"&Starter.userName&"'" & "," & "'"&Common.EMAIL&"', " & " '"&Starter.pinNumber&"'" & "," & "'"&Common.SeatHeight&"',  " & "'"&Common.SeatWidth&"'," &"'"&Common.SeatDepth&"', " & "'"&tiltangle&"', " & "'"& Common.ArmRestWidth &"', " & "'"&Common.ArmRestHeight&"', " & "'"&Common.LumbarHeight&"', " & "'"&Common.BackRestAngle&"', " & "'"&Common.InflatableLumbarSupport&"'" & ")"
		Catch
			Log("error inserting values into manualsettings table")
			'''Return
		End Try
		'''		Try
		'''			db.ExecuteRemoteQuery(insertQuery, "INSERT")
		'''			wait for QueryResults(Results2 As List)
		'''			For i = 0 To Results2.Size - 1
		'''				Dim m As Map = Results2.Get(i)
		'''				LogColor("Inserted record into ManualSettings " & m, xui.Color_Magenta)
		'''			Next
		'''			progressdialog.hide
		'''			Sleep(500)
		'''		Catch
		'''			LogColor("new record inserted into ManualSettings", Colors.Blue)
		'''		End Try
		'''	End If
		Dim path As PathBuilder
		path.Initialize
		path.Collection("StromDB").Document("ManualSettings").Collection("Measurements")
		wait for (B4XPages.MainPage.store.CreateDocument(path.Complete, "", CreateMap("UserName":Common.userName, "Password":Common.pinNumber, _
		"SeatHeight":Common.SeatHeight, "SeatWidth":Common.SeatWidth, "SeatDepth":Common.SeatDepth, "SeatTilt":Common.SeatTilt, "ArmRestWidth":Common.ArmRestWidth, _
		"ArmRestHeight":Common.ArmRestHeight, "LumbarHeight":Common.LumbarHeight, "BackRestAngle":Common.BackRestAngle, "InflatableLumbarSupport":Common.InflatableLumbarSupport))) Complete(Results As Map)
		LogColor("created document: " & Results, xui.Color_Blue)
		If Results.IsInitialized And Results.Size > 0 Then
			If Results.ContainsKey("id") Then
				progressdialog.Hide
				Sleep(500)
			End If
		End If
		End If
	'''Next
	End If

		'''	If count > 0 Then

	
	progressdialog.hide
	Sleep(250)
	B4XPages.ShowPageAndRemovePreviousPages("MeasurementsDone")
	B4XPages.GetPage("MeasurementsDone").As(MeasurementsDone).AnimateFromRight
	
'''	Dim query As String = "SELECT Height, LUMBARHEIGHT, KNEEHEIGHT, ELBOWHEIGHT, BUTTOCKSHEIGHT, HIPWIDTH, ELBOWWIDTH, SHOEHEIGHT, POSITIONPREF FROM Registrations WHERE UserName = " & "'"&Starter.userName&"'" & " AND PinNumber = " & "'"&Starter.pinNumber&"'"
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
'''	db.ExecuteRemoteQuery(query, "SELECTCOLUMNS")
'''	wait for QueryResults(Results As List)
'''	For i = 0 To Results.Size - 1
'''		Dim m As Map = Results.Get(i)
'''		height = m.get("Height")
'''		lumbar = m.get("LUMBARHEIGHT")
'''		knee = m.get("KNEEHEIGHT")
'''		elbow = m.get("ELBOWHEIGHT")
'''		buttocks = m.get("BUTTOCKSHEIGHT")
'''		hip = m.get("HIPWIDTH")
'''		elbowwidth = m.get("ELBOWWIDTH")
'''		shoe = m.get("SHOEHEIGHT")
'''		positionpref = m.get("POSITIONPREF")
'''	Next
'''	
'''	Dim constant As Int
'''	If positionpref = "Perch" Then
'''		constant = -5
'''		tiltangle = -5
'''	else if positionpref = "Neutral" Then
'''		constant = 0
'''		tiltangle = 0
'''	else if positionpref = "Reclined" Or positionpref = "Recline" Then
'''		constant = 5
'''		tiltangle = 5
'''	Else
'''		constant = 0
'''		tiltangle = 0
'''	End If
'''	
'''	Try
'''		heightadd = ((Tan(constant*cPI/180))*(elbowwidth-7.14))*(-1)
'''	Catch
'''		Log("error performing calculation")
'''	End Try
'''	
'''	Dim queryemail As String = "SELECT EMAIL FROM Registrations WHERE UserName = " & "'"&Starter.userName&"'" & " AND PinNumber = " & "'"&Starter.pinNumber&"'"
'''	Dim db2 As DBTransactions
'''	db2.Initialize(Me)
'''	db2.ExecuteRemoteQuery(queryemail, "SELECTCOLUMNS")
'''	wait for QueryResults(Results2 As List)
'''	For i = 0 To Results2.Size - 1
'''		Dim m As Map = Results2.Get(i)
'''		Common.EMAIL = m.Get("EMAIL")
'''	Next
'''	
'''	Dim count As Int = 0
'''	Dim query As String = "SELECT count(*) FROM ManualSettings WHERE UserName = " & "'"&Starter.userName&"'" & " AND Password = " & "'"&Starter.pinNumber&"'"
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
'''	db.ExecuteRemoteQuery(query, "UPDATETABLE")
'''	Log("select count query: " & query)
'''	wait for QueryResults(Results2 As List)
'''	Log("after select count query: " & Results2)
'''	For i = 0 To Results2.Size - 1
'''		Dim m As Map
'''		m = Results2.Get(i)
'''		'''		Log("m: " & m.GetKeyAt(0) & " -- " & m.GetValueAt(0))
'''		Try
'''			count = m.Get("count(*)")
'''		Catch
'''			count = 0
'''		End Try
'''		'''exists = m.Get("count(*)")
'''	Next
	
'''	If count > 0 Then
'''		Common.SeatHeight = NumberFormat(knee + heightadd, 0, 1)/Common.mmConstant
'''		Common.SeatWidth = NumberFormat(elbowwidth, 0, 1)/Common.mmConstant
'''		Common.SeatDepth = NumberFormat(elbowwidth, 0,1)/Common.mmConstant
'''		Common.SeatTilt = tiltangle
'''		Common.ArmRestWidth = NumberFormat(elbowwidth, 0, 1)/Common.mmConstant
'''		Common.ArmRestHeight = NumberFormat((elbow - buttocks) + knee, 0, 1)/Common.mmConstant
'''		Common.LumbarHeight = NumberFormat((lumbar - buttocks) + knee, 0, 1)/Common.mmConstant
'''		Common.BackRestAngle = 100
'''		Common.InflatableLumbarSupport = 50
'''				
'''		Dim updateQuery As String = "UPDATE ManualSettings SET SeatHeight = " & "'"&(NumberFormat(knee + heightadd, 0, 1)/Common.mmConstant)&"'" & " ,SeatWidth = " & "'"&(NumberFormat(elbowwidth, 0, 1)/Common.mmConstant)&"'"& " ,SeatDepth = " & "'"&(NumberFormat(elbowwidth, 0,1)/Common.mmConstant)&"'" & " ,SeatTilt="&"'"&tiltangle&"'" & " ,ArmRestWidth="&"'"&(NumberFormat(elbowwidth, 0, 1)/Common.mmConstant)&"'" & _
'''		" ,ArmRestHeight="&"'"&(NumberFormat((elbow - buttocks) + knee, 0, 1)/Common.mmConstant)&"'" & " ,LumbarHeight="&"'"&(NumberFormat((lumbar - buttocks) + knee, 0, 1)/Common.mmConstant)&"'" & ", BackRestAngle="&"'"&Common.BackRestAngle&"'" & ", InflatableLumbarSupport=" & "'"&Common.InflatableLumbarSupport&"'" & _
'''		" WHERE UserName = " &"'"&Starter.userName&"'" & " AND Password = " & "'"&Starter.pinNumber&"'"
'''		Dim db As DBTransactions
'''		db.Initialize(Me)
'''		db.ExecuteRemoteQuery(updateQuery, "UPDATE")
'''		wait for QueryResults(Results2 As List)
'''		Dim m As Map = Results2.Get(0)
'''		LogColor("Updated ManualSettings " & m, xui.Color_Magenta)
'''		'''progressdialog.hide
'''		progressdialog.Hide
'''		Sleep(500)
'''	Else
'''		Try
'''			Common.SeatHeight = NumberFormat(knee + heightadd, 0, 1)/Common.mmConstant
'''			Common.SeatWidth = NumberFormat(elbowwidth, 0, 1)/Common.mmConstant
'''			Common.SeatDepth = NumberFormat(elbowwidth, 0,1)/Common.mmConstant
'''			Common.SeatTilt = tiltangle
'''			Common.ArmRestWidth = NumberFormat(elbowwidth, 0, 1)/Common.mmConstant
'''			Common.ArmRestHeight = NumberFormat((elbow - buttocks) + knee, 0, 1)/Common.mmConstant
'''			Common.LumbarHeight = NumberFormat((lumbar - buttocks) + knee, 0, 1)/Common.mmConstant
'''			Common.BackRestAngle = 100
'''			Common.InflatableLumbarSupport = 50
'''			Dim insertQuery As String = "INSERT INTO ManualSettings (UserName, EMAIL, Password, SeatHeight, SeatWidth, SeatDepth, SeatTilt, ArmRestWidth, ArmRestHeight, LumbarHeight, BackRestAngle, InflatableLumbarSupport) VALUES " & "(" & "'"&Starter.userName&"'" & "," & "'"&Common.EMAIL&"', " & " '"&Starter.pinNumber&"'" & "," & "'"&Common.SeatHeight&"',  " & "'"&Common.SeatWidth&"'," &"'"&Common.SeatDepth&"', " & "'"&tiltangle&"', " & "'"& Common.ArmRestWidth &"', " & "'"&Common.ArmRestHeight&"', " & "'"&Common.LumbarHeight&"', " & "'"&Common.BackRestAngle&"', " & "'"&Common.InflatableLumbarSupport&"'" & ")"
'''		Catch
'''			Log("error inserting values into manualsettings table")
'''			'''Return
'''		End Try
'''		Try
'''			db.ExecuteRemoteQuery(insertQuery, "INSERT")
'''			wait for QueryResults(Results2 As List)
'''			For i = 0 To Results2.Size - 1
'''				Dim m As Map = Results2.Get(i)
'''				LogColor("Inserted record into ManualSettings " & m, xui.Color_Magenta)
'''			Next
'''			progressdialog.hide
'''			Sleep(500)
'''		Catch
'''			LogColor("new record inserted into ManualSettings", Colors.Blue)
'''		End Try
'''	End If



End Sub

Sub btnBackKneeHeight_Click
	Log("btnBackKneeHeight pressed")
	ASViewPager1.PreviousPage2
End Sub

Sub btnBackButtocksHeight_Click
	Log("btnBackButtocksHeight pressed")
	ASViewPager1.PreviousPage2
End Sub

Sub btnSaveButtocksHeight_Click
	Log("btnSaveButtocksHeight pressed, going to page 9")
	'''ProgressDialogShow2("Saving Buttocks Height Measurements to DataBase!", False)
	progressdialog.Show("Saving buttocks height measurmenets", xui.Color_White)
	Dim distance As Double
	Dim distanceString As String
	Dim distance2 As String
	distance = Abs((H1ButtocksHeight.GetBase.Top+H1ButtocksHeight.YPosition) - (H2ButtocksHeight.GetBase.Top+H2ButtocksHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1ButtocksHeight.LabelText = distance2
	Starter.BUTTOCKS_HEIGHT = H1ButtocksHeight.LabelText
'''	Dim query As String
'''	Dim db As DBTransactions
'''	db.Initialize(Me)
'''	query = $"UPDATE Registrations SET BUTTOCKSHEIGHT = ${"'"&distance2&"'"} WHERE UserName = ${"'"&Starter.userName&"'"} AND PinNumber = ${"'"&Starter.pinNumber&"'"}"$
'''	db.ExecuteRemoteQuery(query, "UPDATE")
'''	wait for QueryResults(Results2 As List)
'''	For i = 0 To Results2.Size - 1
'''		Dim m As Map
'''		m = Results2.Get(i)
'''		'''Starter.pHeight = m.Get("HEIGHT")
'''		'''Starter.sHeight = m.Get("SHOEHEIGHT")
'''		Log($"Updating Buttocks height Info: ${m}"$)
	'''	Next

	wait for (B4XPages.MainPage.store.UpdateDocument("StromDB/Registrations/Users", Common.Collection, CreateMap("BUTTOCKSHEIGHT":distance2))) Complete(Results As Map)
	If Results.IsInitialized And Results.ContainsKey("id") Then
		Sleep(500)
		'''		progressdialog.hide
		'''		ASViewPager1.NextPage2
		progressdialog.hide
		ASViewPager1.NextPage2
	End If

	

'''	Common.mysql.AddNonQueryToBatch(query, Null)
'''	Dim SenderFilter As Object = Common.mysql.ExecNonQueryBatch("BUTTOCKSHEIGHT")
'''	Wait For (SenderFilter) BUTTOCKSHEIGHT_NonQueryComplete (Success As Boolean)
'''	Log("Updated Registration table, setting new BUTTOCKSHEIGHT: " & Success)


End Sub

Sub H1ButtocksHeight_YPosition (Y As Double)
	'''	Log("H1 Top: " & (H1ButtocksHeight.GetBase.Top + H1ButtocksHeight.YPosition))
	'''	Log("H2 Top: " & (H2ButtocksHeight.GetBase.Top + H2ButtocksHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1ButtocksHeight.GetBase.Top+H1ButtocksHeight.YPosition) - (H2ButtocksHeight.GetBase.Top+H2ButtocksHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1ButtocksHeight.LabelText = distance2
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub H2ButtocksHeight_YPosition (Y As Double)
	'''	Log("H1 Top: " & (H1ButtocksHeight.GetBase.Top + H1ButtocksHeight.YPosition))
	'''	Log("H2 Top: " & (H2ButtocksHeight.GetBase.Top + H2ButtocksHeight.YPosition))
	Dim distanceString  As String
	Dim distance As Double
	Dim distance2 As String
	distance = Abs((H1ButtocksHeight.GetBase.Top+H1ButtocksHeight.YPosition) - (H2ButtocksHeight.GetBase.Top+H2ButtocksHeight.YPosition)) * pixelMetric
	distanceString = distance
	'''distance = Round(distance)
	distance2 = NumberFormat(distance, 0, 2)
	H1ButtocksHeight.LabelText = distance2
	'''	LogColor("distance is now: " & $"${distance2}"$, Colors.Magenta)
End Sub

Sub ASBottomMenu1_Tab1Click
	Log("home clicked")
'''	Activity.Finish
'''	StartActivity(MainMenu)
	B4XPages.ClosePage(Me)
	B4XPages.ShowPage("MainMenu")
End Sub

Sub ASBottomMenu1_Tab2Click
	Log("profile clicked")
	'''Activity.Finish
	'''StartActivity(Profile2)
	B4XPages.ClosePage(Me)
	B4XPages.ShowPage("Profile2")
End Sub

Sub ASBottomMenu1_Tab3Click
	Log("help clicked")
	'''Activity.Finish
	'''StartActivity(Contact)
	B4XPages.ClosePage(Me)
	B4XPages.ShowPage("Contact")
End Sub

Sub ASBottomMenu1_Tab4Click
	Log("shopping clicked")
	''https://stromergonomics.com/
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_highlighted.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(49, 211, 184)
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("close request called")
	Return False
End Sub