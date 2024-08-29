B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
'ASBottomMenu
'Author: Alexander Stolte
'Version: 2.7

#If Documentation

Updates
V2.2
-add TabChange Event
-set Badget BorderWidth to 0dip

V2.3
-Fix TabClick Event

V2.4
-Fix TabClick-Bug that the click event was execute 8 times on start

V2.5
-Fix setMiddleButtonSize is not working

V2.6
-Removes a warning of a "Unused variable"
-Removes Logs in Release mode
-Add "getBase" to get the base view, to get for example the view height
V2.7
	-Add getBadgetLabel1-5
#End If

'Modes
#DesignerProperty: Key: TabModes, DisplayName: Tab Mode, FieldType: String, Description: Placeholder, DefaultValue: 4Tabs, List: 2Tabs|4Tabs
#DesignerProperty: Key: MiddleButtonVisible, DisplayName: Middle Button Visible, FieldType: Boolean, DefaultValue: True, Description: Placeholder
#DesignerProperty: Key: EnableMiddleButtonAsTab, DisplayName: Middle Button as Tab, FieldType: Boolean, DefaultValue: False, Description: Placeholder
#DesignerProperty: Key: MiddleButtonWave, DisplayName: Wave on Middle Button, FieldType: Boolean, DefaultValue: False, Description: Placeholder
'Underline
#DesignerProperty: Key: UnderlineVisible, DisplayName: Underline Visible, FieldType: Boolean, DefaultValue: True, Description: Placeholder
#DesignerProperty: Key: UnderlineColor, DisplayName: Underline Color, FieldType: Color, DefaultValue: 0xFFFFFFFF, Description: Placeholder
#DesignerProperty: Key: UnderlineAnimation, DisplayName: Underline Animation, FieldType: String, Description: Normal: Normal Slide Animation to the next Tab Stretch: A Stretch Animation to the Next Tab , DefaultValue: Normal, List: Normal|Stretch

'Tabs
#DesignerProperty: Key: PartinglineShow, DisplayName: Partingline Visible, FieldType: Boolean, DefaultValue: True, Description: Placeholder
#DesignerProperty: Key: PartinglineColor, DisplayName: Partingline Color, FieldType: Color, DefaultValue: 0xFFFFFFFF, Description: Placeholder

'Text
#DesignerProperty: Key: TextOnly, DisplayName: Text Only, FieldType: Boolean, DefaultValue: False, Description: No Icons,Text Visible True Required
#DesignerProperty: Key: TextVisible, DisplayName: Text Visible, FieldType: Boolean, DefaultValue: False, Description: Placeholder
#DesignerProperty: Key: Text1, DisplayName: Text 1, FieldType: String, DefaultValue: Home
#DesignerProperty: Key: Text2, DisplayName: Text 2, FieldType: String, DefaultValue: Chats
#DesignerProperty: Key: Text3, DisplayName: Text 3, FieldType: String, DefaultValue: Add New
#DesignerProperty: Key: Text4, DisplayName: Text 4, FieldType: String, DefaultValue: Groups
#DesignerProperty: Key: Text5, DisplayName: Text 5, FieldType: String, DefaultValue: Settings

'Badgets
#DesignerProperty: Key: EnableBadget1, DisplayName: Enable Badget 1, FieldType: Boolean, DefaultValue: False, Description: Enables the Badget.
#DesignerProperty: Key: BadgetColor1, DisplayName: Badget Color 1, FieldType: Color, DefaultValue: 0xFF000000, Description: The Background Color of the 1 Badget. The number stands for the page.
#DesignerProperty: Key: EnableBadget2, DisplayName: Enable Badget 2, FieldType: Boolean, DefaultValue: False, Description: Enables the Badget.
#DesignerProperty: Key: BadgetColor2, DisplayName: Badget Color 2, FieldType: Color, DefaultValue: 0xFF8E44AD, Description: The Background Color of the 2 Badget. The number stands for the page.
#DesignerProperty: Key: EnableBadget3, DisplayName: Enable Badget 3, FieldType: Boolean, DefaultValue: False, Description: Enables the Badget.
#DesignerProperty: Key: BadgetColor3, DisplayName: Badget Color 3, FieldType: Color, DefaultValue: 0xFF4862A3, Description: The Background Color of the 3 Badget. The number stands for the page.
#DesignerProperty: Key: EnableBadget4, DisplayName: Enable Badget 4, FieldType: Boolean, DefaultValue: False, Description: Enables the Badget.
#DesignerProperty: Key: BadgetColor4, DisplayName: Badget Color 4, FieldType: Color, DefaultValue: 0xFF48A34E, Description: The Background Color of the 4 Badget. The number stands for the page.

#DesignerProperty: Key: EnableBadget5, DisplayName: Enable Badget 5, FieldType: Boolean, DefaultValue: False, Description: Enables the Badget.
#DesignerProperty: Key: BadgetColor5, DisplayName: Badget Color 5, FieldType: Color, DefaultValue: 0xFF48A34E, Description: The Background Color of the 5 Badget. The number stands for the page.

'Click Colors
#DesignerProperty: Key: EnableSelectedPageColor, DisplayName: Enable Selected Page Icon Color, FieldType: Boolean, DefaultValue: True, Description: If True then the Icon will change the Color on the current Page.
#DesignerProperty: Key: SelectedPageColor, DisplayName: Selected Page Icon Color, FieldType: Color, DefaultValue: 0xFF27AE61, Description: The Color of the Icon of the current Page.

'Background
#DesignerProperty: Key: TabBackgroundColor, DisplayName: Tabs Background Color, FieldType: Color, DefaultValue: 0xFF2F343A, Description: The Color of the Background.
#DesignerProperty: Key: TabClickColor, DisplayName: Page Click Color, FieldType: Color, DefaultValue: 0xFF7F8C8D, Description: The Color of Halo Effect during Page Click.
#DesignerProperty: Key: MiddleButtonBackgroundColor, DisplayName: Middle Button Background Color, FieldType: Color, DefaultValue: 0xFF2D8879, Description: Placeholder

#Event: Tab1Click
#Event: Tab2Click
#Event: Tab3Click
#Event: Tab4Click
#Event: Tab5Click

#Event: MiddleButtonClick
#Event: MiddleButtonLongClick
#Event: TabChange (CurrentTab as int)

Sub Class_Globals
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Private mBase As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private middlebuttonsize As Float
	
	Private xpnl_tab_background As B4XView
	
	Private xpnl_tab_1,xpnl_tab_2,xpnl_tab_3,xpnl_tab_4,xpnl_tab_5 As B4XView
	
	Private xicon_1,xicon_2,xicon_3,xicon_4,xicon_5 As B4XView
	
	Private xpnl_parting_line_1,xpnl_parting_line_2,xpnl_parting_line_3,xpnl_parting_line_4,xpnl_parting_line_5 As B4XView
	
	Private xpnl_underline As B4XView
	
	Private xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4,xlbl_text_5 As B4XView
	
	Private xpnl_parting_line As B4XView
	
	Private xpnl_middlebutton As B4XView
	Private xicon_middlebutton As B4XView
	
	Private xlbl_badget_1,xlbl_badget_2,xlbl_badget_3,xlbl_badget_4,xlbl_badget_5 As B4XView
	
	Private badget_value_1,badget_value_2,badget_value_3,badget_value_4,badget_value_5 As Int
	
	Private current_tab As Int = 1
	
	Private icon_1,icon_2,icon_3,icon_4,icon_5,icon_middlebutton As B4XBitmap
	
	'Properties
	'Modes
	Private tabmodes As String
	Private middlebutton_visible As Boolean
	Private enable_middlebutton_astab As Boolean
	Private middlebutton_wave As Boolean 
	
	'Underline
	Private underline_visible As Boolean
	Private underline_color As Int
	Private underline_animation As String
	
	'Tabs
	Private partinglineshow As Boolean
	Private partingline_color As Int
	
	'Text
	Private text_only As Boolean
	Private text_visible As Boolean
	Private text_1,text_2,text_3,text_4,text_5 As String
	
	'Badgets
	Private enable_badget_1,enable_badget_2,enable_badget_3,enable_badget_4,enable_badget_5 As Boolean
	Private badget_color_1,badget_color_2,badget_color_3,badget_color_4,badget_color_5 As Int
	
	'ClickColors
	Private enable_selectedpage_color As Boolean
	Private selectedpage_color As Int
	
	'Background
	Private tabBackground_color As Int
	Private tabclick_color As Int 
	Private middlebuttonbackground_color As Int 
	
End Sub

Private Sub ini_properties(Props As Map)
	
	'Modes
	tabmodes = Props.Get("TabModes")
	middlebutton_visible = Props.Get("MiddleButtonVisible")
	enable_middlebutton_astab = Props.Get("EnableMiddleButtonAsTab")
	middlebutton_wave = Props.Get("MiddleButtonWave")
	
	'Underline
	underline_visible = Props.Get("UnderlineVisible")
	underline_color = xui.PaintOrColorToColor(Props.Get("UnderlineColor"))
	underline_animation = Props.Get("UnderlineAnimation")
	
	'Tabs
	partinglineshow = Props.Get("PartinglineShow")
	partingline_color = xui.PaintOrColorToColor(Props.Get("PartinglineColor"))
	
	'Text
	text_only = Props.Get("TextOnly")
	text_visible = Props.Get("TextVisible")
	text_1 = Props.Get("Text1")
	text_2 = Props.Get("Text2")
	text_3 = Props.Get("Text3")
	text_4 = Props.Get("Text4")
	text_5 = Props.Get("Text5")
	
	'Badgets
	enable_badget_1 = Props.Get("EnableBadget1")
	enable_badget_2 = Props.Get("EnableBadget2")
	enable_badget_3 = Props.Get("EnableBadget3")
	enable_badget_4 = Props.Get("EnableBadget4")
	enable_badget_5 = Props.Get("EnableBadget5")
	
	badget_color_1 = xui.PaintOrColorToColor(Props.Get("BadgetColor1"))
	badget_color_2 = xui.PaintOrColorToColor(Props.Get("BadgetColor2"))
	badget_color_3 = xui.PaintOrColorToColor(Props.Get("BadgetColor3"))
	badget_color_4 = xui.PaintOrColorToColor(Props.Get("BadgetColor4"))
	badget_color_5 = xui.PaintOrColorToColor(Props.Get("BadgetColor5"))
	
	'Click Colors
	enable_selectedpage_color = Props.Get("EnableSelectedPageColor")
	selectedpage_color = xui.PaintOrColorToColor(Props.Get("SelectedPageColor"))
	
	'Background
	tabBackground_color = xui.Color_Transparent'''xui.PaintOrColorToColor(Props.Get("TabBackgroundColor"))
	tabclick_color = xui.PaintOrColorToColor(Props.Get("TabClickColor"))
	middlebuttonbackground_color = xui.PaintOrColorToColor(Props.Get("MiddleButtonBackgroundColor"))
	
End Sub

Public Sub Initialize (Callback As Object, EventName As String)
	mEventName = EventName
	mCallBack = Callback
End Sub

'Base type must be Object
Public Sub DesignerCreateView (Base As Object, Lbl As Label, Props As Map)
	mBase = Base
  	'''mBase.SetBitmap(LoadBitmap(File.DirAssets, "Rectangle 60.png"))
	
	If xpnl_tab_background.IsInitialized = False Then
		ini_properties(Props)
	Else
		'''xpnl_tab_background.SetBitmap(LoadBitmap(File.DirAssets, "Rectangle 60.png"))
	End If
	
	#If B4A or B4I
	
	Base_Resize(mBase.Width,mBase.Height)
	
	#End If
	'''FillImageToView(LoadBitmap(File.DirAssets, "Rectangle 60.png"), mBase)
