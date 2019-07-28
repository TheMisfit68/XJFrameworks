#tag Class
Protected Class Modules
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Function AddChild(lTopoNumber_Param As Integer, lExtendedNumber_Param As Integer, bsPartNumber_Param As String, bsVersion_Param As String) As UnityProServer.IModule
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New AddChild_Func5(mThis.Ptr( 0 ).Ptr(48 ))
		  Dim resultCode As Integer
		  Dim Local_bsPartNumber_Param As Ptr
		  Local_bsPartNumber_Param = COM.SysAllocString( bsPartNumber_Param )
		  Dim Local_bsVersion_Param As Ptr
		  Local_bsVersion_Param = COM.SysAllocString( bsVersion_Param )
		  Dim Return_ppNewModule_Param As Ptr
		  resultCode = func.Invoke(mThis, lTopoNumber_Param, lExtendedNumber_Param, Local_bsPartNumber_Param, Local_bsVersion_Param, Return_ppNewModule_Param)
		  COM.SysFreeString(Local_bsPartNumber_Param)
		  COM.SysFreeString(Local_bsVersion_Param)
		  If resultCode = 0 Then
		    If Nil = Return_ppNewModule_Param  Then Return Nil
		    Return New UnityProServer.IModule(Return_ppNewModule_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on AddChild", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function AddChild_Func5(this As Ptr, lTopoNumber_Param As Integer, lExtendedNumber_Param As Integer, bsPartNumber_Param As Ptr, bsVersion_Param As Ptr, ByRef ppNewModule_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{648B3134-82F0-4DD9-A522-3FB8AF1DC017}" )
		    clsid = COM.IIDFromString( "{A65729A4-04F5-4E45-9CBF-279B8D98F0A7}" )
		    
		    Dim p As Ptr
		    If COM.CoCreateInstance( clsid, nil, COM.CLSCTX_INPROC_SERVER or COM.CLSCTX_LOCAL_SERVER, riid, p ) = 0 then
		      If ObjectMap = Nil Then ObjectMap = New Dictionary
		      Super.Constructor( p )
		      If Not connectEvents Then Return
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Count_Get_Func1(this As Ptr, ByRef pVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub DeleteChild(lTopoNumber_Param As Integer, lExtendedNumber_Param As Integer)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DeleteChild_Func2(mThis.Ptr( 0 ).Ptr(52 ))
		  Dim resultCode As Integer
		  resultCode = func.Invoke(mThis, lTopoNumber_Param, lExtendedNumber_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on DeleteChild", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DeleteChild_Func2(this As Ptr, lTopoNumber_Param As Integer, lExtendedNumber_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Destructor()
		  If ObjectMap <> Nil And ObjectMap.HasKey(Handle) Then ObjectMap.Remove(Handle)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Enum__Get_Func1(this As Ptr, ByRef ppEnum_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{648B3134-82F0-4DD9-A522-3FB8AF1DC017}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ImportChild(bsFileName_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ImportChild_Func1(mThis.Ptr( 0 ).Ptr(36 ))
		  Dim resultCode As Integer
		  Dim Local_bsFileName_Param As Ptr
		  Local_bsFileName_Param = COM.SysAllocString( bsFileName_Param )
		  resultCode = func.Invoke(mThis, Local_bsFileName_Param)
		  COM.SysFreeString(Local_bsFileName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ImportChild", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ImportChild_Func1(this As Ptr, bsFileName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Item(lTopoNumber_Param As Integer, lExtendedNumber_Param As Integer, Id_Param As Integer, IndexNameKey_Param As Variant) As UnityProServer.IModule
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Item_Func5(mThis.Ptr( 0 ).Ptr(32 ))
		  Dim resultCode As Integer
		  Dim Local_IndexNameKey_Param As MemoryBlock = COM.RBVariantToVARIANT(IndexNameKey_Param)
		  Dim Return_ppNewModule_Param As Ptr
		  resultCode = func.Invoke(mThis, lTopoNumber_Param, lExtendedNumber_Param, Id_Param, Local_IndexNameKey_Param, Return_ppNewModule_Param)
		  COM.FreeVARIANT(Local_IndexNameKey_Param)
		  If resultCode = 0 Then
		    If Nil = Return_ppNewModule_Param  Then Return Nil
		    Return New UnityProServer.IModule(Return_ppNewModule_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Item", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Item_Func5(this As Ptr, lTopoNumber_Param As Integer, lExtendedNumber_Param As Integer, Id_Param As Integer, IndexNameKey_Param As Ptr, ByRef ppNewModule_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function ListModifiedById(SignatureBegin_Param As Variant, SignatureEnd_Param As Variant) As Variant
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ListModifiedById_Get_Func3(mThis.Ptr( 0 ).Ptr(40 ))
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
		Protected Delegate Function ListModifiedById_Get_Func3(this As Ptr, SignatureBegin_Param As Ptr, SignatureEnd_Param As Ptr, pListModifiedIds_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function LocalChild_Get_Func1(this As Ptr, ByRef ppNewModule_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub MoveChild(lDestTopoNumber_Param As Integer, lDestExtendedNumber_Param As Integer, lFromBUSTopoNumber_Param As Integer, lFromBUSIsAuxRack_Param As Integer, lFromDROPTopoNumber_Param As Integer, lFromDROPIsAuxRack_Param As Integer, lFromRACKTopoNumber_Param As Integer, lFromRACKIsAuxRack_Param As Integer, lFromMODULETopoNumber_Param As Integer, lFromMODULEIsAuxRack_Param As Integer, lFromCHANNELTopoNumber_Param As Integer, lFromCHANNELIsAuxRack_Param As Integer)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New MoveChild_Func12(mThis.Ptr( 0 ).Ptr(56 ))
		  Dim resultCode As Integer
		  resultCode = func.Invoke(mThis, lDestTopoNumber_Param, lDestExtendedNumber_Param, lFromBUSTopoNumber_Param, lFromBUSIsAuxRack_Param, lFromDROPTopoNumber_Param, lFromDROPIsAuxRack_Param, lFromRACKTopoNumber_Param, lFromRACKIsAuxRack_Param, lFromMODULETopoNumber_Param, lFromMODULEIsAuxRack_Param, lFromCHANNELTopoNumber_Param, lFromCHANNELIsAuxRack_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on MoveChild", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function MoveChild_Func12(this As Ptr, lDestTopoNumber_Param As Integer, lDestExtendedNumber_Param As Integer, lFromBUSTopoNumber_Param As Integer, lFromBUSIsAuxRack_Param As Integer, lFromDROPTopoNumber_Param As Integer, lFromDROPIsAuxRack_Param As Integer, lFromRACKTopoNumber_Param As Integer, lFromRACKIsAuxRack_Param As Integer, lFromMODULETopoNumber_Param As Integer, lFromMODULEIsAuxRack_Param As Integer, lFromCHANNELTopoNumber_Param As Integer, lFromCHANNELIsAuxRack_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IModules.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceChild(lTopoNumber_Param As Integer, lExtendedNumber_Param As Integer, bsActualPartNumber_Param As String, bsActualVersion_Param As String, bsNewPartNumber_Param As String, bsNewVersion_Param As String) As UnityProServer.IModule
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New ReplaceChild_Func7(mThis.Ptr( 0 ).Ptr(60 ))
		  Dim resultCode As Integer
		  Dim Local_bsActualPartNumber_Param As Ptr
		  Local_bsActualPartNumber_Param = COM.SysAllocString( bsActualPartNumber_Param )
		  Dim Local_bsActualVersion_Param As Ptr
		  Local_bsActualVersion_Param = COM.SysAllocString( bsActualVersion_Param )
		  Dim Local_bsNewPartNumber_Param As Ptr
		  Local_bsNewPartNumber_Param = COM.SysAllocString( bsNewPartNumber_Param )
		  Dim Local_bsNewVersion_Param As Ptr
		  Local_bsNewVersion_Param = COM.SysAllocString( bsNewVersion_Param )
		  Dim Return_ppNewModule_Param As Ptr
		  resultCode = func.Invoke(mThis, lTopoNumber_Param, lExtendedNumber_Param, Local_bsActualPartNumber_Param, Local_bsActualVersion_Param, Local_bsNewPartNumber_Param, Local_bsNewVersion_Param, Return_ppNewModule_Param)
		  COM.SysFreeString(Local_bsActualPartNumber_Param)
		  COM.SysFreeString(Local_bsActualVersion_Param)
		  COM.SysFreeString(Local_bsNewPartNumber_Param)
		  COM.SysFreeString(Local_bsNewVersion_Param)
		  If resultCode = 0 Then
		    If Nil = Return_ppNewModule_Param  Then Return Nil
		    Return New UnityProServer.IModule(Return_ppNewModule_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ReplaceChild", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ReplaceChild_Func7(this As Ptr, lTopoNumber_Param As Integer, lExtendedNumber_Param As Integer, bsActualPartNumber_Param As Ptr, bsActualVersion_Param As Ptr, bsNewPartNumber_Param As Ptr, bsNewVersion_Param As Ptr, ByRef ppNewModule_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Integer
			  Dim func As New Count_Get_Func1( mThis.Ptr( 0 ).Ptr( 28 ) )
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
			  Dim func As New Enum__Get_Func1( mThis.Ptr( 0 ).Ptr( 64 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppEnum_Param )
			  If 0 = resultCode Then
			    If Nil <> ppEnum_Param Then
			      Return New COM.IUnknown( ppEnum_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Enum_", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Enum_ As COM.IUnknown
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppNewModule_Param As Ptr
			  Dim func As New LocalChild_Get_Func1( mThis.Ptr( 0 ).Ptr( 44 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppNewModule_Param )
			  If 0 = resultCode Then
			    If Nil <> ppNewModule_Param Then
			      Return New UnityProServer.IModule( ppNewModule_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on LocalChild", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		LocalChild As UnityProServer.IModule
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

	#tag Property, Flags = &h1
		Protected Shared ObjectMap As Dictionary
	#tag EndProperty


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
