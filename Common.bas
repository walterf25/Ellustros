B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=10
@EndOfDesignText@
'Code module
'Subs in this code module will be accessible from all modules.
Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Public CurrentDBVersion As Int
	Public SeatHeight As Double
	Public SeatWidth As Double
	Public SeatDepth As Double
	Public SeatTilt As Double
	Public ArmRestWidth As Double
	Public ArmRestHeight As Double
	Public EyeHeight As Double
	Public LumbarHeight As Double
	Public BackRestAngle As Double
	Public InflatableLumbarSupport As Double
	Public random As Int = -1
	Public fromSummary As Boolean = False
	Public ACTION_DOWN As Int'' = Activity.ACTION_DOWN
	Public ACTION_MOVE As Int  '' = Activity.ACTION_MOVE
	Public ACTION_UP As Int '' = Activity.ACTION_UP
	Public SlidersActive As Boolean
	Public prefPosition As String
	Public ShoeHeightPref As Int
	Public H2SideHeightPosition As Float
	Public EMAIL As String = ""
	
'''	Public myfont As Font = Font.CreateNew2("CeraPro-Black", 30)
'''	Public myfont2 As Font = Font.CreateNew2("CeraPro-Medium", 18)
'''	Public btnFont As Font = Font.CreateNew2("CeraPro-Bold", 16)
	Public xui As XUI
'''	Public myfont As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro black.otf"), 30)
'''	Public myfont2 As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro medium.otf"), 18)
'''	Public btnFont As B4XFont = xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 16)
	
	Public TitleColor As Int = Colors.rgb(28, 30, 36)
	Public SubTitleColor As Int = Colors.rgb(73, 75, 79)
	Public txtBoxHintColor As Int = Colors.argb(255, 157, 161, 136)
	
	Public LightBlueColors As Int = Colors.RGB(164, 212, 232)
	Public DarkGrayColors As Int = Colors.RGB(73, 75, 79)
	'''Public xui As XUI
	
	Public userName As String = ""
	Public pinNumber As String = ""
	
	Public manager As BleManager2
	Public NOT_INITIALIZED As Short = 0
	Public INITIALIZING As Short = 1
	Public IDLE As Short = 2
	Public MOVING As Short = 3
	Public FAULT As Short = 10
	
	Public CHAIR_NOT_IDLE As Int = 2048
	Public SEAT_HEIGHT_ERROR As Int = 16384
	Public ARMREST_WIDTH_ERROR As Int = 8192
	Public SEAT_DEPTH_ERROR As Int = 256
	Public BACKREST_TILT_ERROR As Int = 64
	
	Public SEAT_HEIGHT_MIN As Float
	Public SEAT_HEIGHT_MAX As Float
	Public ARMREST_WIDTH_MIN As Float
	Public ARMREST_WIDTH_MAX As Float
	Public SEAT_DEPTH_MIN As Float
	Public SEAT_DEPTH_MAX As Float
	Public BACKREST_TILT_MIN As Float
	Public BACKREST_TILT_MAX As Float
	Public SEAT_TILT_MIN As Float
	Public SEAT_TILT_MAX As Float
	Public ARMREST_HEIGHT_MIN As Float
	Public ARMREST_HEIGHT_MAX As Float
	Public BACKREST_HEIGHT_MIN As Float
	Public BACKREST_HEIGHT_MAX As Float
	Public LUMBAR_INFLATION_MIN As Float = 0
	Public LUMBAR_INFLATION_MAX  As Float = 100
	
	Public Measurements_Done As Boolean = False
	Public mmConstant As Float = 25.4
	Public InConstant As Float = 2.54
	Public BLEConnected As Boolean = False
	Public PairDeviceActive As Boolean
	Public IPADDR As String = "68.178.247.43"
	Public driver As String = "com.mysql.jdbc.Driver"
	Public jdbcUrl As String = "jdbc:mysql://68.178.247.43/Strom_Ergonomics"
	Public userName As String = "stromergo2022"
	Public Password As String = "NVeX({?9}DZd"
'''	Public mysql As JdbcSQL
	
	Public fromChairOptimal As Boolean = False
	Public ManualSettingsActive As Boolean = False
	Public InitialStateRequest As Boolean = False
	Public centertilt_slope As Float = 0.08960573477
	Public centertilt_intercept As Float = -6.806451613
	Public backrest_angle_slope As Float = 0.1242236025
	Public backrest_angle_intercept As Float = 88.75776398
	Public Collection As String
	Public ManualSettingsCollectionID As String
	Public ellustros As String = "TRÖS"
End Sub

'''Public Sub IconifyEdt(edt As ACEditText, drawableName As String)
'''	Dim xml As XmlLayoutBuilder
'''	Dim ETxt As JavaObject = edt
'''	ETxt.RunMethod("setCompoundDrawablesWithIntrinsicBounds", Array As Object(xml.GetDrawable(drawableName), Null, Null, Null))
'''End Sub
'''
Public Sub myfont As B4XFont
	Return xui.CreateFont(Typeface.LoadFromAssets("cera pro black.otf"), 30)
End Sub

Public Sub myfont2 As B4XFont
	Return xui.CreateFont(Typeface.LoadFromAssets("cera pro medium.otf"), 18)
