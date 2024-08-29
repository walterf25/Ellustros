B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.2
@EndOfDesignText@
Sub Class_Globals
	Private ChairInformation As String = "00008d20-7c95-11ed-9398-0800200cc966"
	Private ChairControl As String =     "00008d20-7c95-11ed-9398-0800200cc977"
	'''00008D20-7C95-11ED-9398-0800200CC977
	Private DeviceFirmware As String = 	"0001"
	Private ChairState As String = 		"0002"
	Private BatteryStatus As String = 	"0003"
	Private AxesCurPos As String = 		"0004"
	Private AxesRange As String = 		"0005"
	Private ChairMotionCMD As String =	"0001"
	Private ChairMotionRESP As String = 	"0002"
	Private AxesCMD As String = 			"0003"
	
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	
End Sub

Public Sub ChairInformationService As String
	Return ChairInformation
End Sub

Public Sub ChairControlService As String
	Return ChairControl
End Sub

Public Sub DeviceFirmwareCharacteristic As String
	Return UUIDInformation(DeviceFirmware)
End Sub

Public Sub ChairStateCharacteristic As String
	Return UUIDInformation(ChairState)
End Sub

Public Sub BatteryStatusCharacteristic As String
	Return UUIDInformation(BatteryStatus)
End Sub

Public Sub AxesCurPosCharacteristic As String
	Return UUIDInformation(AxesCurPos)
End Sub

Public Sub AxesRangeCharacteristic As String
	Return UUIDInformation(AxesRange)
End Sub

Public Sub ChairMotionCMDCharacterstic As String
	Return UUIDControl(ChairMotionCMD)
End Sub

Public Sub ChairMotionRespCharacteristic As String
	Return UUIDControl(ChairMotionRESP)
End Sub

Public Sub AxesCMDCharacteristic As String
	Return UUIDControl(AxesCMD)
End Sub

'utility to convert short UUIDs to long format on Android
Private Sub UUIDInformation(id As String) As String 'ignore
#if B4A
	Return id.ToLowerCase & "8d20-7c95-11ed-9398-0800200cc966"
#else if B4I
	Return id.ToUpperCase
#End If
End Sub

Private Sub UUIDControl(id As String) As String 'ignore
#if B4A
	Return id.ToLowerCase & "8d20-7c95-11ed-9398-0800200cc977"
#else if B4I
	Return id.ToUpperCase
#End If
End Sub