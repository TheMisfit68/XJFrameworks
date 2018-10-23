#tag Class
Protected Class IIODdts
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
		  Return COM.IIDFromString("{011567B1-CC4C-11D5-A32D-000629A2F326}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(IODdtName_Param As String, Id_Param As Integer = 0) As UnityProServer.IIODdt
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Item_Func3(mThis.Ptr( 0 ).Ptr(32 ))
		  Dim resultCode As Integer
		  Dim Local_IODdtName_Param As Ptr
		  Local_IODdtName_Param = COM.SysAllocString( IODdtName_Param )
		  Dim Return_ppReturnedIODdt_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_IODdtName_Param, Id_Param, Return_ppReturnedIODdt_Param)
		  COM.SysFreeString(Local_IODdtName_Param)
		  If resultCode = 0 Then
		    If Nil = Return_ppReturnedIODdt_Param  Then Return Nil
		    Return New UnityProServer.IIODdt(Return_ppReturnedIODdt_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Item", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Item_Func3(this As Ptr, IODdtName_Param As Ptr, Id_Param As Integer, ByRef ppReturnedIODdt_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function ListModifiedById(SignatureBegin_Param As Variant, SignatureEnd_Param As Variant) As Variant
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ListModifiedById_Func3(mThis.Ptr( 0 ).Ptr(36 ))
		  Dim resultCode As Integer
		  Dim Local_SignatureBegin_Param As MemoryBlock = COM.RBVariantToVARIANT(SignatureBegin_Param)
		  Dim Local_SignatureEnd_Param As MemoryBlock = COM.RBVariantToVARIANT(SignatureEnd_Param)
		  Dim Return_pListModifiedIds_Param As Ptr
		  Dim pListModifiedIds_Param_MB As New MemoryBlock(16)
		  Return_pListModifiedIds_Param = pListModifiedIds_Param_MB
		  resultCode = func.Invoke(mThis, Local_SignatureBegin_Param, Local_SignatureEnd_Param, Return_pListModifiedIds_Param)
		  COM.FreeVARIANT(Local_SignatureBegin_Param)
		  COM.FreeVARIANT(Local_SignatureEnd_Param)
		  If resultCode = 0 Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(Return_pListModifiedIds_Param)
		    COM.FreeVARIANT(Return_pListModifiedIds_Param)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ListModifiedById", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ListModifiedById_Func3(this As Ptr, SignatureBegin_Param As Ptr, SignatureEnd_Param As Ptr, pListModifiedIds_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IIODdts.IID, p ) Then
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
			  Dim pNumber_Param As Integer
			  Dim func As New Count_Get_Func1( mThis.Ptr( 0 ).Ptr( 28 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pNumber_Param )
			  If 0 = resultCode Then
			    Return pNumber_Param
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
			  Dim func As New _NewEnum_Get_Func1( mThis.Ptr( 0 ).Ptr( 40 ) )
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
