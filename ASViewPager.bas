B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.8
@EndOfDesignText@
'ASViewPager
'Author: Alexander Stolte
'Version: V1.09
#If Documentation
Changelog:
V1.00
	-Release
V1.01
	-Base_Resize is now public
	-NextPage and PreviousPage Bug Fix
	-setCurrentIndex Bug Fix
	-PageChangeEvent Bug Fix
V1.02
	-B4I Bug Fixes
	-NextPage and PreviousPage Bug Fix
V1.03
	-Resize BugFix
V1.04
	-B4I Page-Height BugFix
	-B4I Page-Swipe BugFix
V1.05
	-BugFix
V1.06
	-Add Designer Property "Orientation" - Vertical is now supported
V1.07
	-BugFix getCurrentIndex
	-BugFix PageChanged event is now only firing if the index is changed
	-Add setIgnorePageChangedEvent Property
	-Add TouchBegin Event
	-Add TouchEnd Event
	-BugFix PageChanged is now firing if you press on a emulator, for example the arrow up or down keys on yor keyboard
V1.08
	-Add Tag Property 
		https://www.b4x.com/android/forum/threads/b4x-how-to-get-custom-view-here-from-clv-or-any-other-container.117992/#content
	-Add Clear - clears the list and sets the index to 0
	-BugFix xCustomListview Top was always 0
V1.09
	-B4I BugFixes for Release Mode - swiping is now better

-Add SwipeOnEndOfPage Event - triggers when the user scrolls even though he is already at the end of the list. Or if the user is on the 1st page and scrolls to the wrong direction
#End If

#DesignerProperty: Key: Orientation, DisplayName: Orientation, FieldType: String, DefaultValue: Horizontal, List: Horizontal|Vertical

#Event: PageChanged(Index as int)
#Event: ScrollChanged(Offset As Int)
#Event: ReachEnd
#Event: TouchBegin
#Event: TouchEnd
'#Event: SwipeOnEndOfPage

Sub Class_Globals
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Private mBase As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private tmr_main As Timer
	Private tmr2_main As Timer
	'Views
	Private xclv_main As CustomListView
	
	'Variables etc...
	Private current_index As Int = 0'ignore
	#If B4A or B4I
	Private g_x,g_y,g_dv,g_ad As Float
	Private g_ms As Long
	Private  isfirstmove As Boolean = False
	#end if
	#If B4I 
	Private tmp As GestureRecognizer 
	#end if
	Private g_ignorepagechangedevent As Boolean = False
	Private g_orientation As String 
	
	Private ismoving As Boolean = False
	
	Public Tag As Object
	Private IndicatorsCVS As B4XCanvas
	Private g_IndicatorActiveColor,g_IndicatorInactiveColor As Int
	Private xpnl_circlebackground As B4XView
	Private space As Int = 5dip
	Private MeasuringFront As Boolean = False
	Private realheight As Int
	'Private SwipeOnEndOfPage_OnlyOnce As Boolean = True
End Sub

Public Sub Initialize (Callback As Object, EventName As String)
	mEventName = EventName
	mCallBack = Callback
End Sub

'Base type must be Object
Public Sub DesignerCreateView (Base As Object, Lbl As Label, Props As Map)
	mBase = Base
	Tag = mBase.Tag
	mBase.Tag = Me
	mBase.Color = xui.color_white
	g_orientation = Props.Get("Orientation")
	mBase.Parent.Color = xui.color_white
	If xclv_main.IsInitialized = False Then
		ini_xclv
	End If
	#If B4A
	Base_Resize(mBase.Width,mBase.Height)
	#End If
	realheight = mBase.Height
End Sub

