#tag Class
Protected Class IApplication
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub AllowSwitchOfflineOnModification(lSwitchOffline_Param As Integer = 0)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New AllowSwitchOfflineOnModification_Func1(mThis.Ptr( 0 ).Ptr(220 ))
		  Dim resultCode As Integer
		  resultCode = func.Invoke(mThis, lSwitchOffline_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on AllowSwitchOfflineOnModification", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function AllowSwitchOfflineOnModification_Func1(this As Ptr, lSwitchOffline_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CustomLibraryPath_Get_Func1(this As Ptr, ByRef pBstrPath_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayStart(OptionReadWrite_Param As epsrHmiOptions, comandLine_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayStart_Func2(mThis.Ptr( 0 ).Ptr(52 ))
		  Dim resultCode As Integer
		  Dim Local_comandLine_Param As Ptr
		  Local_comandLine_Param = COM.SysAllocString( comandLine_Param )
		  resultCode = func.Invoke(mThis, OptionReadWrite_Param, Local_comandLine_Param)
		  COM.SysFreeString(Local_comandLine_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on DisplayStart", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayStartControl(bstrServicePsswd_Param As String, bstrHMIRWPasswrd_Param As String, OptionReadWrite_Param As epsrHmiOptions, comandLine_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayStartControl_Func4(mThis.Ptr( 0 ).Ptr(184 ))
		  Dim resultCode As Integer
		  Dim Local_bstrServicePsswd_Param As Ptr
		  Local_bstrServicePsswd_Param = COM.SysAllocString( bstrServicePsswd_Param )
		  Dim Local_bstrHMIRWPasswrd_Param As Ptr
		  Local_bstrHMIRWPasswrd_Param = COM.SysAllocString( bstrHMIRWPasswrd_Param )
		  Dim Local_comandLine_Param As Ptr
		  Local_comandLine_Param = COM.SysAllocString( comandLine_Param )
		  resultCode = func.Invoke(mThis, Local_bstrServicePsswd_Param, Local_bstrHMIRWPasswrd_Param, OptionReadWrite_Param, Local_comandLine_Param)
		  COM.SysFreeString(Local_bstrServicePsswd_Param)
		  COM.SysFreeString(Local_bstrHMIRWPasswrd_Param)
		  COM.SysFreeString(Local_comandLine_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on DisplayStartControl", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayStartControl_Func4(this As Ptr, bstrServicePsswd_Param As Ptr, bstrHMIRWPasswrd_Param As Ptr, OptionReadWrite_Param As epsrHmiOptions, comandLine_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayStartForMultiWriter(bstrComandLine_Param As String, lDisplayPopupWarning_Param As Integer = 1)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayStartForMultiWriter_Func2(mThis.Ptr( 0 ).Ptr(196 ))
		  Dim resultCode As Integer
		  Dim Local_bstrComandLine_Param As Ptr
		  Local_bstrComandLine_Param = COM.SysAllocString( bstrComandLine_Param )
		  resultCode = func.Invoke(mThis, Local_bstrComandLine_Param, lDisplayPopupWarning_Param)
		  COM.SysFreeString(Local_bstrComandLine_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on DisplayStartForMultiWriter", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayStartForMultiWriter_Func2(this As Ptr, bstrComandLine_Param As Ptr, lDisplayPopupWarning_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayStart_Func2(this As Ptr, OptionReadWrite_Param As epsrHmiOptions, comandLine_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ExecutionPath_Get_Func1(this As Ptr, ByRef pBstrPath_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function FileSignature(bstrFileName_Param As String) As Variant
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New FileSignature_Get_Func2(mThis.Ptr( 0 ).Ptr(164 ))
		  Dim resultCode As Integer
		  Dim Local_bstrFileName_Param As Ptr
		  Local_bstrFileName_Param = COM.SysAllocString( bstrFileName_Param )
		  Dim Return_pVal_Param As Ptr
		  Dim pVal_Param_MB As New MemoryBlock(16)
		  Return_pVal_Param = pVal_Param_MB
		  resultCode = func.Invoke(mThis, Local_bstrFileName_Param, Return_pVal_Param)
		  COM.SysFreeString(Local_bstrFileName_Param)
		  If resultCode = 0 Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(Return_pVal_Param)
		    COM.FreeVARIANT(Return_pVal_Param)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on FileSignature", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function FileSignature_Get_Func2(this As Ptr, bstrFileName_Param As Ptr, pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetAPX(VariantApx_Param As Variant, VariantApd_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetAPX_Func2(mThis.Ptr( 0 ).Ptr(208 ))
		  Dim resultCode As Integer
		  Dim Local_VariantApx_Param As New MemoryBlock(16)
		  Dim Local_VariantApd_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_VariantApx_Param, Local_VariantApd_Param)
		  VariantApx_Param = COM.VARIANTToRBVariant(Local_VariantApx_Param)
		  VariantApd_Param = COM.VARIANTToRBVariant(Local_VariantApd_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetAPX", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetAPX_Func2(this As Ptr, VariantApx_Param As Ptr, VariantApd_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetCurrentProject(lWriteAccessToken_Param As Integer, lCurrentInstance_Param As Integer, bstrPassWord_Param As String, ByRef ppProject_Param As UnityProServer.IProject)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetCurrentProject_Func4(mThis.Ptr( 0 ).Ptr(64 ))
		  Dim resultCode As Integer
		  Dim Local_bstrPassWord_Param As Ptr
		  Local_bstrPassWord_Param = COM.SysAllocString( bstrPassWord_Param )
		  Dim Local_ppProject_Param As Ptr
		  resultCode = func.Invoke(mThis, lWriteAccessToken_Param, lCurrentInstance_Param, Local_bstrPassWord_Param, Local_ppProject_Param)
		  ppProject_Param = New UnityProServer.IProject(Local_ppProject_Param)
		  COM.SysFreeString(Local_bstrPassWord_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetCurrentProject", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetCurrentProject_Func4(this As Ptr, lWriteAccessToken_Param As Integer, lCurrentInstance_Param As Integer, bstrPassWord_Param As Ptr, ByRef ppProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetDisplayPosition(plLeft_Param As Variant, plTop_Param As Variant, plRight_Param As Variant, plBottom_Param As Variant, peShowState_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetDisplayPosition_Func5(mThis.Ptr( 0 ).Ptr(48 ))
		  Dim resultCode As Integer
		  Dim Local_plLeft_Param As New MemoryBlock(16)
		  Dim Local_plTop_Param As New MemoryBlock(16)
		  Dim Local_plRight_Param As New MemoryBlock(16)
		  Dim Local_plBottom_Param As New MemoryBlock(16)
		  Dim Local_peShowState_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_plLeft_Param, Local_plTop_Param, Local_plRight_Param, Local_plBottom_Param, Local_peShowState_Param)
		  plLeft_Param = COM.VARIANTToRBVariant(Local_plLeft_Param)
		  plTop_Param = COM.VARIANTToRBVariant(Local_plTop_Param)
		  plRight_Param = COM.VARIANTToRBVariant(Local_plRight_Param)
		  plBottom_Param = COM.VARIANTToRBVariant(Local_plBottom_Param)
		  peShowState_Param = COM.VARIANTToRBVariant(Local_peShowState_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetDisplayPosition", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetDisplayPosition_Func5(this As Ptr, plLeft_Param As Ptr, plTop_Param As Ptr, plRight_Param As Ptr, plBottom_Param As Ptr, peShowState_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetProfile(vProfilName_Param As Variant, vUserName_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetProfile_Func2(mThis.Ptr( 0 ).Ptr(32 ))
		  Dim resultCode As Integer
		  Dim Local_vProfilName_Param As New MemoryBlock(16)
		  Dim Local_vUserName_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_vProfilName_Param, Local_vUserName_Param)
		  vProfilName_Param = COM.VARIANTToRBVariant(Local_vProfilName_Param)
		  vUserName_Param = COM.VARIANTToRBVariant(Local_vUserName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetProfile", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetProfile_Func2(this As Ptr, vProfilName_Param As Ptr, vUserName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{976E88E4-4684-11D4-8215-00104B448E0B}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImportProject(sourceFilename_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ImportProject_Func1(mThis.Ptr( 0 ).Ptr(76 ))
		  Dim resultCode As Integer
		  Dim Local_sourceFilename_Param As Ptr
		  Local_sourceFilename_Param = COM.SysAllocString( sourceFilename_Param )
		  resultCode = func.Invoke(mThis, Local_sourceFilename_Param)
		  COM.SysFreeString(Local_sourceFilename_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ImportProject", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ImportProject_Func1(this As Ptr, sourceFilename_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InstallationPath_Get_Func1(this As Ptr, ByRef pBstrPath_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsProfileSet_Get_Func1(this As Ptr, ByRef plVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsProjectOpen_Get_Func1(this As Ptr, ByRef plVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsTargetConnectedEqual_Get_Func1(this As Ptr, ByRef plVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsTargetConnected_Get_Func1(this As Ptr, ByRef plVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsVisible_Get_Func1(this As Ptr, ByRef plVisible_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsWriteAccessTokenFree_Get_Func1(this As Ptr, ByRef plVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function LibraryPath_Get_Func1(this As Ptr, ByRef pBstrPath_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub NewProject(bstrProjectName_Param As String, bstrPartNumber_Param As String, bstrVersion_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New NewProject_Func3(mThis.Ptr( 0 ).Ptr(68 ))
		  Dim resultCode As Integer
		  Dim Local_bstrProjectName_Param As Ptr
		  Local_bstrProjectName_Param = COM.SysAllocString( bstrProjectName_Param )
		  Dim Local_bstrPartNumber_Param As Ptr
		  Local_bstrPartNumber_Param = COM.SysAllocString( bstrPartNumber_Param )
		  Dim Local_bstrVersion_Param As Ptr
		  Local_bstrVersion_Param = COM.SysAllocString( bstrVersion_Param )
		  resultCode = func.Invoke(mThis, Local_bstrProjectName_Param, Local_bstrPartNumber_Param, Local_bstrVersion_Param)
		  COM.SysFreeString(Local_bstrProjectName_Param)
		  COM.SysFreeString(Local_bstrPartNumber_Param)
		  COM.SysFreeString(Local_bstrVersion_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on NewProject", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function NewProject_Func3(this As Ptr, bstrProjectName_Param As Ptr, bstrPartNumber_Param As Ptr, bstrVersion_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub OpenAPX(VariantApx_Param As Variant, VariantApd_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New OpenAPX_Func2(mThis.Ptr( 0 ).Ptr(204 ))
		  Dim resultCode As Integer
		  Dim Local_VariantApx_Param As MemoryBlock = COM.RBVariantToVARIANT(VariantApx_Param)
		  Dim Local_VariantApd_Param As MemoryBlock = COM.RBVariantToVARIANT(VariantApd_Param)
		  resultCode = func.Invoke(mThis, Local_VariantApx_Param, Local_VariantApd_Param)
		  COM.FreeVARIANT(Local_VariantApx_Param)
		  COM.FreeVARIANT(Local_VariantApd_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on OpenAPX", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function OpenAPX_Func2(this As Ptr, VariantApx_Param As Ptr, VariantApd_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub OpenArchive(bsArchiveFilename_Param As String, bsSafetyPwd_Param As String = "")
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New OpenArchive_Func2(mThis.Ptr( 0 ).Ptr(200 ))
		  Dim resultCode As Integer
		  Dim Local_bsArchiveFilename_Param As Ptr
		  Local_bsArchiveFilename_Param = COM.SysAllocString( bsArchiveFilename_Param )
		  Dim Local_bsSafetyPwd_Param As Ptr
		  Local_bsSafetyPwd_Param = COM.SysAllocString( bsSafetyPwd_Param )
		  resultCode = func.Invoke(mThis, Local_bsArchiveFilename_Param, Local_bsSafetyPwd_Param)
		  COM.SysFreeString(Local_bsArchiveFilename_Param)
		  COM.SysFreeString(Local_bsSafetyPwd_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on OpenArchive", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function OpenArchive_Func2(this As Ptr, bsArchiveFilename_Param As Ptr, bsSafetyPwd_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IApplication.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function OutputWindow_Get_Func1(this As Ptr, ByRef ppOutputWindow_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function PlcConnectionAddress_Get_Func1(this As Ptr, ByRef CurrentConnectionAddress_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function PlcConnectionDriver_Get_Func1(this As Ptr, ByRef CurrentConnectionDriver_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Project(lWriteAccessToken_Param As Integer = 0) As UnityProServer.IProject
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Project_Get_Func2(mThis.Ptr( 0 ).Ptr(60 ))
		  Dim resultCode As Integer
		  Dim Return_ppProject_Param As Ptr
		  resultCode = func.Invoke(mThis, lWriteAccessToken_Param, Return_ppProject_Param)
		  If resultCode = 0 Then
		    If Nil = Return_ppProject_Param  Then Return Nil
		    Return New UnityProServer.IProject(Return_ppProject_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Project", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProjectClose()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ProjectClose_Func0(mThis.Ptr( 0 ).Ptr(84 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ProjectClose_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ProjectForMultiWriter_Get_Func1(this As Ptr, ByRef ppProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Project_Get_Func2(this As Ptr, lWriteAccessToken_Param As Integer, ByRef ppProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub PutProfile(UserName_Param As String, Password_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New PutProfile_Func2(mThis.Ptr( 0 ).Ptr(188 ))
		  Dim resultCode As Integer
		  Dim Local_UserName_Param As Ptr
		  Local_UserName_Param = COM.SysAllocString( UserName_Param )
		  Dim Local_Password_Param As Ptr
		  Local_Password_Param = COM.SysAllocString( Password_Param )
		  resultCode = func.Invoke(mThis, Local_UserName_Param, Local_Password_Param)
		  COM.SysFreeString(Local_UserName_Param)
		  COM.SysFreeString(Local_Password_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on PutProfile", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function PutProfile_Func2(this As Ptr, UserName_Param As Ptr, Password_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SelectTarget_Get_Func1(this As Ptr, ByRef peTarget_Param As epsrTargetConnection) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetDisplayPosition(lLeft_Param As Integer, lTop_Param As Integer, lRight_Param As Integer, lBottom_Param As Integer, eShowState_Param As epsrShowState)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetDisplayPosition_Func5(mThis.Ptr( 0 ).Ptr(44 ))
		  Dim resultCode As Integer
		  resultCode = func.Invoke(mThis, lLeft_Param, lTop_Param, lRight_Param, lBottom_Param, eShowState_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetDisplayPosition", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetDisplayPosition_Func5(this As Ptr, lLeft_Param As Integer, lTop_Param As Integer, lRight_Param As Integer, lBottom_Param As Integer, eShowState_Param As epsrShowState) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetPlcConnectionAddress(NewConnectionAddress_Param As String, pProject_Param As UnityProServer.IProject)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetPlcConnectionAddress_Func2(mThis.Ptr( 0 ).Ptr(100 ))
		  Dim resultCode As Integer
		  Dim Local_NewConnectionAddress_Param As Ptr
		  Local_NewConnectionAddress_Param = COM.SysAllocString( NewConnectionAddress_Param )
		  Dim Local_pProject_Param As Ptr
		  Local_pProject_Param = pProject_Param.Handle
		  resultCode = func.Invoke(mThis, Local_NewConnectionAddress_Param, Local_pProject_Param)
		  COM.SysFreeString(Local_NewConnectionAddress_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetPlcConnectionAddress", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetPlcConnectionAddress_Func2(this As Ptr, NewConnectionAddress_Param As Ptr, pProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetPlcConnectionDriver(CurrentConnectionDriver_Param As String, pProject_Param As UnityProServer.IProject)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetPlcConnectionDriver_Func2(mThis.Ptr( 0 ).Ptr(108 ))
		  Dim resultCode As Integer
		  Dim Local_CurrentConnectionDriver_Param As Ptr
		  Local_CurrentConnectionDriver_Param = COM.SysAllocString( CurrentConnectionDriver_Param )
		  Dim Local_pProject_Param As Ptr
		  Local_pProject_Param = pProject_Param.Handle
		  resultCode = func.Invoke(mThis, Local_CurrentConnectionDriver_Param, Local_pProject_Param)
		  COM.SysFreeString(Local_CurrentConnectionDriver_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetPlcConnectionDriver", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetPlcConnectionDriver_Func2(this As Ptr, CurrentConnectionDriver_Param As Ptr, pProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetProjectSettingsTemplate(bsTemplateFilename_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetProjectSettingsTemplate_Func1(mThis.Ptr( 0 ).Ptr(212 ))
		  Dim resultCode As Integer
		  Dim Local_bsTemplateFilename_Param As Ptr
		  Local_bsTemplateFilename_Param = COM.SysAllocString( bsTemplateFilename_Param )
		  resultCode = func.Invoke(mThis, Local_bsTemplateFilename_Param)
		  COM.SysFreeString(Local_bsTemplateFilename_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetProjectSettingsTemplate", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetProjectSettingsTemplate_Func1(this As Ptr, bsTemplateFilename_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetSelectTarget(eTarget_Param As epsrTargetConnection, pProject_Param As UnityProServer.IProject)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetSelectTarget_Func2(mThis.Ptr( 0 ).Ptr(92 ))
		  Dim resultCode As Integer
		  Dim Local_pProject_Param As Ptr
		  Local_pProject_Param = pProject_Param.Handle
		  resultCode = func.Invoke(mThis, eTarget_Param, Local_pProject_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetSelectTarget", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetSelectTarget_Func2(this As Ptr, eTarget_Param As epsrTargetConnection, pProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetSimulatorConnectionAddress(NewSimulatorAddress_Param As String, pProject_Param As UnityProServer.IProject)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetSimulatorConnectionAddress_Func2(mThis.Ptr( 0 ).Ptr(116 ))
		  Dim resultCode As Integer
		  Dim Local_NewSimulatorAddress_Param As Ptr
		  Local_NewSimulatorAddress_Param = COM.SysAllocString( NewSimulatorAddress_Param )
		  Dim Local_pProject_Param As Ptr
		  Local_pProject_Param = pProject_Param.Handle
		  resultCode = func.Invoke(mThis, Local_NewSimulatorAddress_Param, Local_pProject_Param)
		  COM.SysFreeString(Local_NewSimulatorAddress_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetSimulatorConnectionAddress", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetSimulatorConnectionAddress_Func2(this As Ptr, NewSimulatorAddress_Param As Ptr, pProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetSimulatorConnectionDriver(NewSimulatorDriver_Param As String, pProject_Param As UnityProServer.IProject)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetSimulatorConnectionDriver_Func2(mThis.Ptr( 0 ).Ptr(124 ))
		  Dim resultCode As Integer
		  Dim Local_NewSimulatorDriver_Param As Ptr
		  Local_NewSimulatorDriver_Param = COM.SysAllocString( NewSimulatorDriver_Param )
		  Dim Local_pProject_Param As Ptr
		  Local_pProject_Param = pProject_Param.Handle
		  resultCode = func.Invoke(mThis, Local_NewSimulatorDriver_Param, Local_pProject_Param)
		  COM.SysFreeString(Local_NewSimulatorDriver_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetSimulatorConnectionDriver", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetSimulatorConnectionDriver_Func2(this As Ptr, NewSimulatorDriver_Param As Ptr, pProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SimulatorConnectionAddress_Get_Func1(this As Ptr, ByRef CurrentSimulatorAddress_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SimulatorConnectionDriver_Get_Func1(this As Ptr, ByRef CurrentSimulatorDriver_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub TargetConnectionClose(pProject_Param As UnityProServer.IProject)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New TargetConnectionClose_Func1(mThis.Ptr( 0 ).Ptr(132 ))
		  Dim resultCode As Integer
		  Dim Local_pProject_Param As Ptr
		  Local_pProject_Param = pProject_Param.Handle
		  resultCode = func.Invoke(mThis, Local_pProject_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on TargetConnectionClose", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TargetConnectionClose_Func1(this As Ptr, pProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TargetConnectionMode_Get_Func1(this As Ptr, ByRef pVal_Param As epsrConnectionMode) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub TargetConnectionOpen(target_Param As epsrTargetConnection, BstrNameReservation_Param As String, ConnectionMode_Param As epsrConnectionMode, pProject_Param As UnityProServer.IProject)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New TargetConnectionOpen_Func4(mThis.Ptr( 0 ).Ptr(128 ))
		  Dim resultCode As Integer
		  Dim Local_BstrNameReservation_Param As Ptr
		  Local_BstrNameReservation_Param = COM.SysAllocString( BstrNameReservation_Param )
		  Dim Local_pProject_Param As Ptr
		  Local_pProject_Param = pProject_Param.Handle
		  resultCode = func.Invoke(mThis, target_Param, Local_BstrNameReservation_Param, ConnectionMode_Param, Local_pProject_Param)
		  COM.SysFreeString(Local_BstrNameReservation_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on TargetConnectionOpen", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TargetConnectionOpen_Func4(this As Ptr, target_Param As epsrTargetConnection, BstrNameReservation_Param As Ptr, ConnectionMode_Param As epsrConnectionMode, pProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TargetConnectionState_Get_Func1(this As Ptr, ByRef pVal_Param As epsrConnectionState) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub TargetSendCommand(newPlcCommand_Param As epsrPlcCommand, pProject_Param As UnityProServer.IProject)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New TargetSendCommand_Func2(mThis.Ptr( 0 ).Ptr(160 ))
		  Dim resultCode As Integer
		  Dim Local_pProject_Param As Ptr
		  Local_pProject_Param = pProject_Param.Handle
		  resultCode = func.Invoke(mThis, newPlcCommand_Param, Local_pProject_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on TargetSendCommand", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TargetSendCommand_Func2(this As Ptr, newPlcCommand_Param As epsrPlcCommand, pProject_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TargetSignature_Get_Func1(this As Ptr, pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TargetState_Get_Func1(this As Ptr, ByRef pVal_Param As epsrPlcState) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub TransferAllPLCToPC()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New TransferAllPLCToPC_Func0(mThis.Ptr( 0 ).Ptr(72 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TransferAllPLCToPC_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Version_Get_Func1(this As Ptr, ByRef pBstrVersion_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pBstrPath_Param As Ptr
			  Dim func As New CustomLibraryPath_Get_Func1( mThis.Ptr( 0 ).Ptr( 216 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pBstrPath_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pBstrPath_Param )
			  Else
			    Raise New COM.COMException("Failed on CustomLibraryPath", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		CustomLibraryPath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pBstrPath_Param As Ptr
			  Dim func As New ExecutionPath_Get_Func1( mThis.Ptr( 0 ).Ptr( 172 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pBstrPath_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pBstrPath_Param )
			  Else
			    Raise New COM.COMException("Failed on ExecutionPath", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		ExecutionPath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pBstrPath_Param As Ptr
			  Dim func As New InstallationPath_Get_Func1( mThis.Ptr( 0 ).Ptr( 168 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pBstrPath_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pBstrPath_Param )
			  Else
			    Raise New COM.COMException("Failed on InstallationPath", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		InstallationPath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim plVal_Param As Integer
			  Dim func As New IsProfileSet_Get_Func1( mThis.Ptr( 0 ).Ptr( 36 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, plVal_Param )
			  If 0 = resultCode Then
			    Return plVal_Param
			  Else
			    Raise New COM.COMException("Failed on IsProfileSet", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		IsProfileSet As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim plVal_Param As Integer
			  Dim func As New IsProjectOpen_Get_Func1( mThis.Ptr( 0 ).Ptr( 80 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, plVal_Param )
			  If 0 = resultCode Then
			    Return plVal_Param
			  Else
			    Raise New COM.COMException("Failed on IsProjectOpen", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		IsProjectOpen As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim plVal_Param As Integer
			  Dim func As New IsTargetConnected_Get_Func1( mThis.Ptr( 0 ).Ptr( 136 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, plVal_Param )
			  If 0 = resultCode Then
			    Return plVal_Param
			  Else
			    Raise New COM.COMException("Failed on IsTargetConnected", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		IsTargetConnected As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim plVal_Param As Integer
			  Dim func As New IsTargetConnectedEqual_Get_Func1( mThis.Ptr( 0 ).Ptr( 140 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, plVal_Param )
			  If 0 = resultCode Then
			    Return plVal_Param
			  Else
			    Raise New COM.COMException("Failed on IsTargetConnectedEqual", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		IsTargetConnectedEqual As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim plVisible_Param As Integer
			  Dim func As New IsVisible_Get_Func1( mThis.Ptr( 0 ).Ptr( 56 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, plVisible_Param )
			  If 0 = resultCode Then
			    Return plVisible_Param
			  Else
			    Raise New COM.COMException("Failed on IsVisible", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		IsVisible As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim plVal_Param As Integer
			  Dim func As New IsWriteAccessTokenFree_Get_Func1( mThis.Ptr( 0 ).Ptr( 40 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, plVal_Param )
			  If 0 = resultCode Then
			    Return plVal_Param
			  Else
			    Raise New COM.COMException("Failed on IsWriteAccessTokenFree", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		IsWriteAccessTokenFree As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pBstrPath_Param As Ptr
			  Dim func As New LibraryPath_Get_Func1( mThis.Ptr( 0 ).Ptr( 176 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pBstrPath_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pBstrPath_Param )
			  Else
			    Raise New COM.COMException("Failed on LibraryPath", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		LibraryPath As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppOutputWindow_Param As Ptr
			  Dim func As New OutputWindow_Get_Func1( mThis.Ptr( 0 ).Ptr( 180 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppOutputWindow_Param )
			  If 0 = resultCode Then
			    If Nil <> ppOutputWindow_Param Then
			      Return New UnityProServer.IOutputWindow( ppOutputWindow_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on OutputWindow", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		OutputWindow As UnityProServer.IOutputWindow
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim CurrentConnectionAddress_Param As Ptr
			  Dim func As New PlcConnectionAddress_Get_Func1( mThis.Ptr( 0 ).Ptr( 96 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, CurrentConnectionAddress_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( CurrentConnectionAddress_Param )
			  Else
			    Raise New COM.COMException("Failed on PlcConnectionAddress", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		PlcConnectionAddress As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim CurrentConnectionDriver_Param As Ptr
			  Dim func As New PlcConnectionDriver_Get_Func1( mThis.Ptr( 0 ).Ptr( 104 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, CurrentConnectionDriver_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( CurrentConnectionDriver_Param )
			  Else
			    Raise New COM.COMException("Failed on PlcConnectionDriver", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		PlcConnectionDriver As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppProject_Param As Ptr
			  Dim func As New ProjectForMultiWriter_Get_Func1( mThis.Ptr( 0 ).Ptr( 192 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppProject_Param )
			  If 0 = resultCode Then
			    If Nil <> ppProject_Param Then
			      Return New UnityProServer.IProject( ppProject_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on ProjectForMultiWriter", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		ProjectForMultiWriter As UnityProServer.IProject
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim peTarget_Param As epsrTargetConnection
			  Dim func As New SelectTarget_Get_Func1( mThis.Ptr( 0 ).Ptr( 88 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, peTarget_Param )
			  If 0 = resultCode Then
			    Return peTarget_Param
			  Else
			    Raise New COM.COMException("Failed on SelectTarget", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		SelectTarget As epsrTargetConnection
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim CurrentSimulatorAddress_Param As Ptr
			  Dim func As New SimulatorConnectionAddress_Get_Func1( mThis.Ptr( 0 ).Ptr( 112 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, CurrentSimulatorAddress_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( CurrentSimulatorAddress_Param )
			  Else
			    Raise New COM.COMException("Failed on SimulatorConnectionAddress", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		SimulatorConnectionAddress As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim CurrentSimulatorDriver_Param As Ptr
			  Dim func As New SimulatorConnectionDriver_Get_Func1( mThis.Ptr( 0 ).Ptr( 120 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, CurrentSimulatorDriver_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( CurrentSimulatorDriver_Param )
			  Else
			    Raise New COM.COMException("Failed on SimulatorConnectionDriver", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		SimulatorConnectionDriver As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As epsrConnectionMode
			  Dim func As New TargetConnectionMode_Get_Func1( mThis.Ptr( 0 ).Ptr( 148 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return pVal_Param
			  Else
			    Raise New COM.COMException("Failed on TargetConnectionMode", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		TargetConnectionMode As epsrConnectionMode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As epsrConnectionState
			  Dim func As New TargetConnectionState_Get_Func1( mThis.Ptr( 0 ).Ptr( 144 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return pVal_Param
			  Else
			    Raise New COM.COMException("Failed on TargetConnectionState", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		TargetConnectionState As epsrConnectionState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim mb As New MemoryBlock(16)
			  Dim pVal_Param As Ptr = mb
			  Dim func As New TargetSignature_Get_Func1( mThis.Ptr( 0 ).Ptr( 152 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Dim retVal As Variant = COM.VARIANTToRBVariant( pVal_Param )
			    COM.FreeVARIANT( pVal_Param )
			    Return retVal
			  Else
			    Raise New COM.COMException("Failed on TargetSignature", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		TargetSignature As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As epsrPlcState
			  Dim func As New TargetState_Get_Func1( mThis.Ptr( 0 ).Ptr( 156 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return pVal_Param
			  Else
			    Raise New COM.COMException("Failed on TargetState", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		TargetState As epsrPlcState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pBstrVersion_Param As Ptr
			  Dim func As New Version_Get_Func1( mThis.Ptr( 0 ).Ptr( 28 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pBstrVersion_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pBstrVersion_Param )
			  Else
			    Raise New COM.COMException("Failed on Version", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Version As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CustomLibraryPath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExecutionPath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InstallationPath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsProfileSet"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsProjectOpen"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsTargetConnected"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsTargetConnectedEqual"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsVisible"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsWriteAccessTokenFree"
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
			Name="LibraryPath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PlcConnectionAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PlcConnectionDriver"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectTarget"
			Group="Behavior"
			Type="epsrTargetConnection"
			EditorType="Enum"
			#tag EnumValues
				"0 - psrConnectToPlc"
				"1 - psrConnectToSimulator"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="SimulatorConnectionAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SimulatorConnectionDriver"
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
			Name="TargetConnectionMode"
			Group="Behavior"
			Type="epsrConnectionMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - psrConnectionModeUnknown"
				"1 - psrConnectionModePrimary"
				"2 - psrConnectionModeSecondary"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TargetConnectionState"
			Group="Behavior"
			Type="epsrConnectionState"
			EditorType="Enum"
			#tag EnumValues
				"0 - psrConnectionStateOffline"
				"1 - psrConnectionStateDifferent"
				"2 - psrConnectionStateEqual"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TargetState"
			Group="Behavior"
			Type="epsrPlcState"
			EditorType="Enum"
			#tag EnumValues
				"0 - psrPlcStateUnknown"
				"1 - psrPlcStateStop"
				"2 - psrPlcStateRun"
				"3 - psrPlcStateDefault"
				"4 - psrPlcStateNoConf"
				"5 - psrPlcStateHalt"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
