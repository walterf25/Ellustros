B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=10
@EndOfDesignText@
'Custom View class 
#Event: Touch (args() As Object)
#Event: Click (Tag As String)
#Event: YPosition (Y As Double)
#DesignerProperty: Key: LineWidth, DisplayName: Line Width, FieldType: Int, DefaultValue: 3
#DesignerProperty: Key: LineColor, DisplayName: Line Color, FieldType: Color, DefaultValue: 0xFF0515FF, Description: You can use the built-in color picker to find the color values.
'''#DesignerProperty: Key: DefaultColorExample, DisplayName: Default Color Example, FieldType: Color, DefaultValue: Null, Description: Setting the default value to Null means that a nullable field will be displayed.
Sub Class_Globals
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Private mBase As B4XView
	Private Const DefaultColorConstant As Int = -984833 'ignore
	Private pnlMain As B4XView
	Private pnlArrow As B4XView
	Private mProps As Map
	Private cnvDrawing As B4XCanvas
	Private lblLeft As B4XView
	Private lblRight As B4XView
	Dim color, width As Int
	Dim Parent As B4XView
	Private pnlRect As B4XRect
	Private ACTION_DOWN As Int
	Private ACTION_MOVE As Int
	Private ACTION_UP As Int
	Private imgLeft As B4XView
	Private imgRight As B4XView
	Private myfont As B4XFont
	
	Private cvsThumbLeft As B4XCanvas
	Private rectThumbLeft As B4XRect
	Private cvsThumbRight As B4XCanvas
	Private rectThumbRight As B4XRect
	Private xui As XUI
	
End Sub

Public Sub Initialize (Callback As Object, EventName As String)
	mEventName = EventName
	mCallBack = Callback
	ACTION_DOWN = 0
	ACTION_MOVE = 2
	ACTION_UP = 1
	#If B4A
	myfont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 30)
	#Else
	
	#End If
End Sub

Public Sub DesignerCreateView (Base As Panel, lbl As Label, Props As Map)
	mBase = Base
	mProps = Props
	Parent  = mBase
	'''pnlMain.Initialize("pnlMain")
	pnlMain = xui.CreatePanel("pnlMain")
	Log("parent.width: " & Parent.Width & " parent.height: " & Parent.Height)
	Parent.AddView(pnlMain, 0, 0, Parent.Width, Parent.Height)
	pnlMain.Color = Colors.Transparent
	Log("panelmain.top: " & pnlMain.Top & " pnlmain.width: " & pnlMain.Width & " pnlmain.height: " & pnlMain.Height)
	pnlRect.Initialize(pnlMain.Left, pnlMain.Top, pnlMain.Width, pnlMain.Height)
	Dim cd As ColorDrawable
	cd.Initialize2(Colors.Transparent, 10dip, 2dip, Colors.Yellow)
	pnlMain.Tag = Parent.Tag
	'''mBase.SetColorAndBorder(xui.Color_Transparent, 2dip, xui.Color_Black, 0)
	CallSubDelayed(Me, "LoadLayout")
End Sub

private Sub LoadLayout
	Log("loading layout")
	pnlMain.LoadLayout("HorizontalArrow")
	'''pnlMain.SetColorAndBorder(xui.Color_Transparent, 2dip, xui.Color_Black, 0)
	'''pnlArrow.Top = 0
	'''pnlArrow.Height = pnlMain.Height
	'''pnlArrow.Width = pnlMain.Width
	pnlArrow.Height = 5dip
	pnlArrow.Top = pnlMain.Top+pnlMain.Height/2 - pnlArrow.Height/2
	Log("pnlarrow.width: " & pnlArrow.Width & " pnlarrow.top: " & pnlArrow.Top & " pnlarrow.height: " & pnlArrow.Height)

	pnlMain.Color = Colors.transparent
	Parent.Color = Colors.Transparent
	Dim r As Reflector
	r.Target = pnlMain
	r.SetOnTouchListener("pnlMain_Touch")
	color = mProps.Get("LineColor")
	width = mProps.Get("LineWidth")
	
	imgLeft.Color = xui.Color_Transparent
	imgRight.Color = xui.Color_Transparent
'''	imgLeft.SetColorAndBorder(xui.Color_Transparent, 1dip, xui.Color_White, 0)
'''	imgRight.SetColorAndBorder(xui.Color_Transparent, 1dip, xui.Color_White, 0)

	
	cnvDrawing.Initialize(pnlArrow)
	cnvDrawing.DrawLine(pnlArrow.Left, pnlArrow.Height/2 - 3dip/2, pnlArrow.Width, pnlArrow.Height/2 - 3dip/2, color, 2dip)
	cnvDrawing.Invalidate
	'''cnvDrawing.DrawCircle(pnlArrow.Left - 10dip/2, pnlArrow.Height/2, 10dip, color, True, 0)
	'''cnvDrawing.Initialize(pnlMain)
	'''DrawLine(cnvDrawing, color, width)
	DrawThumbs
End Sub

Public Sub GetBase As Panel
	Return mBase
End Sub

Public Sub getParent As Panel
	Return Parent
End Sub

