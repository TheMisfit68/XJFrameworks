#tag Class
Protected Class IPSRApplicationEvents
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Function AfterBuildComplete(VarSignature_Param As Variant) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 2
		  If memID = -1Then Raise New COM.COMException("Failed on AfterBuildComplete", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_VarSignature_Param As MemoryBlock = COM.RBVariantToVARIANT(VarSignature_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_VarSignature_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_VarSignature_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_VarSignature_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on AfterBuildComplete", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub AfterBuildComplete_Func2(this As Ptr, VarSignature_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function AfterDownload(VarSignature_Param As Variant) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 7
		  If memID = -1Then Raise New COM.COMException("Failed on AfterDownload", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_VarSignature_Param As MemoryBlock = COM.RBVariantToVARIANT(VarSignature_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_VarSignature_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_VarSignature_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_VarSignature_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on AfterDownload", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub AfterDownload_Func2(this As Ptr, VarSignature_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function AfterSave(VarSignature_Param As Variant) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 8
		  If memID = -1Then Raise New COM.COMException("Failed on AfterSave", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_VarSignature_Param As MemoryBlock = COM.RBVariantToVARIANT(VarSignature_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_VarSignature_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_VarSignature_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_VarSignature_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on AfterSave", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AfterSaveAs(VarSignature_Param As Variant, bstrNewProjectName_Param As String, bstrOldProjectName_Param As String) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 9
		  If memID = -1Then Raise New COM.COMException("Failed on AfterSaveAs", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_VarSignature_Param As MemoryBlock = COM.RBVariantToVARIANT(VarSignature_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_bstrNewProjectName_Param As MemoryBlock = COM.RBVariantToVARIANT(bstrNewProjectName_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_bstrOldProjectName_Param As MemoryBlock = COM.RBVariantToVARIANT(bstrOldProjectName_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_VarSignature_Param <> Nil Then mbParams.StringValue(2 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_VarSignature_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_bstrNewProjectName_Param <> Nil Then mbParams.StringValue(1 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_bstrNewProjectName_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_bstrOldProjectName_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_bstrOldProjectName_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_VarSignature_Param)
		  COM.FreeVARIANT(Local_bstrNewProjectName_Param)
		  COM.FreeVARIANT(Local_bstrOldProjectName_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on AfterSaveAs", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub AfterSaveAs_Func4(this As Ptr, VarSignature_Param As Ptr, bstrNewProjectName_Param As Ptr, bstrOldProjectName_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub AfterSave_Func2(this As Ptr, VarSignature_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function BeforeBuildComplete(VarSignature_Param As Variant) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 1
		  If memID = -1Then Raise New COM.COMException("Failed on BeforeBuildComplete", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_VarSignature_Param As MemoryBlock = COM.RBVariantToVARIANT(VarSignature_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_VarSignature_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_VarSignature_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_VarSignature_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on BeforeBuildComplete", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub BeforeBuildComplete_Func2(this As Ptr, VarSignature_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function BeforeDownload(VarSignature_Param As Variant) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 6
		  If memID = -1Then Raise New COM.COMException("Failed on BeforeDownload", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_VarSignature_Param As MemoryBlock = COM.RBVariantToVARIANT(VarSignature_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_VarSignature_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_VarSignature_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_VarSignature_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on BeforeDownload", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub BeforeDownload_Func2(this As Ptr, VarSignature_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DisplayStart() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 4
		  If memID = -1Then Raise New COM.COMException("Failed on DisplayStart", -1)
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
		    Raise New COM.COMException("Failed on DisplayStart", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub DisplayStart_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function DisplayStop() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 5
		  If memID = -1Then Raise New COM.COMException("Failed on DisplayStop", -1)
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
		    Raise New COM.COMException("Failed on DisplayStop", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub DisplayStop_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{8C2340A4-016C-11D4-A1D5-000629A2F326}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OffLine() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 11
		  If memID = -1Then Raise New COM.COMException("Failed on OffLine", -1)
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
		    Raise New COM.COMException("Failed on OffLine", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub OffLine_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function OnLine() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 10
		  If memID = -1Then Raise New COM.COMException("Failed on OnLine", -1)
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
		    Raise New COM.COMException("Failed on OnLine", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub OnLine_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IPSRApplicationEvents.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteAccessAvailable() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 3
		  If memID = -1Then Raise New COM.COMException("Failed on WriteAccessAvailable", -1)
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
		    Raise New COM.COMException("Failed on WriteAccessAvailable", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub WriteAccessAvailable_Func1(this As Ptr, OutVal_Param As Integer)
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