Private Sub ini_xclv
	Dim tmplbl As Label
	tmplbl.Initialize("")
 
	Dim tmpmap As Map
	tmpmap.Initialize
	tmpmap.Put("DividerColor",0x00FFFFFF)
	tmpmap.Put("DividerHeight",0)
	tmpmap.Put("PressedColor",0x00FFFFFF)
	tmpmap.Put("InsertAnimationDuration",0)
	tmpmap.Put("ListOrientation",g_orientation)
	tmpmap.Put("ShowScrollBar",False)
	xclv_main.Initialize(Me,"xclv_main")
	xclv_main.DesignerCreateView(mBase,tmplbl,tmpmap)
	xclv_main.sv.Color = xui.color_white
	xpnl_circlebackground = xui.CreatePanel("")
	g_IndicatorActiveColor = xui.Color_RGB(49, 211, 184)
	g_IndicatorInactiveColor = xui.Color_ARGB(150, 28, 30, 36)
	'''g_IndicatorInactiveColor = 0x1C1E24
	
	mBase.AddView(xpnl_circlebackground,0,0,1dip,1dip)
	IndicatorsCVS.Initialize(xpnl_circlebackground)
	#IF B4A
'''	Private objPages As Reflector
'''	objPages.Target = xclv_main.sv
	'''	objPages.SetOnTouchListener("xpnl_PageArea2_Touch")
	Private objPages As Reflector
	objPages.Target = xclv_main.sv
	objPages.SetOnTouchListener("xpnl_PageArea2_Touch")
	#Else IF B4I	
	tmp.Initialize("tmp",Me,xclv_main.GetBase)'.sv)
	tmp.AddPanGesture(1,1)
	#Else IF B4J
	Dim r As Reflector
	r.Target = xclv_main.sv
	r.AddEventFilter("et", "javafx.scene.input.KeyEvent.KEY_PRESSED")
	r.AddEventFilter("et", "javafx.scene.input.KeyEvent.KEY_RELEASED")
	#End if
	
	#If B4I
	Do While xclv_main.sv.IsInitialized = False
		'Sleep(0)
	Loop
	Dim sv As ScrollView = xclv_main.sv
	sv.Color = xui.Color_ARGB(255,32, 33, 37)
	#End If
	realheight = mBase.Height
End Sub

Public Sub Base_Resize (Width As Double, Height As Double)
	LogColor("height = " & Height, Colors.Blue)
	LogColor("activity.height: " & 100%y, Colors.Blue)
	'''Dim totalheight As Int = (100%y - Height)
	mBase.Width = Width
	If getCurrentIndex = 0 Or getCurrentIndex = 1 Then
	mBase.Height = Height
	If Height = 100%y Then
		mBase.Height = realheight
	Else
		mBase.Height = 100%y
	End If
	End If
	
	Log("height base_resize: " & Height)
'''	If MeasuringFront = False Then
'''	xpnl_circlebackground.SetLayoutAnimated(0,0,Height - 10dip, Width,20dip)
'''	Else
'''		xpnl_circlebackground.SetLayoutAnimated(0,0,Height - 20dip,Width,20dip)
'''	End If
	If current_index = 0 Or current_index = 1 Then
		xpnl_circlebackground.SetLayoutAnimated(0,0, realheight -  10dip, Width,20dip)
		Else
		xpnl_circlebackground.SetLayoutAnimated(0,0,100%y - 20dip,Width,20dip)
	End If
	LogColor("xpnl_circlebackground top: " & xpnl_circlebackground.Top, Colors.Blue)
	IndicatorsCVS.Resize(xpnl_circlebackground.Width, xpnl_circlebackground.Height)
	xclv_main.AsView.Height = Height
	xclv_main.AsView.Width = Width
	xclv_main.Base_Resize(Width,Height)
	xclv_main.AsView.Color = xui.color_white
	For i = 0 To xclv_main.Size -1
		If g_orientation = "Horizontal" Then
			xclv_main.ResizeItem(i,Width)
		Else
			xclv_main.ResizeItem(i,Height)
		End If
	Next
	Sleep(0)
	If xclv_main.Size > 0 Then xclv_main.ScrollToItem(current_index)
	DrawIndicators(xpnl_circlebackground.Height,getCurrentIndex)
End Sub

Public Sub getBase As B4XView
	Return mBase
End Sub

Public Sub AddPage(xpnl_layout As B4XView,value As Object)	
	xclv_main.Add(xpnl_layout,value)
	xclv_main.GetBase.Color = xui.Color_White
End Sub

Public Sub RemovePage(index As Int)
	xclv_main.RemoveAt(index)
End Sub

Public Sub PreviousPage	
	Log("previousPage clicked")
	If (current_index -1) > -1 Then
		PageChangeEvent(current_index -1)
		xclv_main.ScrollToItem(current_index)
	End If
End Sub