End Sub

Private Sub divider As Int
	
	If tabmodes = "2Tabs"  Then
		
		If enable_middlebutton_astab = True Then
			
			Return 3
			
			Else
				
				Return 2
				
		End If
		
	Else
			
		If enable_middlebutton_astab = True Then
			
			Return 5
			
		Else
				
			Return 4
				
		End If
		
	End If
	
End Sub

Private Sub Base_Resize (Width As Double, Height As Double)
  
  mBase.Color = xui.Color_Transparent
  
	If xpnl_tab_background.IsInitialized = False Then
		
		ini_layout
		
	End If
  
	xpnl_underline.Visible = underline_visible
'''  	Log("resizing to: " & Width & " -- " & Height)
	'''xpnl_tab_background.SetLayoutAnimated(0,0,(40 * mBase.Height)/100,mBase.Width,(60 * mBase.Height)/100)
	'''xpnl_tab_background.SetLayoutAnimated(0, 0, 0, Width, Height)
	'''xpnl_tab_background.SetBitmap(LoadBitmap(File.DirAssets, "Rectangle 60@2x.png"))
	'''SetBitmapWithFitOrFill(xpnl_tab_background, LoadBitmap(File.DirAssets, "Rectangle 60@2x.png"))
	'''FillImageToView(LoadBitmap(File.DirAssets, "xpnl_background.png"), xpnl_tab_background)
	'''xpnl_tab_background.SetBitmap(LoadBitmap(File.DirAssets, "xpnl_background.png"))
	xpnl_parting_line.SetLayoutAnimated(0,0,0,mBase.Width,0dip)
  
	xlbl_text_1.Visible = text_visible
	xlbl_text_2.Visible = text_visible
	xlbl_text_3.Visible = text_visible
	xlbl_text_4.Visible = text_visible
	xlbl_text_5.Visible = text_visible
  
	If middlebutton_visible = True And enable_middlebutton_astab = False Then
  	
		
		xpnl_middlebutton.Visible = True
		
		If middlebuttonsize = 0 Then middlebuttonsize = (80 * mBase.Height)/100
		
		If middlebutton_wave = False Then
			
			xpnl_middlebutton.SetLayoutAnimated(0,mBase.Width/2 - middlebuttonsize/2,xpnl_tab_background.Top - middlebuttonsize/2,middlebuttonsize,middlebuttonsize)
			
			Else
				
			xpnl_middlebutton.SetLayoutAnimated(0,mBase.Width/2 - middlebuttonsize/2,xpnl_tab_background.Top - middlebuttonsize/3,middlebuttonsize,middlebuttonsize)
			
		End If
		
	xicon_middlebutton.SetLayoutAnimated(0,20dip,20dip,xpnl_middlebutton.Width - 40dip,xpnl_middlebutton.Height - 40dip)

		xpnl_middlebutton.SetColorAndBorder(middlebuttonbackground_color,2dip,xui.Color_White,xpnl_middlebutton.Height/2)
	
	Else if middlebutton_visible = False Or enable_middlebutton_astab = True Then
		
		xpnl_middlebutton.Visible = False
	
	End If
  
	xpnl_parting_line_1.Visible = False
	xpnl_parting_line_2.Visible = False
	xpnl_parting_line_3.Visible = False
	xpnl_parting_line_4.Visible = False
	xpnl_parting_line_5.Visible = False
  
  If divider = 2 Then
  	
		If middlebutton_visible = True Then
			
			xpnl_tab_1.SetLayoutAnimated(0,0,0,xpnl_tab_background.Width/divider - xpnl_middlebutton.Width/2,xpnl_tab_background.Height)
			xpnl_tab_2.SetLayoutAnimated(0,xpnl_middlebutton.Left + xpnl_middlebutton.Width,0,xpnl_tab_background.Width/divider - xpnl_middlebutton.Width/2,xpnl_tab_background.Height)
 
			Else
				
			xpnl_tab_1.SetLayoutAnimated(0,0,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
			xpnl_tab_2.SetLayoutAnimated(0,xpnl_tab_1.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
 
			xpnl_parting_line_1.Visible = partinglineshow
 
		End If
  	
	Else  If divider = 3 Then
	
		xpnl_tab_1.SetLayoutAnimated(0,0,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
		
		xpnl_tab_5.SetLayoutAnimated(0,xpnl_tab_1.Left + xpnl_tab_1.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
		
		xpnl_tab_2.SetLayoutAnimated(0,xpnl_tab_5.Left + xpnl_tab_5.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
	
		xpnl_parting_line_1.Visible = partinglineshow
		xpnl_parting_line_5.Visible = partinglineshow
	
	Else  If divider = 4 Then
		
		If middlebutton_visible = True Then
			
			Dim tmp_width As Double = (xpnl_tab_background.Width - xpnl_middlebutton.Width)/divider
			
			xpnl_tab_1.SetLayoutAnimated(0,0,0,tmp_width,xpnl_tab_background.Height)
			xpnl_tab_2.SetLayoutAnimated(0,xpnl_tab_1.Width,0,tmp_width,xpnl_tab_background.Height)
			
			
			xpnl_tab_3.SetLayoutAnimated(0,xpnl_middlebutton.Left + xpnl_middlebutton.Width,0,tmp_width,xpnl_tab_background.Height)
			xpnl_tab_4.SetLayoutAnimated(0,xpnl_tab_3.Left + tmp_width,0,tmp_width,xpnl_tab_background.Height)
			
			xpnl_parting_line_1.Visible = partinglineshow
			xpnl_parting_line_3.Visible = partinglineshow
			
			Else
				
			xpnl_tab_1.SetLayoutAnimated(0,0,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
			xpnl_tab_2.SetLayoutAnimated(0,xpnl_tab_1.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
			xpnl_tab_3.SetLayoutAnimated(0,xpnl_tab_2.Left + xpnl_tab_2.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
			xpnl_tab_4.SetLayoutAnimated(0,xpnl_tab_3.Left + xpnl_tab_3.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
		
			xpnl_parting_line_1.Visible = partinglineshow
			If middlebutton_visible = False Then xpnl_parting_line_2.Visible = partinglineshow Else xpnl_parting_line_2.Visible = False
			
			xpnl_parting_line_3.Visible = partinglineshow
				
		End If
		
		
		
	Else  If divider = 5 Then
	
		xpnl_tab_1.SetLayoutAnimated(0,0,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
		xpnl_tab_2.SetLayoutAnimated(0,xpnl_tab_1.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
		
		xpnl_tab_5.SetLayoutAnimated(0,xpnl_tab_2.Left + xpnl_tab_2.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
		
		xpnl_tab_3.SetLayoutAnimated(0,xpnl_tab_5.Left + xpnl_tab_5.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
		xpnl_tab_4.SetLayoutAnimated(0,xpnl_tab_3.Left + xpnl_tab_3.Width,0,xpnl_tab_background.Width/divider,xpnl_tab_background.Height)
	
		xpnl_parting_line_1.Visible = partinglineshow
		xpnl_parting_line_2.Visible = partinglineshow
		xpnl_parting_line_5.Visible = partinglineshow
		xpnl_parting_line_3.Visible = partinglineshow
	
End If
  

	If current_tab = 1 Then
  	
		tab_1_handler(False,0,0)
	
	else If current_tab = 2 Then
	
		tab_2_handler(False,0,0)
	else If current_tab = 3 Then
	
		tab_3_handler(False,0,0)
		
	else If current_tab = 4 Then
	
		tab_4_handler(False,0,0)
		
	else If current_tab = 5 Then
	
		tab_5_handler(False,0,0)
	
	End If

	If badget_value_1 > 0 Then xlbl_badget_1.Visible = enable_badget_1
	If badget_value_2 > 0 Then xlbl_badget_2.Visible = enable_badget_2
	If badget_value_3 > 0 Then xlbl_badget_3.Visible = enable_badget_3
	If badget_value_4 > 0 Then xlbl_badget_4.Visible = enable_badget_4
	If badget_value_5 > 0 Then xlbl_badget_5.Visible = enable_badget_5
	
	If text_only = False Then
		
		xlbl_badget_1.SetLayoutAnimated(0,xicon_1.Left + xicon_1.Width + 5dip,xpnl_tab_1.Top + 4dip,18dip,18dip)
		xlbl_badget_1.SetColorAndBorder(badget_color_1,0dip,xui.Color_White,xlbl_badget_1.Height/2)
	
		xlbl_badget_2.SetLayoutAnimated(0,xicon_2.Left + xicon_2.Width + 5dip,xpnl_tab_2.Top + 4dip,18dip,18dip)
		xlbl_badget_2.SetColorAndBorder(badget_color_2,0dip,xui.Color_White,xlbl_badget_2.Height/2)
	
		xlbl_badget_3.SetLayoutAnimated(0,xicon_3.Left + xicon_3.Width + 5dip,xpnl_tab_3.Top + 4dip,18dip,18dip)
		xlbl_badget_3.SetColorAndBorder(badget_color_3,0dip,xui.Color_White,xlbl_badget_3.Height/2)
	
		xlbl_badget_4.SetLayoutAnimated(0,xicon_4.Left + xicon_4.Width + 5dip,xpnl_tab_4.Top + 4dip,18dip,18dip)
		xlbl_badget_4.SetColorAndBorder(badget_color_4,0dip,xui.Color_White,xlbl_badget_4.Height/2)
	
		xlbl_badget_5.SetLayoutAnimated(0,xicon_5.Left + xicon_5.Width + 5dip,xpnl_tab_5.Top + 4dip,18dip,18dip)
		xlbl_badget_5.SetColorAndBorder(badget_color_5,0dip,xui.Color_White,xlbl_badget_5.Height/2)
		
		End If
  
	xpnl_parting_line_1.SetLayoutAnimated(0,xpnl_tab_1.Width - 2dip,xpnl_tab_1.Height/2 - (xpnl_tab_1.Height/2)/2,2dip,xpnl_tab_1.Height/2)
	xpnl_parting_line_2.SetLayoutAnimated(0,xpnl_tab_2.Width - 2dip,xpnl_tab_1.Height/2 - (xpnl_tab_1.Height/2)/2,2dip,xpnl_tab_2.Height/2)
	xpnl_parting_line_3.SetLayoutAnimated(0,xpnl_tab_3.Width - 2dip,xpnl_tab_1.Height/2 - (xpnl_tab_1.Height/2)/2,2dip,xpnl_tab_3.Height/2)
	xpnl_parting_line_4.SetLayoutAnimated(0,xpnl_tab_4.Width - 2dip,xpnl_tab_1.Height/2 - (xpnl_tab_1.Height/2)/2,2dip,xpnl_tab_4.Height/2)
	xpnl_parting_line_5.SetLayoutAnimated(0,xpnl_tab_5.Width - 2dip,xpnl_tab_1.Height/2 - (xpnl_tab_1.Height/2)/2,2dip,xpnl_tab_5.Height/2)
  

	
	

	
	
	xpnl_underline.SetColorAndBorder(underline_color,0,xui.Color_White,xpnl_underline.Height/2)
  
	If middlebutton_visible = True And enable_middlebutton_astab = False And middlebutton_wave = True Then
  	
  
	build_wave(xpnl_middlebutton.Height)
  
	Else
		
		xpnl_parting_line.Visible = True
	
  End If
'''  Log("xpnl_tab_background size: " & "left: " & xpnl_tab_background.Left & xpnl_tab_background.Width & " -- " & xpnl_tab_background.Height)
End Sub

