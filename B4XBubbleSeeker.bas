B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8
@EndOfDesignText@
'Custom View class 
#Event: ChangeValue (Value As Int)
'#DesignerProperty: Key: BooleanExample, DisplayName: Boolean Example, FieldType: Boolean, DefaultValue: True, Description: Example of a boolean property.
#DesignerProperty: Key: MinValue, DisplayName: MinValue, FieldType: Float, DefaultValue: 0, MinRange: -100, Description: Note that MinRange and MaxRange are optional.
#DesignerProperty: Key: MaxValue, DisplayName: MaxValue, FieldType: Float, DefaultValue: 100, MinRange: 0, Description: Note that MinRange and MaxRange are optional.
#DesignerProperty: Key: Value, DisplayName: Value, FieldType: Float, DefaultValue: 0, MinRange: -100, Description: Actual value
'#DesignerProperty: Key: StringWithListExample, DisplayName: String With List, FieldType: String, DefaultValue: Sunday, List: Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday
'#DesignerProperty: Key: StringExample, DisplayName: String Example, FieldType: String, DefaultValue: Text
#DesignerProperty: Key: ColorSlide, DisplayName: ColorSlide Example, FieldType: Color, DefaultValue: 0xFFA4D4E8, Description: Color of the slider.
'#DesignerProperty: Key: DefaultColorExample, DisplayName: Default Color Example, FieldType: Color, DefaultValue: Null, Description: Setting the default value to Null means that a nullable field will be displayed.
Sub Class_Globals
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Public mBase As B4XView	'set to Public
	Public Tag As Object	'added to meet Erels recommendations
	Private xui As XUI
	'Private Const DefaultColorConstant As Int = -984833 'ignore
	
	Private ColorSlide As Int
	Private MinValue,MaxValue As Float = 0
	Private mValue As Float = 0	'changed the name to mValue as Value has become a property
	Private mRealValue As Float = 0
	Private valueString As String
	
	Private PositionPixels As Float
	
	Private pnlForeground As B4XView
	Private LabMin,LabMax As B4XView
	Private Ball As B4XView
	Private mparent As B4XView
	Private cvsBall As B4XCanvas
	Private cvsForeground As B4XCanvas
	Private rect As B4XRect
	Private rectPanelFront As B4XRect
	
	Private my0 As Int
	Private mScale As Float
	
	Private mRadius = 10dip As Int
	Private mOffset As Int
End Sub

Public Sub Initialize (Callback As Object, EventName As String)
	mEventName = EventName
	mCallBack = Callback
	
	pnlForeground = xui.CreatePanel("pnlForeground")
	Private lbl As Label
	lbl.Initialize("")
	LabMin = lbl
	Private lbl As Label
	lbl.Initialize("")
	LabMax = lbl
	Ball = xui.CreatePanel("")
End Sub

Public Sub DesignerCreateView (Base As Object, Lbl As Label, Props As Map)
	mBase = Base
	Tag = mBase.Tag		'added to meet Erels recommendations
	mBase.Tag = Me		'added to meet Erels recommendations
	mparent = mBase.Parent
	
	Log("tag: " & Tag)

	ColorSlide = Props.GetDefault("Color", 0xFFA4D4E8)
	MinValue = Props.GetDefault("MinValue", 0)
	MaxValue = Props.GetDefault("MaxValue", 100)
	mValue = Props.GetDefault("Value", 0)
	mValue = Max(mValue, MinValue)
	mValue = Min(mValue, MaxValue)
	
	'removes the border, which is set to 1 by default
	mBase.SetColorAndBorder(xui.Color_Transparent, 0, xui.Color_Transparent, 0)
	ColorSlide = xui.Color_RGB(164, 212, 232)
'	Pan.Color = xui.Color_RGB(164, 212, 232) '''ColorSlide
	
	LabMin.Color = xui.Color_Transparent
	LabMin.TextColor = xui.Color_White