Public Sub PreviousPage2
	If (current_index -1) > -1 Then
		PageChangeEvent(current_index -1)
		'''xclv_main.ScrollToItem(current_index)
		Log("tmr2_initialized and enalbed")
		tmr2_main.Initialize("tmr2_main",5)
		tmr2_main.Enabled = True
	End If
End Sub

Public Sub NextPage
	If (current_index +1) < xclv_main.Size Then
		PageChangeEvent(current_index +1)
		xclv_main.AnimationDuration = 350
		xclv_main.ScrollToItem(current_index)
	End If
End Sub

Public Sub NextPage2
	If (current_index +1) < xclv_main.Size Then
		PageChangeEvent(current_index +1)
		tmr_main.Initialize("tmr_main",5)
		tmr_main.Enabled = True
	End If
End Sub
Private Sub tmr_main_Tick
	Dim tmp As Int = mBase.Width * current_index
	Log("tmp: " & tmp)
	Log("xclv_main.sv.ScrollViewOffsetX: " & xclv_main.sv.ScrollViewOffsetX)
	If xclv_main.sv.ScrollViewOffsetX = tmp Then
		tmr_main.Enabled = False
		Log("tmr_disabled")
	Else
		tmr_main.Enabled = False
		xclv_main.sv.ScrollViewOffsetX = xclv_main.sv.ScrollViewOffsetX + 5
		Log("xclv_main.sv.ScrollViewOffsetX: " & xclv_main.sv.ScrollViewOffsetX)
		Log("else")
	End If
End Sub

Private Sub tmr2_main_Tick
	Dim tmp As Int = mBase.Width * current_index
	If xclv_main.sv.ScrollViewOffsetX = tmp Then
		tmr2_main.Enabled = False
	Else
		tmr2_main.Enabled = False
		xclv_main.sv.ScrollViewOffsetX = xclv_main.sv.ScrollViewOffsetX + 5
	End If
End Sub

Public Sub setMeasuringFront(b As Boolean)
	MeasuringFront = b
End Sub

public Sub EnableScrolling(enable As Boolean)
	Dim sw As CLVSwipe
	sw.Initialize(xclv_main, Me, "swipe")
	sw.Base.SendToBack
	sw.ScrollingEnabled = enable
End Sub

#Region Properties

Public Sub setIgnorePageChangedEvent(ignore As Boolean)
	g_ignorepagechangedevent = ignore
End Sub

Public Sub getCurrentIndex As Int	
		Return current_index'xclv_main.FirstVisibleIndex
End Sub

Public Sub setCurrentIndex(index As Int)
	PageChangeEvent(index)
	xclv_main.ScrollToItem(index)
End Sub

Public Sub getSize As Int
	Return xclv_main.Size
End Sub

Public Sub getCustomListView As CustomListView
	Return xclv_main
End Sub

Public Sub Clear
	xclv_main.Clear
	current_index = 0
End Sub

'gets or sets the inactive indicator color
Public Sub setIndicatorInactiveColor(clr As Int)
	g_IndicatorInactiveColor = clr
	DrawIndicators(xpnl_circlebackground.Height,getCurrentIndex)
End Sub
Public Sub getIndicatorInactiveColor As Int
	Return g_IndicatorInactiveColor
End Sub
'gets or sets the active indicator color
Public Sub setIndicatorActiveColor(clr As Int)
	g_IndicatorActiveColor = clr
	DrawIndicators(xpnl_circlebackground.Height,getCurrentIndex)
End Sub

Public Sub getIndicatorActiveColor As Int
	Return g_IndicatorActiveColor
End Sub

Public Sub getIndicatorPosition As Int
	Return xpnl_circlebackground.Top
End Sub

#End Region

#Region Swipe

#If B4A or B4I

Private Sub ff(x As Float,y As Float)
	isfirstmove = True
	g_ms=DateTime.Now
	g_x=X
	g_y=Y
	If g_orientation = "Horizontal" Then
	g_dv = (xclv_main.GetBase.Width)/2
	Else
	g_dv = (xclv_main.GetBase.Height)/2
	End If
	g_ad = 0
End Sub
#If B4A
Private Sub HandleTouch(Action As Int,x As Float,y As Float) As Boolean
#Else If B4I
Private Sub HandleTouch(Action As Int,x As Float,y As Float) As ResumableSub
	Sleep(0)
#End If
'''	Log("moving action = " & g_orientation)
	If MeasuringFront Then Return True
	Select Action
		Case 2
			TouchBeginEvent
			ismoving = True
			If isfirstmove = False Then
				'SwipeOnEndOfPage_OnlyOnce = True
				ff(X,y)
			Else
				'g_x = 0
				'g_y = 0
				
