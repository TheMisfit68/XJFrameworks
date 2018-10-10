#tag Class
Protected Class Ddt
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub CloseEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditor_Func0(mThis.Ptr( 0 ).Ptr(72 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditorControl_Func1(mThis.Ptr( 0 ).Ptr(92 ))
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

	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{92A2EDDC-1A24-11D5-B23A-0002553484A6}" )
		    clsid = COM.IIDFromString( "{92A2EDDA-1A24-11D5-B23A-0002553484A6}" )
		    
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
		  Dim func As New Delete_Func0(mThis.Ptr( 0 ).Ptr(64 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Delete_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DescriptiveForm_Get_Func1(this As Ptr, ByRef pCurrentDescriptiveForm_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Destructor()
		  If ObjectMap <> Nil And ObjectMap.HasKey(Handle) Then ObjectMap.Remove(Handle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditor_Func0(mThis.Ptr( 0 ).Ptr(68 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditorControl_Func1(mThis.Ptr( 0 ).Ptr(88 ))
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
		  Dim func As New Export_Func2(mThis.Ptr( 0 ).Ptr(76 ))
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
		Protected Delegate Function Id_Get_Func1(this As Ptr, ByRef pCurrentId_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{92A2EDDC-1A24-11D5-B23A-0002553484A6}")
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InfoSignature_Get_Func1(this As Ptr, ByRef pCurrentSignature_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InfoSize_Get_Func1(this As Ptr, ByRef pCurrentSize_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InfoVersion_Get_Func1(this As Ptr, ByRef pCurrentVersion_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub ListArrayInfos(Size_Param As Variant, TypeCategory_Param As Variant, MinRanges_Param As Variant, MaxRanges_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ListArrayInfos_Func4(mThis.Ptr( 0 ).Ptr(84 ))
		  Dim resultCode As Integer
		  Dim Local_Size_Param As New MemoryBlock(16)
		  Dim Local_TypeCategory_Param As New MemoryBlock(16)
		  Dim Local_MinRanges_Param As New MemoryBlock(16)
		  Dim Local_MaxRanges_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_Size_Param, Local_TypeCategory_Param, Local_MinRanges_Param, Local_MaxRanges_Param)
		  Size_Param = COM.VARIANTToRBVariant(Local_Size_Param)
		  TypeCategory_Param = COM.VARIANTToRBVariant(Local_TypeCategory_Param)
		  MinRanges_Param = COM.VARIANTToRBVariant(Local_MinRanges_Param)
		  MaxRanges_Param = COM.VARIANTToRBVariant(Local_MaxRanges_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ListArrayInfos", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ListArrayInfos_Func4(this As Ptr, Size_Param As Ptr, TypeCategory_Param As Ptr, MinRanges_Param As Ptr, MaxRanges_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub ListSubfields(SubfieldsNamesList_Param As Variant, SubfieldsTypeNameList_Param As Variant, SubfieldsTypeCategoryList_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ListSubfields_Func3(mThis.Ptr( 0 ).Ptr(80 ))
		  Dim resultCode As Integer
		  Dim Local_SubfieldsNamesList_Param As New MemoryBlock(16)
		  Dim Local_SubfieldsTypeNameList_Param As New MemoryBlock(16)
		  Dim Local_SubfieldsTypeCategoryList_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_SubfieldsNamesList_Param, Local_SubfieldsTypeNameList_Param, Local_SubfieldsTypeCategoryList_Param)
		  SubfieldsNamesList_Param = COM.VARIANTToRBVariant(Local_SubfieldsNamesList_Param)
		  SubfieldsTypeNameList_Param = COM.VARIANTToRBVariant(Local_SubfieldsTypeNameList_Param)
		  SubfieldsTypeCategoryList_Param = COM.VARIANTToRBVariant(Local_SubfieldsTypeCategoryList_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ListSubfields", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ListSubfields_Func3(this As Ptr, SubfieldsNamesList_Param As Ptr, SubfieldsTypeNameList_Param As Ptr, SubfieldsTypeCategoryList_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Get_Func1(this As Ptr, ByRef pCurrentName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IDdt.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TypeCategory_Get_Func1(this As Ptr, ByRef pTypeCategory_Param As epsrTypeCategory) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ValidationDate_Get_Func1(this As Ptr, pCurrentDate_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pCurrentComment_Param As Ptr
			  Dim func As New Comment_Get_Func1( mThis.Ptr( 0 ).Ptr( 32 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pCurrentComment_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pCurrentComment_Param )
			  Else
			    Raise New COM.COMException("Failed on Comment", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Comment As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pCurrentDescriptiveForm_Param As Ptr
			  Dim func As New DescriptiveForm_Get_Func1( mThis.Ptr( 0 ).Ptr( 44 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pCurrentDescriptiveForm_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pCurrentDescriptiveForm_Param )
			  Else
			    Raise New COM.COMException("Failed on DescriptiveForm", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		DescriptiveForm As String
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pCurrentSignature_Param As Ptr
			  Dim func As New InfoSignature_Get_Func1( mThis.Ptr( 0 ).Ptr( 52 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pCurrentSignature_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pCurrentSignature_Param )
			  Else
			    Raise New COM.COMException("Failed on InfoSignature", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		InfoSignature As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pCurrentSize_Param As Integer
			  Dim func As New InfoSize_Get_Func1( mThis.Ptr( 0 ).Ptr( 48 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pCurrentSize_Param )
			  If 0 = resultCode Then
			    Return pCurrentSize_Param
			  Else
			    Raise New COM.COMException("Failed on InfoSize", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		InfoSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pCurrentVersion_Param As Ptr
			  Dim func As New InfoVersion_Get_Func1( mThis.Ptr( 0 ).Ptr( 56 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pCurrentVersion_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pCurrentVersion_Param )
			  Else
			    Raise New COM.COMException("Failed on InfoVersion", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		InfoVersion As String
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
		Name As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Shared ObjectMap As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pTypeCategory_Param As epsrTypeCategory
			  Dim func As New TypeCategory_Get_Func1( mThis.Ptr( 0 ).Ptr( 40 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pTypeCategory_Param )
			  If 0 = resultCode Then
			    Return pTypeCategory_Param
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
			  Dim mb As New MemoryBlock(16)
			  Dim pCurrentDate_Param As Ptr = mb
			  Dim func As New ValidationDate_Get_Func1( mThis.Ptr( 0 ).Ptr( 60 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pCurrentDate_Param )
			  If 0 = resultCode Then
			    Dim retVal As Variant = COM.VARIANTToRBVariant( pCurrentDate_Param )
			    COM.FreeVARIANT( pCurrentDate_Param )
			    Return retVal
			  Else
			    Raise New COM.COMException("Failed on ValidationDate", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		ValidationDate As Variant
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Comment"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DescriptiveForm"
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
			Name="InfoSignature"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InfoSize"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InfoVersion"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
	#tag EndViewBehavior
End Class
#tag EndClass