Private Sub build_wave(size As Double)
	Log("building_wave")
	#If B4J or B4I

	xpnl_parting_line.Visible = False
	Sleep(0)
	If mBase.NumberOfViews = 4 Then
		'Remove the shape panels
		For Each v As B4XView In mBase.GetAllViewsRecursive
			If v.Tag = "shape" Then v.RemoveViewFromParent
		Next
	End If
	'''''
	'Code for the curve starts here
	'''''
	'shapes view init
	Dim shape,shapeBack As B4XView
	
	Dim shapePanel As B4XView = create_imageview("")
	Dim shapeBackPanel As B4XView = create_imageview("")
    
	
	
	Dim BezierView,BezierBackView As BitmapCreator
	Dim BezierPath As BCPath
	Dim sWidth As Double = (mBase.Height/1.2) +200 + 25
	Dim sHeight As Double = ((mBase.Height/1.2)/2) '+ 10'+ 20
    
	'draw path
	BezierPath.Initialize(0, sHeight)
	CurveTo(BezierPath, 60, sHeight-1, 90, ((sHeight/3)*2)-5)
	CurveTo(BezierPath, 130, 0, sWidth/2, 1)
	CurveTo(BezierPath, sWidth-130, 0, sWidth-90, ((sHeight/3)*2)-5)
	CurveTo(BezierPath, sWidth-60, sHeight-1, sWidth, sHeight)
	BezierPath.LineTo(0,sHeight)
    
	'draw background
	
	BezierView.Initialize(sWidth,sHeight)
	BezierView.DrawPath(BezierPath,tabBackground_color,True,0dip)
	shapePanel.SetBitmap(BezierView.Bitmap)
	
	'draw border
	BezierBackView.Initialize(sWidth,sHeight)
	BezierBackView.DrawPath(BezierPath,tabBackground_color,True,0)
	shapeBackPanel.SetBitmap(BezierBackView.Bitmap)
    
	'set curve view position and background
	shape = shapePanel
	mBase.AddView(shape,(mBase.Width / 2 - sWidth / 2),0, sWidth, sHeight)
	shape.Top = xpnl_tab_background.Top - sHeight + 2dip
	shape.Left = xpnl_tab_background.Width / 2 - shape.Width /2
	shapeBack = shapeBackPanel
	mBase.AddView(shapeBack,(mBase.Width / 2 - sWidth / 2),0, sWidth, sHeight)
	shapeBack.Top = xpnl_tab_background.Top - sHeight + 2dip
	shapeBack.Left = xpnl_tab_background.Width / 2 - shapeBack.Width /2
	shapeBack.SendToBack
	'xpnl_tab_background.BringToFront
	xpnl_middlebutton.BringToFront
    
	shape.Tag = "shape"
	shapeBack.Tag = "shape"
	
	'''''
	'Code for the curve ends here
	'''''
	
	#Else if B4A
	
	'shapes view init
	Dim shape,shapeBack As B4XView
	Dim shapePanel,shapeBackPanel As Panel
	shapePanel.Initialize("")
	shapeBackPanel.Initialize("")
    
	Dim BezierView,BezierBackView As BitmapCreator
	Dim BezierPath As BCPath
	Dim sWidth As Double = mBase.Height+200
	Dim sHeight As Double = ((mBase.Height/1.2)/2) - 4
    
	'draw path
	BezierPath.Initialize(0, sHeight)
	CurveTo(BezierPath, sWidth/8, sHeight-1, sWidth/5, ((sHeight/3)*2)-5)
	CurveTo(BezierPath, sWidth/3, 0, sWidth/2, 1)
	CurveTo(BezierPath, sWidth-(sWidth/3), 0, sWidth-(sWidth/5), ((sHeight/3)*2)-5)
	CurveTo(BezierPath, sWidth-(sWidth/8), sHeight-1, sWidth, sHeight)
	BezierPath.LineTo(0,sHeight)
    
	'draw background
	BezierView.Initialize(sWidth,sHeight)
	BezierView.DrawPath(BezierPath,tabBackground_color,True,0)
	shapePanel.SetBackgroundImage(BezierView.Bitmap).Gravity = Gravity.FILL
    
	'draw border
	BezierBackView.Initialize(sWidth,sHeight+1)
	BezierBackView.DrawPath(BezierPath,partingline_color,True,0)
	shapeBackPanel.SetBackgroundImage(BezierBackView.Bitmap).Gravity = Gravity.FILL
	'''shapeBackPanel.SetBackgroundImage(LoadBitmap(File.DirAssets, "Rectangle 60@2x.png"))
    
	'set curve view position and background
	shape = shapePanel
	mBase.AddView(shape,(mBase.Width / 2 - sWidth / 2),0, sWidth, sHeight)
	shape.Top = 3dip
	shape.Left = xpnl_tab_background.Width / 2 - shape.Width /2
	shapeBack = shapeBackPanel
	mBase.AddView(shapeBack,(mBase.Width / 2 - sWidth / 2),0, sWidth, sHeight+1)
	shapeBack.Top = 0
	shapeBack.Left = xpnl_tab_background.Width / 2 - shapeBack.Width /2
	shapeBack.SendToBack
	
	xpnl_middlebutton.BringToFront
    
	shape.Tag = "shape"
	shapeBack.Tag = "shape"
	
	'''''
	'Code for the curve ends here
	'''''
    
	'Top position has been modified for the curve view
	'xpnl_middlebutton.Top = xpnl_parting_line.Top - xpnl_middlebutton.Height/3
    
	'xpnl_middlebutton.Left = xpnl_tab_background.Width / 2 - xpnl_middlebutton.Width /2

	'icon_middlebutton.Width = xpnl_middlebutton.Width /2.5
	'icon_middlebutton.Height = xpnl_middlebutton.Height /2.5
    
	'icon_middlebutton.Left = xpnl_middlebutton.Width / 2 - icon_middlebutton.Width /2
	'icon_middlebutton.Top = xpnl_middlebutton.Height / 2 - icon_middlebutton.Height / 2
	
	
	
	
	#End if
	
End Sub

Private Sub ini_layout
	Log("initializing bottom menu layout")
	xpnl_tab_background = xui.CreatePanel("")
	mBase.AddView(xpnl_tab_background,0,15dip,mBase.Width,mBase.Height)''
	'''mBase.SetBitmap(LoadBitmap(File.DirAssets, "Rectangle 60@2x.png"))
