#tag Class
Protected Class IPous
Inherits COM.IDispatch
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Count_Get_Func1(this As Ptr, ByRef pNumber_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{B1001FA3-146E-4F74-9D36-726550C3AC62}")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Import(FileNameToImport_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Import_Func1(mThis.Ptr( 0 ).Ptr(9 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_FileNameToImport_Param As Ptr
		    Local_FileNameToImport_Param = COM.SysAllocString( FileNameToImport_Param )
		    resultCode = func.Invoke(mThis, Local_FileNameToImport_Param)
		    COM.SysFreeString(Local_FileNameToImport_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Import", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImportWithStrategy(FileNameToImport_Param As String, psrImportStrategy_Param As epsrImportOption)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New ImportWithStrategy_Func2(mThis.Ptr( 0 ).Ptr(11 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_FileNameToImport_Param As Ptr
		    Local_FileNameToImport_Param = COM.SysAllocString( FileNameToImport_Param )
		    resultCode = func.Invoke(mThis, Local_FileNameToImport_Param, psrImportStrategy_Param)
		    COM.SysFreeString(Local_FileNameToImport_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on ImportWithStrategy", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ImportWithStrategy_Func2(this As Ptr, FileNameToImport_Param As Ptr, psrImportStrategy_Param As epsrImportOption) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Import_Func1(this As Ptr, FileNameToImport_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Item(PouName_Param As String, Id_Param As Integer) As UnityProServer.IPou
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Item_Func3(mThis.Ptr( 0 ).Ptr(8 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_PouName_Param As Ptr
		    Local_PouName_Param = COM.SysAllocString( PouName_Param )
		    Dim Return_ppReturnedPou_Param As Ptr
		    resultCode = func.Invoke(mThis, Local_PouName_Param, Id_Param, Return_ppReturnedPou_Param)
		    COM.SysFreeString(Local_PouName_Param)
		    If resultCode = 0 Then
		      If Nil = Return_ppReturnedPou_Param  Then Return Nil
		      Return New UnityProServer.IPou(Return_ppReturnedPou_Param)
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Item", resultCode)
		    End If
		    
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Item_Func3(this As Ptr, PouName_Param As Ptr, Id_Param As Integer, ByRef ppReturnedPou_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.IPous.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function _NewEnum_Get_Func1(this As Ptr, ByRef ppEnum_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pNumber_Param As Integer
			    Dim func As New Count_Get_Func1( mThis.Ptr( 0 ).Ptr( 7 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pNumber_Param )
			    If 0 = resultCode Then
			      Return pNumber_Param
			    Else
			      Raise New COM.COMException("Failed on Count", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim ppEnum_Param As Ptr
			    Dim func As New _NewEnum_Get_Func1( mThis.Ptr( 0 ).Ptr( 10 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, ppEnum_Param )
			    If 0 = resultCode Then
			      If Nil <> ppEnum_Param Then
			        Return New COM.IUnknown( ppEnum_Param )
			      End If
			    Else
			      Raise New COM.COMException("Failed on _NewEnum", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		_NewEnum As COM.IUnknown
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
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
