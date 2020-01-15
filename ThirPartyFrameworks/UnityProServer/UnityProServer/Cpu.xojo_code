#tag Class
Protected Class Cpu
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub CloseEditor()
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New CloseEditor_Func0(mThis.Ptr( 0 ).Ptr(12 * COM.SIZEOF_PTR ))
		    Call func.Invoke(mThis)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseEditorControl(bstrHMIRWPasswrd_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New CloseEditorControl_Func1(mThis.Ptr( 0 ).Ptr(14 * COM.SIZEOF_PTR ))
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

	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{A48414B1-0194-11D5-A242-0006296240B1}" )
		    clsid = COM.IIDFromString( "{EEBCB410-0198-11D5-A242-0006296240B1}" )
		    
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
		    Dim func As New DisplayEditor_Func0(mThis.Ptr( 0 ).Ptr(11 * COM.SIZEOF_PTR ))
		    Call func.Invoke(mThis)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditorControl(bstrHMIRWPasswrd_Param As String)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New DisplayEditorControl_Func1(mThis.Ptr( 0 ).Ptr(13 * COM.SIZEOF_PTR ))
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

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Family_Get_Func1(this As Ptr, ByRef FamilyName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{A48414B1-0194-11D5-A242-0006296240B1}")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.ICpu.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function PartNumber_Get_Func1(this As Ptr, ByRef PartNumber_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TopoAddress_Get_Func1(this As Ptr, ByRef StringWithTopologicalAddress_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Version_Get_Func1(this As Ptr, ByRef Version_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim FamilyName_Param As Ptr
			    Dim func As New Family_Get_Func1( mThis.Ptr( 0 ).Ptr( 7 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, FamilyName_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( FamilyName_Param )
			    Else
			      Raise New COM.COMException("Failed on Family", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Family As String
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
			    Dim PartNumber_Param As Ptr
			    Dim func As New PartNumber_Get_Func1( mThis.Ptr( 0 ).Ptr( 8 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, PartNumber_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( PartNumber_Param )
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
			    Dim StringWithTopologicalAddress_Param As Ptr
			    Dim func As New TopoAddress_Get_Func1( mThis.Ptr( 0 ).Ptr( 10 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, StringWithTopologicalAddress_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( StringWithTopologicalAddress_Param )
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
			    Dim Version_Param As Ptr
			    Dim func As New Version_Get_Func1( mThis.Ptr( 0 ).Ptr( 9 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, Version_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( Version_Param )
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
			Name="Family"
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
		#tag ViewProperty
			Name="Version"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopoAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
