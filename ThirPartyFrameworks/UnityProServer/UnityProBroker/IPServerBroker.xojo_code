#tag Class
Protected Class IPServerBroker
Inherits COM.IDispatch
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{359686EA-EF6E-11D3-A1CC-000629A2F326}")
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InterfaceVersion_Get_Func1(this As Ptr, ByRef pVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function NewApplication() As UnityProServer.IApplication
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New NewApplication_Func1(mThis.Ptr( 0 ).Ptr(32 ))
		  Dim resultCode As Integer
		  Dim Return___MIDL__IPServerBroker0001_Param As Ptr
		  resultCode = func.Invoke(mThis, Return___MIDL__IPServerBroker0001_Param)
		  If resultCode = 0 Then
		    If Nil = Return___MIDL__IPServerBroker0001_Param  Then Return Nil
		    Return New UnityProServer.IApplication(Return___MIDL__IPServerBroker0001_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on NewApplication", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewApplicationWithProfile(BSTRUserName_Param As String, bstrPassword_Param As String) As UnityProServer.IApplication
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New NewApplicationWithProfile_Func3(mThis.Ptr( 0 ).Ptr(40 ))
		  Dim resultCode As Integer
		  Dim Local_BSTRUserName_Param As Ptr
		  Local_BSTRUserName_Param = COM.SysAllocString( BSTRUserName_Param )
		  Dim Local_bstrPassword_Param As Ptr
		  Local_bstrPassword_Param = COM.SysAllocString( bstrPassword_Param )
		  Dim Return_ppApp_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_BSTRUserName_Param, Local_bstrPassword_Param, Return_ppApp_Param)
		  COM.SysFreeString(Local_BSTRUserName_Param)
		  COM.SysFreeString(Local_bstrPassword_Param)
		  If resultCode = 0 Then
		    If Nil = Return_ppApp_Param  Then Return Nil
		    Return New UnityProServer.IApplication(Return_ppApp_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on NewApplicationWithProfile", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function NewApplicationWithProfile_Func3(this As Ptr, BSTRUserName_Param As Ptr, bstrPassword_Param As Ptr, ByRef ppApp_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub NewApplicationWithPServerBrokerContext(pIPServerBrokerContext_Param As UnityProBroker.IPServerBrokerContext, ByRef ppApp_Param As UnityProServer.IApplication)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New NewApplicationWithPServerBrokerContext_Func2(mThis.Ptr( 0 ).Ptr(56 ))
		  Dim resultCode As Integer
		  Dim Local_pIPServerBrokerContext_Param As Ptr
		  Local_pIPServerBrokerContext_Param = pIPServerBrokerContext_Param.Handle
		  Dim Local_ppApp_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_pIPServerBrokerContext_Param, Local_ppApp_Param)
		  ppApp_Param = New UnityProServer.IApplication(Local_ppApp_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on NewApplicationWithPServerBrokerContext", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function NewApplicationWithPServerBrokerContext_Func2(this As Ptr, pIPServerBrokerContext_Param As Ptr, ByRef ppApp_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function NewApplication_Func1(this As Ptr, ByRef __MIDL__IPServerBroker0001_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function OpenApplication(StuFileName_Param As String) As UnityProServer.IApplication
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New OpenApplication_Func2(mThis.Ptr( 0 ).Ptr(28 ))
		  Dim resultCode As Integer
		  Dim Local_StuFileName_Param As Ptr
		  Local_StuFileName_Param = COM.SysAllocString( StuFileName_Param )
		  Dim Return___MIDL__IPServerBroker0000_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_StuFileName_Param, Return___MIDL__IPServerBroker0000_Param)
		  COM.SysFreeString(Local_StuFileName_Param)
		  If resultCode = 0 Then
		    If Nil = Return___MIDL__IPServerBroker0000_Param  Then Return Nil
		    Return New UnityProServer.IApplication(Return___MIDL__IPServerBroker0000_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on OpenApplication", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenApplicationWithProfile(BstrStuFileName_Param As String, BSTRUserName_Param As String, bstrPassword_Param As String) As UnityProServer.IApplication
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New OpenApplicationWithProfile_Func4(mThis.Ptr( 0 ).Ptr(36 ))
		  Dim resultCode As Integer
		  Dim Local_BstrStuFileName_Param As Ptr
		  Local_BstrStuFileName_Param = COM.SysAllocString( BstrStuFileName_Param )
		  Dim Local_BSTRUserName_Param As Ptr
		  Local_BSTRUserName_Param = COM.SysAllocString( BSTRUserName_Param )
		  Dim Local_bstrPassword_Param As Ptr
		  Local_bstrPassword_Param = COM.SysAllocString( bstrPassword_Param )
		  Dim Return_ppApp_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_BstrStuFileName_Param, Local_BSTRUserName_Param, Local_bstrPassword_Param, Return_ppApp_Param)
		  COM.SysFreeString(Local_BstrStuFileName_Param)
		  COM.SysFreeString(Local_BSTRUserName_Param)
		  COM.SysFreeString(Local_bstrPassword_Param)
		  If resultCode = 0 Then
		    If Nil = Return_ppApp_Param  Then Return Nil
		    Return New UnityProServer.IApplication(Return_ppApp_Param)
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on OpenApplicationWithProfile", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function OpenApplicationWithProfile_Func4(this As Ptr, BstrStuFileName_Param As Ptr, BSTRUserName_Param As Ptr, bstrPassword_Param As Ptr, ByRef ppApp_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub OpenApplicationWithPServerBrokerContext(BstrStuFileName_Param As String, pIPServerBrokerContext_Param As UnityProBroker.IPServerBrokerContext, ByRef ppApp_Param As UnityProServer.IApplication)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New OpenApplicationWithPServerBrokerContext_Func3(mThis.Ptr( 0 ).Ptr(52 ))
		  Dim resultCode As Integer
		  Dim Local_BstrStuFileName_Param As Ptr
		  Local_BstrStuFileName_Param = COM.SysAllocString( BstrStuFileName_Param )
		  Dim Local_pIPServerBrokerContext_Param As Ptr
		  Local_pIPServerBrokerContext_Param = pIPServerBrokerContext_Param.Handle
		  Dim Local_ppApp_Param As Ptr
		  resultCode = func.Invoke(mThis, Local_BstrStuFileName_Param, Local_pIPServerBrokerContext_Param, Local_ppApp_Param)
		  ppApp_Param = New UnityProServer.IApplication(Local_ppApp_Param)
		  COM.SysFreeString(Local_BstrStuFileName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on OpenApplicationWithPServerBrokerContext", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function OpenApplicationWithPServerBrokerContext_Func3(this As Ptr, BstrStuFileName_Param As Ptr, pIPServerBrokerContext_Param As Ptr, ByRef ppApp_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function OpenApplication_Func2(this As Ptr, StuFileName_Param As Ptr, ByRef __MIDL__IPServerBroker0000_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub OpenProjectWithPServerBrokerContext(pApp_Param As UnityProServer.IApplication, BstrStuFileName_Param As String, pIPServerBrokerContext_Param As UnityProBroker.IPServerBrokerContext)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New OpenProjectWithPServerBrokerContext_Func3(mThis.Ptr( 0 ).Ptr(60 ))
		  Dim resultCode As Integer
		  Dim Local_pApp_Param As Ptr
		  Local_pApp_Param = pApp_Param.Handle
		  Dim Local_BstrStuFileName_Param As Ptr
		  Local_BstrStuFileName_Param = COM.SysAllocString( BstrStuFileName_Param )
		  Dim Local_pIPServerBrokerContext_Param As Ptr
		  Local_pIPServerBrokerContext_Param = pIPServerBrokerContext_Param.Handle
		  resultCode = func.Invoke(mThis, Local_pApp_Param, Local_BstrStuFileName_Param, Local_pIPServerBrokerContext_Param)
		  COM.SysFreeString(Local_BstrStuFileName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on OpenProjectWithPServerBrokerContext", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function OpenProjectWithPServerBrokerContext_Func3(this As Ptr, pApp_Param As Ptr, BstrStuFileName_Param As Ptr, pIPServerBrokerContext_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProBroker.IPServerBroker.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SecurityDatabasePath_Get_Func1(this As Ptr, ByRef pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Integer
			  Dim func As New InterfaceVersion_Get_Func1( mThis.Ptr( 0 ).Ptr( 44 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return pVal_Param
			  Else
			    Raise New COM.COMException("Failed on InterfaceVersion", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		InterfaceVersion As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim pVal_Param As Ptr
			  Dim func As New SecurityDatabasePath_Get_Func1( mThis.Ptr( 0 ).Ptr( 48 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( pVal_Param )
			  Else
			    Raise New COM.COMException("Failed on SecurityDatabasePath", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		SecurityDatabasePath As String
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
			Name="InterfaceVersion"
			Group="Behavior"
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
			Name="SecurityDatabasePath"
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
	#tag EndViewBehavior
End Class
#tag EndClass
