#tag Class
Protected Class PSRApplicationRef
Inherits COM.IUnknown
	#tag Method, Flags = &h0
		Function AddExternalClientConnected() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 4
		  If memID = -1Then Raise New COM.COMException("Failed on AddExternalClientConnected", -1)
		  Dim params As COM.DISPPARAMS
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on AddExternalClientConnected", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub AddExternalClientConnected_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Shared Function Callback_Analyze(this As Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_Build(this As Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_CloseEditor(this As Ptr, nIdr_Param As UInt32) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_CloseProject(this As Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_DisplayEditor(this As Ptr, nIdr_Param As UInt32) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_GetDisplayPosition(this As Ptr, ByRef plLeft_Param As Integer, ByRef plTop_Param As Integer, ByRef plRight_Param As Integer, ByRef plBottom_Param As Integer, ByRef piShowSate_Param As Integer) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_GetOutpuSheetContentsAsString(this As Ptr, nIdr_Param As UInt32, ppArrayOfStrings_Param As Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_HideHMI(this As Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_IUnknown_AddRef(this As Ptr) As UInt32
		  #pragma X86CallingConvention StdCall
		  If ObjectMap.HasKey( this ) Then
		    Dim instance As UnityProServer.PSRApplicationRef = ObjectMap.Value( this )
		    If instance <> Nil Then Return instance.AddRef
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_IUnknown_QueryInterface(this As Ptr, riid As Ptr, Byref out As Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  // Check if riid matches the events interface that this class implements
		  Select Case COM.StringFromIID( riid )
		  Case COM.StringFromIID( IPSRApplicationRefEvents.IID ), COM.StringFromIID( COM.IUnknown.IID )
		    out = this
		    // We must add a reference before we return
		    If ObjectMap.HasKey( this ) Then
		      Dim instance As UnityProServer.PSRApplicationRef = ObjectMap.Value( this )
		      If instance <> Nil Then Call instance.AddRef
		    End If
		    Return COM.S_OK
		  End Select
		  Return &h80004002 // E_NOINTERFACE
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_IUnknown_Release(this As Ptr) As UInt32
		  #pragma X86CallingConvention StdCall
		  If ObjectMap.HasKey( this ) Then
		    Dim instance As UnityProServer.PSRApplicationRef = ObjectMap.Value( this )
		    If instance <> Nil Then Return instance.Release
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_NoMoreClients(this As Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_ReBuildAll(this As Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_SetDisplayPosition(this As Ptr, lLeft_Param As Integer, lTop_Param As Integer, lRight_Param As Integer, lBottom_Param As Integer, iShowState_Param As Integer) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_ShowHMI(this As Ptr, OptionReadWrite_Param As epsrHmiOptions, comandLine_Param As String) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Callback_ShowHMIForMultiWriter(this As Ptr, bstrComandLine_Param As String, lDisplayPopupWarning_Param As Integer) As Integer
		  #pragma X86CallingConvention StdCall
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{C48B8101-FE7A-11D3-A1D0-000629A2F326}" )
		    clsid = COM.IIDFromString( "{C48B8102-FE7A-11D3-A1D0-000629A2F326}" )
		    
		    Dim p As Ptr
		    If COM.CoCreateInstance( clsid, nil, COM.CLSCTX_INPROC_SERVER or COM.CLSCTX_LOCAL_SERVER, riid, p ) = 0 then
		      If ObjectMap = Nil Then ObjectMap = New Dictionary
		      Super.Constructor( p )
		      If Not connectEvents Then Return
		      If 0 = QueryInterface( COM.IConnectionPointContainer.IID, p ) Then
		        Dim connPtContainer As New COM.IConnectionPointContainer(p)
		        // The default source interface (i.e. the events interface) is IPSRApplicationRefEvents and inherits from IUnknown
		        If 0 = connPtContainer.FindConnectionPoint( IPSRApplicationRefEvents.IID, p ) Then
		          Dim connPt As New COM.IConnectionPoint(p)
		          mVTable = New MemoryBlock(64)
		          mVTable.Ptr(0) = AddressOf Callback_IUnknown_QueryInterface
		          mVTable.Ptr(4) = AddressOf Callback_IUnknown_AddRef
		          mVTable.Ptr(8) = AddressOf Callback_IUnknown_Release
		          mVTable.Ptr(12) = AddressOf Callback_NoMoreClients
		          mVTable.Ptr(16) = AddressOf Callback_ShowHMI
		          mVTable.Ptr(20) = AddressOf Callback_CloseProject
		          mVTable.Ptr(24) = AddressOf Callback_SetDisplayPosition
		          mVTable.Ptr(28) = AddressOf Callback_GetDisplayPosition
		          mVTable.Ptr(32) = AddressOf Callback_Build
		          mVTable.Ptr(36) = AddressOf Callback_ReBuildAll
		          mVTable.Ptr(40) = AddressOf Callback_Analyze
		          mVTable.Ptr(44) = AddressOf Callback_CloseEditor
		          mVTable.Ptr(48) = AddressOf Callback_DisplayEditor
		          mVTable.Ptr(52) = AddressOf Callback_GetOutpuSheetContentsAsString
		          mVTable.Ptr(56) = AddressOf Callback_ShowHMIForMultiWriter
		          mVTable.Ptr(60) = AddressOf Callback_HideHMI
		          mPtrToVTable = New MemoryBlock(4)
		          mPtrToVTable.Ptr(0) = mVTable
		          Dim ptrMB As Ptr = mPtrToVTable
		          ObjectMap.Value( ptrMB ) = Me
		          Call connPt.Advise( mPtrToVTable, mCookie )
		        End If
		      End If
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If ObjectMap <> Nil And ObjectMap.HasKey(Handle) Then ObjectMap.Remove(Handle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExternalViewDead() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 5
		  If memID = -1Then Raise New COM.COMException("Failed on ExternalViewDead", -1)
		  Dim params As COM.DISPPARAMS
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ExternalViewDead", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub ExternalViewDead_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function FileName() As String
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 2
		  If memID = -1Then Raise New COM.COMException("Failed on FileName", -1)
		  Dim params As COM.DISPPARAMS
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on FileName", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub FileName_Get_Func2(this As Ptr, ByRef pVal_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetApp() As UnityProServer.IApplication
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 1
		  If memID = -1Then Raise New COM.COMException("Failed on GetApp", -1)
		  Dim params As COM.DISPPARAMS
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetApp", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub GetApp_Func2(this As Ptr, ByRef ppApplication_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetInternalApp(bstrPassWord_Param As String) As UnityProServer.IApplication
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 8
		  If memID = -1Then Raise New COM.COMException("Failed on GetInternalApp", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_bstrPassWord_Param As MemoryBlock = COM.RBVariantToVARIANT(bstrPassWord_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_bstrPassWord_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_bstrPassWord_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_bstrPassWord_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetInternalApp", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub GetInternalApp_Func3(this As Ptr, bstrPassWord_Param As Ptr, ByRef ppApplication_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{C48B8101-FE7A-11D3-A1D0-000629A2F326}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInteractivePServerWriteAccessHMIFree() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 7
		  If memID = -1Then Raise New COM.COMException("Failed on IsInteractivePServerWriteAccessHMIFree", -1)
		  Dim params As COM.DISPPARAMS
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on IsInteractivePServerWriteAccessHMIFree", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub IsInteractivePServerWriteAccessHMIFree_Get_Func2(this As Ptr, ByRef plVal_Param As Integer, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function NumberOfClients() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 3
		  If memID = -1Then Raise New COM.COMException("Failed on NumberOfClients", -1)
		  Dim params As COM.DISPPARAMS
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on NumberOfClients", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub NumberOfClients_Get_Func2(this As Ptr, ByRef pVal_Param As Integer, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IPSRApplicationRef.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReleaseMapOfDeleteObject() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 6
		  If memID = -1Then Raise New COM.COMException("Failed on ReleaseMapOfDeleteObject", -1)
		  Dim params As COM.DISPPARAMS
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ReleaseMapOfDeleteObject", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub ReleaseMapOfDeleteObject_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration


	#tag Hook, Flags = &h0
		Event Analyze_Event() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Build_Event() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CloseEditor_Event(nIdr_Param As UInt32) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CloseProject_Event() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DisplayEditor_Event(nIdr_Param As UInt32) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetDisplayPosition_Event(ByRef plLeft_Param As Integer, ByRef plTop_Param As Integer, ByRef plRight_Param As Integer, ByRef plBottom_Param As Integer, ByRef piShowSate_Param As Integer) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetOutpuSheetContentsAsString_Event(nIdr_Param As UInt32, ppArrayOfStrings_Param As Ptr) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HideHMI_Event() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NoMoreClients_Event() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReBuildAll_Event() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SetDisplayPosition_Event(lLeft_Param As Integer, lTop_Param As Integer, lRight_Param As Integer, lBottom_Param As Integer, iShowState_Param As Integer) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShowHMIForMultiWriter_Event(bstrComandLine_Param As String, lDisplayPopupWarning_Param As Integer) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ShowHMI_Event(OptionReadWrite_Param As epsrHmiOptions, comandLine_Param As String) As Integer
	#tag EndHook


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
