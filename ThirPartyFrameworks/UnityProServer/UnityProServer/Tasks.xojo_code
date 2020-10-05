#tag Class
Protected Class Tasks
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Function Add(TaskType_Param As epsrTaskType) As UnityProServer.ITask
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Add_Func2(mThis.Ptr( 0 ).Ptr(7 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Return_ppNewTask_Param As Ptr
		    resultCode = func.Invoke(mThis, TaskType_Param, Return_ppNewTask_Param)
		    If resultCode = 0 Then
		      If Nil = Return_ppNewTask_Param  Then Return Nil
		      Return New UnityProServer.ITask(Return_ppNewTask_Param)
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Add", resultCode)
		    End If
		    
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Add_Func2(this As Ptr, TaskType_Param As epsrTaskType, ByRef ppNewTask_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{7AFD0FF2-CCE7-11D4-A254-0006290515BB}" )
		    clsid = COM.IIDFromString( "{8A5D3720-1231-11D5-A248-0006296240B1}" )
		    
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
		Sub Destructor()
		  #if TargetWin32
		    If ObjectMap <> Nil And ObjectMap.HasKey(Handle) Then ObjectMap.Remove(Handle)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{7AFD0FF2-CCE7-11D4-A254-0006290515BB}")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Import(FileNameToImport_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Import_Func1(mThis.Ptr( 0 ).Ptr(11 * COM.SIZEOF_PTR ))
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
		    Dim func As New ImportWithStrategy_Func2(mThis.Ptr( 0 ).Ptr(13 * COM.SIZEOF_PTR ))
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
		Function Item(EnumTaskName_Param As Variant, Id_Param As Integer) As UnityProServer.ITask
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Item_Func3(mThis.Ptr( 0 ).Ptr(9 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_EnumTaskName_Param As MemoryBlock = COM.RBVariantToVARIANT(EnumTaskName_Param)
		    Dim Return_ppNewTask_Param As Ptr
		    resultCode = func.Invoke(mThis, Local_EnumTaskName_Param, Id_Param, Return_ppNewTask_Param)
		    COM.FreeVARIANT(Local_EnumTaskName_Param)
		    If resultCode = 0 Then
		      If Nil = Return_ppNewTask_Param  Then Return Nil
		      Return New UnityProServer.ITask(Return_ppNewTask_Param)
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Item", resultCode)
		    End If
		    
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Item_Func3(this As Ptr, EnumTaskName_Param As Ptr, Id_Param As Integer, ByRef ppNewTask_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function ListModifiedById(SignatureBegin_Param As Variant, SignatureEnd_Param As Variant) As Variant
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New ListModifiedById_Func3(mThis.Ptr( 0 ).Ptr(10 * COM.SIZEOF_PTR ))
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
		    
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function ListModifiedById_Func3(this As Ptr, SignatureBegin_Param As Ptr, SignatureEnd_Param As Ptr, pListModifiedIds_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.ITasks.IID, p ) Then
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
			    Dim pVal_Param As Integer
			    Dim func As New Count_Get_Func1( mThis.Ptr( 0 ).Ptr( 8 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			    If 0 = resultCode Then
			      Return pVal_Param
			    Else
			      Raise New COM.COMException("Failed on Count", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Count As Integer
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim ppEnum_Param As Ptr
			    Dim func As New _NewEnum_Get_Func1( mThis.Ptr( 0 ).Ptr( 12 * COM.SIZEOF_PTR ) )
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
