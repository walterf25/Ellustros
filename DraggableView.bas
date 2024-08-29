B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=10.2
@EndOfDesignText@
Sub Class_Globals
	Private innerView As B4XView
	Private panel1 As B4XView
	Private downx, downy As Int
	Private ACTION_DOWN, ACTION_MOVE, ACTION_UP As Int
	Private mCallBack As Object
	Private mEventName As String
	Private Horizontal As Boolean
	Private mActive As Boolean
	Private xui As XUI
End Sub

Sub Initialize(CallBack As Object, EventName As String, Activity As Activity, v As B4XView, showFrame As Boolean)
	mCallBack = CallBack
	mEventName = EventName
	innerView = v
	'''panel1.Initialize("")
	panel1 = xui.CreatePanel("")
	'''panel1.Color = Colors.Transparent
	If showFrame Then
	panel1.SetColorAndBorder(xui.Color_Transparent, 2dip, xui.Color_Black, 0)
	innerView.SetColorAndBorder(xui.Color_Transparent, 2dip, xui.Color_White, 0)
	End If
	Activity.AddView(panel1, v.Left, v.Top, v.Width, v.Height)
'''	panel1.AddView(innerView, 0, 0, panel1.Width, panel1.Height)
	'''Activity.AddView(panel1, v.Left, v.Height/2 - 
	ACTION_DOWN = Common.ACTION_DOWN
	ACTION_MOVE = Common.ACTION_MOVE
	ACTION_UP = Common.ACTION_UP
	Dim r As Reflector
	r.Target = panel1
	r.SetOnTouchListener("pnlMain_Touch") 'why reflection instead of the regular Panel_Touch event? Good question which deserves a forum thread of its own (not related to classes)...
End Sub

Public Sub setHorizontal(h As Boolean)
	Horizontal = h
End Sub

Public Sub getHorizontal As Boolean
	Return Horizontal
End Sub

public Sub setActive(active As Boolean)
	mActive = active
End Sub

Public Sub getActive As Boolean
	Return mActive
End Sub

Public Sub getEventName As String
	Return mEventName
End Sub

public Sub getBase As B4XView
	Return panel1
End Sub

Private Sub pnlMain_Touch (o As Object, ACTION As Int, x As Float, y As Float, motion As Object) As Boolean
	'''If Common.SlidersActive = False Then Return True
	LogColor("Active: " & getActive & " mEventName: " & mEventName, Colors.Blue)
	If getActive = False Then Return False
'''	Log("inside panel1_touch")
	If ACTION = ACTION_DOWN Then
		downx = x
		'''downy = y
		If SubExists(mCallBack, mEventName&"_Click") Then
			CallSubDelayed(mCallBack, mEventName&"_Click")
		End If
	Else
		If getHorizontal Then
		'''innerView.Left = innerView.Left + x - downx
		innerView.Top = innerView.Top + y - downy
		'''panel1.Left = innerView.Left
		panel1.Top = innerView.Top
		If SubExists(mCallBack, mEventName&"_YPosition") Then
			CallSubDelayed2(mCallBack, mEventName&"_YPosition", (innerView.Top+innerView.Height/2))
		End If
		Else
			innerView.Left = innerView.Left + x - downx
			panel1.Left = innerView.Left
			If SubExists(mCallBack, mEventName&"_XPosition") Then
				CallSubDelayed2(mCallBack, mEventName&"_XPosition", (innerView.left+innerView.Width/2))
			End If
		End If
	End If
	Return True
End Sub