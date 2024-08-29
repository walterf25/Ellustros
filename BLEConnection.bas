B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=12.2
@EndOfDesignText@
#Event: Connected (Services As List)
#Event: DataAvailable (ServiceId as String, Characteristics as Map)
#Event: DeviceFound (Name As String, DeviceId As String)
#Event: Disconnected
#Event: StateChanged (State As Int)
#Event: WriteComplete (Characteristic As String, Status as Int)

Sub Class_Globals
	
	#if B4A
	'''Private manager As BleManager2
	'''Private rp As RuntimePermissions
	#else if B4i
	Private manager As BleManager
	#end if
	
	Private callback As Object
	Private EventName As Object
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(mCallBack As Object, mEventName As String)
	callback = mCallBack
	EventName = mEventName
	Common.manager.Initialize("manager")	
End Sub

public Sub AsBleManager As BleManager2
	Return Common.manager
End Sub

Sub manager_Connected (Services As List)
	If SubExists(callback, EventName&"_Connected") Then
		CallSubDelayed2(callback, EventName & "_Connected", Services)
	End If
End Sub

Sub manager_DataAvailable (ServiceId As String, Characteristics As Map)
	If SubExists(callback, EventName&"_DataAvailable") Then
		CallSubDelayed3(callback, EventName&"_DataAvailable", ServiceId, Characteristics)
	End If
End Sub

Sub manager_DeviceFound (Name As String, DeviceId As String, AdvertisingData As Map, RSSI As Double)
	If SubExists(callback, EventName&"_DeviceFound") Then
		CallSubDelayed3(callback, EventName&"_DeviceFound", Name, DeviceId)
	End If
End Sub

Sub manager_Disconnected
	LogColor("BLE disconnected", Colors.Red)
	If SubExists(callback, EventName&"_Disconnected") Then
		CallSubDelayed(callback, EventName&"_Disconnected")
	End If
End Sub

Sub manager_MtuChanged (Success As Boolean, MTU As Int)
	
End Sub

Sub manager_StateChanged (State As Int)
	If SubExists(callback, EventName&"_StateChanged") Then
		CallSubDelayed2(callback, EventName&"_StateChanged", State)
	End If
End Sub

Sub manager_WriteComplete (Characteristic As String, Status As Int)
	If SubExists(callback, EventName&"_WriteComplete") Then
		CallSubDelayed3(callback, EventName&"_WriteComplete", Characteristic, Status)
	End If
End Sub