'	xpnl_tab_background.Color = xui.Color_RGB(47, 52, 58)
	'''xpnl_tab_background.Color = tabBackground_color
	'''xpnl_tab_background.SetBitmap(LoadBitmap(File.DirAssets, "Rectangle 60.png"))
	'''xpnl_tab_background.SetBitmap(LoadBitmap(File.DirAssets, "xpnl_background.png").Resize(mBase.Width +15dip, mBase.Height + 17dip, False))
	'''FillImageToView(LoadBitmap(File.DirAssets, "xpnl_background.png"), xpnl_tab_background)
	xpnl_tab_background.SetBitmap(LoadBitmap(File.DirAssets, "Rectangle 60@2x.png").Resize(mBase.Width + 60dip, mBase.Height + 40dip, False))
	xpnl_parting_line = xui.CreatePanel("")
	
	xpnl_tab_1 = xui.CreatePanel("tab_1")
	xpnl_tab_2 = xui.CreatePanel("tab_2")
	xpnl_tab_3 = xui.CreatePanel("tab_3")
	xpnl_tab_4 = xui.CreatePanel("tab_4")
	xpnl_tab_5 = xui.CreatePanel("tab_5")
	
	xicon_1 = create_imageview("")
	xicon_2 = create_imageview("")
	xicon_3 = create_imageview("")
	xicon_4 = create_imageview("")
	xicon_5 = create_imageview("")
	
	xlbl_text_1 = create_label("")
	xlbl_text_2 = create_label("")
	xlbl_text_3 = create_label("")
	xlbl_text_4 = create_label("")
	xlbl_text_5 = create_label("")
	
	xlbl_badget_1 = create_label("")
	xlbl_badget_2 = create_label("")
	xlbl_badget_3 = create_label("")
	xlbl_badget_4 = create_label("")
	xlbl_badget_5 = create_label("")
	
	xpnl_parting_line_1 = xui.CreatePanel("")
	xpnl_parting_line_2 = xui.CreatePanel("")
	xpnl_parting_line_3 = xui.CreatePanel("")
	xpnl_parting_line_4 = xui.CreatePanel("")
	xpnl_parting_line_5 = xui.CreatePanel("")
	
	xpnl_parting_line_1.Visible = False
	xpnl_parting_line_2.Visible = False
	xpnl_parting_line_3.Visible = False
	xpnl_parting_line_4.Visible = False
	xpnl_parting_line_5.Visible = False
	
	xpnl_underline = xui.CreatePanel("")
	
	xpnl_tab_background.AddView(xpnl_tab_1,0,0,0,0)
	xpnl_tab_background.AddView(xpnl_tab_2,0,0,0,0)
	xpnl_tab_background.AddView(xpnl_tab_3,0,0,0,0)
	xpnl_tab_background.AddView(xpnl_tab_4,0,0,0,0)
	xpnl_tab_background.AddView(xpnl_tab_5,0,0,0,0)
	
	xpnl_tab_1.AddView(xicon_1,0,0,1dip,1dip)
	xpnl_tab_2.AddView(xicon_2,0,0,1dip,1dip)
	xpnl_tab_3.AddView(xicon_3,0,0,1dip,1dip)
	xpnl_tab_4.AddView(xicon_4,0,0,1dip,1dip)
	xpnl_tab_5.AddView(xicon_5,0,0,1dip,1dip)
	
	xpnl_tab_1.AddView(xlbl_text_1,0,0,0,0)
	xpnl_tab_2.AddView(xlbl_text_2,0,0,0,0)
	xpnl_tab_3.AddView(xlbl_text_3,0,0,0,0)
	xpnl_tab_4.AddView(xlbl_text_4,0,0,0,0)
	xpnl_tab_5.AddView(xlbl_text_5,0,0,0,0)
	
	xpnl_tab_1.AddView(xlbl_badget_1,0,0,0,0)
	xpnl_tab_2.AddView(xlbl_badget_2,0,0,0,0)
	xpnl_tab_3.AddView(xlbl_badget_3,0,0,0,0)
	xpnl_tab_4.AddView(xlbl_badget_4,0,0,0,0)
	xpnl_tab_5.AddView(xlbl_badget_5,0,0,0,0)
	
	xpnl_tab_1.AddView(xpnl_parting_line_1,0,0,0,0)
	xpnl_tab_2.AddView(xpnl_parting_line_2,0,0,0,0)
	xpnl_tab_3.AddView(xpnl_parting_line_3,0,0,0,0)
	xpnl_tab_4.AddView(xpnl_parting_line_4,0,0,0,0)
	xpnl_tab_5.AddView(xpnl_parting_line_5,0,0,0,0)
	
	xpnl_tab_background.AddView(xpnl_underline,0,0,0,0)
	
	'''xpnl_parting_line.SetBitmap(xui.LoadBitmap(File.DirAssets, "Rectangle 60@2x.png"))
	xpnl_tab_background.AddView(xpnl_parting_line,0,0,0,0)
	'xpnl_parting_line.Color = xui.Color_White
	xpnl_parting_line.Color = partingline_color
	
	xpnl_middlebutton = xui.CreatePanel("middle_button")
	
	mBase.AddView(xpnl_middlebutton,0,0,0,0)
	
	xicon_middlebutton = create_imageview("")
	xpnl_middlebutton.AddView(xicon_middlebutton,0,0,0,0)
	
	ini_textllabels(xlbl_text_1,text_1,xui.Color_White)
	ini_textllabels(xlbl_text_2,text_2,xui.Color_White)
	ini_textllabels(xlbl_text_3,text_3,xui.Color_White)
	ini_textllabels(xlbl_text_4,text_4,xui.Color_White)
	ini_textllabels(xlbl_text_5,text_5,xui.Color_White)

	ini_badgets(xlbl_badget_1)
	ini_badgets(xlbl_badget_2)
	ini_badgets(xlbl_badget_3)
	ini_badgets(xlbl_badget_4)
	ini_badgets(xlbl_badget_5)
	
	ini_partingline(xpnl_parting_line_1)
	ini_partingline(xpnl_parting_line_2)
	ini_partingline(xpnl_parting_line_3)
	ini_partingline(xpnl_parting_line_4)
	ini_partingline(xpnl_parting_line_5)
	
	'''xpnl_tab_background.SetBitmap(LoadBitmap(File.DirAssets, "Rectangle 60@2x.png"))
	
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

Private Sub ini_partingline(xpartingline As B4XView)
	
	xpartingline.Color = partingline_color

	
End Sub

Private Sub ini_textllabels(xlabel As B4XView,text As String,color As Int)
	
	xlabel.Text = text
	xlabel.TextColor = color
	xlabel.SetTextAlignment("CENTER","CENTER")
	xlabel.Font = xui.CreateDefaultBoldFont(12)

End Sub

Private Sub ini_badgets(xbadget As B4XView)
	
	xbadget.Font = xui.CreateDefaultBoldFont(10)
	xbadget.TextColor = xui.Color_White
	xbadget.SetTextAlignment("CENTER","CENTER")
	xbadget.Visible = False
	
End Sub

Private Sub create_imageview(EventName As String) As B4XView
	
	Dim tmp_imageview As ImageView
	tmp_imageview.Initialize(EventName)
	
	Return tmp_imageview
	
End Sub

Private Sub create_label(EventName As String) As B4XView
	
	Dim tmp_label As Label
	tmp_label.Initialize(EventName)
	
	Return tmp_label
	
	
End Sub

Private Sub format_textlabel(speed250 As Int)
	
	If text_only = True Then
	
		xlbl_text_1.SetLayoutAnimated(0,0,xpnl_tab_1.Height/2 - 25dip/2,xpnl_tab_1.Width,25dip)
		xlbl_text_2.SetLayoutAnimated(0,0,xpnl_tab_2.Height/2 - 25dip/2,xpnl_tab_1.Width,25dip)
		xlbl_text_3.SetLayoutAnimated(0,0,xpnl_tab_3.Height/2 - 25dip/2,xpnl_tab_1.Width,25dip)
		xlbl_text_4.SetLayoutAnimated(0,0,xpnl_tab_4.Height/2 - 25dip/2,xpnl_tab_1.Width,25dip)
		xlbl_text_5.SetLayoutAnimated(0,0,xpnl_tab_5.Height/2 - 25dip/2,xpnl_tab_1.Width,25dip)
	
		xlbl_text_1.Visible = True
		xlbl_text_2.Visible = True
		xlbl_text_3.Visible = True
		xlbl_text_4.Visible = True
		xlbl_text_5.Visible = True
	
		xicon_1.Visible = False
		xicon_2.Visible = False
		xicon_3.Visible = False
		xicon_4.Visible = False
		xicon_5.Visible = False
	
	Else If text_visible = True Then
		
		
		xicon_1.SetLayoutAnimated(speed250,xpnl_tab_1.Width/2 - (25dip/1.25)/2,xpnl_tab_1.Height/2 - ((25dip/1.25) + 10dip)/2,25dip/1.25,25dip/1.25)
		xlbl_text_1.SetLayoutAnimated(speed250,0,(xpnl_tab_1.Height/2 - ((25dip/1.25) + 10dip)/2) + xicon_1.Height ,xpnl_tab_1.Width,14dip)
	
		xicon_2.SetLayoutAnimated(speed250,xpnl_tab_2.Width/2 - (25dip/1.25)/2,xpnl_tab_2.Height/2 - ((25dip/1.25) + 10dip)/2,25dip/1.25,25dip/1.25)
		xlbl_text_2.SetLayoutAnimated(speed250,0,(xpnl_tab_2.Height/2 - ((25dip/1.25) + 10dip)/2) + xicon_2.Height ,xpnl_tab_2.Width,14dip)
			
		xicon_3.SetLayoutAnimated(speed250,xpnl_tab_3.Width/2 - (25dip/1.25)/2,xpnl_tab_3.Height/2 - ((25dip/1.25) + 10dip)/2,25dip/1.25,25dip/1.25)
		xlbl_text_3.SetLayoutAnimated(speed250,0,(xpnl_tab_3.Height/2 - ((25dip/1.25) + 10dip)/2) + xicon_3.Height ,xpnl_tab_3.Width,14dip)
			
		xicon_4.SetLayoutAnimated(speed250,xpnl_tab_4.Width/2 - (25dip/1.25)/2,xpnl_tab_4.Height/2 - ((25dip/1.25) + 10dip)/2,25dip/1.25,25dip/1.25)
		xlbl_text_4.SetLayoutAnimated(speed250,0,(xpnl_tab_4.Height/2 - ((25dip/1.25) + 10dip)/2) + xicon_3.Height ,xpnl_tab_4.Width,14dip)
			
		xicon_5.SetLayoutAnimated(speed250,xpnl_tab_5.Width/2 - (25dip/1.25)/2,xpnl_tab_5.Height/2 - ((25dip/1.25) + 10dip)/2,25dip/1.25,25dip/1.25)
		xlbl_text_5.SetLayoutAnimated(speed250,0,(xpnl_tab_5.Height/2 - ((25dip/1.25) + 10dip)/2) + xicon_5.Height ,xpnl_tab_5.Width,14dip)
	
		xicon_1.Visible = True
		xicon_2.Visible = True
		xicon_3.Visible = True
		xicon_4.Visible = True
		xicon_5.Visible = True
	
	Else If text_visible = False And text_only = False Then
	
	
		xicon_1.SetLayoutAnimated(0,xpnl_tab_1.Width/2 - 25dip/2,xpnl_tab_1.Height/2 - 25dip/2,25dip,25dip)
		xicon_2.SetLayoutAnimated(0,xpnl_tab_2.Width/2 - 25dip/2,xpnl_tab_2.Height/2 - 25dip/2,25dip,25dip)
		xicon_3.SetLayoutAnimated(0,xpnl_tab_3.Width/2 - 25dip/2,xpnl_tab_3.Height/2 - 25dip/2,25dip,25dip)
		xicon_4.SetLayoutAnimated(0,xpnl_tab_4.Width/2 - 25dip/2,xpnl_tab_4.Height/2 - 25dip/2,25dip,25dip)
		xicon_5.SetLayoutAnimated(0,xpnl_tab_5.Width/2 - 25dip/2,xpnl_tab_5.Height/2 - 25dip/2,25dip,25dip)
	
		xicon_1.Visible = True
		xicon_2.Visible = True
		xicon_3.Visible = True
		xicon_4.Visible = True
		xicon_5.Visible = True
	
		End If
	
