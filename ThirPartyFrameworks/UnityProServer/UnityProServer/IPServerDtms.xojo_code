#tag Class
Protected Class IPServerDtms
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub Add(bstrFatherProtocolID_Param As String, bstrDeviceTypeName_Param As String, bstrDtmProgId_Param As String, bstrTargetVersion_Param As String, bstrDefaultDTMName_Param As String, vbCheckIOVisionName_Param As Boolean, ByRef ppNewDtm_Param As UnityProServer.IPServerDtm)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Add_Func7(mThis.Ptr( 0 ).Ptr(10 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrFatherProtocolID_Param As Ptr
		    Local_bstrFatherProtocolID_Param = COM.SysAllocString( bstrFatherProtocolID_Param )
		    Dim Local_bstrDeviceTypeName_Param As Ptr
		    Local_bstrDeviceTypeName_Param = COM.SysAllocString( bstrDeviceTypeName_Param )
		    Dim Local_bstrDtmProgId_Param As Ptr
		    Local_bstrDtmProgId_Param = COM.SysAllocString( bstrDtmProgId_Param )
		    Dim Local_bstrTargetVersion_Param As Ptr
		    Local_bstrTargetVersion_Param = COM.SysAllocString( bstrTargetVersion_Param )
		    Dim Local_bstrDefaultDTMName_Param As Ptr
		    Local_bstrDefaultDTMName_Param = COM.SysAllocString( bstrDefaultDTMName_Param )
		    Dim Local_vbCheckIOVisionName_Param As Int16 = COM.RBBooleanToVARIANTBOOL(vbCheckIOVisionName_Param)
		    Dim Local_ppNewDtm_Param As Ptr
		    resultCode = func.Invoke(mThis, Local_bstrFatherProtocolID_Param, Local_bstrDeviceTypeName_Param, Local_bstrDtmProgId_Param, Local_bstrTargetVersion_Param, Local_bstrDefaultDTMName_Param, Local_vbCheckIOVisionName_Param, Local_ppNewDtm_Param)
		    ppNewDtm_Param = New UnityProServer.IPServerDtm(Local_ppNewDtm_Param)
		    COM.SysFreeString(Local_bstrFatherProtocolID_Param)
		    COM.SysFreeString(Local_bstrDeviceTypeName_Param)
		    COM.SysFreeString(Local_bstrDtmProgId_Param)
		    COM.SysFreeString(Local_bstrTargetVersion_Param)
		    COM.SysFreeString(Local_bstrDefaultDTMName_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Add", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Add_Func7(this As Ptr, bstrFatherProtocolID_Param As Ptr, bstrDeviceTypeName_Param As Ptr, bstrDtmProgId_Param As Ptr, bstrTargetVersion_Param As Ptr, bstrDefaultDTMName_Param As Ptr, vbCheckIOVisionName_Param As Int16, ByRef ppNewDtm_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyChild(bstrDtmIdObjectToCopy_Param As String, ByRef ppDtmCopied_Param As UnityProServer.IPServerDtm)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New CopyChild_Func2(mThis.Ptr( 0 ).Ptr(11 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDtmIdObjectToCopy_Param As Ptr
		    Local_bstrDtmIdObjectToCopy_Param = COM.SysAllocString( bstrDtmIdObjectToCopy_Param )
		    Dim Local_ppDtmCopied_Param As Ptr
		    resultCode = func.Invoke(mThis, Local_bstrDtmIdObjectToCopy_Param, Local_ppDtmCopied_Param)
		    ppDtmCopied_Param = New UnityProServer.IPServerDtm(Local_ppDtmCopied_Param)
		    COM.SysFreeString(Local_bstrDtmIdObjectToCopy_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on CopyChild", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyChildOnChannelCommunication(bstrDtmIdObjectToCopy_Param As String, bstrName_Param As String, bstrChannelCommunication_Param As String, ByRef ppDtmCopied_Param As UnityProServer.IPServerDtm)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New CopyChildOnChannelCommunication_Func4(mThis.Ptr( 0 ).Ptr(13 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDtmIdObjectToCopy_Param As Ptr
		    Local_bstrDtmIdObjectToCopy_Param = COM.SysAllocString( bstrDtmIdObjectToCopy_Param )
		    Dim Local_bstrName_Param As Ptr
		    Local_bstrName_Param = COM.SysAllocString( bstrName_Param )
		    Dim Local_bstrChannelCommunication_Param As Ptr
		    Local_bstrChannelCommunication_Param = COM.SysAllocString( bstrChannelCommunication_Param )
		    Dim Local_ppDtmCopied_Param As Ptr
		    resultCode = func.Invoke(mThis, Local_bstrDtmIdObjectToCopy_Param, Local_bstrName_Param, Local_bstrChannelCommunication_Param, Local_ppDtmCopied_Param)
		    ppDtmCopied_Param = New UnityProServer.IPServerDtm(Local_ppDtmCopied_Param)
		    COM.SysFreeString(Local_bstrDtmIdObjectToCopy_Param)
		    COM.SysFreeString(Local_bstrName_Param)
		    COM.SysFreeString(Local_bstrChannelCommunication_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on CopyChildOnChannelCommunication", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CopyChildOnChannelCommunication_Func4(this As Ptr, bstrDtmIdObjectToCopy_Param As Ptr, bstrName_Param As Ptr, bstrChannelCommunication_Param As Ptr, ByRef ppDtmCopied_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub CopyChildWithName(bstrDtmIdObjectToCopy_Param As String, bstrName_Param As String, ByRef ppDtmCopied_Param As UnityProServer.IPServerDtm)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New CopyChildWithName_Func3(mThis.Ptr( 0 ).Ptr(12 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDtmIdObjectToCopy_Param As Ptr
		    Local_bstrDtmIdObjectToCopy_Param = COM.SysAllocString( bstrDtmIdObjectToCopy_Param )
		    Dim Local_bstrName_Param As Ptr
		    Local_bstrName_Param = COM.SysAllocString( bstrName_Param )
		    Dim Local_ppDtmCopied_Param As Ptr
		    resultCode = func.Invoke(mThis, Local_bstrDtmIdObjectToCopy_Param, Local_bstrName_Param, Local_ppDtmCopied_Param)
		    ppDtmCopied_Param = New UnityProServer.IPServerDtm(Local_ppDtmCopied_Param)
		    COM.SysFreeString(Local_bstrDtmIdObjectToCopy_Param)
		    COM.SysFreeString(Local_bstrName_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on CopyChildWithName", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CopyChildWithName_Func3(this As Ptr, bstrDtmIdObjectToCopy_Param As Ptr, bstrName_Param As Ptr, ByRef ppDtmCopied_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CopyChild_Func2(this As Ptr, bstrDtmIdObjectToCopy_Param As Ptr, ByRef ppDtmCopied_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Count_Get_Func1(this As Ptr, ByRef pVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{BFBCEE54-1F69-4D94-B2D3-9DAA29C01566}")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(bstrDtmName_Param As String, lId_Param As Integer, bstrDTMId_Param As String) As UnityProServer.IPServerDtm
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Item_Func4(mThis.Ptr( 0 ).Ptr(9 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrDtmName_Param As Ptr
		    Local_bstrDtmName_Param = COM.SysAllocString( bstrDtmName_Param )
		    Dim Local_bstrDTMId_Param As Ptr
		    Local_bstrDTMId_Param = COM.SysAllocString( bstrDTMId_Param )
		    Dim Return_ppDtm_Param As Ptr
		    resultCode = func.Invoke(mThis, Local_bstrDtmName_Param, lId_Param, Local_bstrDTMId_Param, Return_ppDtm_Param)
		    COM.SysFreeString(Local_bstrDtmName_Param)
		    COM.SysFreeString(Local_bstrDTMId_Param)
		    If resultCode = 0 Then
		      If Nil = Return_ppDtm_Param  Then Return Nil
		      Return New UnityProServer.IPServerDtm(Return_ppDtm_Param)
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Item", resultCode)
		    End If
		    
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Item_Func4(this As Ptr, bstrDtmName_Param As Ptr, lId_Param As Integer, bstrDTMId_Param As Ptr, ByRef ppDtm_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.IPServerDtms.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function _Enum_Get_Func1(this As Ptr, ByRef ppEnum_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pVal_Param As Integer
			    Dim func As New Count_Get_Func1( mThis.Ptr( 0 ).Ptr( 7 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			    If 0 = resultCode Then
			      Return pVal_Param
			    Else
			      Raise New COM.COMException("Failed on Count", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim ppEnum_Param As Ptr
			    Dim func As New _Enum_Get_Func1( mThis.Ptr( 0 ).Ptr( 8 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, ppEnum_Param )
			    If 0 = resultCode Then
			      If Nil <> ppEnum_Param Then
			        Return New COM.IUnknown( ppEnum_Param )
			      End If
			    Else
			      Raise New COM.COMException("Failed on _Enum", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		_Enum As COM.IUnknown
	#tag EndComputedProperty


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
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
