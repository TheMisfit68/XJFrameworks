#tag Class
Protected Class ITimerEvent
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub CloseEditor()
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New CloseEditor_Func0(mThis.Ptr( 0 ).Ptr(16 * COM.SIZEOF_PTR ))
		    Call func.Invoke(mThis)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseEditorControl(bstrHMIRWPasswrd_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New CloseEditorControl_Func1(mThis.Ptr( 0 ).Ptr(19 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrHMIRWPasswrd_Param As Ptr
		    Local_bstrHMIRWPasswrd_Param = COM.SysAllocString( bstrHMIRWPasswrd_Param )
		    resultCode = func.Invoke(mThis, Local_bstrHMIRWPasswrd_Param)
		    COM.SysFreeString(Local_bstrHMIRWPasswrd_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on CloseEditorControl", resultCode)
		    End If
		    
		  #endif
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
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Delete_Func0(mThis.Ptr( 0 ).Ptr(14 * COM.SIZEOF_PTR ))
		    Call func.Invoke(mThis)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Delete_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DisplayEditor()
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New DisplayEditor_Func0(mThis.Ptr( 0 ).Ptr(15 * COM.SIZEOF_PTR ))
		    Call func.Invoke(mThis)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditorControl(bstrHMIRWPasswrd_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New DisplayEditorControl_Func1(mThis.Ptr( 0 ).Ptr(18 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrHMIRWPasswrd_Param As Ptr
		    Local_bstrHMIRWPasswrd_Param = COM.SysAllocString( bstrHMIRWPasswrd_Param )
		    resultCode = func.Invoke(mThis, Local_bstrHMIRWPasswrd_Param)
		    COM.SysFreeString(Local_bstrHMIRWPasswrd_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on DisplayEditorControl", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayEditorControl_Func1(this As Ptr, bstrHMIRWPasswrd_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Export(FileNameToExport_Param As String, ExportOption_Param As Integer)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Export_Func2(mThis.Ptr( 0 ).Ptr(17 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_FileNameToExport_Param As Ptr
		    Local_FileNameToExport_Param = COM.SysAllocString( FileNameToExport_Param )
		    resultCode = func.Invoke(mThis, Local_FileNameToExport_Param, ExportOption_Param)
		    COM.SysFreeString(Local_FileNameToExport_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Export", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Export_Func2(this As Ptr, FileNameToExport_Param As Ptr, ExportOption_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetControlParameters(Timebase_Param As Variant, PresetUnit_Param As Variant, PhaseUnit_Param As Variant)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New GetControlParameters_Func3(mThis.Ptr( 0 ).Ptr(12 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_Timebase_Param As New MemoryBlock(16)
		    Dim Local_PresetUnit_Param As New MemoryBlock(16)
		    Dim Local_PhaseUnit_Param As New MemoryBlock(16)
		    resultCode = func.Invoke(mThis, Local_Timebase_Param, Local_PresetUnit_Param, Local_PhaseUnit_Param)
		    Timebase_Param = COM.VARIANTToRBVariant(Local_Timebase_Param)
		    PresetUnit_Param = COM.VARIANTToRBVariant(Local_PresetUnit_Param)
		    PhaseUnit_Param = COM.VARIANTToRBVariant(Local_PhaseUnit_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on GetControlParameters", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetControlParameters_Func3(this As Ptr, Timebase_Param As Ptr, PresetUnit_Param As Ptr, PhaseUnit_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Id_Get_Func1(this As Ptr, ByRef pCurrentId_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{7AFD0FF1-CCE7-11D4-A254-0006290515BB}")
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Language_Get_Func1(this As Ptr, ByRef pLanguage_Param As epsrLanguage) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Get_Func1(this As Ptr, ByRef pCurrentName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.ITimerEvent.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetControlParameters(Timebase_Param As Integer, PresetUnit_Param As Integer, PhaseUnit_Param As Integer)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New SetControlParameters_Func3(mThis.Ptr( 0 ).Ptr(13 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    resultCode = func.Invoke(mThis, Timebase_Param, PresetUnit_Param, PhaseUnit_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on SetControlParameters", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SetControlParameters_Func3(this As Ptr, Timebase_Param As Integer, PresetUnit_Param As Integer, PhaseUnit_Param As Integer) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pCurrentComment_Param As Ptr
			    Dim func As New Comment_Get_Func1( mThis.Ptr( 0 ).Ptr( 8 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pCurrentComment_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( pCurrentComment_Param )
			    Else
			      Raise New COM.COMException("Failed on Comment", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim func As New Comment_Put_Func1( mThis.Ptr( 0 ).Ptr( 9 * COM.SIZEOF_PTR ) )
			    Dim Local_rhs_Param As Ptr
			    Local_rhs_Param = COM.SysAllocString( value )
			    Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			    If 0 = resultCode Then
			    Else
			      Raise New COM.COMException("Failed on Comment", resultCode )
			    End If
			    COM.SysFreeString( Local_rhs_Param )
			  #endif
			  
			End Set
		#tag EndSetter
		Comment As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pCurrentId_Param As Integer
			    Dim func As New Id_Get_Func1( mThis.Ptr( 0 ).Ptr( 10 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pCurrentId_Param )
			    If 0 = resultCode Then
			      Return pCurrentId_Param
			    Else
			      Raise New COM.COMException("Failed on Id", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Id As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pLanguage_Param As epsrLanguage
			    Dim func As New Language_Get_Func1( mThis.Ptr( 0 ).Ptr( 11 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pLanguage_Param )
			    If 0 = resultCode Then
			      Return pLanguage_Param
			    Else
			      Raise New COM.COMException("Failed on Language", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Language As epsrLanguage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pCurrentName_Param As Ptr
			    Dim func As New Name_Get_Func1( mThis.Ptr( 0 ).Ptr( 7 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pCurrentName_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( pCurrentName_Param )
			    Else
			      Raise New COM.COMException("Failed on Name", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty


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
			Name="Language"
			Group="Behavior"
			Type="epsrLanguage"
			EditorType="Enum"
			#tag EnumValues
				"14355429970673798 - psrILlanguage"
				"29555198972133512 - psrSTlanguage"
				"29555198972133512 - psrLDlanguage"
				"29555198972133512 - psrFBDlanguage"
				"29555198972133512 - psrSFClanguage"
				"29555198972133704 - psrLL984language"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
