#tag Class
Protected Class IVariables
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Function Add(sVarName_Param As String, sTypeName_Param As String) As UnityProServer.IVariable
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Add_Func3(mThis.Ptr( 0 ).Ptr(28 ))
		  Dim resultCode As Integer
		  Dim Local_sVarName_Param As Ptr
		  Local_sVarName_Param = COM.SysAllocString( sVarName_Param )
		  Dim Local_sTypeName_Param As Ptr
		  Local_sTypeName_Param = COM.SysAllocString( sTypeName_Param )
		  Dim Return_newVar_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_sVarName_Param, Local_sTypeName_Param, Return_newVar_Param)
		  COM.SysFreeString(Local_sVarName_Param)
		  COM.SysFreeString(Local_sTypeName_Param)
		  If resultCode = 0 Then
		    If Nil = Return_newVar_Param  Then Return Nil
		    Return New UnityProServer.IVariable(Return_newVar_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Add", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Add_Func3(this As Ptr, sVarName_Param As Ptr, sTypeName_Param As Ptr, ByRef newVar_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Count_Get_Func1(this As Ptr, ByRef pVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Export(FileNameExport_Param As String, ExportOption_Param As Integer = 0)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Export_Func2(mThis.Ptr( 0 ).Ptr(64 ))
		  Dim resultCode As Integer
		  Dim Local_FileNameExport_Param As Ptr
		  Local_FileNameExport_Param = COM.SysAllocString( FileNameExport_Param )
		  resultCode = func.Invoke(mThis, Local_FileNameExport_Param, ExportOption_Param)
		  COM.SysFreeString(Local_FileNameExport_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Export", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExportXVM(FileNameExport_Param As String, ExportOption_Param As Integer = 0)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ExportXVM_Func2(mThis.Ptr( 0 ).Ptr(68 ))
		  Dim resultCode As Integer
		  Dim Local_FileNameExport_Param As Ptr
		  Local_FileNameExport_Param = COM.SysAllocString( FileNameExport_Param )
		  resultCode = func.Invoke(mThis, Local_FileNameExport_Param, ExportOption_Param)
		  COM.SysFreeString(Local_FileNameExport_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ExportXVM", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ExportXVM_Func2(this As Ptr, FileNameExport_Param As Ptr, ExportOption_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Export_Func2(this As Ptr, FileNameExport_Param As Ptr, ExportOption_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{06BEE8EF-42B8-11D4-A1E9-000629A2F326}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Import(FileNameToImport_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Import_Func1(mThis.Ptr( 0 ).Ptr(60 ))
		  Dim resultCode As Integer
		  Dim Local_FileNameToImport_Param As Ptr
		  Local_FileNameToImport_Param = COM.SysAllocString( FileNameToImport_Param )
		  resultCode = func.Invoke(mThis, Local_FileNameToImport_Param)
		  COM.SysFreeString(Local_FileNameToImport_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Import", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImportWithStrategy(FileNameToImport_Param As String, psrImportStrategy_Param As epsrImportOption = UnityProServer.epsrImportOption.psrImportOptionKeepPrevious)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ImportWithStrategy_Func2(mThis.Ptr( 0 ).Ptr(72 ))
		  Dim resultCode As Integer
		  Dim Local_FileNameToImport_Param As Ptr
		  Local_FileNameToImport_Param = COM.SysAllocString( FileNameToImport_Param )
		  resultCode = func.Invoke(mThis, Local_FileNameToImport_Param, psrImportStrategy_Param)
		  COM.SysFreeString(Local_FileNameToImport_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ImportWithStrategy", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ImportWithStrategy_Func2(this As Ptr, FileNameToImport_Param As Ptr, psrImportStrategy_Param As epsrImportOption) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Import_Func1(this As Ptr, FileNameToImport_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Item(Key_Param As Variant, Id_Param As Integer = 0) As UnityProServer.IVariable
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Item_Func3(mThis.Ptr( 0 ).Ptr(40 ))
		  Dim resultCode As Integer
		  Dim Local_Key_Param As MemoryBlock = COM.RBVariantToVARIANT(Key_Param)
		  Dim Return_ppReturnedVariable_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_Key_Param, Id_Param, Return_ppReturnedVariable_Param)
		  COM.FreeVARIANT(Local_Key_Param)
		  If resultCode = 0 Then
		    If Nil = Return_ppReturnedVariable_Param  Then Return Nil
		    Return New UnityProServer.IVariable(Return_ppReturnedVariable_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Item", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Item_Func3(this As Ptr, Key_Param As Ptr, Id_Param As Integer, ByRef ppReturnedVariable_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub ListAttributesReturnValues(AttributesKeyCodeList_Param As Variant, IecTypeList_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ListAttributesReturnValues_Func2(mThis.Ptr( 0 ).Ptr(56 ))
		  Dim resultCode As Integer
		  Dim Local_AttributesKeyCodeList_Param As MemoryBlock = COM.RBVariantToVARIANT(AttributesKeyCodeList_Param)
		  Dim Local_IecTypeList_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_AttributesKeyCodeList_Param, Local_IecTypeList_Param)
		  IecTypeList_Param = COM.VARIANTToRBVariant(Local_IecTypeList_Param)
		  COM.FreeVARIANT(Local_AttributesKeyCodeList_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ListAttributesReturnValues", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ListAttributesReturnValues_Func2(this As Ptr, AttributesKeyCodeList_Param As Ptr, IecTypeList_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function ListAttributesSupported(ApplicationLevel_Param As String, IdentKeyCode_Param As String) As Variant
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ListAttributesSupported_Func3(mThis.Ptr( 0 ).Ptr(52 ))
		  Dim resultCode As Integer
		  Dim Local_ApplicationLevel_Param As Ptr
		  Local_ApplicationLevel_Param = COM.SysAllocString( ApplicationLevel_Param )
		  Dim Local_IdentKeyCode_Param As Ptr
		  Local_IdentKeyCode_Param = COM.SysAllocString( IdentKeyCode_Param )
		  Dim Return_AttributesDescription_Param As Ptr
		  Dim AttributesDescription_Param_MB As New MemoryBlock(16)
		  Return_AttributesDescription_Param = AttributesDescription_Param_MB
		  resultCode = func.Invoke(mThis, Local_ApplicationLevel_Param, Local_IdentKeyCode_Param, Return_AttributesDescription_Param)
		  COM.SysFreeString(Local_ApplicationLevel_Param)
		  COM.SysFreeString(Local_IdentKeyCode_Param)
		  If resultCode = 0 Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(Return_AttributesDescription_Param)
		    COM.FreeVARIANT(Return_AttributesDescription_Param)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ListAttributesSupported", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ListAttributesSupported_Func3(this As Ptr, ApplicationLevel_Param As Ptr, IdentKeyCode_Param As Ptr, AttributesDescription_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub ListAttributesValues(ListofVariableIds_Param As Variant, Filter_Param As Variant, ListofAttributesToRead_Param As Variant, ListofAttributesValues_Param As Variant, IecTypeList_Param As Variant, ListofErrorCode_Param As Variant, ListofErrorStrings_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ListAttributesValues_Func7(mThis.Ptr( 0 ).Ptr(48 ))
		  Dim resultCode As Integer
		  Dim Local_ListofVariableIds_Param As MemoryBlock = COM.RBVariantToVARIANT(ListofVariableIds_Param)
		  Dim Local_Filter_Param As MemoryBlock = COM.RBVariantToVARIANT(Filter_Param)
		  Dim Local_ListofAttributesToRead_Param As MemoryBlock = COM.RBVariantToVARIANT(ListofAttributesToRead_Param)
		  Dim Local_ListofAttributesValues_Param As New MemoryBlock(16)
		  Dim Local_IecTypeList_Param As New MemoryBlock(16)
		  Dim Local_ListofErrorCode_Param As New MemoryBlock(16)
		  Dim Local_ListofErrorStrings_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_ListofVariableIds_Param, Local_Filter_Param, Local_ListofAttributesToRead_Param, Local_ListofAttributesValues_Param, Local_IecTypeList_Param, Local_ListofErrorCode_Param, Local_ListofErrorStrings_Param)
		  ListofAttributesValues_Param = COM.VARIANTToRBVariant(Local_ListofAttributesValues_Param)
		  IecTypeList_Param = COM.VARIANTToRBVariant(Local_IecTypeList_Param)
		  ListofErrorCode_Param = COM.VARIANTToRBVariant(Local_ListofErrorCode_Param)
		  ListofErrorStrings_Param = COM.VARIANTToRBVariant(Local_ListofErrorStrings_Param)
		  COM.FreeVARIANT(Local_ListofVariableIds_Param)
		  COM.FreeVARIANT(Local_Filter_Param)
		  COM.FreeVARIANT(Local_ListofAttributesToRead_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ListAttributesValues", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ListAttributesValues_Func7(this As Ptr, ListofVariableIds_Param As Ptr, Filter_Param As Ptr, ListofAttributesToRead_Param As Ptr, ListofAttributesValues_Param As Ptr, IecTypeList_Param As Ptr, ListofErrorCode_Param As Ptr, ListofErrorStrings_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function ListModifiedById(SignatureBegin_Param As Variant, SignatureEnd_Param As Variant) As Variant
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ListModifiedById_Func3(mThis.Ptr( 0 ).Ptr(44 ))
		  Dim resultCode As Integer
		  Dim Local_SignatureBegin_Param As MemoryBlock = COM.RBVariantToVARIANT(SignatureBegin_Param)
		  Dim Local_SignatureEnd_Param As MemoryBlock = COM.RBVariantToVARIANT(SignatureEnd_Param)
		  Dim Return_ListModifiedIds_Param As Ptr
		  Dim ListModifiedIds_Param_MB As New MemoryBlock(16)
		  Return_ListModifiedIds_Param = ListModifiedIds_Param_MB
		  resultCode = func.Invoke(mThis, Local_SignatureBegin_Param, Local_SignatureEnd_Param, Return_ListModifiedIds_Param)
		  COM.FreeVARIANT(Local_SignatureBegin_Param)
		  COM.FreeVARIANT(Local_SignatureEnd_Param)
		  If resultCode = 0 Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(Return_ListModifiedIds_Param)
		    COM.FreeVARIANT(Return_ListModifiedIds_Param)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ListModifiedById", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ListModifiedById_Func3(this As Ptr, SignatureBegin_Param As Ptr, SignatureEnd_Param As Ptr, ListModifiedIds_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IVariables.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function _NewEnum_Get_Func1(this As Ptr, ByRef ppEnum_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Integer
			  Dim func As New Count_Get_Func1( mThis.Ptr( 0 ).Ptr( 32 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return pVal_Param
			  Else
			    Raise New COM.COMException("Failed on Count", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppEnum_Param As Ptr
			  Dim func As New _NewEnum_Get_Func1( mThis.Ptr( 0 ).Ptr( 36 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppEnum_Param )
			  If 0 = resultCode Then
			    If Nil <> ppEnum_Param Then
			      Return New COM.IUnknown( ppEnum_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on _NewEnum", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		_NewEnum As COM.IUnknown
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
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
