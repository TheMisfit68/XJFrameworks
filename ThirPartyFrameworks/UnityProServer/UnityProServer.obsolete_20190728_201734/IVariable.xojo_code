#tag Class
Protected Class IVariable
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub CloseEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditor_Func0(mThis.Ptr( 0 ).Ptr(84 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditorControl_Func1(mThis.Ptr( 0 ).Ptr(104 ))
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
		Protected Delegate Function Comment_Get_Func1(this As Ptr, ByRef CurrentComment_Param As Ptr) As Integer
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
		  Dim func As New Delete_Func0(mThis.Ptr( 0 ).Ptr(96 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Delete_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditor_Func0(mThis.Ptr( 0 ).Ptr(80 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditorControl_Func1(mThis.Ptr( 0 ).Ptr(100 ))
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
		Sub GetListAttributesValues(VariableSubfield_Param As String, ListofAttributesToRead_Param As Variant, CurrentValues_Param As Variant, IecTypeList_Param As Variant, ListofErrorCode_Param As Variant, ListofErrorStrings_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetListAttributesValues_Func6(mThis.Ptr( 0 ).Ptr(88 ))
		  Dim resultCode As Integer
		  Dim Local_VariableSubfield_Param As Ptr
		  Local_VariableSubfield_Param = COM.SysAllocString( VariableSubfield_Param )
		  Dim Local_ListofAttributesToRead_Param As MemoryBlock = COM.RBVariantToVARIANT(ListofAttributesToRead_Param)
		  Dim Local_CurrentValues_Param As New MemoryBlock(16)
		  Dim Local_IecTypeList_Param As New MemoryBlock(16)
		  Dim Local_ListofErrorCode_Param As New MemoryBlock(16)
		  Dim Local_ListofErrorStrings_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_VariableSubfield_Param, Local_ListofAttributesToRead_Param, Local_CurrentValues_Param, Local_IecTypeList_Param, Local_ListofErrorCode_Param, Local_ListofErrorStrings_Param)
		  CurrentValues_Param = COM.VARIANTToRBVariant(Local_CurrentValues_Param)
		  IecTypeList_Param = COM.VARIANTToRBVariant(Local_IecTypeList_Param)
		  ListofErrorCode_Param = COM.VARIANTToRBVariant(Local_ListofErrorCode_Param)
		  ListofErrorStrings_Param = COM.VARIANTToRBVariant(Local_ListofErrorStrings_Param)
		  COM.SysFreeString(Local_VariableSubfield_Param)
		  COM.FreeVARIANT(Local_ListofAttributesToRead_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetListAttributesValues", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetListAttributesValues_Func6(this As Ptr, VariableSubfield_Param As Ptr, ListofAttributesToRead_Param As Ptr, CurrentValues_Param As Ptr, IecTypeList_Param As Ptr, ListofErrorCode_Param As Ptr, ListofErrorStrings_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetVarImplem(Password_Param As String, VariableSubfield_Param As String = "") As Variant
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetVarImplem_Func3(mThis.Ptr( 0 ).Ptr(76 ))
		  Dim resultCode As Integer
		  Dim Local_Password_Param As Ptr
		  Local_Password_Param = COM.SysAllocString( Password_Param )
		  Dim Local_VariableSubfield_Param As Ptr
		  Local_VariableSubfield_Param = COM.SysAllocString( VariableSubfield_Param )
		  Dim Return_pRatVarPhysicalImplem_Param As Ptr
		  Dim pRatVarPhysicalImplem_Param_MB As New MemoryBlock(16)
		  Return_pRatVarPhysicalImplem_Param = pRatVarPhysicalImplem_Param_MB
		  resultCode = func.Invoke(mThis, Local_Password_Param, Local_VariableSubfield_Param, Return_pRatVarPhysicalImplem_Param)
		  COM.SysFreeString(Local_Password_Param)
		  COM.SysFreeString(Local_VariableSubfield_Param)
		  If resultCode = 0 Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(Return_pRatVarPhysicalImplem_Param)
		    COM.FreeVARIANT(Return_pRatVarPhysicalImplem_Param)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetVarImplem", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetVarImplem_Func3(this As Ptr, Password_Param As Ptr, VariableSubfield_Param As Ptr, pRatVarPhysicalImplem_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Id_Get_Func1(this As Ptr, ByRef CurrentId_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{06BEE8F1-42B8-11D4-A1E9-000629A2F326}")
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InitialValue_Get_Func1(this As Ptr, CurrentValue_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InitialValue_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Get_Func1(this As Ptr, ByRef CurrentName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IVariable.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub put_TypeName(VariableTypeName_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New put_TypeName_Func1(mThis.Ptr( 0 ).Ptr(108 ))
		  Dim resultCode As Integer
		  Dim Local_VariableTypeName_Param As Ptr
		  Local_VariableTypeName_Param = COM.SysAllocString( VariableTypeName_Param )
		  resultCode = func.Invoke(mThis, Local_VariableTypeName_Param)
		  COM.SysFreeString(Local_VariableTypeName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on put_TypeName", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function put_TypeName_Func1(this As Ptr, VariableTypeName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetListAttributesValues(VariableSubfield_Param As String, ListofAttributesToSet_Param As Variant, NewValues_Param As Variant, IecTypeList_Param As Variant, ListofErrorCode_Param As Variant, ListofErrorStrings_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetListAttributesValues_Func6(mThis.Ptr( 0 ).Ptr(92 ))
		  Dim resultCode As Integer
		  Dim Local_VariableSubfield_Param As Ptr
		  Local_VariableSubfield_Param = COM.SysAllocString( VariableSubfield_Param )
		  Dim Local_ListofAttributesToSet_Param As MemoryBlock = COM.RBVariantToVARIANT(ListofAttributesToSet_Param)
		  Dim Local_NewValues_Param As MemoryBlock = COM.RBVariantToVARIANT(NewValues_Param)
		  Dim Local_IecTypeList_Param As MemoryBlock = COM.RBVariantToVARIANT(IecTypeList_Param)
		  Dim Local_ListofErrorCode_Param As New MemoryBlock(16)
		  Dim Local_ListofErrorStrings_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_VariableSubfield_Param, Local_ListofAttributesToSet_Param, Local_NewValues_Param, Local_IecTypeList_Param, Local_ListofErrorCode_Param, Local_ListofErrorStrings_Param)
		  ListofErrorCode_Param = COM.VARIANTToRBVariant(Local_ListofErrorCode_Param)
		  ListofErrorStrings_Param = COM.VARIANTToRBVariant(Local_ListofErrorStrings_Param)
		  COM.SysFreeString(Local_VariableSubfield_Param)
		  COM.FreeVARIANT(Local_ListofAttributesToSet_Param)
		  COM.FreeVARIANT(Local_NewValues_Param)
		  COM.FreeVARIANT(Local_IecTypeList_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetListAttributesValues", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetListAttributesValues_Func6(this As Ptr, VariableSubfield_Param As Ptr, ListofAttributesToSet_Param As Ptr, NewValues_Param As Ptr, IecTypeList_Param As Ptr, ListofErrorCode_Param As Ptr, ListofErrorStrings_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TopologicalAddress_Get_Func1(this As Ptr, CurrentValue_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TopologicalAddress_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TypeCategory_Get_Func1(this As Ptr, ByRef VariableTypeCategory_Param As epsrTypeCategory) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TypeCode_Get_Func1(this As Ptr, ByRef VariableTypeCode_Param As epsrTypeCode) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TypeName_Get_Func1(this As Ptr, ByRef VariableTypeName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim CurrentComment_Param As Ptr
			  Dim func As New Comment_Get_Func1( mThis.Ptr( 0 ).Ptr( 36 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, CurrentComment_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( CurrentComment_Param )
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
			  Dim CurrentId_Param As Integer
			  Dim func As New Id_Get_Func1( mThis.Ptr( 0 ).Ptr( 72 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, CurrentId_Param )
			  If 0 = resultCode Then
			    Return CurrentId_Param
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
			  Dim mb As New MemoryBlock(16)
			  Dim CurrentValue_Param As Ptr = mb
			  Dim func As New InitialValue_Get_Func1( mThis.Ptr( 0 ).Ptr( 44 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, CurrentValue_Param )
			  If 0 = resultCode Then
			    Dim retVal As Variant = COM.VARIANTToRBVariant( CurrentValue_Param )
			    COM.FreeVARIANT( CurrentValue_Param )
			    Return retVal
			  Else
			    Raise New COM.COMException("Failed on InitialValue", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New InitialValue_Put_Func1( mThis.Ptr( 0 ).Ptr( 48 ) )
			  Dim Local_rhs_Param As Ptr
			  Dim mb As MemoryBlock = COM.RBVariantToVARIANT( value )
			  Local_rhs_Param = mb
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on InitialValue", resultCode )
			  End If
			  COM.FreeVARIANT( mb )
			  
			End Set
		#tag EndSetter
		InitialValue As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim CurrentName_Param As Ptr
			  Dim func As New Name_Get_Func1( mThis.Ptr( 0 ).Ptr( 28 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, CurrentName_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( CurrentName_Param )
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
			  Dim mb As New MemoryBlock(16)
			  Dim CurrentValue_Param As Ptr = mb
			  Dim func As New TopologicalAddress_Get_Func1( mThis.Ptr( 0 ).Ptr( 52 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, CurrentValue_Param )
			  If 0 = resultCode Then
			    Dim retVal As Variant = COM.VARIANTToRBVariant( CurrentValue_Param )
			    COM.FreeVARIANT( CurrentValue_Param )
			    Return retVal
			  Else
			    Raise New COM.COMException("Failed on TopologicalAddress", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New TopologicalAddress_Put_Func1( mThis.Ptr( 0 ).Ptr( 56 ) )
			  Dim Local_rhs_Param As Ptr
			  Dim mb As MemoryBlock = COM.RBVariantToVARIANT( value )
			  Local_rhs_Param = mb
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on TopologicalAddress", resultCode )
			  End If
			  COM.FreeVARIANT( mb )
			  
			End Set
		#tag EndSetter
		TopologicalAddress As Variant
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim VariableTypeCategory_Param As epsrTypeCategory
			  Dim func As New TypeCategory_Get_Func1( mThis.Ptr( 0 ).Ptr( 64 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, VariableTypeCategory_Param )
			  If 0 = resultCode Then
			    Return VariableTypeCategory_Param
			  Else
			    Raise New COM.COMException("Failed on TypeCategory", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		TypeCategory As epsrTypeCategory
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim VariableTypeCode_Param As epsrTypeCode
			  Dim func As New TypeCode_Get_Func1( mThis.Ptr( 0 ).Ptr( 68 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, VariableTypeCode_Param )
			  If 0 = resultCode Then
			    Return VariableTypeCode_Param
			  Else
			    Raise New COM.COMException("Failed on TypeCode", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		TypeCode As epsrTypeCode
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim VariableTypeName_Param As Ptr
			  Dim func As New TypeName_Get_Func1( mThis.Ptr( 0 ).Ptr( 60 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, VariableTypeName_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( VariableTypeName_Param )
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
			Name="TypeCategory"
			Group="Behavior"
			Type="epsrTypeCategory"
			EditorType="Enum"
			#tag EnumValues
				"0 - PSR_TYPECAT_UNKNOWN"
				"1 - PSR_TYPECAT_EDT"
				"2 - PSR_TYPECAT_DDT_STRUCT"
				"3 - PSR_TYPECAT_DDT_ARRAY"
				"4 - PSR_TYPECAT_IODDT"
				"5 - PSR_TYPECAT_EFB"
				"6 - PSR_TYPECAT_DFB"
				"7 - PSR_TYPECAT_ANONYMOUS_ARRAY"
				"8 - PSR_TYPECAT_ANY_ARRAY"
				"9 - PSR_TYPECAT_ANY_REF"
				"10 - PSR_TYPECAT_ANY_DDT_REF"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TypeCode"
			Group="Behavior"
			Type="epsrTypeCode"
			EditorType="Enum"
			#tag EnumValues
				"0 - PSR_TYPECODE_UNKNOWN"
				"1 - PSR_TYPECODE_INT"
				"2 - PSR_TYPECODE_DINT"
				"3 - PSR_TYPECODE_BOOL"
				"4 - PSR_TYPECODE_UINT"
				"5 - PSR_TYPECODE_UDINT"
				"6 - PSR_TYPECODE_REAL"
				"7 - PSR_TYPECODE_TIME"
				"8 - PSR_TYPECODE_DATE"
				"9 - PSR_TYPECODE_BYTE"
				"10 - PSR_TYPECODE_DT"
				"11 - PSR_TYPECODE_DWORD"
				"12 - PSR_TYPECODE_EBOOL"
				"13 - PSR_TYPECODE_STRING"
				"14 - PSR_TYPECODE_WSTRING"
				"15 - PSR_TYPECODE_TOD"
				"16 - PSR_TYPECODE_WORD"
			#tag EndEnumValues
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
