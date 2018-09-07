#tag Class
Protected Class IProject
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub Analyze()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Analyze_Func0(mThis.Ptr( 0 ).Ptr(128 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Analyze_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Build()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Build_Func0(mThis.Ptr( 0 ).Ptr(120 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BuildAll()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New BuildAll_Func0(mThis.Ptr( 0 ).Ptr(124 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function BuildAll_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Build_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Comment_Get_Func1(this As Ptr, ByRef pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Comment_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Configuration_Get_Func1(this As Ptr, ByRef ppCurentConfiguration_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Context(varTypeSpecificInfo_Param As Variant, varSpecificInfo_Param As Variant, VarSignature_Param As Variant) As UnityProServer.IContext
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Context_Get_Func4(mThis.Ptr( 0 ).Ptr(160 ))
		  Dim resultCode As Integer
		  Dim Local_varTypeSpecificInfo_Param As MemoryBlock = COM.RBVariantToVARIANT(varTypeSpecificInfo_Param)
		  Dim Local_varSpecificInfo_Param As MemoryBlock = COM.RBVariantToVARIANT(varSpecificInfo_Param)
		  Dim Local_VarSignature_Param As MemoryBlock = COM.RBVariantToVARIANT(VarSignature_Param)
		  Dim Return_ppIContext_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_varTypeSpecificInfo_Param, Local_varSpecificInfo_Param, Local_VarSignature_Param, Return_ppIContext_Param)
		  COM.FreeVARIANT(Local_varTypeSpecificInfo_Param)
		  COM.FreeVARIANT(Local_varSpecificInfo_Param)
		  COM.FreeVARIANT(Local_VarSignature_Param)
		  If resultCode = 0 Then
		    If Nil = Return_ppIContext_Param  Then Return Nil
		    Return New UnityProServer.IContext(Return_ppIContext_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Context", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Context_Get_Func4(this As Ptr, varTypeSpecificInfo_Param As Ptr, varSpecificInfo_Param As Ptr, VarSignature_Param As Ptr, ByRef ppIContext_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CurrentSignature_Get_Func1(this As Ptr, pSignature_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Ddts_Get_Func1(this As Ptr, ByRef ppDdts_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Dfbs_Get_Func1(this As Ptr, ByRef ppDfbs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Documentation_Get_Func1(this As Ptr, ByRef ppCurentDocumentation_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Efbs_Get_Func1(this As Ptr, ByRef ppEfbs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Export(FileNameToExport_Param As String, ExportOption_Param As Integer = 0)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Export_Func2(mThis.Ptr( 0 ).Ptr(156 ))
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
		Protected Delegate Function FctModules_Get_Func1(this As Ptr, ByRef ppFctModules_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetPrivateFiles(bsFilter_Param As String, ByRef pNbFiles_Param As Integer) As Variant
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetPrivateFiles_Func3(mThis.Ptr( 0 ).Ptr(188 ))
		  Dim resultCode As Integer
		  Dim Local_bsFilter_Param As Ptr
		  Local_bsFilter_Param = COM.SysAllocString( bsFilter_Param )
		  Dim Return_pFileNames_Param As Ptr
		  Dim pFileNames_Param_MB As New MemoryBlock(16)
		  Return_pFileNames_Param = pFileNames_Param_MB
		  resultCode = func.Invoke(mThis, Local_bsFilter_Param, pNbFiles_Param, Return_pFileNames_Param)
		  COM.SysFreeString(Local_bsFilter_Param)
		  If resultCode = 0 Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(Return_pFileNames_Param)
		    COM.FreeVARIANT(Return_pFileNames_Param)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetPrivateFiles", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetPrivateFiles_Func3(this As Ptr, bsFilter_Param As Ptr, ByRef pNbFiles_Param As Integer, pFileNames_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetProjectSettingValue(bsSettingIdent_Param As String, varSettingValue_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetProjectSettingValue_Func2(mThis.Ptr( 0 ).Ptr(196 ))
		  Dim resultCode As Integer
		  Dim Local_bsSettingIdent_Param As Ptr
		  Local_bsSettingIdent_Param = COM.SysAllocString( bsSettingIdent_Param )
		  Dim Local_varSettingValue_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_bsSettingIdent_Param, Local_varSettingValue_Param)
		  varSettingValue_Param = COM.VARIANTToRBVariant(Local_varSettingValue_Param)
		  COM.SysFreeString(Local_bsSettingIdent_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetProjectSettingValue", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetProjectSettingValue_Func2(this As Ptr, bsSettingIdent_Param As Ptr, varSettingValue_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetTmpPath() As String
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetTmpPath_Func1(mThis.Ptr( 0 ).Ptr(192 ))
		  Dim resultCode As Integer
		  Dim Return_pBstrPath_Param As Ptr
		  resultCode = func.Invoke(mThis, Return_pBstrPath_Param)
		  If resultCode = 0 Then
		    Return COM.BSTRToRBString(Return_pBstrPath_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetTmpPath", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetTmpPath_Func1(this As Ptr, ByRef pBstrPath_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetVersion(ByRef plVersionAutoIncrementset_Param As Integer, ByRef plBuildVersion_Param As Integer, ByRef plMajorVersion_Param As Integer, ByRef plMinorVersion_Param As Integer) As String
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetVersion_Func5(mThis.Ptr( 0 ).Ptr(72 ))
		  Dim resultCode As Integer
		  Dim Return_pbstrFormatVersion_Param As Ptr
		  resultCode = func.Invoke(mThis, plVersionAutoIncrementset_Param, plBuildVersion_Param, plMajorVersion_Param, plMinorVersion_Param, Return_pbstrFormatVersion_Param)
		  If resultCode = 0 Then
		    Return COM.BSTRToRBString(Return_pbstrFormatVersion_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetVersion", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetVersion_Func5(this As Ptr, ByRef plVersionAutoIncrementset_Param As Integer, ByRef plBuildVersion_Param As Integer, ByRef plMajorVersion_Param As Integer, ByRef plMinorVersion_Param As Integer, ByRef pbstrFormatVersion_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function HasProjectFileName_Get_Func1(this As Ptr, ByRef plVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Id_Get_Func1(this As Ptr, ByRef pVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{06BEE8EC-42B8-11D4-A1E9-000629A2F326}")
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InfoBuildState_Get_Func1(this As Ptr, ByRef pVal_Param As epsrBuildState) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InfoCreation_Get_Func1(this As Ptr, pVariant_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InfoModification_Get_Func1(this As Ptr, pVariant_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IODdts_Get_Func1(this As Ptr, ByRef ppIODdts_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function IsModified() As Int16
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New IsModified_Func1(mThis.Ptr( 0 ).Ptr(136 ))
		  Dim resultCode As Integer
		  Dim Return_value_Param As Int16
		  resultCode = func.Invoke(mThis, Return_value_Param)
		  If resultCode = 0 Then
		    Return Return_value_Param
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on IsModified", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsModified_Func1(this As Ptr, ByRef value_Param As Int16) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function ListDeletedById(SignatureBegin_Param As Variant, SignatureEnd_Param As Variant, Filter_Param As Variant) As Variant
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ListDeletedById_Func4(mThis.Ptr( 0 ).Ptr(132 ))
		  Dim resultCode As Integer
		  Dim Local_SignatureBegin_Param As MemoryBlock = COM.RBVariantToVARIANT(SignatureBegin_Param)
		  Dim Local_SignatureEnd_Param As MemoryBlock = COM.RBVariantToVARIANT(SignatureEnd_Param)
		  Dim Local_Filter_Param As MemoryBlock = COM.RBVariantToVARIANT(Filter_Param)
		  Dim Return_ListDeletedIds_Param As Ptr
		  Dim ListDeletedIds_Param_MB As New MemoryBlock(16)
		  Return_ListDeletedIds_Param = ListDeletedIds_Param_MB
		  resultCode = func.Invoke(mThis, Local_SignatureBegin_Param, Local_SignatureEnd_Param, Local_Filter_Param, Return_ListDeletedIds_Param)
		  COM.FreeVARIANT(Local_SignatureBegin_Param)
		  COM.FreeVARIANT(Local_SignatureEnd_Param)
		  COM.FreeVARIANT(Local_Filter_Param)
		  If resultCode = 0 Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(Return_ListDeletedIds_Param)
		    COM.FreeVARIANT(Return_ListDeletedIds_Param)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ListDeletedById", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ListDeletedById_Func4(this As Ptr, SignatureBegin_Param As Ptr, SignatureEnd_Param As Ptr, Filter_Param As Ptr, ListDeletedIds_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Get_Func1(this As Ptr, ByRef pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Networks_Get_Func1(this As Ptr, ByRef ppNetworks_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IProject.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrivateInfo(FileName_Param As String) As String
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New PrivateInfo_Get_Func2(mThis.Ptr( 0 ).Ptr(164 ))
		  Dim resultCode As Integer
		  Dim Local_FileName_Param As Ptr
		  Local_FileName_Param = COM.SysAllocString( FileName_Param )
		  Dim Return_pVal_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_FileName_Param, Return_pVal_Param)
		  COM.SysFreeString(Local_FileName_Param)
		  If resultCode = 0 Then
		    Return COM.BSTRToRBString(Return_pVal_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on PrivateInfo", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function PrivateInfo_Get_Func2(this As Ptr, FileName_Param As Ptr, ByRef pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function PrivateInfo_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Program_Get_Func1(this As Ptr, ByRef ppCurentProgram_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ProjectFileName_Get_Func1(this As Ptr, ByRef pBstrVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub PutPrivateFile(bstrFullPathWithName_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New PutPrivateFile_Func1(mThis.Ptr( 0 ).Ptr(184 ))
		  Dim resultCode As Integer
		  Dim Local_bstrFullPathWithName_Param As Ptr
		  Local_bstrFullPathWithName_Param = COM.SysAllocString( bstrFullPathWithName_Param )
		  resultCode = func.Invoke(mThis, Local_bstrFullPathWithName_Param)
		  COM.SysFreeString(Local_bstrFullPathWithName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on PutPrivateFile", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function PutPrivateFile_Func1(this As Ptr, bstrFullPathWithName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub PutVersion(lVersionAutoIncrementset_Param As Integer, lBuildVersion_Param As Integer, lMajorVersion_Param As Integer, lMinorVersion_Param As Integer)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New PutVersion_Func4(mThis.Ptr( 0 ).Ptr(76 ))
		  Dim resultCode As Integer
		  resultCode = func.Invoke(mThis, lVersionAutoIncrementset_Param, lBuildVersion_Param, lMajorVersion_Param, lMinorVersion_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on PutVersion", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function PutVersion_Func4(this As Ptr, lVersionAutoIncrementset_Param As Integer, lBuildVersion_Param As Integer, lMajorVersion_Param As Integer, lMinorVersion_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub RestoreDataToPLC(FileName_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New RestoreDataToPLC_Func1(mThis.Ptr( 0 ).Ptr(176 ))
		  Dim resultCode As Integer
		  Dim Local_FileName_Param As Ptr
		  Local_FileName_Param = COM.SysAllocString( FileName_Param )
		  resultCode = func.Invoke(mThis, Local_FileName_Param)
		  COM.SysFreeString(Local_FileName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on RestoreDataToPLC", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function RestoreDataToPLC_Func1(this As Ptr, FileName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Save()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Save_Func0(mThis.Ptr( 0 ).Ptr(144 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveArchive(bsArchiveFilename_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SaveArchive_Func1(mThis.Ptr( 0 ).Ptr(180 ))
		  Dim resultCode As Integer
		  Dim Local_bsArchiveFilename_Param As Ptr
		  Local_bsArchiveFilename_Param = COM.SysAllocString( bsArchiveFilename_Param )
		  resultCode = func.Invoke(mThis, Local_bsArchiveFilename_Param)
		  COM.SysFreeString(Local_bsArchiveFilename_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SaveArchive", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SaveArchive_Func1(this As Ptr, bsArchiveFilename_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SaveAs(FileName_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SaveAs_Func1(mThis.Ptr( 0 ).Ptr(148 ))
		  Dim resultCode As Integer
		  Dim Local_FileName_Param As Ptr
		  Local_FileName_Param = COM.SysAllocString( FileName_Param )
		  resultCode = func.Invoke(mThis, Local_FileName_Param)
		  COM.SysFreeString(Local_FileName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SaveAs", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SaveAs_Func1(this As Ptr, FileName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SaveDataFromPLC(FileName_Param As String, varSaveParametersArray_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 36
		  If memID = -1Then Raise New COM.COMException("Failed on SaveDataFromPLC", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_FileName_Param As MemoryBlock = COM.RBVariantToVARIANT(FileName_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_varSaveParametersArray_Param As MemoryBlock = COM.RBVariantToVARIANT(varSaveParametersArray_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_FileName_Param <> Nil Then mbParams.StringValue(1 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_FileName_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_varSaveParametersArray_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_varSaveParametersArray_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD, params, result, nil, err)
		  COM.FreeVARIANT(Local_FileName_Param)
		  COM.FreeVARIANT(Local_varSaveParametersArray_Param)
		  If resultCode = COM.S_OK Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SaveDataFromPLC", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveDataFromPLC(FileName_Param As String, varSaveParametersArray_Param As Variant, pvarSaveParametersArrayUsed_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SaveDataFromPLC_Func3(mThis.Ptr( 0 ).Ptr(172 ))
		  Dim resultCode As Integer
		  Dim Local_FileName_Param As Ptr
		  Local_FileName_Param = COM.SysAllocString( FileName_Param )
		  Dim Local_varSaveParametersArray_Param As MemoryBlock = COM.RBVariantToVARIANT(varSaveParametersArray_Param)
		  Dim Local_pvarSaveParametersArrayUsed_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_FileName_Param, Local_varSaveParametersArray_Param, Local_pvarSaveParametersArrayUsed_Param)
		  pvarSaveParametersArrayUsed_Param = COM.VARIANTToRBVariant(Local_pvarSaveParametersArrayUsed_Param)
		  COM.SysFreeString(Local_FileName_Param)
		  COM.FreeVARIANT(Local_varSaveParametersArray_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SaveDataFromPLC", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SaveDataFromPLC_Func3(this As Ptr, FileName_Param As Ptr, varSaveParametersArray_Param As Ptr, pvarSaveParametersArrayUsed_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Save_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Search(Type_Param As Variant, Name_Param As String, pSearchResult_Param As Variant, pTypesFound_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Search_Func4(mThis.Ptr( 0 ).Ptr(152 ))
		  Dim resultCode As Integer
		  Dim Local_Type_Param As MemoryBlock = COM.RBVariantToVARIANT(Type_Param)
		  Dim Local_Name_Param As Ptr
		  Local_Name_Param = COM.SysAllocString( Name_Param )
		  Dim Local_pSearchResult_Param As New MemoryBlock(16)
		  Dim Local_pTypesFound_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_Type_Param, Local_Name_Param, Local_pSearchResult_Param, Local_pTypesFound_Param)
		  pSearchResult_Param = COM.VARIANTToRBVariant(Local_pSearchResult_Param)
		  pTypesFound_Param = COM.VARIANTToRBVariant(Local_pTypesFound_Param)
		  COM.SysFreeString(Local_Name_Param)
		  COM.FreeVARIANT(Local_Type_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Search", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Search_Func4(this As Ptr, Type_Param As Ptr, Name_Param As Ptr, pSearchResult_Param As Ptr, pTypesFound_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub TransferAllPCtoPLC()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New TransferAllPCtoPLC_Func0(mThis.Ptr( 0 ).Ptr(140 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TransferAllPCtoPLC_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Variables_Get_Func1(this As Ptr, ByRef pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Ptr
			  Dim func As New Comment_Get_Func1( mThis.Ptr( 0 ).Ptr( 36 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pVal_Param )
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
			  Dim ppCurentConfiguration_Param As Ptr
			  Dim func As New Configuration_Get_Func1( mThis.Ptr( 0 ).Ptr( 88 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppCurentConfiguration_Param )
			  If 0 = resultCode Then
			    If Nil <> ppCurentConfiguration_Param Then
			      Return New UnityProServer.IConfiguration( ppCurentConfiguration_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Configuration", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Configuration As UnityProServer.IConfiguration
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim mb As New MemoryBlock(16)
			  Dim pSignature_Param As Ptr = mb
			  Dim func As New CurrentSignature_Get_Func1( mThis.Ptr( 0 ).Ptr( 52 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pSignature_Param )
			  If 0 = resultCode Then
			    Dim retVal As Variant = COM.VARIANTToRBVariant( pSignature_Param )
			    COM.FreeVARIANT( pSignature_Param )
			    Return retVal
			  Else
			    Raise New COM.COMException("Failed on CurrentSignature", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		CurrentSignature As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppDdts_Param As Ptr
			  Dim func As New Ddts_Get_Func1( mThis.Ptr( 0 ).Ptr( 104 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppDdts_Param )
			  If 0 = resultCode Then
			    If Nil <> ppDdts_Param Then
			      Return New UnityProServer.IDdts( ppDdts_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Ddts", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Ddts As UnityProServer.IDdts
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppDfbs_Param As Ptr
			  Dim func As New Dfbs_Get_Func1( mThis.Ptr( 0 ).Ptr( 108 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppDfbs_Param )
			  If 0 = resultCode Then
			    If Nil <> ppDfbs_Param Then
			      Return New UnityProServer.IDfbs( ppDfbs_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Dfbs", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Dfbs As UnityProServer.IDfbs
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppCurentDocumentation_Param As Ptr
			  Dim func As New Documentation_Get_Func1( mThis.Ptr( 0 ).Ptr( 92 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppCurentDocumentation_Param )
			  If 0 = resultCode Then
			    If Nil <> ppCurentDocumentation_Param Then
			      Return New UnityProServer.IDocumentation( ppCurentDocumentation_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Documentation", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Documentation As UnityProServer.IDocumentation
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppEfbs_Param As Ptr
			  Dim func As New Efbs_Get_Func1( mThis.Ptr( 0 ).Ptr( 112 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppEfbs_Param )
			  If 0 = resultCode Then
			    If Nil <> ppEfbs_Param Then
			      Return New UnityProServer.IEfbs( ppEfbs_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Efbs", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Efbs As UnityProServer.IEfbs
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppFctModules_Param As Ptr
			  Dim func As New FctModules_Get_Func1( mThis.Ptr( 0 ).Ptr( 96 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppFctModules_Param )
			  If 0 = resultCode Then
			    If Nil <> ppFctModules_Param Then
			      Return New UnityProServer.IFctModules( ppFctModules_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on FctModules", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		FctModules As UnityProServer.IFctModules
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim plVal_Param As Integer
			  Dim func As New HasProjectFileName_Get_Func1( mThis.Ptr( 0 ).Ptr( 60 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, plVal_Param )
			  If 0 = resultCode Then
			    Return plVal_Param
			  Else
			    Raise New COM.COMException("Failed on HasProjectFileName", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		HasProjectFileName As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Integer
			  Dim func As New Id_Get_Func1( mThis.Ptr( 0 ).Ptr( 44 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return pVal_Param
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
			  Dim pVal_Param As epsrBuildState
			  Dim func As New InfoBuildState_Get_Func1( mThis.Ptr( 0 ).Ptr( 56 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return pVal_Param
			  Else
			    Raise New COM.COMException("Failed on InfoBuildState", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		InfoBuildState As epsrBuildState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim mb As New MemoryBlock(16)
			  Dim pVariant_Param As Ptr = mb
			  Dim func As New InfoCreation_Get_Func1( mThis.Ptr( 0 ).Ptr( 64 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVariant_Param )
			  If 0 = resultCode Then
			    Dim retVal As Variant = COM.VARIANTToRBVariant( pVariant_Param )
			    COM.FreeVARIANT( pVariant_Param )
			    Return retVal
			  Else
			    Raise New COM.COMException("Failed on InfoCreation", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		InfoCreation As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim mb As New MemoryBlock(16)
			  Dim pVariant_Param As Ptr = mb
			  Dim func As New InfoModification_Get_Func1( mThis.Ptr( 0 ).Ptr( 68 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVariant_Param )
			  If 0 = resultCode Then
			    Dim retVal As Variant = COM.VARIANTToRBVariant( pVariant_Param )
			    COM.FreeVARIANT( pVariant_Param )
			    Return retVal
			  Else
			    Raise New COM.COMException("Failed on InfoModification", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		InfoModification As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppIODdts_Param As Ptr
			  Dim func As New IODdts_Get_Func1( mThis.Ptr( 0 ).Ptr( 116 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppIODdts_Param )
			  If 0 = resultCode Then
			    If Nil <> ppIODdts_Param Then
			      Return New UnityProServer.IIODdts( ppIODdts_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on IODdts", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		IODdts As UnityProServer.IIODdts
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Ptr
			  Dim func As New Name_Get_Func1( mThis.Ptr( 0 ).Ptr( 28 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pVal_Param )
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
			  Dim ppNetworks_Param As Ptr
			  Dim func As New Networks_Get_Func1( mThis.Ptr( 0 ).Ptr( 100 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppNetworks_Param )
			  If 0 = resultCode Then
			    If Nil <> ppNetworks_Param Then
			      Return New UnityProServer.INetworks( ppNetworks_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Networks", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Networks As UnityProServer.INetworks
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New PrivateInfo_Put_Func1( mThis.Ptr( 0 ).Ptr( 168 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on PrivateInfo", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		PrivateInfo As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppCurentProgram_Param As Ptr
			  Dim func As New Program_Get_Func1( mThis.Ptr( 0 ).Ptr( 84 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppCurentProgram_Param )
			  If 0 = resultCode Then
			    If Nil <> ppCurentProgram_Param Then
			      Return New UnityProServer.IProgram( ppCurentProgram_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Program", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Program As UnityProServer.IProgram
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pBstrVal_Param As Ptr
			  Dim func As New ProjectFileName_Get_Func1( mThis.Ptr( 0 ).Ptr( 48 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pBstrVal_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pBstrVal_Param )
			  Else
			    Raise New COM.COMException("Failed on ProjectFileName", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		ProjectFileName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Ptr
			  Dim func As New Variables_Get_Func1( mThis.Ptr( 0 ).Ptr( 80 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    If Nil <> pVal_Param Then
			      Return New UnityProServer.IVariables( pVal_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Variables", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Variables As UnityProServer.IVariables
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Comment"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasProjectFileName"
			Group="Behavior"
			Type="Integer"
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
			Name="InfoBuildState"
			Group="Behavior"
			Type="epsrBuildState"
			EditorType="Enum"
			#tag EnumValues
				"0 - psrBuildStateNotBuilt"
				"1 - psrBuildStateBuiltOk"
				"2 - psrBuildStateAnalyzed"
				"3 - psrBuildStateUnknown"
			#tag EndEnumValues
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
			Name="PrivateInfo"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProjectFileName"
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
