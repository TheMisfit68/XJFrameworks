#tag Class
Protected Class IPSRApplicationRefEvents
Inherits COM.IUnknown
	#tag Method, Flags = &h0
		Function Analyze() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 8
		  If memID = -1Then Raise New COM.COMException("Failed on Analyze", -1)
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
		    Raise New COM.COMException("Failed on Analyze", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub Analyze_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Build() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 6
		  If memID = -1Then Raise New COM.COMException("Failed on Build", -1)
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
		    Raise New COM.COMException("Failed on Build", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub Build_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function CloseEditor(nIdr_Param As UInt32) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 9
		  If memID = -1Then Raise New COM.COMException("Failed on CloseEditor", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_nIdr_Param As MemoryBlock = COM.RBVariantToVARIANT(nIdr_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_nIdr_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_nIdr_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_nIdr_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on CloseEditor", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub CloseEditor_Func2(this As Ptr, nIdr_Param As UInt32, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function CloseProject() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 3
		  If memID = -1Then Raise New COM.COMException("Failed on CloseProject", -1)
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
		    Raise New COM.COMException("Failed on CloseProject", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub CloseProject_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DisplayEditor(nIdr_Param As UInt32) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 10
		  If memID = -1Then Raise New COM.COMException("Failed on DisplayEditor", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_nIdr_Param As MemoryBlock = COM.RBVariantToVARIANT(nIdr_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_nIdr_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_nIdr_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_nIdr_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on DisplayEditor", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub DisplayEditor_Func2(this As Ptr, nIdr_Param As UInt32, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetDisplayPosition(ByRef plLeft_Param As Integer, ByRef plTop_Param As Integer, ByRef plRight_Param As Integer, ByRef plBottom_Param As Integer, ByRef piShowSate_Param As Integer) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 5
		  If memID = -1Then Raise New COM.COMException("Failed on GetDisplayPosition", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_plLeft_Param As MemoryBlock = COM.RBVariantToVARIANT(plLeft_Param, True)
		  params.cArgs = params.cArgs + 1
		  Dim Local_plTop_Param As MemoryBlock = COM.RBVariantToVARIANT(plTop_Param, True)
		  params.cArgs = params.cArgs + 1
		  Dim Local_plRight_Param As MemoryBlock = COM.RBVariantToVARIANT(plRight_Param, True)
		  params.cArgs = params.cArgs + 1
		  Dim Local_plBottom_Param As MemoryBlock = COM.RBVariantToVARIANT(plBottom_Param, True)
		  params.cArgs = params.cArgs + 1
		  Dim Local_piShowSate_Param As MemoryBlock = COM.RBVariantToVARIANT(piShowSate_Param, True)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_plLeft_Param <> Nil Then mbParams.StringValue(4 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_plLeft_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_plTop_Param <> Nil Then mbParams.StringValue(3 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_plTop_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_plRight_Param <> Nil Then mbParams.StringValue(2 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_plRight_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_plBottom_Param <> Nil Then mbParams.StringValue(1 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_plBottom_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_piShowSate_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_piShowSate_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  Dim tempVar As Variant
		  Dim mb As MemoryBlock
		  mb = mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT)
		  tempVar = COM.VARIANTToRBVariant(mb)
		  plLeft_Param = tempVar
		  mb = mbParams.StringValue(1 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT)
		  tempVar = COM.VARIANTToRBVariant(mb)
		  plTop_Param = tempVar
		  mb = mbParams.StringValue(2 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT)
		  tempVar = COM.VARIANTToRBVariant(mb)
		  plRight_Param = tempVar
		  mb = mbParams.StringValue(3 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT)
		  tempVar = COM.VARIANTToRBVariant(mb)
		  plBottom_Param = tempVar
		  mb = mbParams.StringValue(4 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT)
		  tempVar = COM.VARIANTToRBVariant(mb)
		  piShowSate_Param = tempVar
		  COM.FreeVARIANT(Local_plLeft_Param)
		  COM.FreeVARIANT(Local_plTop_Param)
		  COM.FreeVARIANT(Local_plRight_Param)
		  COM.FreeVARIANT(Local_plBottom_Param)
		  COM.FreeVARIANT(Local_piShowSate_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetDisplayPosition", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub GetDisplayPosition_Func6(this As Ptr, ByRef plLeft_Param As Integer, ByRef plTop_Param As Integer, ByRef plRight_Param As Integer, ByRef plBottom_Param As Integer, ByRef piShowSate_Param As Integer, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetOutpuSheetContentsAsString(nIdr_Param As UInt32, ppArrayOfStrings_Param As Ptr) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 11
		  If memID = -1Then Raise New COM.COMException("Failed on GetOutpuSheetContentsAsString", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_nIdr_Param As MemoryBlock = COM.RBVariantToVARIANT(nIdr_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_ppArrayOfStrings_Param As MemoryBlock = COM.RBVariantToVARIANT(ppArrayOfStrings_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_nIdr_Param <> Nil Then mbParams.StringValue(1 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_nIdr_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_ppArrayOfStrings_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_ppArrayOfStrings_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_nIdr_Param)
		  COM.FreeVARIANT(Local_ppArrayOfStrings_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetOutpuSheetContentsAsString", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub GetOutpuSheetContentsAsString_Func3(this As Ptr, nIdr_Param As UInt32, ppArrayOfStrings_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function HideHMI() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 13
		  If memID = -1Then Raise New COM.COMException("Failed on HideHMI", -1)
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
		    Raise New COM.COMException("Failed on HideHMI", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub HideHMI_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{C48C8103-FE7A-11D3-A1D0-000629A2F326}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NoMoreClients() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 1
		  If memID = -1Then Raise New COM.COMException("Failed on NoMoreClients", -1)
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
		    Raise New COM.COMException("Failed on NoMoreClients", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub NoMoreClients_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IPSRApplicationRefEvents.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReBuildAll() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 7
		  If memID = -1Then Raise New COM.COMException("Failed on ReBuildAll", -1)
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
		    Raise New COM.COMException("Failed on ReBuildAll", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub ReBuildAll_Func1(this As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function SetDisplayPosition(lLeft_Param As Integer, lTop_Param As Integer, lRight_Param As Integer, lBottom_Param As Integer, iShowState_Param As Integer) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 4
		  If memID = -1Then Raise New COM.COMException("Failed on SetDisplayPosition", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_lLeft_Param As MemoryBlock = COM.RBVariantToVARIANT(lLeft_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_lTop_Param As MemoryBlock = COM.RBVariantToVARIANT(lTop_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_lRight_Param As MemoryBlock = COM.RBVariantToVARIANT(lRight_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_lBottom_Param As MemoryBlock = COM.RBVariantToVARIANT(lBottom_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_iShowState_Param As MemoryBlock = COM.RBVariantToVARIANT(iShowState_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_lLeft_Param <> Nil Then mbParams.StringValue(4 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_lLeft_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_lTop_Param <> Nil Then mbParams.StringValue(3 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_lTop_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_lRight_Param <> Nil Then mbParams.StringValue(2 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_lRight_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_lBottom_Param <> Nil Then mbParams.StringValue(1 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_lBottom_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_iShowState_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_iShowState_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_lLeft_Param)
		  COM.FreeVARIANT(Local_lTop_Param)
		  COM.FreeVARIANT(Local_lRight_Param)
		  COM.FreeVARIANT(Local_lBottom_Param)
		  COM.FreeVARIANT(Local_iShowState_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetDisplayPosition", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub SetDisplayPosition_Func6(this As Ptr, lLeft_Param As Integer, lTop_Param As Integer, lRight_Param As Integer, lBottom_Param As Integer, iShowState_Param As Integer, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function ShowHMI(OptionReadWrite_Param As epsrHmiOptions, comandLine_Param As String) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 2
		  If memID = -1Then Raise New COM.COMException("Failed on ShowHMI", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_OptionReadWrite_Param As MemoryBlock = COM.RBVariantToVARIANT(OptionReadWrite_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_comandLine_Param As MemoryBlock = COM.RBVariantToVARIANT(comandLine_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_OptionReadWrite_Param <> Nil Then mbParams.StringValue(1 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_OptionReadWrite_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_comandLine_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_comandLine_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_OptionReadWrite_Param)
		  COM.FreeVARIANT(Local_comandLine_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ShowHMI", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowHMIForMultiWriter(bstrComandLine_Param As String, lDisplayPopupWarning_Param As Integer) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 12
		  If memID = -1Then Raise New COM.COMException("Failed on ShowHMIForMultiWriter", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_bstrComandLine_Param As MemoryBlock = COM.RBVariantToVARIANT(bstrComandLine_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_lDisplayPopupWarning_Param As MemoryBlock = COM.RBVariantToVARIANT(lDisplayPopupWarning_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_bstrComandLine_Param <> Nil Then mbParams.StringValue(1 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_bstrComandLine_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_lDisplayPopupWarning_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_lDisplayPopupWarning_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_bstrComandLine_Param)
		  COM.FreeVARIANT(Local_lDisplayPopupWarning_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ShowHMIForMultiWriter", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub ShowHMIForMultiWriter_Func3(this As Ptr, bstrComandLine_Param As Ptr, lDisplayPopupWarning_Param As Integer, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub ShowHMI_Func3(this As Ptr, OptionReadWrite_Param As epsrHmiOptions, comandLine_Param As Ptr, OutVal_Param As Integer)
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
