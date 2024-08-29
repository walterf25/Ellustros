B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=10
@EndOfDesignText@
'Custom View class 
'''#Event: Touch (args() As Object)
#Event: Click (Tag As String)
#Event: XPosition (X As Double)
#DesignerProperty: Key: LineWidth, DisplayName: Line Width, FieldType: Int, DefaultValue: 3
#DesignerProperty: Key: LineColor, DisplayName: Line Color, FieldType: Color, DefaultValue: 0xFF0515FF, Description: You can use the built-in color picker to find the color values.
Sub Class_Globals
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Private mBase As B4XView
	Private Const DefaultColorConstant As Int = -984833 'ignore
	Private pnlMain2 As B4XView
	Private mProps2 As Map
	Private cnvDrawing2 As B4XCanvas
	Dim color, width As Int
	Dim Parent As B4XView
	Private defaultColor As Int
	Private pnlRect As B4XRect
	Private lblBottom As B4XView
	Private lblTop As B4XView
	Private pnlArrow2 As B4XView
	Private ACTION_DOWN As Int
	Private ACTION_MOVE As Int
	Private ACTION_UP As Int
	Private imgTop As B4XView
	Private imgBottom As B4XView
	Private myfont As B4XFont
	Private xui As XUI
	
	Private cvsThumbLeft As B4XCanvas
	Private rectThumbLeft As B4XRect
	Private cvsThumbRight As B4XCanvas
	Private rectThumbRight As B4XRect
End Sub

Public Sub Initialize (Callback As Object, EventName As String)
	mEventName = EventName
	mCallBack = Callback
	#If B4A
	myfont = xui.CreateFont(Typeface.LoadFromAssets("Cera Pro Medium.otf"), 30)
	#else
	
	#End If
End Sub

Public Sub DesignerCreateView (Base As Panel, lbl As Label, Props As Map)
	mBase = Base
	mProps2 = Props
    Parent = mBase
	'''pnlMain2.Initialize("pnlMain2")
	'''Parent.AddView(pnlMain2, 0, 0, Parent.Width, Parent.Height)
	'''pnlMain2.Color = Colors.Transparent
'''	pnlRect.Initialize(pnlMain2.Left, pnlMain2.Top, pnlMain2.Width, pnlMain2.Height)
	pnlRect.Initialize(Parent.Left, Parent.Top, Parent.Width, Parent.Height)
	'''pnlMain2.Tag = Parent.Tag
	CallSubDelayed(Me, "LoadLayout")
End Sub

Public Sub GetBase As Panel
	Return mBase
End Sub

Public Sub getTag As String
	'''Return pnlMain2.Tag
	Return Parent.Tag
End Sub

private Sub LoadLayout
	'''pnlMain2.LoadLayout("VerticalArrow")
	Parent.LoadLayout("VerticalArrow")
	imgBottom.Color = xui.Color_Transparent
	imgTop.Color = xui.Color_Transparent
	'''pnlArrow2.Top = 0
	'''pnlArrow2.Height = pnlMain2.Height
	'''pnlArrow2.Width = pnlMain2.Width
	'''pnlArrow2.width = 3dip
	'''pnlArrow2.left = pnlMain2.left+pnlMain2.width/2 - pnlArrow2.Width/2
	'''pnlArrow2.left = Parent.left+Parent.width/2 - Parent.Width/2
	'''pnlArrow2.Left = imgTop.Left+imgBottom.Width/2 - pnlArrow2.Width/2
	pnlArrow2.Left = (imgTop.Width - pnlArrow2.Width)/2
	'''pnlMain2.Color = Colors.red
	Parent.Color = Colors.Transparent
	Dim r As Reflector
