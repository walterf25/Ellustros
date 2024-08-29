B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.96
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	Private height, lumbar, knee, elbow, buttocks, hip, elbowwidth, shoe, positionpref, eyeheight As String
	Private tiltangle As Double
	Private heightadd As Double
	Private lottieview As LottieView
	Private imgLogo As B4XView
	Private lblTitle As B4XView
	Private ASBottomMenu1 As ASBottomMenu
	
	Type XYPosition (layerName As String, posX As Float, posY As Float, roation As Float, anchorX As Float, anchorY As Float, ScaleX As Float, ScaleY As Float)
	Private ScaleY As Float
	Private ScaleX As Float
	Private LayersInfo As List
	Private btnBack As B4XView
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
'load the layout to Root
	Root.LoadLayout("SeatingRecommendations")
	Root.Color = xui.Color_White
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.PartinglineVisible = False
	ASBottomMenu1.UnderlineVisible = False
	ASBottomMenu1.SelectedPageIconColor = xui.color_RGB(164, 212, 232)
	ASBottomMenu1.MiddleButtonVisible = False
	ASBottomMenu1.BadgetColor1 = Colors.Black
	ASBottomMenu1.BadgetColor2 = Colors.Black
	ASBottomMenu1.BadgetColor4 = Colors.Black
	
	btnBack.Color = xui.Color_Transparent
	
	lblTitle.font = Common.myfont
	lblTitle.TextSize = 36
	'''lblTitle.Text = "STRÖM Bespoke"
	lblTitle.Text = Common.ellustros & " Bespoke"
	lblTitle.TextColor = Common.TitleColor
	
	imgLogo.SetBitmap(LoadBitmap(File.DirAssets, "group 7191@3x.png"))
	#If B4A
	imgLogo.As(ImageView).Gravity = Gravity.FILL
	#End If
	
	lottieview.Initialize("lottie")
	Root.AddView(lottieview, 0, imgLogo.Top+lblTitle.Height + 100dip, 450dip, 450dip)
	lottieview.setAnimationFromJson("measurements_v4.json")
	
	''''''[370.427,355.787,0]
'''	Dim mlayer As KeyPath
'''	mlayer.Initialize("6")
'''	Dim drawable As Drawable
'''	Log("lottie drawable: " & lottieview.getDrawable)
'''	drawable.Initialize(lottieview.getDrawable, mlayer)
'''	drawable.addValueCallback(370.427, 150.0)

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
				eyeheight = val.Get("EYEHEIGHT")
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
			Common.SeatHeight = NumberFormat(knee + heightadd, 0, 1)'''/Common.mmConstant
			Common.SeatWidth = NumberFormat(elbowwidth, 0, 1)'''/Common.mmConstant
			Common.SeatDepth = NumberFormat(elbowwidth, 0,1)'''/Common.mmConstant
			Common.SeatTilt = tiltangle
			Common.ArmRestWidth = NumberFormat(elbowwidth, 0, 1)'''/Common.mmConstant
			Common.EyeHeight = NumberFormat(eyeheight - buttocks + knee, 0, 1)
			Common.ArmRestHeight = NumberFormat((elbow - buttocks) + knee, 0, 1)'''/Common.mmConstant
			Common.LumbarHeight = NumberFormat((lumbar - buttocks) + knee, 0, 1)'''/Common.mmConstant
			Common.BackRestAngle = 100
			Common.InflatableLumbarSupport = 50
			Common.ManualSettingsCollectionID = val.Get("id")
		End If
	End If
	
	
	CalculateScaleXY
	
	Dim j As JSONParser
	j.Initialize(File.ReadString(File.DirAssets, "measurements_v4.json"))
	
	Dim m As Map = j.NextObject
	Log("m: " & m)
	Dim Layers As List = m.Get("layers")
	LayersInfo = ParseJson(Layers)
	
	
	Dim parentLayer As XYPosition
	Dim childLayer As XYPosition
	parentLayer.Initialize

	For Each layer As XYPosition In LayersInfo
		If layer.layerName = "N" Then
			parentLayer = layer
			Exit
		End If
	Next
	
	For Each layerdata As XYPosition In LayersInfo

		If layerdata.layerName <> "N" Then
			childLayer = layerdata
			Log("layer name: " & childLayer.layerName)
			'''Dim xy_abs As XYPosition
	
			'''xy_abs = calculateAbsolutePosition(parentLayer, childLayer)
			Dim lbl As Label
			lbl.Initialize("")
			lbl.Tag = childLayer.layerName
			'''lbl.Font = Common.myfont
			lbl.Typeface = Typeface.LoadFromAssets("cera pro black.otf")
			Select childLayer.layerName
				Case "8"
					lbl.Text = Common.ArmRestWidth
					'''lbl.Text = "8"
				Case "7"
					lbl.Text = Common.SeatDepth
					'''lbl.Text = "7"
				Case "6"
					lbl.Text = Common.EyeHeight
					'''lbl.Text = "6"
				Case "5"
					lbl.Text = Common.ArmRestHeight
					'''lbl.Text = "5"
				Case "4"
					lbl.Text = Common.SeatHeight
					'''lbl.Text = "4"
				Case "3"
					lbl.Text = Common.ArmRestHeight
					'''lbl.Text = "3"
				Case "2"
					lbl.Text = Common.LumbarHeight '''NumberFormat(Common.BackRestAngle, 0, 0)
					'''lbl.Text = "2"
				Case "1"
					lbl.Text = "105" ''Common.SeatTilt
					'''lbl.Text = "1"
			End Select
			'''[370.427,355.787,0]
			lbl.TextColor = Common.TitleColor
			lbl.TextSize = 12
			lbl.Visible = False
			Dim offsetY As Float = (lottieview.Top * Density)
			LogColor("offsetY: " & offsetY, xui.Color_Blue)
			LogColor("position.X: " & ((childLayer.posX - childLayer.anchorX) * ScaleX), xui.Color_Blue)
			LogColor("position.Y: " & ((childLayer.posY - childLayer.anchorY) * ScaleY + lottieview.top), xui.Color_Blue)
			Root.AddView(lbl, (childLayer.posX - childLayer.anchorX) * ScaleX - 10dip, (childLayer.posY - childLayer.anchorY) * ScaleY + lottieview.top - (20dip/2), 30dip, 20dip)
		End If
	Next
	
	lottieview.setRepeatCount(0)
	'''lottieview.StartAnimation
End Sub

'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Sub lottie_AnimationStarted()
	Log("animation Stated")
End Sub

Sub lottie_AnimationEnded()
	Log("animation ended")

	For Each v As B4XView In Root.GetAllViewsRecursive
		Log("view: " & v)
		Log("view tag: " & v.Tag)
		Log("type: " & GetType(v))
		If v Is Label And v.Tag <> Null And (v.Tag = "8" Or v.Tag = "7" Or v.Tag = "6" Or v.Tag = "5" Or v.Tag = "4" Or v.Tag = "3" Or v.Tag = "2" Or v.Tag = "1") Then
			Dim lbl As Label = v
			lbl.Visible = True
		End If
	Next
	
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
	'''StartActivity(Profile2)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
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
	'''StartActivity(helpMenu)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_normal.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_highlighted.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(164, 212, 232)
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
	ASBottomMenu1.SelectedPageIconColor = Colors.RGB(49, 211, 184)
	Dim p As PhoneIntents
	StartActivity(p.OpenBrowser("https://ellustros.com/"))
End Sub

Sub B4XPage_Appear
	LogColor("Seating just appeared....", Colors.Blue)
	ASBottomMenu1.Icon1 = LoadBitmap(File.DirAssets,"home_normal.png")
	ASBottomMenu1.Icon2 = LoadBitmap(File.DirAssets, "profile_highlighted.png")
	ASBottomMenu1.Icon3 = LoadBitmap(File.DirAssets, "help_normal.png")
	ASBottomMenu1.Icon4 = LoadBitmap(File.DirAssets, "shopping_normal.png")
	'''ASBottomMenu1.CurrentTab = 2
	'''ASBottomMenu1_Tab2Click
	If lottieview.IsInitialized Then
		lottieview.StartAnimation
	End If
End Sub

Sub B4XPage_Disappear
	Log("Seating disappeared...")
	For Each v As B4XView In Root.GetAllViewsRecursive
		Log("view: " & v)
		Log("view tag: " & v.Tag)
		Log("type: " & GetType(v))
		If v Is Label And v.Tag <> Null And (v.Tag = "8" Or v.Tag = "7" Or v.Tag = "6" Or v.Tag = "5" Or v.Tag = "4" Or v.Tag = "3" Or v.Tag = "2" Or v.Tag = "1") Then
			Dim lbl As Label = v
			lbl.Visible = False
		End If
	Next
	lottieview.PauseAnimation
End Sub

Sub B4XPage_CloseRequest As ResumableSub
	Log("Seating close request called")
	Return False
End Sub

Private Sub CalculateScaleXY
	Dim originalWidth As Int = 450
	Dim orignalHeight As Int = 450
	Dim lottieWidth As Float = lottieview.Width
	Dim lottieHeight As Float = lottieview.Height
	'''	Dim realWidth As Float = GetRealWidth
	'''	Dim realHeight As Float = GetRealHeight
	
	ScaleX = lottieWidth / originalWidth
	ScaleY = lottieHeight / orignalHeight
	Log("ScaleX: " & ScaleX)
	Log("ScaleY: " & ScaleY)
End Sub

Private Sub ParseJson(layers As List)As List
	Dim layerInfo As List
	layerInfo.Initialize
	
	For Each m As Map In layers
		Log("m: " & m)
		Dim layerdata As XYPosition
		layerdata.Initialize
		Dim ks As Map = m.Get("ks")
		Dim layername As String = m.Get("nm")
		Log("layer name: " & layername)
		'''layerInfo.Put(layername&"_"&"layerName", layername)
		layerdata.layerName = layername
		If layername = "N" Or layername = "1" Or layername = "2" _
		Or layername = "3" Or layername = "4" Or layername = "5" _
		Or layername = "6" Or layername = "7" Or layername = "8" And Not(ks.ContainsKey("y")) Then
			Dim angle As Map = ks.Get("r")
			Log("angle: " & angle)
			Dim kvalue As Object
			kvalue = angle.Get("k")
			Log("angle type: " & GetType(kvalue))
			If GetType(kvalue) = "java.lang.Double" Or GetType(kvalue) = "java.lang.Integer" Then
				Dim mrotation As Float = angle.Get("k")
				Dim scale As Map = ks.Get("s")
				Dim anchor As Map = ks.Get("a")
				Log("angle: " & angle)
				Log("Scale: " & scale)
				Log("anchor: " & anchor)
				Dim pos As Map = ks.Get("p")
				Dim k As List = pos.Get("k")
				Log("layer: " & layername & " pos: " & k)
				Dim manchor As List = anchor.Get("k")
				Dim mmscale As Object = scale.Get("k")
				Log("mscale type: " & GetType(mmscale))
				If mmscale Is List Then
					Dim mscale As List = mmscale
					Log("mscale: " & mscale)
					'''For Each o As Object In mscale
					Dim o As Object = mscale.Get(1)
					Log("o: " & o)
					If o Is Map Then
						Dim escala As Map = o
						Log("time: " & escala.Get("t"))
						Log("scale: " & escala.Get("s"))
						Dim mscale As List = escala.Get("s")
						Log("scaleList: " & mscale)
						Log("get type: " & GetType(0))
					Else if o Is List Then
						Dim mscale As List = o
					End If
					'''Next
				Else
			
				End If
		
		
				'''layerInfo.Put("Rotation", mrotation)
				layerdata.roation = mrotation
				For i = 0 To k.Size - 1
					If i = 0 Then
						'''layerInfo.Put(layername&"_"&"posX", k.get(i))
						layerdata.posX = k.Get(i)'''*ScaleX
					Else if i = 1 Then
						'''layerInfo.Put(layername&"_"&"posY", k.Get(i))
						layerdata.posY = k.Get(i)'''*ScaleY
					End If
				Next
				For j = 0 To manchor.Size - 1
					If j = 0 Then
						''layerInfo.Put(layername&"_"&"anchorX", manchor.Get(j))
						layerdata.anchorX = manchor.Get(j)'''*ScaleX
					else if j = 1 Then
						'layerInfo.Put(layername&"_"&"anchorY", manchor.Get(j))
						layerdata.anchorY = manchor.Get(j)'''*ScaleY
					End If
				Next
				For t = 0 To mscale.Size - 1
					If t = 0 Then
						'''layerInfo.Put(layername&"_"&"scaleX", mscale.Get(t))
						layerdata.ScaleX = mscale.Get(t)
					else if t = 1 Then
						'''layerInfo.Put(layername&"_"&"scaleY", mscale.Get(t))
						layerdata.ScaleY = mscale.Get(t)
					End If
				Next
				layerInfo.Add(layerdata)
			End If
		End If
		If layername == "N" Then Exit
	Next
	
	Return layerInfo
End Sub

Private Sub btnBack_Click
	B4XPages.ShowPageAndRemovePreviousPages("Recommendations")
	B4XPages.GetPage("Recommendations").As(Recommendations).AnimateFromRight
End Sub