End Sub

Public Sub btnFont As B4XFont
	Return xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 16)
End Sub

Public Sub btnFont2 As B4XFont
	Return xui.CreateFont(Typeface.LoadFromAssets("cera pro bold.otf"), 18)
End Sub

Public Sub DarkGrayColor(view As B4XView)
	view.SetColorAndBorder(xui.Color_RGB(73, 75, 79), 0dip, xui.Color_Transparent, 35dip)
End Sub

Public Sub LightBlueColor(view As B4XView)
	view.SetColorAndBorder(xui.Color_RGB(164, 212, 232), 0dip, xui.Color_Transparent, 35dip)
End Sub

Public Sub LightBlueColor4(view As B4XView)
	view.SetColorAndBorder(xui.Color_RGB(164, 212, 232), 0dip, xui.Color_Transparent, 30dip)
End Sub

Public Sub LightBlueColor2(view As B4XView)
	view.SetColorAndBorder(xui.Color_RGB(182, 220, 236), 0dip, xui.Color_Transparent, 45dip)
End Sub

Public Sub LightBlueColor3(view As B4XView)
	view.SetColorAndBorder(xui.Color_RGB(200, 229, 241), 0dip, xui.Color_Transparent, 35dip)
End Sub

Public Sub LightBlueColor_2(view As B4XView)
	view.SetColorAndBorder(xui.Color_RGB(164, 212, 232), 0dip, xui.Color_Transparent, 45dip)
End Sub

Public Sub LightBlueColor4_2(view As B4XView)
	view.SetColorAndBorder(xui.Color_RGB(164, 212, 232), 0dip, xui.Color_Transparent, 45dip)
End Sub

Public Sub LightBlueColor2_2(view As B4XView)
	view.SetColorAndBorder(xui.Color_RGB(182, 220, 236), 0dip, xui.Color_Transparent, 45dip)
End Sub

Public Sub LightBlueColor3_2(view As B4XView)
	view.SetColorAndBorder(xui.Color_RGB(200, 229, 241), 0dip, xui.Color_Transparent, 45dip)
End Sub

#If B4i
Public Sub setHintProperties(view As TextField, hintText As String, mFont As Font)
	Dim no As NativeObject
	no = view
	Dim attrtxt As AttributedString
	attrtxt.Initialize(hintText, mFont, xui.Color_ARGB(255, 157, 161, 136))
	'''txtUserName.HintColor = Colors.argb(255, 157, 161, 136)
	no.SetField("attributedPlaceholder", attrtxt)
End Sub
#End If

Public Sub CreateB4XFont(FontFileName As String, FontSize As Float, NativeFontSize As Float) As B4XFont
    #IF B4A
	'''Return Typeface.LoadFromAssets(FontFileName), FontSize)
	Return xui.CreateFont(Typeface.LoadFromAssets(FontFileName), FontSize)
	'''Return Typeface.CreateNew(Typeface.LoadFromAssets(FontFileName), FontSize)
    #ELSE IF B4I
	Return xui.CreateFont(Font.CreateNew2(FontFileName, NativeFontSize), FontSize)
    #ELSE ' B4J
        Return xui.CreateFont(FX.LoadFont(File.DirAssets, FontFileName, NativeFontSize), FontSize)
    #END IF
End Sub

Public Sub txtViewBackground(v As B4XView)
	'''cd1.Initialize2(Colors.rgb(249, 250, 253), 0, 0dip, Colors.Black)
	v.SetColorAndBorder(xui.Color_RGB(249, 250, 253), 0, xui.Color_Black, 0dip)
End Sub

Private Sub EscapeField(f As String) As String
	Return "[" & f & "]"
End Sub


' updates a single field in a record
' Field is the column name
Public Sub UpdateRecord(TableName As String, Field As String, NewValue As Object, _
		WhereFieldEquals As Map)
	UpdateRecord2(TableName, CreateMap(Field: NewValue), WhereFieldEquals)
End Sub

' updates multiple fields in a record
' in the Fields map the keys are the column names
Public Sub UpdateRecord2(TableName As String, Fields As Map, WhereFieldEquals As Map) As String
	If WhereFieldEquals.Size = 0 Then
		Log("WhereFieldEquals map empty!")
		Return
	End If
	If Fields.Size = 0 Then
		Log("Fields empty")
		Return
	End If
	Dim sb As StringBuilder
	sb.Initialize
	sb.Append("UPDATE ").Append(EscapeField(TableName)).Append(" SET ")
	Dim args As List
	args.Initialize
	For Each col As String In Fields.Keys
		sb.Append(EscapeField(col)).Append("=?")
		sb.Append(",")
		args.Add(Fields.Get(col))
	Next
	sb.Remove(sb.Length - 1, sb.Length)
	sb.Append(" WHERE ")
	For Each col As String In WhereFieldEquals.Keys
		sb.Append(EscapeField(col)).Append(" = ?")
		sb.Append(" AND ")
		args.Add(WhereFieldEquals.Get(col))
	Next
	sb.Remove(sb.Length - " AND ".Length, sb.Length)
	#IF Not(DBUTILS_NOLOGS)
	Log("UpdateRecord: " & sb.ToString)
	#End If
	Return sb.ToString
End Sub