'				If (current_index = xclv_main.Size -1 Or current_index = 0) And SwipeOnEndOfPage_OnlyOnce = True Then
'			
'					If current_index = xclv_main.Size -1 Then
'						If g_orientation = "Horizontal" Then
'							If x < g_x Then SwipeOnEndOfPage
'						Else
'							If y < g_y Then SwipeOnEndOfPage
'						End If
'					Else if current_index = 0 Then
'						If g_orientation = "Horizontal" Then
'							If x > g_x Then SwipeOnEndOfPage
'						Else
'							If y > g_y Then SwipeOnEndOfPage
'						End If
'					End If
'				
'				End If

			End If
			
		Case 1
			TouchEndEvent
			ismoving = False
			isfirstmove = False
			If g_orientation = "Horizontal" Then
				If ((DateTime.Now-g_ms)<300) And (Abs(X - g_x) > (1dip)) Then

					g_dv =1dip
				'#If B4A
					If X < g_x Then g_ad = 1
				'#Else If B4I
					'If X > g_x Then g_ad = 1'vorher
				'#End If
				End If
			Else
				If ((DateTime.Now-g_ms)<300)  And (Abs(y - g_y) > (1dip)) Then
					g_dv =1dip
				
				'#If B4A
					If y < g_y Then g_ad = 1
				'#Else If B4I
					'If y > g_y Then g_ad = 1
				'#End If			
				End If
			End If
			For i = 0 To xclv_main.Size -1
				If g_orientation = "Horizontal" Then
					If (((i+1)*xclv_main.GetBase.Width) - xclv_main.sv.ScrollViewOffsetX) > (g_dv) Then
						'#If B4I
						'If (i+g_ad) > xclv_main.Size-1 Or  xclv_main.sv.ScrollViewOffsetX <= 0 Then Return False
						'If (i+g_ad) > xclv_main.Size-1 Or (current_index = 0  And (i+g_ad) = 0) Or xclv_main.sv.ScrollViewOffsetX < 0 Then Return False
						'#Else
						If (i+g_ad) > xclv_main.Size-1 Or  xclv_main.sv.ScrollViewOffsetX <= 0 Then Return False
						'#End If
						xclv_main.ScrollToItem(i+g_ad)
						If current_index <> (i+g_ad) Then PageChangeEvent(i+g_ad)
						Return True
					End If
				Else
					If (((i+1)*xclv_main.GetBase.Height) - xclv_main.sv.ScrollViewOffsetY) > (g_dv) Then
						'#If B4I
						'If (i+g_ad) > xclv_main.Size-1 Or  xclv_main.sv.ScrollViewOffsetY <= 0 Then Return False
						'If (i+g_ad) > xclv_main.Size-1 Or (current_index = 0  And (i+g_ad) = 0) Or xclv_main.sv.ScrollViewOffsetY < 0 Then Return False
						'#Else
						If (i+g_ad) > xclv_main.Size-1 Or  xclv_main.sv.ScrollViewOffsetY <= 0 Then Return False
						'#End If
						xclv_main.ScrollToItem(i+g_ad)
						If current_index <> (i+g_ad) Then PageChangeEvent(i+g_ad)
						Return True
					End If
				End If
			Next
	End Select
	Return False
End Sub

#End If

#If B4A

Private Sub xpnl_PageArea2_Touch(ViewTag As Object, Action As Int, X As Float, y As Float, MotionEvent As Object) As Boolean
	Return HandleTouch(Action,x,y)
End Sub

#Else If B4I

Private Sub tmp_pan(state As Int, att As Pan_Attributes)
	'Log("att.X: " & att.X)
	Select state
		Case 2 'STATE_Changed
			HandleTouch(2,att.X,att.Y)
		Case 3 'STATE_End
			HandleTouch(1,att.X,att.Y)
	End Select
End Sub

#Else If B4J
Private Sub et_Filter (EventData As Event)
	Dim jo As JavaObject = EventData
	Dim code As String = jo.RunMethod("getCode", Null)
	Dim EventType As String = jo.RunMethod("getEventType", Null)

'	If EventType = "KEY_PRESSED" Then       
'		Log("KEY_PRESSED")  
'		Log("Code: " & code) 
	If EventType = "KEY_RELEASED" Then
		'Log("Code: " & code)
		If g_orientation = "Horizontal" Then
			If code = "RIGHT" Then
				NextPage
			Else If code = "LEFT" Then
				PreviousPage
			End If
		Else
			If code = "DOWN" Then
				NextPage
			Else If code = "UP" Then
				PreviousPage
			End If
		End If
	End If
End Sub

#End If

#End Region

#Region Events

''Private Sub (c As Boolean, TrueRes As Object, FalseRes As Object) As Object
''	If c Then Return TrueRes Else Return FalseRes
''End Sub

Private Sub xclv_main_ScrollChanged (Offset As Int)
	If xclv_main.FindIndexFromOffset(Offset) <> current_index And Offset = IIf(g_orientation = "Vertical",mBase.Height,mBase.Width) * xclv_main.FindIndexFromOffset(Offset) Then
		PageChangeEvent(xclv_main.FindIndexFromOffset(Offset))
	End If
	If xui.SubExists(mCallBack, mEventName & "_ScrollChanged", 1) Then
		CallSub2(mCallBack, mEventName & "_ScrollChanged",Offset)
	End If
