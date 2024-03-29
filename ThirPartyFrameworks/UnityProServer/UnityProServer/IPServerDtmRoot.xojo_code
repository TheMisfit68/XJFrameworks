#tag Class
Protected Class IPServerDtmRoot
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub AddCommunicationDtm(bstrDeviceTypeName_Param As String, bstrProgID_Param As String, bstrTargetVersion_Param As String, bstrDefaultDTMName_Param As String, vbCheckIOVisionName_Param As Boolean, ByRef pbstrDtmIdAdded_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New AddCommunicationDtm_Func6(mThis.Ptr( 0 ).Ptr(15 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDeviceTypeName_Param As Ptr
		    Local_bstrDeviceTypeName_Param = COM.SysAllocString( bstrDeviceTypeName_Param )
		    Dim Local_bstrProgID_Param As Ptr
		    Local_bstrProgID_Param = COM.SysAllocString( bstrProgID_Param )
		    Dim Local_bstrTargetVersion_Param As Ptr
		    Local_bstrTargetVersion_Param = COM.SysAllocString( bstrTargetVersion_Param )
		    Dim Local_bstrDefaultDTMName_Param As Ptr
		    Local_bstrDefaultDTMName_Param = COM.SysAllocString( bstrDefaultDTMName_Param )
		    Dim Local_vbCheckIOVisionName_Param As Int16 = COM.RBBooleanToVARIANTBOOL(vbCheckIOVisionName_Param)
		    Dim Local_pbstrDtmIdAdded_Param As Ptr = COM.SysAllocString( pbstrDtmIdAdded_Param )
		    resultCode = func.Invoke(mThis, Local_bstrDeviceTypeName_Param, Local_bstrProgID_Param, Local_bstrTargetVersion_Param, Local_bstrDefaultDTMName_Param, Local_vbCheckIOVisionName_Param, Local_pbstrDtmIdAdded_Param)
		    pbstrDtmIdAdded_Param = COM.BSTRToRBString(Local_pbstrDtmIdAdded_Param)
		    COM.SysFreeString(Local_bstrDeviceTypeName_Param)
		    COM.SysFreeString(Local_bstrProgID_Param)
		    COM.SysFreeString(Local_bstrTargetVersion_Param)
		    COM.SysFreeString(Local_bstrDefaultDTMName_Param)
		    COM.SysFreeString(Local_pbstrDtmIdAdded_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on AddCommunicationDtm", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function AddCommunicationDtm_Func6(this As Ptr, bstrDeviceTypeName_Param As Ptr, bstrProgID_Param As Ptr, bstrTargetVersion_Param As Ptr, bstrDefaultDTMName_Param As Ptr, vbCheckIOVisionName_Param As Int16, ByRef pbstrDtmIdAdded_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub AddSlaveDtm(bstrFatherDTMId_Param As String, bstrFatherProtocolID_Param As String, bstrDeviceTypeName_Param As String, bstrProgID_Param As String, bstrTargetVersion_Param As String, bstrDefaultDTMName_Param As String, vbCheckIOVisionName_Param As Boolean, ByRef pbstrDtmIdAdded_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New AddSlaveDtm_Func8(mThis.Ptr( 0 ).Ptr(14 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrFatherDTMId_Param As Ptr
		    Local_bstrFatherDTMId_Param = COM.SysAllocString( bstrFatherDTMId_Param )
		    Dim Local_bstrFatherProtocolID_Param As Ptr
		    Local_bstrFatherProtocolID_Param = COM.SysAllocString( bstrFatherProtocolID_Param )
		    Dim Local_bstrDeviceTypeName_Param As Ptr
		    Local_bstrDeviceTypeName_Param = COM.SysAllocString( bstrDeviceTypeName_Param )
		    Dim Local_bstrProgID_Param As Ptr
		    Local_bstrProgID_Param = COM.SysAllocString( bstrProgID_Param )
		    Dim Local_bstrTargetVersion_Param As Ptr
		    Local_bstrTargetVersion_Param = COM.SysAllocString( bstrTargetVersion_Param )
		    Dim Local_bstrDefaultDTMName_Param As Ptr
		    Local_bstrDefaultDTMName_Param = COM.SysAllocString( bstrDefaultDTMName_Param )
		    Dim Local_vbCheckIOVisionName_Param As Int16 = COM.RBBooleanToVARIANTBOOL(vbCheckIOVisionName_Param)
		    Dim Local_pbstrDtmIdAdded_Param As Ptr = COM.SysAllocString( pbstrDtmIdAdded_Param )
		    resultCode = func.Invoke(mThis, Local_bstrFatherDTMId_Param, Local_bstrFatherProtocolID_Param, Local_bstrDeviceTypeName_Param, Local_bstrProgID_Param, Local_bstrTargetVersion_Param, Local_bstrDefaultDTMName_Param, Local_vbCheckIOVisionName_Param, Local_pbstrDtmIdAdded_Param)
		    pbstrDtmIdAdded_Param = COM.BSTRToRBString(Local_pbstrDtmIdAdded_Param)
		    COM.SysFreeString(Local_bstrFatherDTMId_Param)
		    COM.SysFreeString(Local_bstrFatherProtocolID_Param)
		    COM.SysFreeString(Local_bstrDeviceTypeName_Param)
		    COM.SysFreeString(Local_bstrProgID_Param)
		    COM.SysFreeString(Local_bstrTargetVersion_Param)
		    COM.SysFreeString(Local_bstrDefaultDTMName_Param)
		    COM.SysFreeString(Local_pbstrDtmIdAdded_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on AddSlaveDtm", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function AddSlaveDtm_Func8(this As Ptr, bstrFatherDTMId_Param As Ptr, bstrFatherProtocolID_Param As Ptr, bstrDeviceTypeName_Param As Ptr, bstrProgID_Param As Ptr, bstrTargetVersion_Param As Ptr, bstrDefaultDTMName_Param As Ptr, vbCheckIOVisionName_Param As Int16, ByRef pbstrDtmIdAdded_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub CloseAllEditor(bstrDTMId_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New CloseAllEditor_Func1(mThis.Ptr( 0 ).Ptr(9 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDTMId_Param As Ptr
		    Local_bstrDTMId_Param = COM.SysAllocString( bstrDTMId_Param )
		    resultCode = func.Invoke(mThis, Local_bstrDTMId_Param)
		    COM.SysFreeString(Local_bstrDTMId_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on CloseAllEditor", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CloseAllEditor_Func1(this As Ptr, bstrDTMId_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Connect(bstrDTMId_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Connect_Func1(mThis.Ptr( 0 ).Ptr(11 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDTMId_Param As Ptr
		    Local_bstrDTMId_Param = COM.SysAllocString( bstrDTMId_Param )
		    resultCode = func.Invoke(mThis, Local_bstrDTMId_Param)
		    COM.SysFreeString(Local_bstrDTMId_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Connect", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Connect_Func1(this As Ptr, bstrDTMId_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect(bstrDTMId_Param As String, vbForce_Param As Boolean)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Disconnect_Func2(mThis.Ptr( 0 ).Ptr(12 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDTMId_Param As Ptr
		    Local_bstrDTMId_Param = COM.SysAllocString( bstrDTMId_Param )
		    Dim Local_vbForce_Param As Int16 = COM.RBBooleanToVARIANTBOOL(vbForce_Param)
		    resultCode = func.Invoke(mThis, Local_bstrDTMId_Param, Local_vbForce_Param)
		    COM.SysFreeString(Local_bstrDTMId_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Disconnect", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Disconnect_Func2(this As Ptr, bstrDTMId_Param As Ptr, vbForce_Param As Int16) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayDefaultEditor(bstrDTMId_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New DisplayDefaultEditor_Func1(mThis.Ptr( 0 ).Ptr(8 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDTMId_Param As Ptr
		    Local_bstrDTMId_Param = COM.SysAllocString( bstrDTMId_Param )
		    resultCode = func.Invoke(mThis, Local_bstrDTMId_Param)
		    COM.SysFreeString(Local_bstrDTMId_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on DisplayDefaultEditor", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayDefaultEditor_Func1(this As Ptr, bstrDTMId_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayDiagnosisEditor(bstrDTMId_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New DisplayDiagnosisEditor_Func1(mThis.Ptr( 0 ).Ptr(7 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDTMId_Param As Ptr
		    Local_bstrDTMId_Param = COM.SysAllocString( bstrDTMId_Param )
		    resultCode = func.Invoke(mThis, Local_bstrDTMId_Param)
		    COM.SysFreeString(Local_bstrDTMId_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on DisplayDiagnosisEditor", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayDiagnosisEditor_Func1(this As Ptr, bstrDTMId_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Dtms(ppDtmCollection_Param As COM.IDispatch)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Dtms_Get_Func1(mThis.Ptr( 0 ).Ptr(16 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_ppDtmCollection_Param As Ptr
		    Local_ppDtmCollection_Param = ppDtmCollection_Param.Handle
		    resultCode = func.Invoke(mThis, Local_ppDtmCollection_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Dtms", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Dtms_Get_Func1(this As Ptr, ppDtmCollection_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetDtmFromDtmId(bstrDTMId_Param As String, ByRef ppServerDtm_Param As UnityProServer.IPServerDtm)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New GetDtmFromDtmId_Func2(mThis.Ptr( 0 ).Ptr(18 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDTMId_Param As Ptr
		    Local_bstrDTMId_Param = COM.SysAllocString( bstrDTMId_Param )
		    Dim Local_ppServerDtm_Param As Ptr
		    resultCode = func.Invoke(mThis, Local_bstrDTMId_Param, Local_ppServerDtm_Param)
		    ppServerDtm_Param = New UnityProServer.IPServerDtm(Local_ppServerDtm_Param)
		    COM.SysFreeString(Local_bstrDTMId_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on GetDtmFromDtmId", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetDtmFromDtmId_Func2(this As Ptr, bstrDTMId_Param As Ptr, ByRef ppServerDtm_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetDtmFromId(lId_Param As Integer, ByRef ppServerDtm_Param As UnityProServer.IPServerDtm)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New GetDtmFromId_Func2(mThis.Ptr( 0 ).Ptr(19 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_ppServerDtm_Param As Ptr
		    resultCode = func.Invoke(mThis, lId_Param, Local_ppServerDtm_Param)
		    ppServerDtm_Param = New UnityProServer.IPServerDtm(Local_ppServerDtm_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on GetDtmFromId", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetDtmFromId_Func2(this As Ptr, lId_Param As Integer, ByRef ppServerDtm_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetDtmFromName(bstrName_Param As String, ByRef ppServerDtm_Param As UnityProServer.IPServerDtm)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New GetDtmFromName_Func2(mThis.Ptr( 0 ).Ptr(17 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrName_Param As Ptr
		    Local_bstrName_Param = COM.SysAllocString( bstrName_Param )
		    Dim Local_ppServerDtm_Param As Ptr
		    resultCode = func.Invoke(mThis, Local_bstrName_Param, Local_ppServerDtm_Param)
		    ppServerDtm_Param = New UnityProServer.IPServerDtm(Local_ppServerDtm_Param)
		    COM.SysFreeString(Local_bstrName_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on GetDtmFromName", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetDtmFromName_Func2(this As Ptr, bstrName_Param As Ptr, ByRef ppServerDtm_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{F96F4679-9265-4520-9481-38C3B1595466}")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.IPServerDtmRoot.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSlaveBusAddress(bstrDTMId_Param As String, bstrBusAddress_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New SetSlaveBusAddress_Func2(mThis.Ptr( 0 ).Ptr(13 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDTMId_Param As Ptr
		    Local_bstrDTMId_Param = COM.SysAllocString( bstrDTMId_Param )
		    Dim Local_bstrBusAddress_Param As Ptr
		    Local_bstrBusAddress_Param = COM.SysAllocString( bstrBusAddress_Param )
		    resultCode = func.Invoke(mThis, Local_bstrDTMId_Param, Local_bstrBusAddress_Param)
		    COM.SysFreeString(Local_bstrDTMId_Param)
		    COM.SysFreeString(Local_bstrBusAddress_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on SetSlaveBusAddress", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetSlaveBusAddress_Func2(this As Ptr, bstrDTMId_Param As Ptr, bstrBusAddress_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub UpdateDtmPlcLink(bstrDTMId_Param As String, vbWithoutUpdateOfDtmVariable_Param As Boolean)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New UpdateDtmPlcLink_Func2(mThis.Ptr( 0 ).Ptr(10 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDTMId_Param As Ptr
		    Local_bstrDTMId_Param = COM.SysAllocString( bstrDTMId_Param )
		    Dim Local_vbWithoutUpdateOfDtmVariable_Param As Int16 = COM.RBBooleanToVARIANTBOOL(vbWithoutUpdateOfDtmVariable_Param)
		    resultCode = func.Invoke(mThis, Local_bstrDTMId_Param, Local_vbWithoutUpdateOfDtmVariable_Param)
		    COM.SysFreeString(Local_bstrDTMId_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on UpdateDtmPlcLink", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function UpdateDtmPlcLink_Func2(this As Ptr, bstrDTMId_Param As Ptr, vbWithoutUpdateOfDtmVariable_Param As Int16) As Integer
	#tag EndDelegateDeclaration


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
