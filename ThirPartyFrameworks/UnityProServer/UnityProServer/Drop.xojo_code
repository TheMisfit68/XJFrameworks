#tag Class
Protected Class Drop
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

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CloseEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{06F5F958-C8DC-4278-9BDD-FA96A874BE11}" )
		    clsid = COM.IIDFromString( "{67F14FF0-32D7-4CFB-96F9-40B35350017B}" )
		    
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
		Sub Destructor()
		  #if TargetWin32
		    If ObjectMap <> Nil And ObjectMap.HasKey(Handle) Then ObjectMap.Remove(Handle)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditor()
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New DisplayEditor_Func0(mThis.Ptr( 0 ).Ptr(15 * COM.SIZEOF_PTR ))
		    Call func.Invoke(mThis)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Export(bstrFileName_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Export_Func1(mThis.Ptr( 0 ).Ptr(17 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_bstrFileName_Param As Ptr
		    Local_bstrFileName_Param = COM.SysAllocString( bstrFileName_Param )
		    resultCode = func.Invoke(mThis, Local_bstrFileName_Param)
		    COM.SysFreeString(Local_bstrFileName_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Export", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Export_Func1(this As Ptr, bstrFileName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Id_Get_Func1(this As Ptr, ByRef pCurrentId_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{06F5F958-C8DC-4278-9BDD-FA96A874BE11}")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsExtended() As Integer
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New IsExtended_Func1(mThis.Ptr( 0 ).Ptr(14 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Return_plIsExtended_Param As Integer
		    resultCode = func.Invoke(mThis, Return_plIsExtended_Param)
		    If resultCode = 0 Then
		      Return Return_plIsExtended_Param
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on IsExtended", resultCode)
		    End If
		    
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsExtended_Func1(this As Ptr, ByRef plIsExtended_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function IsMain() As Integer
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New IsMain_Func1(mThis.Ptr( 0 ).Ptr(13 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Return_plIsMain_Param As Integer
		    resultCode = func.Invoke(mThis, Return_plIsMain_Param)
		    If resultCode = 0 Then
		      Return Return_plIsMain_Param
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on IsMain", resultCode)
		    End If
		    
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsMain_Func1(this As Ptr, ByRef plIsMain_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Get_Func1(this As Ptr, ByRef pCurrentName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.IDrop.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function PartNumber_Get_Func1(this As Ptr, ByRef pBstrPartNumber_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Racks_Get_Func1(this As Ptr, ByRef ppRacks_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TopoAddress_Get_Func1(this As Ptr, ByRef pBstrTopoAddress_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TopoNumber_Get_Func1(this As Ptr, ByRef pTopoNumber_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Version_Get_Func1(this As Ptr, ByRef pBstrVersion_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pCurrentId_Param As Integer
			    Dim func As New Id_Get_Func1( mThis.Ptr( 0 ).Ptr( 9 * COM.SIZEOF_PTR ) )
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

	#tag Property, Flags = &h1
		Protected Shared ObjectMap As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pBstrPartNumber_Param As Ptr
			    Dim func As New PartNumber_Get_Func1( mThis.Ptr( 0 ).Ptr( 12 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pBstrPartNumber_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( pBstrPartNumber_Param )
			    Else
			      Raise New COM.COMException("Failed on PartNumber", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		PartNumber As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim ppRacks_Param As Ptr
			    Dim func As New Racks_Get_Func1( mThis.Ptr( 0 ).Ptr( 18 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, ppRacks_Param )
			    If 0 = resultCode Then
			      If Nil <> ppRacks_Param Then
			        Return New UnityProServer.IRacks( ppRacks_Param )
			      End If
			    Else
			      Raise New COM.COMException("Failed on Racks", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Racks As UnityProServer.IRacks
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pBstrTopoAddress_Param As Ptr
			    Dim func As New TopoAddress_Get_Func1( mThis.Ptr( 0 ).Ptr( 10 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pBstrTopoAddress_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( pBstrTopoAddress_Param )
			    Else
			      Raise New COM.COMException("Failed on TopoAddress", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		TopoAddress As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pTopoNumber_Param As Integer
			    Dim func As New TopoNumber_Get_Func1( mThis.Ptr( 0 ).Ptr( 8 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pTopoNumber_Param )
			    If 0 = resultCode Then
			      Return pTopoNumber_Param
			    Else
			      Raise New COM.COMException("Failed on TopoNumber", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		TopoNumber As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pBstrVersion_Param As Ptr
			    Dim func As New Version_Get_Func1( mThis.Ptr( 0 ).Ptr( 11 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pBstrVersion_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( pBstrVersion_Param )
			    Else
			      Raise New COM.COMException("Failed on Version", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Version As String
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
			Name="TopoNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Id"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopoAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PartNumber"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
