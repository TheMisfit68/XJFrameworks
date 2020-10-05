#tag Class
Protected Class IPSRApplicationRef
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
		Protected Sub Constructor()
		  // This class is not instantiable
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