'	LabMin.Gravity=Gravity.CENTER

	LabMax.Color = xui.Color_Transparent
	LabMax.TextColor = xui.Color_White
	
	mparent.AddView(Ball, 0, mBase.Top - 15dip, 30dip, 45dip)
	InitBall
	
	mBase.AddView(pnlForeground, 0, 0, mBase.Width, mBase.Height)
	cvsForeground.Initialize(pnlForeground)
	rectPanelFront.Initialize(0, 0, pnlForeground.Width, pnlForeground.Height)
	Ball.Visible = False

	my0 = mBase.Height / 2
	mOffset = mRadius
'	mOffset = mBase.Height / 2
#If B4A
	Base_Resize (mBase.Width, mBase.Height)
#End If
End Sub

Public Sub Base_Resize (Width As Double, Height As Double)
	pnlForeground.Width = Width
	cvsForeground.Resize(Width, Height)
	rectPanelFront.Initialize(0, 0, pnlForeground.Width, pnlForeground.Height)
'''	mScale = (MaxValue - MinValue) / (mBase.Width - 2 * mOffset)
'''	PositionPixels = MinValue * mScale
	ResetScale
	setValue(NumberFormat(mValue, 0, 1))
End Sub

Public Sub GetBase As B4XView
	Return mBase
End Sub

Private Sub ResetScale
	If Tag.As(String).Contains("LumbarCushion") Then
		mScale = (MaxValue - MinValue) / (mBase.Width - 2 * mOffset)
		Else
		mScale = (MaxValue - MinValue) / (mBase.Width - 2 * mOffset)
	End If
	
	PositionPixels = MinValue * mScale
	setValue(mValue)
End Sub

Private Sub InitBall
	Private pth As B4XPath
	Private rctOval As B4XRect
	
	cvsBall.Initialize(Ball)
	rect.Initialize(3dip, 10dip, cvsBall.TargetRect.Width - 3dip, 30dip)
	cvsBall.ClearRect(cvsBall.TargetRect)
	rctOval.Initialize(0, 0, cvsBall.TargetRect.Width, cvsBall.TargetRect.Height - 8dip)
	pth.InitializeOval(rctOval)
	cvsBall.DrawPath(pth, ColorSlide, True, 1dip)
	pth.Initialize(3dip, rctOval.Height * 0.75)
	pth.LineTo(rctOval.Width - 3dip, rctOval.Height * 0.75)
	pth.LineTo(rctOval.Width / 2, Ball.Height)
	cvsBall.DrawPath(pth, ColorSlide, True, 1dip)
	cvsBall.Invalidate
End Sub

Public Sub DrawFrontTrack
	cvsForeground.ClearRect(rectPanelFront)
	cvsForeground.DrawLine(mOffset, my0, rectPanelFront.Width - mOffset, my0, xui.Color_Black, 1dip)
	cvsForeground.DrawLine(mOffset, my0, PositionPixels, my0, ColorSlide, 3dip)
	cvsForeground.DrawCircle(PositionPixels, my0, mRadius, ColorSlide, True, 1dip)
	cvsForeground.Invalidate
End Sub

'''private Sub Corner(Color As Int, Radius As Int) As ColorDrawable
'''	Dim cdb As ColorDrawable
'''
'''	cdb.Initialize2(Colors.White,Radius,5dip,Color)
'''	Return cdb
'''End Sub