End Sub

Private Sub underline_slide_animation_1(toview As B4XView,totab As B4XView,speed250 As Int)
	
	format_textlabel(speed250)
	
	xpnl_underline.SetLayoutAnimated(speed250,totab.Left + totab.Width/2 - 40dip/2,toview.Top + toview.Height + 2.5dip,40dip,2dip)'toview.Width + 10dip
	
	
End Sub

Private Sub underline_slide_animation_2(toview As B4XView,totab As B4XView,speed250 As Int)
	
	format_textlabel(speed250)
	
	If text_only = True Then
		
		
		
		If totab.Left < xpnl_underline.Left Then
			Dim tmp As Double = xpnl_underline.Left - totab.Left + xpnl_underline.Width/2  'xpnl_underline.Left + xpnl_underline.Width + xpnl_underline.Width/2 - totab.Width/2
			xpnl_underline.SetLayoutAnimated(speed250,totab.Left + totab.Width/2 - (toview.Width/2)/2,toview.Top + toview.Height + 2.5dip,tmp,2dip)
			Sleep(speed250)
			xpnl_underline.SetLayoutAnimated(speed250,totab.Left + totab.Width/2 - (toview.Width/2)/2,toview.Top + toview.Height + 2.5dip,toview.Width/2,2dip)
	
		Else
			Dim tmp As Double = totab.Left + totab.Width/2 - (toview.Width/2)/2 - xpnl_underline.Left + xpnl_underline.Width
			xpnl_underline.SetLayoutAnimated(speed250,xpnl_underline.Left,toview.Top + toview.Height + 2.5dip,tmp,2dip)
			Sleep(speed250)
			xpnl_underline.SetLayoutAnimated(speed250,totab.Left + totab.Width/2 - (toview.Width/2)/2,toview.Top + toview.Height + 2.5dip,toview.Width/2,2dip)
			
		End If
		
	Else
			
		If totab.Left < xpnl_underline.Left Then
			Dim tmp As Double = xpnl_underline.Left - totab.Left - xpnl_underline.Width/2  'xpnl_underline.Left + xpnl_underline.Width + xpnl_underline.Width/2 - totab.Width/2
			xpnl_underline.SetLayoutAnimated(speed250,totab.Left + totab.Width/2 - (toview.Width + 10dip)/2,toview.Top + toview.Height + 2.5dip,tmp,2dip)
			Sleep(speed250)
			xpnl_underline.SetLayoutAnimated(speed250,totab.Left + totab.Width/2 - (toview.Width + 10dip)/2,toview.Top + toview.Height + 2.5dip,toview.Width + 10dip,2dip)
	
		Else
			Dim tmp As Double = totab.Left + totab.Width/2 - (toview.Width + 10dip)/2 - xpnl_underline.Left + xpnl_underline.Width
			xpnl_underline.SetLayoutAnimated(speed250,xpnl_underline.Left,toview.Top + toview.Height + 2.5dip,tmp,2dip)
			Sleep(speed250)
			xpnl_underline.SetLayoutAnimated(speed250,totab.Left + totab.Width/2 - (toview.Width + 10dip)/2,toview.Top + toview.Height + 2.5dip,toview.Width + 10dip,2dip)
			
		End If
			
	End If
	
	
	
End Sub

Private Sub underline_slide_animation_withtext_1(totextview As B4XView,totab As B4XView,toiconview As B4XView,speed250 As Int)
	
	format_textlabel(speed250)
	

	toiconview.SetLayoutAnimated(speed250,totab.Width/2 - (25dip/1.25)/2,10dip/2,25dip/1.25,25dip/1.25)
	totextview.SetLayoutAnimated(speed250,0,5dip + toiconview.Height,totab.Width,14dip)
	
	xpnl_underline.SetLayoutAnimated(speed250,totab.Left + totextview.Width/2 - 40dip/2,5dip + toiconview.Height + totextview.Height + 5dip,40dip,2dip)

	
	
End Sub

Private Sub underline_slide_animation_withtext_2(totextview As B4XView,totab As B4XView,toiconview As B4XView,speed250 As Int,speed150 As Int)

	format_textlabel(speed250)
	toiconview.SetLayoutAnimated(speed250,totab.Width/2 - (25dip/1.25)/2,10dip/2,25dip/1.25,25dip/1.25)
	totextview.SetLayoutAnimated(speed250,0,5dip + toiconview.Height,totab.Width,14dip)
	
	'xpnl_underline.SetLayoutAnimated(250,totab.Left + totextview.Width/2 - 40dip/2,5dip + toiconview.Height + totextview.Height + 10dip,40dip,2dip)

	If totab.Left < xpnl_underline.Left Then
		Dim tmp As Double = xpnl_underline.Left - totab.Left  - 40dip/2  'xpnl_underline.Left + xpnl_underline.Width + xpnl_underline.Width/2 - totab.Width/2
		xpnl_underline.SetLayoutAnimated(speed150,totab.Left + totab.Width/2 - (toiconview.Width/2)/2,5dip + toiconview.Height + totextview.Height + 5dip,tmp,2dip)
		Sleep(speed150)
		xpnl_underline.SetLayoutAnimated(speed150,totab.Left + totab.Width/2 - 40dip/2,5dip + toiconview.Height + totextview.Height + 5dip,40dip,2dip)
	
	Else
		Dim tmp As Double = totab.Left + totab.Width/2 - (toiconview.Width/2)/2 - xpnl_underline.Left + 40dip/2
		xpnl_underline.SetLayoutAnimated(speed250,xpnl_underline.Left,5dip + toiconview.Height + totextview.Height + 5dip,tmp,2dip)
		Sleep(speed250)
		xpnl_underline.SetLayoutAnimated(speed250,totab.Left + totab.Width/2 - 40dip/2,5dip + toiconview.Height + totextview.Height + 5dip,40dip,2dip)
			
	End If
	
End Sub


#Region Events

Private Sub tabchange_handler(currenttab As Int)
	
	If xui.SubExists(mCallBack, mEventName & "_TabChange",0) Then
		CallSub2(mCallBack, mEventName & "_TabChange",currenttab)
	End If
	
End Sub

#If B4A or B4I

Private Sub middle_button_Click
	
	middle_button_click_handler
	
End Sub

Private Sub middle_button_LongClick
	
	middle_button_longclick_handler
	
End Sub

#Else B4J

Private Sub middle_button_MouseClicked (EventData As MouseEvent)
	
	
	middle_button_click_handler
	
	
End Sub

#End if

Private Sub middle_button_click_handler
	
	If xui.SubExists(mCallBack, mEventName & "_MiddleButtonClick",0) Then
		CallSub(mCallBack, mEventName & "_MiddleButtonClick")
	End If
	
End Sub

Private Sub middle_button_longclick_handler
	
	If xui.SubExists(mCallBack, mEventName & "_MiddleButtonLongClick",0) Then
		CallSub(mCallBack, mEventName & "_MiddleButtonLongClick")
	End If
	
End Sub

#If B4A or B4I

Private Sub tab_1_Click
	
	tab_1_handler(True,250,150)
	
End Sub

#Else B4J

Private Sub tab_1_MouseClicked (EventData As MouseEvent)
	
	
	tab_1_handler(True,250,150)
	
End Sub

#End If

Private Sub tab_1_handler(WithHalo As Boolean,speed250 As Int,speed150 As Int)
	
	If WithHalo = True Then
	
	If xui.SubExists(mCallBack, mEventName & "_Tab1Click",0) Then
		CallSub(mCallBack, mEventName & "_Tab1Click")
	End If
	
	End If
	
	current_tab = 1
If speed250 > 0 Then tabchange_handler(current_tab)
	
	If underline_animation = "Normal" Then
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4,xlbl_text_5)
			underline_slide_animation_withtext_1(xlbl_text_1,xpnl_tab_1,xicon_1,speed250)
		
		Else
	
			If text_only = True Then
				changelabeltextcolor(xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4,xlbl_text_5)
				underline_slide_animation_1(xlbl_text_1,xpnl_tab_1,speed250)
			Else
				underline_slide_animation_1(xicon_1,xpnl_tab_1,speed250)
			End If
	
		End If
	Else
			
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4,xlbl_text_5)
			underline_slide_animation_withtext_2(xlbl_text_1,xpnl_tab_1,xicon_1,speed250,speed150)
		
		Else
	
			If text_only = True Then
				changelabeltextcolor(xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4,xlbl_text_5)
				underline_slide_animation_2(xlbl_text_1,xpnl_tab_1,speed250)
			Else
				underline_slide_animation_2(xicon_1,xpnl_tab_1,speed250)
			End If
	
		End If
			
	End If
	
	 changeiconcolor(xicon_1,xicon_2,xicon_3,xicon_4,xicon_5,icon_1,icon_2,icon_3,icon_4,icon_5)
	
	
	
	If WithHalo = True Then  CreateHaloEffect(xpnl_tab_1, xpnl_tab_1.Width/2, xpnl_tab_1.Height/2, tabclick_color)

	

End Sub

Private Sub changelabeltextcolor(active_view As B4XView,view_2 As B4XView,view_3 As B4XView,view_4 As B4XView,view_5 As B4XView)
	
	If enable_selectedpage_color = True Then

		active_view.TextColor = selectedpage_color
		
		view_2.TextColor = xui.Color_White

		If tabmodes = "4Tabs"  Then
			view_3.TextColor = xui.Color_White
			view_4.TextColor = xui.Color_White

		End If

		If enable_middlebutton_astab = True Then

			view_5.TextColor = xui.Color_White

		End If

	End If
	
	
End Sub

Private Sub changeiconcolor(active_view As B4XView,view_2 As B4XView,view_3 As B4XView,view_4 As B4XView,view_5 As B4XView,activeicon As B4XBitmap,icon2 As B4XBitmap,icon3 As B4XBitmap,icon4 As B4XBitmap,icon5 As B4XBitmap)
	
	If enable_selectedpage_color = True Then

If active_view.IsInitialized = True And icon2.IsInitialized = True Then

			SetBitmapWithFitOrFill(active_view,ChangeColorBasedOnAlphaLevel(activeicon,selectedpage_color))

			'''SetBitmapWithFitOrFill(view_2,ChangeColorBasedOnAlphaLevel(icon2,xui.Color_White))
			'''SetBitmapWithFitOrFill(view_2,ChangeColorBasedOnAlphaLevel(icon2,xui.Color_RGB(25, 30, 35))) '''xui.Color_Black
			Dim iv As ImageView = view_2
			iv.Gravity = Gravity.FILL
			''' = xui.Color_ARGB(22, 25, 30, 35)

