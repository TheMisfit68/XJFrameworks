#tag Class
Protected Class PServerDtm
Inherits COM.IDispatch
	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function AliasName_Get_Func1(this As Ptr, ByRef pbstrCurrentName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function AliasName_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub BuildControlInformation(ByRef pvbApplicationError_Param As Boolean)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New BuildControlInformation_Func1(mThis.Ptr( 0 ).Ptr(96 ))
		  Dim resultCode As Integer
		  Dim Local_pvbApplicationError_Param As Int16
		  resultCode = func.Invoke(mThis, Local_pvbApplicationError_Param)
		  pvbApplicationError_Param = COM.VARIANTBOOLToRBBoolean(Local_pvbApplicationError_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on BuildControlInformation", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function BuildControlInformation_Func1(this As Ptr, ByRef pvbApplicationError_Param As Int16) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub CloseAllEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseAllEditor_Func0(mThis.Ptr( 0 ).Ptr(52 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CloseAllEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Connect()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Connect_Func0(mThis.Ptr( 0 ).Ptr(60 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Connect_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{90B58E1F-4E87-4180-BE3B-D90DCCAF2752}" )
		    clsid = COM.IIDFromString( "{FB320F6C-AF1E-4E2D-AA68-2E55657BC719}" )
		    
		    Dim p As Ptr
		    If COM.CoCreateInstance( clsid, nil, COM.CLSCTX_INPROC_SERVER or COM.CLSCTX_LOCAL_SERVER, riid, p ) = 0 then
		      If ObjectMap = Nil Then ObjectMap = New Dictionary
		      Super.Constructor( p )
		      If Not connectEvents Then Return
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Delete_Func0(mThis.Ptr( 0 ).Ptr(84 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Delete_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Destructor()
		  If ObjectMap <> Nil And ObjectMap.HasKey(Handle) Then ObjectMap.Remove(Handle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect(vbForce_Param As Boolean)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Disconnect_Func1(mThis.Ptr( 0 ).Ptr(64 ))
		  Dim resultCode As Integer
		  Dim Local_vbForce_Param As Int16 = COM.RBBooleanToVARIANTBOOL(vbForce_Param)
		  resultCode = func.Invoke(mThis, Local_vbForce_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Disconnect", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Disconnect_Func1(this As Ptr, vbForce_Param As Int16) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayDefaultEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayDefaultEditor_Func0(mThis.Ptr( 0 ).Ptr(48 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayDefaultEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayDiagnosisEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayDiagnosisEditor_Func0(mThis.Ptr( 0 ).Ptr(44 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayDiagnosisEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DtmId_Get_Func1(this As Ptr, ByRef pbstrDtmId_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DtmType_Get_Func1(this As Ptr, ByRef psrDtmType_Param As epsrDtmType) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub ExportConfiguration(pvarConfigurationData_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ExportConfiguration_Func1(mThis.Ptr( 0 ).Ptr(108 ))
		  Dim resultCode As Integer
		  Dim Local_pvarConfigurationData_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_pvarConfigurationData_Param)
		  pvarConfigurationData_Param = COM.VARIANTToRBVariant(Local_pvarConfigurationData_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ExportConfiguration", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ExportConfiguration_Func1(this As Ptr, pvarConfigurationData_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetControlParameter(ByRef pbstrXmlControlParameter_Param As String, ByRef pvbApplicationError_Param As Boolean)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetControlParameter_Func2(mThis.Ptr( 0 ).Ptr(92 ))
		  Dim resultCode As Integer
		  Dim Local_pbstrXmlControlParameter_Param As Ptr = COM.SysAllocString( pbstrXmlControlParameter_Param )
		  Dim Local_pvbApplicationError_Param As Int16
		  resultCode = func.Invoke(mThis, Local_pbstrXmlControlParameter_Param, Local_pvbApplicationError_Param)
		  pbstrXmlControlParameter_Param = COM.BSTRToRBString(Local_pbstrXmlControlParameter_Param)
		  pvbApplicationError_Param = COM.VARIANTBOOLToRBBoolean(Local_pvbApplicationError_Param)
		  COM.SysFreeString(Local_pbstrXmlControlParameter_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetControlParameter", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetControlParameter_Func2(this As Ptr, ByRef pbstrXmlControlParameter_Param As Ptr, ByRef pvbApplicationError_Param As Int16) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetSymbolAndLayoutInput(ByRef pbstrXmlXsy_Param As String, ByRef pvbApplicationError_Param As Boolean)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetSymbolAndLayoutInput_Func2(mThis.Ptr( 0 ).Ptr(100 ))
		  Dim resultCode As Integer
		  Dim Local_pbstrXmlXsy_Param As Ptr = COM.SysAllocString( pbstrXmlXsy_Param )
		  Dim Local_pvbApplicationError_Param As Int16
		  resultCode = func.Invoke(mThis, Local_pbstrXmlXsy_Param, Local_pvbApplicationError_Param)
		  pbstrXmlXsy_Param = COM.BSTRToRBString(Local_pbstrXmlXsy_Param)
		  pvbApplicationError_Param = COM.VARIANTBOOLToRBBoolean(Local_pvbApplicationError_Param)
		  COM.SysFreeString(Local_pbstrXmlXsy_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetSymbolAndLayoutInput", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetSymbolAndLayoutInput_Func2(this As Ptr, ByRef pbstrXmlXsy_Param As Ptr, ByRef pvbApplicationError_Param As Int16) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Id_Get_Func1(this As Ptr, ByRef pCurrentId_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{90B58E1F-4E87-4180-BE3B-D90DCCAF2752}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImportConfiguration(varConfigurationData_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ImportConfiguration_Func1(mThis.Ptr( 0 ).Ptr(104 ))
		  Dim resultCode As Integer
		  Dim Local_varConfigurationData_Param As MemoryBlock = COM.RBVariantToVARIANT(varConfigurationData_Param)
		  resultCode = func.Invoke(mThis, Local_varConfigurationData_Param)
		  COM.FreeVARIANT(Local_varConfigurationData_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ImportConfiguration", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ImportConfiguration_Func1(this As Ptr, varConfigurationData_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IPServerDtm.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetControlParameter(bstrXmlControlParameter_Param As String, ByRef pvbApplicationError_Param As Boolean)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetControlParameter_Func2(mThis.Ptr( 0 ).Ptr(88 ))
		  Dim resultCode As Integer
		  Dim Local_bstrXmlControlParameter_Param As Ptr
		  Local_bstrXmlControlParameter_Param = COM.SysAllocString( bstrXmlControlParameter_Param )
		  Dim Local_pvbApplicationError_Param As Int16
		  resultCode = func.Invoke(mThis, Local_bstrXmlControlParameter_Param, Local_pvbApplicationError_Param)
		  pvbApplicationError_Param = COM.VARIANTBOOLToRBBoolean(Local_pvbApplicationError_Param)
		  COM.SysFreeString(Local_bstrXmlControlParameter_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetControlParameter", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetControlParameter_Func2(this As Ptr, bstrXmlControlParameter_Param As Ptr, ByRef pvbApplicationError_Param As Int16) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SlaveBusAddress_Get_Func1(this As Ptr, ByRef pbstrBusAddress_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SlaveBusAddress_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SubLstDtms_Get_Func1(this As Ptr, ByRef ppDtms_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub UpdateDtmPlcLink(vbWithoutUpdateOfDtmVariable_Param As Boolean)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New UpdateDtmPlcLink_Func1(mThis.Ptr( 0 ).Ptr(56 ))
		  Dim resultCode As Integer
		  Dim Local_vbWithoutUpdateOfDtmVariable_Param As Int16 = COM.RBBooleanToVARIANTBOOL(vbWithoutUpdateOfDtmVariable_Param)
		  resultCode = func.Invoke(mThis, Local_vbWithoutUpdateOfDtmVariable_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on UpdateDtmPlcLink", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function UpdateDtmPlcLink_Func1(this As Ptr, vbWithoutUpdateOfDtmVariable_Param As Int16) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pbstrCurrentName_Param As Ptr
			  Dim func As New AliasName_Get_Func1( mThis.Ptr( 0 ).Ptr( 28 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pbstrCurrentName_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pbstrCurrentName_Param )
			  Else
			    Raise New COM.COMException("Failed on AliasName", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New AliasName_Put_Func1( mThis.Ptr( 0 ).Ptr( 32 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on AliasName", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		AliasName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pbstrDtmId_Param As Ptr
			  Dim func As New DtmId_Get_Func1( mThis.Ptr( 0 ).Ptr( 40 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pbstrDtmId_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pbstrDtmId_Param )
			  Else
			    Raise New COM.COMException("Failed on DtmId", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		DtmId As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim psrDtmType_Param As epsrDtmType
			  Dim func As New DtmType_Get_Func1( mThis.Ptr( 0 ).Ptr( 80 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, psrDtmType_Param )
			  If 0 = resultCode Then
			    Return psrDtmType_Param
			  Else
			    Raise New COM.COMException("Failed on DtmType", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		DtmType As epsrDtmType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pCurrentId_Param As Integer
			  Dim func As New Id_Get_Func1( mThis.Ptr( 0 ).Ptr( 36 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pCurrentId_Param )
			  If 0 = resultCode Then
			    Return pCurrentId_Param
			  Else
			    Raise New COM.COMException("Failed on Id", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mCookie As UInt32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPtrToVTable As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mVTable As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared ObjectMap As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pbstrBusAddress_Param As Ptr
			  Dim func As New SlaveBusAddress_Get_Func1( mThis.Ptr( 0 ).Ptr( 68 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pbstrBusAddress_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pbstrBusAddress_Param )
			  Else
			    Raise New COM.COMException("Failed on SlaveBusAddress", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New SlaveBusAddress_Put_Func1( mThis.Ptr( 0 ).Ptr( 72 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on SlaveBusAddress", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		SlaveBusAddress As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppDtms_Param As Ptr
			  Dim func As New SubLstDtms_Get_Func1( mThis.Ptr( 0 ).Ptr( 76 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppDtms_Param )
			  If 0 = resultCode Then
			    If Nil <> ppDtms_Param Then
			      Return New UnityProServer.IPServerDtms( ppDtms_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on SubLstDtms", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		SubLstDtms As UnityProServer.IPServerDtms
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AliasName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DtmId"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DtmType"
			Group="Behavior"
			Type="epsrDtmType"
			EditorType="Enum"
			#tag EnumValues
				"0 - psrDtmType_communication"
				"1 - psrDtmType_gateway"
				"2 - psrDtmType_block"
				"3 - psrDtmType_module"
				"4 - psrDtmType_device"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Id"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
			Name="SlaveBusAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
