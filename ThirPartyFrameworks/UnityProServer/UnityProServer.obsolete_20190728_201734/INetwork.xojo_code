#tag Class
Protected Class INetwork
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub BreakNetlink()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New BreakNetlink_Func0(mThis.Ptr( 0 ).Ptr(112 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function BreakNetlink_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub CloseEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditor_Func0(mThis.Ptr( 0 ).Ptr(64 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditorControl_Func1(mThis.Ptr( 0 ).Ptr(108 ))
		  Dim resultCode As Integer
		  Dim Local_bstrHMIRWPasswrd_Param As Ptr
		  Local_bstrHMIRWPasswrd_Param = COM.SysAllocString( bstrHMIRWPasswrd_Param )
		  resultCode = func.Invoke(mThis, Local_bstrHMIRWPasswrd_Param)
		  COM.SysFreeString(Local_bstrHMIRWPasswrd_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on CloseEditorControl", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CloseEditorControl_Func1(this As Ptr, bstrHMIRWPasswrd_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CloseEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Comment_Get_Func1(this As Ptr, ByRef pCurrentComment_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Comment_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Delete()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Delete_Func0(mThis.Ptr( 0 ).Ptr(56 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Delete_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditor_Func0(mThis.Ptr( 0 ).Ptr(60 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditorControl_Func1(mThis.Ptr( 0 ).Ptr(104 ))
		  Dim resultCode As Integer
		  Dim Local_bstrHMIRWPasswrd_Param As Ptr
		  Local_bstrHMIRWPasswrd_Param = COM.SysAllocString( bstrHMIRWPasswrd_Param )
		  resultCode = func.Invoke(mThis, Local_bstrHMIRWPasswrd_Param)
		  COM.SysFreeString(Local_bstrHMIRWPasswrd_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on DisplayEditorControl", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayEditorControl_Func1(this As Ptr, bstrHMIRWPasswrd_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Export(FileNameToExport_Param As String, ExportOption_Param As Integer = 0)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Export_Func2(mThis.Ptr( 0 ).Ptr(68 ))
		  Dim resultCode As Integer
		  Dim Local_FileNameToExport_Param As Ptr
		  Local_FileNameToExport_Param = COM.SysAllocString( FileNameToExport_Param )
		  resultCode = func.Invoke(mThis, Local_FileNameToExport_Param, ExportOption_Param)
		  COM.SysFreeString(Local_FileNameToExport_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Export", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Export_Func2(this As Ptr, FileNameToExport_Param As Ptr, ExportOption_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function FamilyName_Get_Func1(this As Ptr, ByRef NetworkFamily_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetGlobalData(GroupAddress_Param As Variant, GroupName_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetGlobalData_Func2(mThis.Ptr( 0 ).Ptr(88 ))
		  Dim resultCode As Integer
		  Dim Local_GroupAddress_Param As New MemoryBlock(16)
		  Dim Local_GroupName_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_GroupAddress_Param, Local_GroupName_Param)
		  GroupAddress_Param = COM.VARIANTToRBVariant(Local_GroupAddress_Param)
		  GroupName_Param = COM.VARIANTToRBVariant(Local_GroupName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetGlobalData", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetGlobalData_Func2(this As Ptr, GroupAddress_Param As Ptr, GroupName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetNetworkInfo(NetworkName_Param As Variant, NetworkFamily_Param As Variant, NetworkComment_Param As Variant, bIsAttached_Param As Variant, AdressPath_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetNetworkInfo_Func5(mThis.Ptr( 0 ).Ptr(52 ))
		  Dim resultCode As Integer
		  Dim Local_NetworkName_Param As New MemoryBlock(16)
		  Dim Local_NetworkFamily_Param As New MemoryBlock(16)
		  Dim Local_NetworkComment_Param As New MemoryBlock(16)
		  Dim Local_bIsAttached_Param As New MemoryBlock(16)
		  Dim Local_AdressPath_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_NetworkName_Param, Local_NetworkFamily_Param, Local_NetworkComment_Param, Local_bIsAttached_Param, Local_AdressPath_Param)
		  NetworkName_Param = COM.VARIANTToRBVariant(Local_NetworkName_Param)
		  NetworkFamily_Param = COM.VARIANTToRBVariant(Local_NetworkFamily_Param)
		  NetworkComment_Param = COM.VARIANTToRBVariant(Local_NetworkComment_Param)
		  bIsAttached_Param = COM.VARIANTToRBVariant(Local_bIsAttached_Param)
		  AdressPath_Param = COM.VARIANTToRBVariant(Local_AdressPath_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetNetworkInfo", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetNetworkInfo_Func5(this As Ptr, NetworkName_Param As Ptr, NetworkFamily_Param As Ptr, NetworkComment_Param As Ptr, bIsAttached_Param As Ptr, AdressPath_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetServiceMessaging(IPAddressConf_Param As Variant, IPAddress_Param As Variant, SubNetwork_Param As Variant, GatewayAddress_Param As Variant, XWayProfile_Param As Variant, Network_Param As Variant, Station_Param As Variant, EthernetConf_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetServiceMessaging_Func8(mThis.Ptr( 0 ).Ptr(96 ))
		  Dim resultCode As Integer
		  Dim Local_IPAddressConf_Param As New MemoryBlock(16)
		  Dim Local_IPAddress_Param As New MemoryBlock(16)
		  Dim Local_SubNetwork_Param As New MemoryBlock(16)
		  Dim Local_GatewayAddress_Param As New MemoryBlock(16)
		  Dim Local_XWayProfile_Param As New MemoryBlock(16)
		  Dim Local_Network_Param As New MemoryBlock(16)
		  Dim Local_Station_Param As New MemoryBlock(16)
		  Dim Local_EthernetConf_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_IPAddressConf_Param, Local_IPAddress_Param, Local_SubNetwork_Param, Local_GatewayAddress_Param, Local_XWayProfile_Param, Local_Network_Param, Local_Station_Param, Local_EthernetConf_Param)
		  IPAddressConf_Param = COM.VARIANTToRBVariant(Local_IPAddressConf_Param)
		  IPAddress_Param = COM.VARIANTToRBVariant(Local_IPAddress_Param)
		  SubNetwork_Param = COM.VARIANTToRBVariant(Local_SubNetwork_Param)
		  GatewayAddress_Param = COM.VARIANTToRBVariant(Local_GatewayAddress_Param)
		  XWayProfile_Param = COM.VARIANTToRBVariant(Local_XWayProfile_Param)
		  Network_Param = COM.VARIANTToRBVariant(Local_Network_Param)
		  Station_Param = COM.VARIANTToRBVariant(Local_Station_Param)
		  EthernetConf_Param = COM.VARIANTToRBVariant(Local_EthernetConf_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetServiceMessaging", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetServiceMessaging_Func8(this As Ptr, IPAddressConf_Param As Ptr, IPAddress_Param As Ptr, SubNetwork_Param As Ptr, GatewayAddress_Param As Ptr, XWayProfile_Param As Ptr, Network_Param As Ptr, Station_Param As Ptr, EthernetConf_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetStationNumber(StationNumber_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetStationNumber_Func1(mThis.Ptr( 0 ).Ptr(80 ))
		  Dim resultCode As Integer
		  Dim Local_StationNumber_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_StationNumber_Param)
		  StationNumber_Param = COM.VARIANTToRBVariant(Local_StationNumber_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetStationNumber", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetStationNumber_Func1(this As Ptr, StationNumber_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Id_Get_Func1(this As Ptr, ByRef pCurrentId_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{096A0962-6EFD-11D5-88FC-00062926BB4F}")
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsAttached_Get_Func1(this As Ptr, ByRef plVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Get_Func1(this As Ptr, ByRef pCurrentName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.INetwork.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGlobalData(GroupAddress_Param As String, GroupName_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetGlobalData_Func2(mThis.Ptr( 0 ).Ptr(84 ))
		  Dim resultCode As Integer
		  Dim Local_GroupAddress_Param As Ptr
		  Local_GroupAddress_Param = COM.SysAllocString( GroupAddress_Param )
		  Dim Local_GroupName_Param As Ptr
		  Local_GroupName_Param = COM.SysAllocString( GroupName_Param )
		  resultCode = func.Invoke(mThis, Local_GroupAddress_Param, Local_GroupName_Param)
		  COM.SysFreeString(Local_GroupAddress_Param)
		  COM.SysFreeString(Local_GroupName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetGlobalData", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetGlobalData_Func2(this As Ptr, GroupAddress_Param As Ptr, GroupName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetServiceMessaging(IPAddressConf_Param As Integer, IPAddress_Param As String, SubNetwork_Param As String, GatewayAddress_Param As String, lXWayProfile_Param As Integer, Network_Param As Integer, Station_Param As Integer, EthernetConf_Param As Integer)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetServiceMessaging_Func8(mThis.Ptr( 0 ).Ptr(92 ))
		  Dim resultCode As Integer
		  Dim Local_IPAddress_Param As Ptr
		  Local_IPAddress_Param = COM.SysAllocString( IPAddress_Param )
		  Dim Local_SubNetwork_Param As Ptr
		  Local_SubNetwork_Param = COM.SysAllocString( SubNetwork_Param )
		  Dim Local_GatewayAddress_Param As Ptr
		  Local_GatewayAddress_Param = COM.SysAllocString( GatewayAddress_Param )
		  resultCode = func.Invoke(mThis, IPAddressConf_Param, Local_IPAddress_Param, Local_SubNetwork_Param, Local_GatewayAddress_Param, lXWayProfile_Param, Network_Param, Station_Param, EthernetConf_Param)
		  COM.SysFreeString(Local_IPAddress_Param)
		  COM.SysFreeString(Local_SubNetwork_Param)
		  COM.SysFreeString(Local_GatewayAddress_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetServiceMessaging", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetServiceMessaging_Func8(this As Ptr, IPAddressConf_Param As Integer, IPAddress_Param As Ptr, SubNetwork_Param As Ptr, GatewayAddress_Param As Ptr, lXWayProfile_Param As Integer, Network_Param As Integer, Station_Param As Integer, EthernetConf_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetStationNumber(StationNumber_Param As Integer)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetStationNumber_Func1(mThis.Ptr( 0 ).Ptr(76 ))
		  Dim resultCode As Integer
		  resultCode = func.Invoke(mThis, StationNumber_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetStationNumber", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetStationNumber_Func1(this As Ptr, StationNumber_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TypeName_Get_Func1(this As Ptr, ByRef NetworkType_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pCurrentComment_Param As Ptr
			  Dim func As New Comment_Get_Func1( mThis.Ptr( 0 ).Ptr( 36 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pCurrentComment_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pCurrentComment_Param )
			  Else
			    Raise New COM.COMException("Failed on Comment", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New Comment_Put_Func1( mThis.Ptr( 0 ).Ptr( 40 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on Comment", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		Comment As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim NetworkFamily_Param As Ptr
			  Dim func As New FamilyName_Get_Func1( mThis.Ptr( 0 ).Ptr( 100 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, NetworkFamily_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( NetworkFamily_Param )
			  Else
			    Raise New COM.COMException("Failed on FamilyName", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		FamilyName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pCurrentId_Param As Integer
			  Dim func As New Id_Get_Func1( mThis.Ptr( 0 ).Ptr( 44 ) )
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim plVal_Param As Integer
			  Dim func As New IsAttached_Get_Func1( mThis.Ptr( 0 ).Ptr( 72 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, plVal_Param )
			  If 0 = resultCode Then
			    Return plVal_Param
			  Else
			    Raise New COM.COMException("Failed on IsAttached", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		IsAttached As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pCurrentName_Param As Ptr
			  Dim func As New Name_Get_Func1( mThis.Ptr( 0 ).Ptr( 28 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pCurrentName_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pCurrentName_Param )
			  Else
			    Raise New COM.COMException("Failed on Name", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New Name_Put_Func1( mThis.Ptr( 0 ).Ptr( 32 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on Name", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim NetworkType_Param As Ptr
			  Dim func As New TypeName_Get_Func1( mThis.Ptr( 0 ).Ptr( 48 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, NetworkType_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( NetworkType_Param )
			  Else
			    Raise New COM.COMException("Failed on TypeName", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		TypeName As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Comment"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FamilyName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="IsAttached"
			Group="Behavior"
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
			Name="TypeName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
