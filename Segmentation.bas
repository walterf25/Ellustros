B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.8
@EndOfDesignText@
'v1.00
Sub Class_Globals
	Type SegmentationResult (Success As Boolean, ForegroundBitmap As B4XBitmap, ForegroundMask As B4XBitmap)
	Private segmenter As JavaObject
	Private xui As XUI
End Sub

Public Sub Initialize
	Dim options As JavaObject
	options.InitializeNewInstance("com.google.mlkit.vision.segmentation.subject.SubjectSegmenterOptions.Builder", Null)
	options = options.RunMethodJO("enableForegroundBitmap", Null).RunMethodJO("enableForegroundConfidenceMask", Null).RunMethod("build", Null)
	Dim SubjectSegmentation As JavaObject
	SubjectSegmentation.InitializeStatic("com.google.mlkit.vision.segmentation.subject.SubjectSegmentation")
	segmenter = SubjectSegmentation.RunMethod("getClient", Array(options))
End Sub

Private Sub CreateInputImage(bmp As B4XBitmap) As Object
	Dim InputImage As JavaObject
	InputImage.InitializeStatic("com.google.mlkit.vision.common.InputImage")
	Return InputImage.RunMethod("fromBitmap", Array(bmp, 0))
End Sub

Public Sub Process (bmp As B4XBitmap, getForeGroundMask As Boolean, maskColor As Int) As ResumableSub
	Dim image As JavaObject = CreateInputImage(bmp)
	Dim width, height As Int
	width = image.RunMethod("getWidth", Null)
	height = image.RunMethod("getHeight", Null)
	Dim colores(width & height) As Int
	Dim task As JavaObject = segmenter.RunMethod("process", Array(image))
	Do While task.RunMethod("isComplete", Null).As(Boolean) = False
		Sleep(50)
	Loop
	Dim res As SegmentationResult
	res.Initialize
	If task.RunMethod("isSuccessful", Null) Then
		res.Success = True
		Dim SubjectSegmentationResult As JavaObject = task.RunMethod("getResult", Null)
		res.ForegroundBitmap = SubjectSegmentationResult.RunMethod("getForegroundBitmap", Null)
		
		If getForeGroundMask Then
		Dim ForegroundMask As JavaObject
		ForegroundMask = SubjectSegmentationResult.RunMethod("getForegroundConfidenceMask", Null)
		Dim bitmapMask As BitmapCreator
		bitmapMask.Initialize(width, height)
		For i = 0 To (width * height) - 1
			If (ForegroundMask.RunMethod("get", Null)) > 0.5 Then
				colores(i) = maskColor
			Else
				colores(i) = xui.Color_White
			End If
		Next
		Dim bmpx As JavaObject
		Dim foregroundBitmap As B4XBitmap
		bmpx = bmpx.InitializeStatic("android.graphics.Bitmap")
		Dim config As JavaObject
		config = config.InitializeStatic("android.graphics.Bitmap.Config")
		bmpx = bmpx.RunMethodJO("createBitmap", Array(colores, width, height, config.GetField("ARGB_8888")))
		foregroundBitmap = bmpx
		res.ForegroundMask = foregroundBitmap
		End If
	End If
	Return res
End Sub