End If

		If tabmodes = "4Tabs"  Then
			
			If icon3.IsInitialized = True And icon4.IsInitialized = True Then
			
				'''SetBitmapWithFitOrFill(view_3,ChangeColorBasedOnAlphaLevel(icon3,xui.Color_White))
				'''SetBitmapWithFitOrFill(view_4,ChangeColorBasedOnAlphaLevel(icon4,xui.Color_White))
				'''SetBitmapWithFitOrFill(view_3,ChangeColorBasedOnAlphaLevel(icon3,xui.Color_Black))
				'''SetBitmapWithFitOrFill(view_4,ChangeColorBasedOnAlphaLevel(icon4,xui.Color_Black))
				Dim iv2 As ImageView = view_3
				Dim iv3 As ImageView = view_4
				iv2.Gravity = Gravity.FILL
				iv3.Gravity = Gravity.FILL

End If

		End If

If enable_middlebutton_astab = True Then

If icon5.IsInitialized = True Then

				'''SetBitmapWithFitOrFill(view_5,ChangeColorBasedOnAlphaLevel(icon5,xui.Color_White))
				SetBitmapWithFitOrFill(view_5,ChangeColorBasedOnAlphaLevel(icon5,xui.Color_Black))

End If

End If

	End If
	
	
End Sub

#If B4A or B4I

Private Sub tab_2_Click
	
	tab_2_handler(True,250,150)
	
End Sub

#Else B4J

Private Sub tab_2_MouseClicked (EventData As MouseEvent)
	
	
	tab_2_handler(True,250,150)
	
	
End Sub

#End If


Private Sub tab_2_handler(WithHalo As Boolean,speed250 As Int,speed150 As Int)
	
	If WithHalo = True Then
	
	If xui.SubExists(mCallBack, mEventName & "_Tab2Click",0) Then
		CallSub(mCallBack, mEventName & "_Tab2Click")
	End If
	
	End If
	
	current_tab = 2
	If speed250 > 0 Then tabchange_handler(current_tab)
	
If underline_animation = "Normal" Then
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_2,xlbl_text_1,xlbl_text_3,xlbl_text_4,xlbl_text_5)
			underline_slide_animation_withtext_1(xlbl_text_2,xpnl_tab_2,xicon_2,speed250)
		
		Else
			If text_only = True Then
				changelabeltextcolor(xlbl_text_2,xlbl_text_1,xlbl_text_3,xlbl_text_4,xlbl_text_5)
				underline_slide_animation_1(xlbl_text_2,xpnl_tab_2,speed250)
			Else
				underline_slide_animation_1(xicon_2,xpnl_tab_2,speed250)
			End If
			
		End If
	Else
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_2,xlbl_text_1,xlbl_text_3,xlbl_text_4,xlbl_text_5)
			underline_slide_animation_withtext_2(xlbl_text_2,xpnl_tab_2,xicon_2,speed250,speed150)
		
		Else
			If text_only = True Then
				changelabeltextcolor(xlbl_text_2,xlbl_text_1,xlbl_text_3,xlbl_text_4,xlbl_text_5)
				underline_slide_animation_2(xlbl_text_2,xpnl_tab_2,speed250)
			Else
				underline_slide_animation_2(xicon_2,xpnl_tab_2,speed250)
			End If
			
		End If
			
	End If
	
	changeiconcolor(xicon_2,xicon_1,xicon_3,xicon_4,xicon_5,icon_2,icon_1,icon_3,icon_4,icon_5)
	
	If WithHalo = True Then  CreateHaloEffect(xpnl_tab_2, xpnl_tab_2.Width/2, xpnl_tab_2.Height/2, tabclick_color)
	
End Sub

#If B4A or B4I

Private Sub tab_3_Click
	
	tab_3_handler(True,250,150)
	
End Sub

#Else B4J

Private Sub tab_3_MouseClicked (EventData As MouseEvent)
	
	
	tab_3_handler(True,250,150)
	
	
End Sub

#End If

Private Sub tab_3_handler(WithHalo As Boolean,speed250 As Int,speed150 As Int)
	
	If WithHalo = True Then
	
	If xui.SubExists(mCallBack, mEventName & "_Tab3Click",0) Then
		CallSub(mCallBack, mEventName & "_Tab3Click")
	End If
	
	End If
	
	current_tab = 3
	If speed250 > 0 Then tabchange_handler(current_tab)
	
	If underline_animation = "Normal"  Then
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_3,xlbl_text_1,xlbl_text_2,xlbl_text_4,xlbl_text_5)
			underline_slide_animation_withtext_1(xlbl_text_3,xpnl_tab_3,xicon_3,speed250)
		
		Else
	
			If text_only = True Then
				changelabeltextcolor(xlbl_text_3,xlbl_text_1,xlbl_text_2,xlbl_text_4,xlbl_text_5)
				underline_slide_animation_1(xlbl_text_3,xpnl_tab_3,speed250)
			Else
				underline_slide_animation_1(xicon_3,xpnl_tab_3,speed250)
			End If
			
		End If
	Else
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_3,xlbl_text_1,xlbl_text_2,xlbl_text_4,xlbl_text_5)
			underline_slide_animation_withtext_2(xlbl_text_3,xpnl_tab_3,xicon_3,speed250,speed150)
		
		Else
	
			If text_only = True Then
				changelabeltextcolor(xlbl_text_3,xlbl_text_1,xlbl_text_2,xlbl_text_4,xlbl_text_5)
				underline_slide_animation_2(xlbl_text_3,xpnl_tab_3,speed250)
			Else
				underline_slide_animation_2(xicon_3,xpnl_tab_3,speed250)
			End If
			
	End If
	

	
	End If
	
	changeiconcolor(xicon_3,xicon_1,xicon_2,xicon_4,xicon_5,icon_3,icon_1,icon_2,icon_4,icon_5)
	
	If WithHalo = True Then  CreateHaloEffect(xpnl_tab_3, xpnl_tab_3.Width/2, xpnl_tab_3.Height/2, tabclick_color)
	
End Sub

#If B4A or B4I

Private Sub tab_4_Click
	
	tab_4_handler(True,250,150)
	
End Sub

#Else B4J

Private Sub tab_4_MouseClicked (EventData As MouseEvent)
	
	
	tab_4_handler(True,250,150)
	
	
End Sub

#End If

Private Sub tab_4_handler(WithHalo As Boolean,speed250 As Int,speed150 As Int)
	
	If WithHalo = True Then
	
	If xui.SubExists(mCallBack, mEventName & "_Tab4Click",0) Then
		CallSub(mCallBack, mEventName & "_Tab4Click")
	End If
	
	End If
	
	current_tab = 4
	If speed250 > 0 Then tabchange_handler(current_tab)
	
	If underline_animation = "Normal"  Then
		
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_4,xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4)
			underline_slide_animation_withtext_1(xlbl_text_4,xpnl_tab_4,xicon_4,speed250)
		
		Else
	
			If text_only = True Then
				changelabeltextcolor(xlbl_text_4,xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4)
				underline_slide_animation_1(xlbl_text_4,xpnl_tab_4,speed250)
			Else
				underline_slide_animation_1(xicon_4,xpnl_tab_4,speed250)
			End If
	
		End If
		
	Else
			
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_4,xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4)
			underline_slide_animation_withtext_2(xlbl_text_4,xpnl_tab_4,xicon_4,speed250,speed150)
		
		Else
	
			If text_only = True Then
				changelabeltextcolor(xlbl_text_4,xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4)
				underline_slide_animation_2(xlbl_text_4,xpnl_tab_4,speed250)
			Else
				underline_slide_animation_2(xicon_4,xpnl_tab_4,speed250)
			End If
	
		End If
			
	End If
	
	changeiconcolor(xicon_4,xicon_1,xicon_2,xicon_3,xicon_5,icon_4,icon_1,icon_2,icon_3,icon_5)
	
	If WithHalo = True Then  CreateHaloEffect(xpnl_tab_4, xpnl_tab_4.Width/2, xpnl_tab_4.Height/2, tabclick_color)
	
End Sub

#If B4A or B4I

Private Sub tab_5_Click
	
	tab_5_handler(True,250,150)
	
End Sub

#Else B4J

Private Sub tab_5_MouseClicked (EventData As MouseEvent)
	
	
	tab_5_handler(True,250,150)
	
	
End Sub

#End If

Private Sub tab_5_handler(WithHalo As Boolean,speed250 As Int,speed150 As Int)
	
	If WithHalo = True Then
	
	If xui.SubExists(mCallBack, mEventName & "_Tab5Click",0) Then
		CallSub(mCallBack, mEventName & "_Tab5Click")
	End If
	
	End If
	
	current_tab = 5
	If speed250 > 0 Then tabchange_handler(current_tab)
	
	If underline_animation = "Normal"  Then
		
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_5,xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4)
			underline_slide_animation_withtext_1(xlbl_text_5,xpnl_tab_5,xicon_5,speed250)
		
		Else
	
			If text_only = True Then
				changelabeltextcolor(xlbl_text_5,xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4)
				underline_slide_animation_1(xlbl_text_5,xpnl_tab_5,speed250)
			Else
				underline_slide_animation_1(xicon_5,xpnl_tab_5,speed250)
			End If
	
		End If
		
	Else
			
		If text_visible = True And text_only = False Then
			changelabeltextcolor(xlbl_text_5,xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4)
			underline_slide_animation_withtext_2(xlbl_text_5,xpnl_tab_5,xicon_5,speed250,speed150)
		
		Else
	
			If text_only = True Then
				changelabeltextcolor(xlbl_text_5,xlbl_text_1,xlbl_text_2,xlbl_text_3,xlbl_text_4)
				underline_slide_animation_2(xlbl_text_5,xpnl_tab_5,speed250)
			Else
				underline_slide_animation_2(xicon_5,xpnl_tab_5,speed250)
			End If
	
		End If
			
	End If
	
	changeiconcolor(xicon_5,xicon_1,xicon_2,xicon_3,xicon_4,icon_5,icon_1,icon_2,icon_3,icon_4)
	
	If WithHalo = True Then  CreateHaloEffect(xpnl_tab_5, xpnl_tab_5.Width/2, xpnl_tab_5.Height/2, tabclick_color)
	
End Sub

#End Region

#Region Properties

'Standard Value is 80% of the view height ((80* view.height)/100
'and BorderWidth = 2dip
Public Sub setMiddleButtonSize(size As Double, BorderWidth As Double)
	middlebuttonsize = size
	xpnl_middlebutton.SetLayoutAnimated(0,mBase.Width/2 - middlebuttonsize/2,xpnl_tab_background.Top - middlebuttonsize/2,middlebuttonsize,middlebuttonsize)
	
	xicon_middlebutton.SetLayoutAnimated(0,20dip,20dip,xpnl_middlebutton.Width - 40dip,xpnl_middlebutton.Height - 40dip)
	
	xpnl_middlebutton.SetColorAndBorder(middlebuttonbackground_color,BorderWidth,xui.Color_White,xpnl_middlebutton.Height/2)
	
	If middlebutton_wave = True Then
	
		build_wave(middlebuttonsize)
	
	End If
	
End Sub

Public Sub getMiddleButtonSize As Double
	
	Return xpnl_middlebutton.Height
	
End Sub

Public Sub setCurrentTab(tabnumber As Int)
	
	If tabnumber = 1 Or tabnumber = 2 Or tabnumber = 3 Or tabnumber = 4 Or tabnumber = 5 Then
		
		current_tab = tabnumber
		
		Else
			
			#if debug
		Log("Tab Number not in range")
			#end if
		
	End If
	
End Sub

Public Sub getCurrentTab As Int
	
	Return current_tab
	
End Sub

Public Sub setPageClickColor(color As Int)
	
	tabclick_color = color
	
End Sub

Public Sub getPageClickColor As Int
	
	Return tabclick_color
	
End Sub

Public Sub setTabBackgroundColor(color As Int)
	
	tabBackground_color = color
	xpnl_tab_background.Color = tabBackground_color
	
End Sub

Public Sub getTabBackgroundColor As Int
	
	Return tabBackground_color
	
End Sub

Public Sub setSelectedPageIconColor(color As Int)
	
	selectedpage_color = color
	
End Sub

Public Sub getSelectedPageIconColor As Int
	
	Return selectedpage_color
	
End Sub

Public Sub setText1(text As String)
	
	text_1 = text
	xlbl_text_1.Text = text_1
	
End Sub

Public Sub getText1 As String
	
	Return text_1
	
End Sub

Public Sub setText2(text As String)
	
	text_2 = text
	xlbl_text_2.Text = text_2
	
End Sub

Public Sub getText2 As String
	
	Return text_2
	
End Sub

Public Sub setText3(text As String)
	
	text_3 = text
	xlbl_text_3.Text = text_3
	
End Sub

Public Sub getText3 As String
	
	Return text_3
	
End Sub

Public Sub setText4(text As String)
	
	text_4 = text
	xlbl_text_4.Text = text_4
	
End Sub

Public Sub getText4 As String
	
	Return text_4
	
End Sub

Public Sub setText5(text As String)
	
	text_5 = text
	xlbl_text_5.Text = text_5
	
End Sub

Public Sub getText5 As String
	
	Return text_5
	
End Sub

Public Sub setTextVisible(visible As Boolean)
	
	text_visible = visible
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getTextVisible As Boolean
	
	Return text_visible
	
End Sub

Public Sub setTextOnly(only As Boolean)
	
	text_only = only
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getTextOnly As Boolean
	
	Return text_only
	
End Sub

Public Sub setPartinglineColor(color As Int)
	
	partingline_color = color
	
End Sub

Public Sub getPartinglineColor As Int
	
	Return partingline_color
	
End Sub

Public Sub setPartinglineVisible(visible As Boolean)
	
	partinglineshow = visible
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getPartinglineVisible As Boolean
	
	Return partinglineshow
	
End Sub

Public Sub setUnderlineAnimation(animation As String)
	
	If animation = "Normal" Or animation = "Stretch" Then
		
		underline_animation = animation
		
		Else
			
			
		#if debug
		Log("wrong Animation Name")
			#end if
		
	End If
	
End Sub

Public Sub getUnderlineAnimation As String
	
	Return underline_animation
	
End Sub

Public Sub setUnderlineColor(color As Int)
	
	underline_color = color
	xpnl_underline.Color = color
	
End Sub

Public Sub getUnderlineColor As Int
	
	Return underline_color
	
End Sub

Public Sub setUnderlineVisible(visible As Boolean)
	
	underline_visible = visible
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getUnderlineVisible As Boolean
	
	Return underline_visible
	
End Sub

Public Sub setMiddleButtonAsTab(enable As Boolean)
	
	enable_middlebutton_astab = enable
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getMiddleButtonAsTab As Boolean
	
	Return enable_middlebutton_astab
	
End Sub

Public Sub setMiddleButtonVisible(visible As Boolean)
	
	middlebutton_visible = visible
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getMiddleButtonVisible As Boolean
	
	Return middlebutton_visible
	
End Sub

'not working
Public Sub setWaveOnMiddleButton(enable As Boolean)
	
	middlebutton_wave = enable
	If enable = False  Then
		'Remove the shape panels
		
		Try
			For Each v As B4XView In mBase.GetAllViewsRecursive
			
				If v.Tag = "shape" Then v.RemoveViewFromParent
				Sleep(0)
			Next
			
		Catch
		
			Log(LastException)
	
		End Try
	
		
End If
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getWaveOnMiddleButton As Boolean
	
	Return middlebutton_wave
	
End Sub

Public Sub setMiddleButtonIcon(icon As B4XBitmap)
	#If B4I
	icon_middlebutton = icon'.Resize(xicon_middlebutton.Width,xicon_middlebutton.Height,True)
	xicon_middlebutton.SetBitmap(icon)'.Resize(xicon_middlebutton.Width,xicon_middlebutton.Height,True))
	#Else
	icon_middlebutton = icon.Resize(xicon_middlebutton.Width,xicon_middlebutton.Height,True)
	xicon_middlebutton.SetBitmap(icon.Resize(xicon_middlebutton.Width,xicon_middlebutton.Height,True))
	#End If
	
	
End Sub

Public Sub getMiddleButtonIcon As B4XBitmap
	
	Return icon_middlebutton
	
End Sub

'Icons
Public Sub setIcon1(icon As B4XBitmap)
	
	icon_1 = icon'.Resize(xicon_1.Width,xicon_1.Height,True)
	
		
		xicon_1.SetBitmap(icon_1)
		Base_Resize(mBase.Width,mBase.Height)
		
End Sub

Public Sub getIcon1 As B4XBitmap
	
	Return icon_1
	
End Sub

Public Sub setIcon2(icon As B4XBitmap)

	icon_2 = icon'.Resize(xicon_1.Width,xicon_1.Height,True)
	
	
	xicon_2.SetBitmap(icon_2)
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getIcon2 As B4XBitmap
	
	Return icon_2
	
End Sub

Public Sub setIcon3(icon As B4XBitmap)
	
	icon_3 = icon'.Resize(xicon_1.Width,xicon_1.Height,True)

	xicon_3.SetBitmap(icon_3)
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getIcon3 As B4XBitmap
	
	Return icon_3
	
End Sub

Public Sub setIcon4(icon As B4XBitmap)
	
	icon_4 = icon'.Resize(xicon_1.Width,xicon_1.Height,True)
	
	xicon_4.SetBitmap(icon_4)
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getIcon4 As B4XBitmap
	
	Return icon_4
	
End Sub

Public Sub setIcon5(icon As B4XBitmap)
	
	
	icon_5 = icon'.Resize(xicon_1.Width,xicon_1.Height,True)
	
	xicon_5.SetBitmap(icon_5)
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getIcon5 As B4XBitmap
	
	Return icon_5
	
End Sub

'Badgets
Public Sub getBadgetLabel_1 As B4XView
	Return xlbl_badget_1
End Sub
Public Sub getBadgetLabel_2 As B4XView
	Return xlbl_badget_2
End Sub
Public Sub getBadgetLabel_3 As B4XView
	Return xlbl_badget_3
End Sub
Public Sub getBadgetLabel_4 As B4XView
	Return xlbl_badget_4
End Sub
Public Sub getBadgetLabel_5 As B4XView
	Return xlbl_badget_5
End Sub

Public Sub setEnableBadget1(Enable As Boolean)
	
	enable_badget_1 = Enable
	xlbl_badget_1.Visible = Enable
	
End Sub

Public Sub getEnableBadget1 As Boolean
	
	Return enable_badget_1
	
End Sub

Public Sub setEnableBadget2(Enable As Boolean)
	
	enable_badget_2 = Enable
	xlbl_badget_2.Visible = Enable
	
End Sub

Public Sub getEnableBadget2 As Boolean
	
	Return enable_badget_2
	
End Sub

Public Sub setEnableBadget3(Enable As Boolean)
	
	enable_badget_3 = Enable
	xlbl_badget_3.Visible = Enable
	
End Sub

Public Sub getEnableBadget3 As Boolean
	
	Return enable_badget_3
	
End Sub

Public Sub setEnableBadget4(Enable As Boolean)
	
	enable_badget_4 = Enable
	xlbl_badget_4.Visible = Enable
	
End Sub

Public Sub getEnableBadget4 As Boolean
	
	Return enable_badget_4
	
End Sub

Public Sub setEnableBadget5(Enable As Boolean)
	
	enable_badget_5 = Enable
	xlbl_badget_5.Visible = Enable
	
End Sub

Public Sub getEnableBadget5 As Boolean
	
	Return enable_badget_5
	
End Sub

Public Sub setBadgetColor1(color As Int)
	
	badget_color_1 = color
	xlbl_badget_1.Color = color
	
End Sub

Public Sub getBadgetColor1 As Int
	
	Return badget_color_1
	
End Sub

Public Sub setBadgetColor2(color As Int)
	
	badget_color_2 = color
	xlbl_badget_2.Color = color
	
End Sub

Public Sub getBadgetColor2 As Int
	
	Return badget_color_2
	
End Sub

Public Sub setBadgetColor3(color As Int)
	
	badget_color_3 = color
	xlbl_badget_3.Color = color
	
End Sub

Public Sub getBadgetColor3 As Int
	
	Return badget_color_3
	
End Sub

Public Sub setBadgetColor4(color As Int)
	
	badget_color_4 = color
	xlbl_badget_4.Color = color
	
End Sub

Public Sub getBadgetColor4 As Int
	
	Return badget_color_4
	
End Sub

Public Sub setBadgetColor5(color As Int)
	
	badget_color_5 = color
	xlbl_badget_5.Color = color
	
End Sub

Public Sub getBadgetColor5 As Int
	
	Return badget_color_5
	
End Sub

Public Sub setBadgetValue1(value As Int)
	
	badget_value_1 = value
	
	If value > 9 Then
		
		xlbl_badget_1.Text = "+" & 9
		xlbl_badget_1.TextSize = FitTextSize(xlbl_badget_1)
		
	Else if value < 0 Then
			
		xlbl_badget_1.Text = 0
		xlbl_badget_1.TextSize = FitTextSize(xlbl_badget_1)'13
			
	Else
					
		xlbl_badget_1.Text = value
		xlbl_badget_1.TextSize = FitTextSize(xlbl_badget_1)'13
		
	End If
	
	Base_Resize(mBase.Width,mBase.Height)
	
End Sub

Public Sub getBadgetValue1 As Int
	
	Return badget_value_1
	
End Sub


Public Sub setBadgetValue2(value As Int)
	
	badget_value_2 = value
	
	If value > 9 Then
		
		xlbl_badget_2.Text = "+" & 9
		xlbl_badget_2.TextSize = FitTextSize(xlbl_badget_2)
		
	Else if value < 0 Then
			
		xlbl_badget_2.Text = 0
		xlbl_badget_2.TextSize = FitTextSize(xlbl_badget_2)'13
			
	Else
					
		xlbl_badget_2.Text = value
		xlbl_badget_2.TextSize = FitTextSize(xlbl_badget_2)'13
		
	End If
	Base_Resize(mBase.Width,mBase.Height)
End Sub

Public Sub getBadgetValue2 As Int
	
	Return badget_value_2
	
End Sub


Public Sub setBadgetValue3(value As Int)
	
	badget_value_3 = value
	
	If value > 9 Then
		
		xlbl_badget_3.Text = "+" & 9
		xlbl_badget_3.TextSize = FitTextSize(xlbl_badget_3)
		
	Else if value < 0 Then
			
		xlbl_badget_3.Text = 0
		xlbl_badget_3.TextSize = FitTextSize(xlbl_badget_3)'13
			
	Else
					
		xlbl_badget_3.Text = value
		xlbl_badget_3.TextSize = FitTextSize(xlbl_badget_3)'13
		
	End If
	Base_Resize(mBase.Width,mBase.Height)
End Sub

Public Sub getBadgetValue3 As Int
	
	Return badget_value_3
	
End Sub


Public Sub setBadgetValue4(value As Int)
	
	badget_value_4 = value
	
	If value > 9 Then
		
		xlbl_badget_4.Text = "+" & 9
		xlbl_badget_4.TextSize = FitTextSize(xlbl_badget_4)
		
	Else if value < 0 Then
			
		xlbl_badget_4.Text = 0
		xlbl_badget_4.TextSize = FitTextSize(xlbl_badget_4)'13
			
	Else
					
		xlbl_badget_4.Text = value
		xlbl_badget_4.TextSize = FitTextSize(xlbl_badget_4)'13
		
	End If
	Base_Resize(mBase.Width,mBase.Height)
End Sub

Public Sub getBadgetValue4 As Int
	
	Return badget_value_4
	
End Sub


Public Sub setBadgetValue5(value As Int)
	
	badget_value_5 = value
	
	If value > 9 Then
		
		xlbl_badget_5.Text = "+" & 9
		xlbl_badget_5.TextSize = FitTextSize(xlbl_badget_5)
		
	Else if value < 0 Then
			
		xlbl_badget_5.Text = 0
		xlbl_badget_5.TextSize = FitTextSize(xlbl_badget_5)'13
			
	Else
					
		xlbl_badget_5.Text = value
		xlbl_badget_5.TextSize = FitTextSize(xlbl_badget_5)'13
		
	End If
	Base_Resize(mBase.Width,mBase.Height)
End Sub

Public Sub getBadgetValue5 As Int
	
	Return badget_value_5
	
End Sub

Public Sub getBase As B4XView
	
	Return mBase
	
End Sub

#End Region

#Region UsedFunctions

'https://www.b4x.com/android/forum/threads/b4x-xui-simple-halo-animation.80267/#content
Private Sub CreateHaloEffect (Parent As B4XView, x As Int, y As Int, clr As Int)
	Dim cvs As B4XCanvas
	Dim p As B4XView = xui.CreatePanel("")
	Dim radius As Int = 150dip
	p.SetLayoutAnimated(0, 0, 0, radius * 2, radius * 2)
	cvs.Initialize(p)
	cvs.DrawCircle(cvs.TargetRect.CenterX, cvs.TargetRect.CenterY, cvs.TargetRect.Width / 2, clr, True, 0)
	Dim bmp As B4XBitmap = cvs.CreateBitmap
	For i = 1 To 1
		CreateHaloEffectHelper(Parent,bmp, x, y, radius)
		Sleep(800)
	Next
End Sub

Private Sub CreateHaloEffectHelper (Parent As B4XView,bmp As B4XBitmap, x As Int, y As Int, radius As Int)
	Dim iv As ImageView
	iv.Initialize("")
	Dim p As B4XView = iv
	p.SetBitmap(bmp)
	Parent.AddView(p, x, y, 0, 0)
	Dim duration As Int = 1000
	p.SetLayoutAnimated(duration, x - radius, y - radius, 2 * radius, 2 * radius)
	p.SetVisibleAnimated(duration, False)
	Sleep(duration)
	p.RemoveViewFromParent
End Sub

'https://www.b4x.com/android/forum/threads/b4x-bitmapcreator-change-color-of-bitmap.95518/#post-603416
Private Sub ChangeColorBasedOnAlphaLevel(bmp As B4XBitmap, NewColor As Int) As B4XBitmap
	Dim bc As BitmapCreator
	bc.Initialize(bmp.Width, bmp.Height)
	bc.CopyPixelsFromBitmap(bmp)
	Dim a1, a2 As ARGBColor
	bc.ColorToARGB(NewColor, a1)
	For y = 0 To bc.mHeight - 1
		For x = 0 To bc.mWidth - 1
			bc.GetARGB(x, y, a2)
			If a2.a > 0 Then
				a2.r = a1.r
				a2.g = a1.g
				a2.b = a1.b
				bc.SetARGB(x, y, a2)
			End If
		Next
	Next
	Return bc.Bitmap
End Sub

Public Sub SetBitmapWithFitOrFill (vTargetView As B4XView, bmp As B4XBitmap)
	vTargetView.SetBitmap(bmp)
   #if B4A
	'B4XView.SetBitmap sets the gravity in B4A to CENTER. This will prevent the bitmap from being scaled as needed so
	'we switch to FILL
	Dim iv As ImageView = vTargetView
	iv.Gravity = Gravity.FILL
   #End If
End Sub

Private Sub FitTextSize(v As B4XView) As Float
	
	
	Dim size As Float
	For size = 2 To 80
		If CheckSize(v,size) Then Exit
	Next
	size = size - 0.5
	If CheckSize(v,size) Then size = size - 0.5
	Return size -3
End Sub

'returns true if the size is too large
Private Sub CheckSize(v As B4XView ,size As Float) As Boolean
	v.TextSize = size
'	If MultipleLines Then
'		Return su.MeasureMultilineTextHeight(v, v.Text) > v.Height
'	Else
		
	Return MeasureTextWidth(v.Text, v.Font) > v.Width Or _
			MeasureTextHeight(v.Text, v.Font) > v.Height
'	End If
End Sub

Private Sub MeasureTextWidth(Text As String, Font1 As B4XFont) As Int
#If B4A
    Private bmp As Bitmap
    bmp.InitializeMutable(2dip, 2dip)
    Private cvs As Canvas
    cvs.Initialize2(bmp)
    Return cvs.MeasureStringWidth(Text, Font1.ToNativeFont, Font1.Size)
#Else If B4i
    Return Text.MeasureWidth(Font1.ToNativeFont)
#Else If B4J
	Dim jo As JavaObject
	jo.InitializeNewInstance("javafx.scene.text.Text", Array(Text))
	jo.RunMethod("setFont",Array(Font1.ToNativeFont))
	jo.RunMethod("setLineSpacing",Array(0.0))
	jo.RunMethod("setWrappingWidth",Array(0.0))
	Dim Bounds As JavaObject = jo.RunMethod("getLayoutBounds",Null)
	Return Bounds.RunMethod("getWidth",Null)
#End If
End Sub

Private Sub MeasureTextHeight(Text As String, Font1 As B4XFont) As Int
#If B4A     
    Private bmp As Bitmap
    bmp.InitializeMutable(2dip, 2dip)
    Private cvs As Canvas
    cvs.Initialize2(bmp)
    Return cvs.MeasureStringHeight(Text, Font1.ToNativeFont, Font1.Size)
#Else If B4i
    Return Text.MeasureHeight(Font1.ToNativeFont)
#Else If B4J
	Dim jo As JavaObject
	jo.InitializeNewInstance("javafx.scene.text.Text", Array(Text))
	jo.RunMethod("setFont",Array(Font1.ToNativeFont))
	jo.RunMethod("setLineSpacing",Array(0.0))
	jo.RunMethod("setWrappingWidth",Array(0.0))
	Dim Bounds As JavaObject = jo.RunMethod("getLayoutBounds",Null)
	Return Bounds.RunMethod("getHeight",Null)
#End If
End Sub

'https://www.b4x.com/android/forum/threads/b4x-drawing-with-bitmapcreator.98887/#post-622799
Private Sub CurveTo (Path1 As BCPath, ControlPointX As Float, ControlPointY As Float, TargetX As Float, TargetY As Float)
	Dim LastPoint As InternalBCPathPointData = Path1.Points.Get(Path1.Points.Size - 1)
	Dim CurrentX As Float = LastPoint.X
	Dim Currenty As Float = LastPoint.Y
	Dim NumberOfSteps As Int = 15 '<--- change as needed
	Dim dt As Float = 1 / NumberOfSteps
	Dim t As Float = dt
	For i = 1 To NumberOfSteps
		Dim tt1 As Float =  (1 - t) * (1 - t)
		Dim tt2 As Float = 2 * (1 - t) * t
		Dim tt3 As Float = t * t
		Dim x As Float = tt1 * CurrentX + tt2 * ControlPointX + tt3 * TargetX
		Dim y As Float = tt1 * Currenty + tt2 * ControlPointY + tt3 * TargetY
		Path1.LineTo(x, y)
		t = t + dt
	Next
End Sub

#End Region