public Sub setValue(Value As Double) 'changed it to make it a property
	'''Log("rounding up: " & (Round2(15.01,1)))
	If Value >= MinValue And Value <= MaxValue Then
		mRealValue = Value
		mValue=Value
'''		If mValue >= 0.1 And mValue < 0.99 Then
'''			valueString = Round2(Value, 2) '''NumberFormat(Value, 0, 2)
'''		else if mValue > 0.99 And mValue < 9.99 Then
'''			valueString = NumberFormat(Value, 0, 2)
'''		else if mValue > 0 And mValue < 0.1 Then
'''			valueString = NumberFormat(Value, 0, 2)
'''		Else if mValue > 9.99 And mValue < 99.9 Then
'''			valueString = NumberFormat(Value, 0, 1)
'''		End If
		valueString = NumberFormat(Value, 0, 2)
		
		'''valueString = Round2(Value, 3)
		LogColor("drawing string: " & valueString, Colors.Blue)
		'''LogColor("realvalue: " & Round2((mRealValue*25.4)*10, 1), Colors.Blue)
		Dim fnt As B4XFont = Common.CreateB4XFont("cera pro black.otf", 12, 12)
		Dim r As B4XRect = cvsBall.MeasureText(valueString, fnt)
		Dim baseline As Int = rect.CenterY - r.Height/2 - r.top
		cvsBall.DrawRect(rect, xui.Color_RGB(164, 212, 232), True, 20dip)
		'''cvsBall.DrawText(valueString, rect.CenterX, baseline, fnt, xui.Color_White, "CENTER") '''Ball.Height / 2
		cvsBall.Invalidate
		If Tag.As(String).Contains("LumbarCushion") Then
			PositionPixels = (mValue - MinValue) / mScale + mOffset
			Else
			PositionPixels = (mValue - MinValue) / mScale + mOffset
		End If
		
		Ball.Left = mBase.Left + PositionPixels - Ball.Width / 2 
		DrawFrontTrack
'		Ball.SetLayoutAnimated(200, Ball.left, mBase.Top + mBase.Height / 2 - mOffset - Ball.Height, Ball.Width, Ball.Height)
		Ball.SetLayoutAnimated(0, Ball.left, (mBase.Top + mBase.Height / 2 - mOffset - Ball.Height) + 8dip, Ball.Width, Ball.Height)
	End If
End Sub

Public Sub getValue As Double
	Return mRealValue'''mValue
	'''Return NumberFormat(mValue, 0, 1)
End Sub

Public Sub setMax(val As Double)
'''	If val >= 0.1 And val < 0.99 Then
'''		MaxValue = NumberFormat(val, 0, 3)
'''	else if val > 0.99 Then
'''		MaxValue = NumberFormat(val, 0, 3)
'''	else if val > 0 And val < 0.1 Then
'''		MaxValue = NumberFormat(val, 0, 4)
'''	Else if val > 9.99 And val < 99.9 Then
'''		MaxValue = NumberFormat(val, 0, 1)
'''	End If
	MaxValue = NumberFormat(val, 0, 2)
	'''MaxValue = val
	ResetScale
End Sub

Public Sub setMin(val As Double)
'''	If val >= 0.1 And val < 0.99 Then
'''		MinValue = NumberFormat(val, 0, 3)
'''	else if val > 0.99 Then
'''		MinValue = NumberFormat(val, 0, 3)
'''	else if val > 0 And val < 0.1 Then
'''		MinValue = NumberFormat(val, 0, 4)
'''	Else if val > 9.99 And val < 99.9 Then
'''		MinValue = NumberFormat(val, 0, 1)
'''	End If

	MinValue = NumberFormat(val, 0,2)

	'''MinValue = val
	ResetScale
End Sub

Private Sub pnlForeground_Touch (Action As Int, X As Float, Y As Float)
	Dim P As Double
	Select Action
		Case pnlForeground.TOUCH_ACTION_DOWN
			P = GetP(X)
			setValue(P)
			Ball.SetVisibleAnimated(200, True)
			If xui.SubExists(mCallBack,mEventName & "_ChangeValue", 1) Then CallSub2(mCallBack,mEventName & "_ChangeValue", P)
		Case pnlForeground.TOUCH_ACTION_UP
			Ball.SetVisibleAnimated(200, False)
		Case pnlForeground.TOUCH_ACTION_MOVE
			P = GetP(X)
			setValue(P)
			If xui.SubExists(mCallBack,mEventName & "_ChangeValue", 1) Then CallSub2(mCallBack,mEventName & "_ChangeValue", P)
	End Select
End Sub

Private Sub GetP(X As Double) As Double

	Private val As Double
'''	If Tag.As(String).Contains("LumbarCushion") Then
		val = (X - mOffset + 0.5) * mScale + MinValue
'''	Else
'''		val = (X - mOffset + 0.5) * mScale + MinValue
'''	End If
	val = Max(val, MinValue)
	val = Min(val, MaxValue)

	Return val
End Sub