End Sub

Private Sub xclv_main_ReachEnd
	If xui.SubExists(mCallBack, mEventName & "_ReachEnd", 0) Then
		CallSub(mCallBack, mEventName & "_ReachEnd")
	End If
End Sub

Private Sub PageChangeEvent(index As Int)
	Log("inside PagechangeEvent(index As int): " & index)
	current_index = index
	If g_ignorepagechangedevent = False Then
	If xui.SubExists(mCallBack, mEventName & "_PageChanged", 1) Then
			DrawIndicators(xpnl_circlebackground.Height,index)
		CallSub2(mCallBack, mEventName & "_PageChanged",index)
	End If
	End If
End Sub

Private Sub TouchBeginEvent
	If ismoving = False Then
	If xui.SubExists(mCallBack, mEventName & "_TouchBegin", 0) Then
		CallSub(mCallBack, mEventName & "_TouchBegin")
	End If
	End If
End Sub

Private Sub TouchEndEvent
	If xui.SubExists(mCallBack, mEventName & "_TouchEnd", 0) Then
		CallSub(mCallBack, mEventName & "_TouchEnd")
	End If
End Sub

'Private Sub SwipeOnEndOfPage
'	SwipeOnEndOfPage_OnlyOnce = False
'	If xui.SubExists(mCallBack, mEventName & "_SwipeOnEndOfPage", 0) Then
'		CallSub(mCallBack, mEventName & "_SwipeOnEndOfPage")
'	End If
'End Sub

'https://www.b4x.com/android/forum/threads/b4x-xui-imageslider.87128/
Private Sub DrawIndicators(Height As Float,Index As Int)
	'If pagelist.Size < Then Return
	'''IndicatorsCVS.ClearRect(IndicatorsCVS.TargetRect)
	xpnl_circlebackground.RemoveAllViews
	'''Dim clr As Int
	Dim img(xclv_main.Size) As ImageView
	Dim left As Int = xpnl_circlebackground.Width/2
'''	Log("left first: " & left)
	left = left - (25dip * xclv_main.Size)/2 - 20dip
'''	Log("left: " & left)
	Dim cvs(xclv_main.Size) As B4XCanvas
	For j = 0 To cvs.Length - 1
		cvs(j).Initialize(xpnl_circlebackground)
		img(j).Initialize("")
		cvs(j).ClearRect(cvs(j).TargetRect)
	Next
	For i = 0 To xclv_main.Size - 1
		'''If Index = i Then clr = g_IndicatorActiveColor Else clr =  g_IndicatorInactiveColor
		'''IndicatorsCVS.DrawCircle(IndicatorsCVS.TargetRect.CenterX + (-(xclv_main.Size - 1) / 2 + i) * 12dip, Height/2, 4dip, clr, True, 0)
		Dim rect As B4XRect
		If i <= Index Then
			If i = 0 Then
				xpnl_circlebackground.AddView(img(i), left, 0, 25dip, 10dip)
				img(i).Color = g_IndicatorActiveColor
			rect.Initialize(left, 0, 400dip, 10dip)
			cvs(i).DrawRect(rect, g_IndicatorActiveColor, True, 4dip)
'''			Log("rect left: " & rect.Left & " rect.right: " & rect.Right & " rect.width: " & rect.Width)
			Else
			left = left+25dip+5dip
			'''rect.Initialize(left, 0, 20dip, 10dip)
			xpnl_circlebackground.AddView(img(i), left, 0, 25dip, 10dip)
			img(i).Color = g_IndicatorActiveColor
			End If
		Else
'''			If i = 0 Then
'''				xpnl_circlebackground.AddView(img(i), left, 0, 25dip, 10dip)
'''				img(i).Color = g_IndicatorActiveColor
'''				rect.Initialize(left, 0, 400dip, 10dip)
'''				cvs(i).DrawRect(rect, clr, True, 4dip)
'''				Log("rect left: " & rect.Left & " rect.right: " & rect.Right & " rect.width: " & rect.Width)
'''			Else
				left = left+25dip+5dip
				'''rect.Initialize(left, 0, 20dip, 10dip)
				xpnl_circlebackground.AddView(img(i), left, 0, 25dip, 10dip)
				img(i).Color = g_IndicatorInactiveColor
			'''End If
		End If
	Next
	'''IndicatorsCVS.Invalidate
	For t = 0 To cvs.Length - 1
		cvs(t).Invalidate
	Next
End Sub

#End Region
