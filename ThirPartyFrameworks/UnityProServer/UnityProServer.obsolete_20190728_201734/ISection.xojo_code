#tag Class
Protected Class ISection
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub AttachSectionToFctModule(IdOfFctModule_Param As Integer)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New AttachSectionToFctModule_Func1(mThis.Ptr( 0 ).Ptr(72 ))
		  Dim resultCode As Integer
		  resultCode = func.Invoke(mThis, IdOfFctModule_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on AttachSectionToFctModule", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function AttachSectionToFctModule_Func1(this As Ptr, IdOfFctModule_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub CloseEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditor_Func0(mThis.Ptr( 0 ).Ptr(60 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditorControl_Func1(mThis.Ptr( 0 ).Ptr(84 ))
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
		  Dim func As New Delete_Func0(mThis.Ptr( 0 ).Ptr(52 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Delete_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DetachSectionToFctModule()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DetachSectionToFctModule_Func0(mThis.Ptr( 0 ).Ptr(76 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DetachSectionToFctModule_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditor_Func0(mThis.Ptr( 0 ).Ptr(56 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditorControl_Func1(mThis.Ptr( 0 ).Ptr(80 ))
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
		  Dim func As New Export_Func2(mThis.Ptr( 0 ).Ptr(64 ))
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
		Protected Delegate Function GenLock_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetActivationCondition(ByRef pbsVarName_Param As String, ByRef pusLogic_Param As Integer, ByRef pusLockSate_Param As Integer)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetActivationCondition_Func3(mThis.Ptr( 0 ).Ptr(88 ))
		  Dim resultCode As Integer
		  Dim Local_pbsVarName_Param As Ptr = COM.SysAllocString( pbsVarName_Param )
		  resultCode = func.Invoke(mThis, Local_pbsVarName_Param, pusLogic_Param, pusLockSate_Param)
		  pbsVarName_Param = COM.BSTRToRBString(Local_pbsVarName_Param)
		  COM.SysFreeString(Local_pbsVarName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetActivationCondition", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetActivationCondition_Func3(this As Ptr, ByRef pbsVarName_Param As Ptr, ByRef pusLogic_Param As Integer, ByRef pusLockSate_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Id_Get_Func1(this As Ptr, ByRef pCurrentId_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{7AFD0FF5-CCE7-11D4-A254-0006290515BB}")
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Language_Get_Func1(this As Ptr, ByRef pLanguage_Param As epsrLanguage) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub MoveToTask(NewTask_Param As Variant, NewBrother_Param As Variant, lAfter_Param As Integer = 0)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New MoveToTask_Func3(mThis.Ptr( 0 ).Ptr(68 ))
		  Dim resultCode As Integer
		  Dim Local_NewTask_Param As MemoryBlock = COM.RBVariantToVARIANT(NewTask_Param)
		  Dim Local_NewBrother_Param As MemoryBlock = COM.RBVariantToVARIANT(NewBrother_Param)
		  resultCode = func.Invoke(mThis, Local_NewTask_Param, Local_NewBrother_Param, lAfter_Param)
		  COM.FreeVARIANT(Local_NewTask_Param)
		  COM.FreeVARIANT(Local_NewBrother_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on MoveToTask", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function MoveToTask_Func3(this As Ptr, NewTask_Param As Ptr, NewBrother_Param As Ptr, lAfter_Param As Integer) As Integer
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
		  If 0 = rhs.QueryInterface( UnityProServer.ISection.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Protection_Get_Func1(this As Ptr, ByRef pVal_Param As epsrSectionProtection) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Protection_Put_Func1(this As Ptr, rhs_Param As epsrSectionProtection) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetActivationCondition(bsVarName_Param As String, usLogic_Param As Integer)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetActivationCondition_Func2(mThis.Ptr( 0 ).Ptr(92 ))
		  Dim resultCode As Integer
		  Dim Local_bsVarName_Param As Ptr
		  Local_bsVarName_Param = COM.SysAllocString( bsVarName_Param )
		  resultCode = func.Invoke(mThis, Local_bsVarName_Param, usLogic_Param)
		  COM.SysFreeString(Local_bsVarName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetActivationCondition", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetActivationCondition_Func2(this As Ptr, bsVarName_Param As Ptr, usLogic_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SetSelectedRemoteIO(usReadIO_Param As UInt16, usWiteIO_Param As UInt16)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SetSelectedRemoteIO_Func2(mThis.Ptr( 0 ).Ptr(108 ))
		  Dim resultCode As Integer
		  resultCode = func.Invoke(mThis, usReadIO_Param, usWiteIO_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SetSelectedRemoteIO", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetSelectedRemoteIO_Func2(this As Ptr, usReadIO_Param As UInt16, usWiteIO_Param As UInt16) As Integer
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
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New GenLock_Put_Func1( mThis.Ptr( 0 ).Ptr( 104 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on GenLock", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		GenLock As String
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
			  Dim pLanguage_Param As epsrLanguage
			  Dim func As New Language_Get_Func1( mThis.Ptr( 0 ).Ptr( 48 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pLanguage_Param )
			  If 0 = resultCode Then
			    Return pLanguage_Param
			  Else
			    Raise New COM.COMException("Failed on Language", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Language As epsrLanguage
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
			  Dim pVal_Param As epsrSectionProtection
			  Dim func As New Protection_Get_Func1( mThis.Ptr( 0 ).Ptr( 100 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return pVal_Param
			  Else
			    Raise New COM.COMException("Failed on Protection", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New Protection_Put_Func1( mThis.Ptr( 0 ).Ptr( 96 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, value )
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on Protection", resultCode )
			  End If
			  
			End Set
		#tag EndSetter
		Protection As epsrSectionProtection
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Comment"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GenLock"
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
			Name="Language"
			Group="Behavior"
			Type="epsrLanguage"
			EditorType="Enum"
			#tag EnumValues
				"134 - psrILlanguage"
				"135 - psrSTlanguage"
				"136 - psrLDlanguage"
				"137 - psrFBDlanguage"
				"138 - psrSFClanguage"
				"330 - psrLL984language"
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
			Name="Protection"
			Group="Behavior"
			Type="epsrSectionProtection"
			EditorType="Enum"
			#tag EnumValues
				"1 - PSR_SECTION_PROTECTION_NONE"
				"2 - PSR_SECTION_PROTECTION_READ_ONLY"
				"3 - PSR_SECTION_PROTECTION_NO_READ_WRITE"
			#tag EndEnumValues
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
