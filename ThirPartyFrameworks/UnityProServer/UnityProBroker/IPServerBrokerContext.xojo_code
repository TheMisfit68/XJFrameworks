#tag Class
Protected Class IPServerBrokerContext
Inherits COM.IDispatch
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub get_Profile(ByRef pBSTRUserName_Param As String, ByRef pBSTRUserPassword_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New get_Profile_Func2(mThis.Ptr( 0 ).Ptr(48 ))
		  Dim resultCode As Integer
		  Dim Local_pBSTRUserName_Param As Ptr = COM.SysAllocString( pBSTRUserName_Param )
		  Dim Local_pBSTRUserPassword_Param As Ptr = COM.SysAllocString( pBSTRUserPassword_Param )
		  resultCode = func.Invoke(mThis, Local_pBSTRUserName_Param, Local_pBSTRUserPassword_Param)
		  pBSTRUserName_Param = COM.BSTRToRBString(Local_pBSTRUserName_Param)
		  pBSTRUserPassword_Param = COM.BSTRToRBString(Local_pBSTRUserPassword_Param)
		  COM.SysFreeString(Local_pBSTRUserName_Param)
		  COM.SysFreeString(Local_pBSTRUserPassword_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on get_Profile", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function get_Profile_Func2(this As Ptr, ByRef pBSTRUserName_Param As Ptr, ByRef pBSTRUserPassword_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{6C3F6815-0071-443F-A4D4-1133688ACC64}")
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function LaunchContext_Get_Func1(this As Ptr, ByRef pBuf_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function LaunchContext_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProBroker.IPServerBrokerContext.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub put_Profile(BSTRUserName_Param As String, BSTRUserPassword_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New put_Profile_Func2(mThis.Ptr( 0 ).Ptr(44 ))
		  Dim resultCode As Integer
		  Dim Local_BSTRUserName_Param As Ptr
		  Local_BSTRUserName_Param = COM.SysAllocString( BSTRUserName_Param )
		  Dim Local_BSTRUserPassword_Param As Ptr
		  Local_BSTRUserPassword_Param = COM.SysAllocString( BSTRUserPassword_Param )
		  resultCode = func.Invoke(mThis, Local_BSTRUserName_Param, Local_BSTRUserPassword_Param)
		  COM.SysFreeString(Local_BSTRUserName_Param)
		  COM.SysFreeString(Local_BSTRUserPassword_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on put_Profile", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function put_Profile_Func2(this As Ptr, BSTRUserName_Param As Ptr, BSTRUserPassword_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SafetyProjectPassword_Get_Func1(this As Ptr, ByRef pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SafetyProjectPassword_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function UserName_Get_Func1(this As Ptr, ByRef pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function UserName_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function UserPassword_Get_Func1(this As Ptr, ByRef pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function UserPassword_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function XpdfContext_Get_Func1(this As Ptr, ByRef pXpdfBuf_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function XpdfContext_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pBuf_Param As Ptr
			  Dim func As New LaunchContext_Get_Func1( mThis.Ptr( 0 ).Ptr( 60 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pBuf_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pBuf_Param )
			  Else
			    Raise New COM.COMException("Failed on LaunchContext", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New LaunchContext_Put_Func1( mThis.Ptr( 0 ).Ptr( 64 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on LaunchContext", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		LaunchContext As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Ptr
			  Dim func As New SafetyProjectPassword_Get_Func1( mThis.Ptr( 0 ).Ptr( 52 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pVal_Param )
			  Else
			    Raise New COM.COMException("Failed on SafetyProjectPassword", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New SafetyProjectPassword_Put_Func1( mThis.Ptr( 0 ).Ptr( 56 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on SafetyProjectPassword", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		SafetyProjectPassword As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Ptr
			  Dim func As New UserName_Get_Func1( mThis.Ptr( 0 ).Ptr( 28 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pVal_Param )
			  Else
			    Raise New COM.COMException("Failed on UserName", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New UserName_Put_Func1( mThis.Ptr( 0 ).Ptr( 32 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on UserName", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		UserName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Ptr
			  Dim func As New UserPassword_Get_Func1( mThis.Ptr( 0 ).Ptr( 36 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pVal_Param )
			  Else
			    Raise New COM.COMException("Failed on UserPassword", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New UserPassword_Put_Func1( mThis.Ptr( 0 ).Ptr( 40 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on UserPassword", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		UserPassword As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pXpdfBuf_Param As Ptr
			  Dim func As New XpdfContext_Get_Func1( mThis.Ptr( 0 ).Ptr( 68 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pXpdfBuf_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pXpdfBuf_Param )
			  Else
			    Raise New COM.COMException("Failed on XpdfContext", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mThis = Nil Then Raise New NilObjectException
			  Dim func As New XpdfContext_Put_Func1( mThis.Ptr( 0 ).Ptr( 72 ) )
			  Dim Local_rhs_Param As Ptr
			  Local_rhs_Param = COM.SysAllocString( value )
			  Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			  If 0 = resultCode Then
			  Else
			    Raise New COM.COMException("Failed on XpdfContext", resultCode )
			  End If
			  COM.SysFreeString( Local_rhs_Param )
			  
			End Set
		#tag EndSetter
		XpdfContext As String
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
			Name="LaunchContext"
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
			Name="SafetyProjectPassword"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="UserName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserPassword"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="XpdfContext"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