'''	r.Target = pnlMain2
	r.Target = Parent
	r.SetOnTouchListener("pnlMain_Touch")
	color = mProps2.Get("LineColor")
	width = mProps2.Get("LineWidth")
	
	cnvDrawing2.Initialize(pnlArrow2)
'''	cnvDrawing2.DrawLine(pnlArrow2.top, pnlArrow2.Height/2, pnlArrow2.Height, pnlArrow2.Top+pnlArrow2.Height, color, 2dip)
	'''	cnvDrawing2.Invalidate
	cnvDrawing2.DrawLine(3dip, 0, 3dip, pnlArrow2.Height, color, 2dip)
	cnvDrawing2.Invalidate
	DrawThumbs
End Sub

Private Sub DrawThumbs
	cvsThumbLeft.Initialize(imgTop)
	rectThumbLeft.Initialize(0, 0, cvsThumbLeft.TargetRect.Width, cvsThumbLeft.TargetRect.Height)
	cvsThumbLeft.DrawCircle(Parent.Width/2, imgTop.Height/2, 15dip, color, True, 0)
	cvsThumbLeft.Invalidate
	imgTop.SetBitmap(cvsThumbLeft.CreateBitmap)
	cvsThumbRight.Initialize(imgBottom)
	rectThumbRight.Initialize(0, 0, cvsThumbRight.TargetRect.Width, cvsThumbRight.TargetRect.Height)
	cvsThumbRight.DrawCircle(Parent.Width/2, imgBottom.Height/2, 15dip, color, True, 0)
	cvsThumbRight.Invalidate
	imgBottom.SetBitmap(cvsThumbRight.CreateBitmap)
End Sub

'''Private Sub DrawLine(cnv As Canvas, color1 As Int, width1 As Int)
'''	cnv.DrawRect(pnlRect, Colors.Transparent, False, 1dip)
'''	cnv.DrawLine((lblTop.Left+lblTop.Width+3dip)/2 - width1/2, (lblTop.Top+lblTop.Height) - 9dip, (lblBottom.Left+lblBottom.Width+3dip)/2 - width1/2, lblBottom.Top+9dip, color1, 3dip)
'''	pnlArrow2.Invalidate
'''End Sub
'''
'''Private Sub DrawLineSelected(cnv As Canvas, color1 As Int, width1 As Int)
'''	cnv.DrawColor(Colors.Transparent)
'''	cnv.DrawLine((lblTop.Left+lblTop.Width+3dip)/2 - width1/2, (lblTop.Top+lblTop.Height) - 9dip, (lblBottom.Left+lblBottom.Width+3dip)/2 - width1/2, lblBottom.Top+9dip, color1, 3dip)
'''	lblTop.TextColor = color1
'''	lblBottom.TextColor = color1
'''	pnlArrow2.Invalidate
'''	pnlMain2.Invalidate
'''End Sub

Public Sub DrawLineReset
	'''cnvDrawing2.DrawColor(Colors.Transparent)
	cnvDrawing2.DrawLine((lblTop.Left+lblTop.Width+3dip)/2 - width/2, (lblTop.Top+lblTop.Height) - 9dip, (lblTop.Left+lblBottom.Width+3dip)/2 - width/2, lblBottom.Top+9dip, color, 3dip)
	lblTop.TextColor = color
	lblBottom.TextColor = color
	''pnlArrow2.Invalidate
End Sub

Public Sub getXPosition As Double
	Dim xval As Double
	xval = (Parent.Left+Parent.Width)/2
	Return xval
End Sub

public Sub setLabelText(height As String)
	lblTop.font = myfont
	lblTop.Text = NumberFormat(height, 0, 1)
	lblTop.TextSize = 12
'''	Dim cd As ColorDrawable
'''	cd.Initialize2(Colors.Transparent, 22dip, 0, Colors.White)
	lblTop.TextColor = Colors.Black
	'''lblTop.Gravity = Bit.Or(Gravity.CENTER_HORIZONTAL, Gravity.CENTER_VERTICAL)
	lblTop.SetTextAlignment("CENTER", "CENTER")
	'''lblTop.Background = cd
	lblTop.SetColorAndBorder(xui.Color_Transparent, 0, xui.Color_White, 22dip)
End Sub

Public Sub getLabelText As String
	Return lblTop.Text
End Sub

Private Sub pnlmain_Touch (o As Object, ACTION As Int, x As Float, y As Float, motion As Object) As Boolean
	Dim args(3) As Object
	args(0) = ACTION
	args(1) = X
	args(2) = Y
	Dim jo As JavaObject = motion
	Dim downx As Float
	Dim dx As Float
'''	Dim downy As Float
	'''Log("Y: "& y)
	If ACTION = 0 Then
		Dim rawX As Float = jo.RunMethod("getRawX", Null)
		downx = x
		
		dx = Parent.Left - rawX
'''		downy = y
	'''	Log("parent width: " & Parent.Width & " -- " & Parent.Top)
		'''DrawLineSelected(cnvDrawing2, Colors.Green, 2dip)
'''		If SubExists(mCallBack, mEventName&"_Click") Then
'''			CallSubDelayed2(mCallBack, mEventName&"_Click", Parent.Tag)
'''		End If
		'''Return True
		
	Else if ACTION = 2 Then
		'''	CallSubDelayed2(mCallBack, mEventName&"_Touch", args)
	
		'''Parent.Left = Parent.Left + x - downx
		''' view.setX(event.getRawX() + dX)
		Parent.Left = jo.RunMethod("getRawX", Null) + dx
		'''pnlMain2.Left = jo.RunMethod("getRawX", Null) + dx
		Log("dragging X: " & Parent.Left)
		If SubExists(mCallBack, mEventName&"_XPosition") Then
			CallSubDelayed2(mCallBack, mEventName&"_XPosition", (Parent.Left+Parent.Width/2))
		End If
		
	'''	Log("parent top: " & (Parent.Top+Parent.Height/2) & " Tag: " & Parent.tag)
	Else
		Return False
		'''DrawLineReset
	End If
	Return True
End Sub