Private Sub DrawThumbs
	cvsThumbLeft.Initialize(imgLeft)
	rectThumbLeft.Initialize(0, 0, cvsThumbLeft.TargetRect.Width, cvsThumbLeft.TargetRect.Height)
	cvsThumbLeft.DrawCircle(rectThumbLeft.CenterX, rectThumbLeft.CenterY, 15dip, color, True, 0)
	cvsThumbLeft.Invalidate
	imgLeft.SetBitmap(cvsThumbLeft.CreateBitmap)
	cvsThumbRight.Initialize(imgRight)
	rectThumbRight.Initialize(0, 0, cvsThumbRight.TargetRect.Width, cvsThumbRight.TargetRect.Height)
	cvsThumbRight.DrawCircle(rectThumbRight.CenterX, rectThumbRight.CenterY, 15dip, color, True, 0)
	cvsThumbRight.Invalidate
	imgRight.SetBitmap(cvsThumbRight.CreateBitmap)
End Sub

Private Sub DrawLine(cnv As B4XCanvas, color1 As Int, width1 As Int)
	cnv.DrawRect(pnlRect, Colors.Transparent, False, 1dip)
	cnv.DrawLine(lblLeft.Left+lblLeft.Width - 10dip, lblLeft.Height/2 - (width-7dip)/2, lblRight.Left+5dip, lblRight.Height/2 - (width-7dip)/2, color1, width1)
	lblLeft.TextColor = color1
	lblRight.TextColor = color1
	'''pnlArrow.Invalidate
	'''pnlArrow.Invalidate
End Sub

Private Sub DrawLineSelected(cnv As B4XCanvas, color1 As Int, width1 As Int)
	'''cnv.DrawColor(Colors.Transparent)
	cnv.DrawLine(lblLeft.Left+lblLeft.Width - 10dip, lblLeft.Height/2 - (width-7dip)/2, lblRight.Left+5dip, lblRight.Height/2 - (width-7dip)/2, color1, width1)
	lblLeft.TextColor = Colors.Green
	lblRight.TextColor = Colors.Green
'''	pnlArrow.Invalidate
'''	pnlMain.Invalidate
End Sub

Public Sub DrawLineReset
	'''cnvDrawing.DrawColor(Colors.Transparent)
	cnvDrawing.DrawLine(lblLeft.Left+lblLeft.Width - 10dip, lblLeft.Height/2 - (width-7dip)/2, lblRight.Left+5dip, lblRight.Height/2 - (width-7dip)/2, color, width)
	lblRight.TextColor = color
	lblLeft.TextColor = color
	'''pnlArrow.Invalidate
	'''pnlMain.Invalidate
End Sub

public Sub getTag As String
	Return pnlMain.tag
End Sub

'''private Sub pnlMain_Click
'''	Log("mbase clicked")
'''	DrawLineSelected(cnvDrawing, Colors.Green, 3dip)
'''	CallSubDelayed2(mCallBack, mEventName&"_Click", pnlMain.tag)
'''End Sub

private Sub pnlArrow_Click
	
End Sub

private Sub mBasae_Click
	
End Sub

public Sub setLabelText(height As String)
	lblLeft.font = myfont
	lblLeft.Text = NumberFormat(height, 0, 1)
	lblLeft.TextSize = 12
	Dim cd As ColorDrawable
	cd.Initialize2(Colors.Transparent, 22dip, 0, Colors.White)
	lblLeft.TextColor = Colors.Black
	'''lblLeft.Gravity = Bit.Or(Gravity.CENTER_HORIZONTAL, Gravity.CENTER_VERTICAL)
	lblLeft.SetTextAlignment("CENTER", "CENTER")
	'''lblLeft.Background = cd
	lblLeft.SetColorAndBorder(xui.Color_Transparent, 0, xui.Color_White, 22dip)
End Sub

Public Sub getLabelText As String
	Return lblLeft.Text
End Sub

Public Sub getYPosition As Double
	Dim yval As Double
	yval = (Parent.Top+Parent.Height)/2
	Return yval
End Sub

'''Private Sub pnlmain_Touch (o As Object, ACTION As Int, x As Float, y As Float, motion As Object) As Boolean
'''	Dim args(3) As Object
'''	args(0) = ACTION
'''	args(1) = X
'''	args(2) = Y
'''	Dim downx As Float
'''	Dim downy As Float
'''	Log("Y: "& y)
'''	If ACTION = 0 Then
'''		downx = x
'''		downy = y
'''		Log("parent width: " & Parent.Width & " -- " & Parent.Top)
'''		'''DrawLineSelected(cnvDrawing, Colors.Green, 2dip)
'''		If SubExists(mCallBack, mEventName&"_Click") Then
'''			CallSubDelayed2(mCallBack, mEventName&"_Click", pnlMain.Tag)
'''		End If
'''		Return True
'''	Else if ACTION = 2 Then
''''''	CallSubDelayed2(mCallBack, mEventName&"_Touch", args)
'''	
'''		Parent.Top = Parent.Top + y - downy
'''		If SubExists(mCallBack, mEventName&"_YPosition") Then
'''			CallSubDelayed2(mCallBack, mEventName&"_YPosition", (Parent.Top+Parent.Height/2))
'''		End If
'''		Log("parent top: " & (Parent.Top+Parent.Height/2) & " Tag: " & Parent.tag)
'''	Else
'''	'''	DrawLineReset
'''	End If
'''Return True
'''End Sub

Private Sub getScreenSize As Double()
	Dim xy(2) As Double
	Dim r As Reflector
	r.Target = r.GetContext
	r.Target = r.RunMethod("getResources")
	r.Target = r.RunMethod("getDisplayMetrics")
	xy(0) = r.GetField("xdpi")
	xy(1) = r.GetField("ydpi")
	'''Log(r.GetField("xdpi"))
	'''Log(r.GetField("ydpi"))
	Return xy
End Sub

Public Sub getRect As B4XRect
	Return pnlRect
End Sub

