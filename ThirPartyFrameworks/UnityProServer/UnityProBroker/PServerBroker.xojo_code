#tag Class
Protected Class PServerBroker
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{359686EA-EF6E-11D3-A1CC-000629A2F326}" )
		    clsid = COM.IIDFromString( "{8BE17D4D-EF5F-11D3-A1CC-000629A2F326}" )
		    
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
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{359686EA-EF6E-11D3-A1CC-000629A2F326}")
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function InterfaceVersion_Get_Func1(this As Ptr, ByRef pVal_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function NewApplication() As UnityProServer.IApplication
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New NewApplication_Func1(mThis.Ptr( 0 ).Ptr(8 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Return___MIDL__IPServerBroker0001_Param As Ptr
		    resultCode = func.Invoke(mThis, Return___MIDL__IPServerBroker0001_Param)
		    If resultCode = 0 Then
		      If Nil = Return___MIDL__IPServerBroker0001_Param  Then Return Nil
		      Return New UnityProServer.IApplication(Return___MIDL__IPServerBroker0001_Param)
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on NewApplication", resultCode)
		    End If
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewApplicationWithProfile(BSTRUserName_Param As String, bstrPassword_Param As String) As UnityProServer.IApplication
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New NewApplicationWithProfile_Func3(mThis.Ptr( 0 ).Ptr(10 * COM.SIZEOF_PTR ))
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
		    
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function NewApplicationWithProfile_Func3(this As Ptr, BSTRUserName_Param As Ptr, bstrPassword_Param As Ptr, ByRef ppApp_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub NewApplicationWithPServerBrokerContext(pIPServerBrokerContext_Param As UnityProBroker.IPServerBrokerContext, ByRef ppApp_Param As UnityProServer.IApplication)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New NewApplicationWithPServerBrokerContext_Func2(mThis.Ptr( 0 ).Ptr(14 * COM.SIZEOF_PTR ))
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
		    
		  #endif
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
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New OpenApplication_Func2(mThis.Ptr( 0 ).Ptr(7 * COM.SIZEOF_PTR ))
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
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenApplicationWithProfile(BstrStuFileName_Param As String, BSTRUserName_Param As String, bstrPassword_Param As String) As UnityProServer.IApplication
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New OpenApplicationWithProfile_Func4(mThis.Ptr( 0 ).Ptr(9 * COM.SIZEOF_PTR ))
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
		    
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function OpenApplicationWithProfile_Func4(this As Ptr, BstrStuFileName_Param As Ptr, BSTRUserName_Param As Ptr, bstrPassword_Param As Ptr, ByRef ppApp_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub OpenApplicationWithPServerBrokerContext(BstrStuFileName_Param As String, pIPServerBrokerContext_Param As UnityProBroker.IPServerBrokerContext, ByRef ppApp_Param As UnityProServer.IApplication)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New OpenApplicationWithPServerBrokerContext_Func3(mThis.Ptr( 0 ).Ptr(13 * COM.SIZEOF_PTR ))
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
		    
		  #endif
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
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New OpenProjectWithPServerBrokerContext_Func3(mThis.Ptr( 0 ).Ptr(15 * COM.SIZEOF_PTR ))
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
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function OpenProjectWithPServerBrokerContext_Func3(this As Ptr, pApp_Param As Ptr, BstrStuFileName_Param As Ptr, pIPServerBrokerContext_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProBroker.IPServerBroker.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SecurityDatabasePath_Get_Func1(this As Ptr, ByRef pVal_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pVal_Param As Integer
			    Dim func As New InterfaceVersion_Get_Func1( mThis.Ptr( 0 ).Ptr( 11 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			    If 0 = resultCode Then
			      Return pVal_Param
			    Else
			      Raise New COM.COMException("Failed on InterfaceVersion", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		InterfaceVersion As Integer
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
			    Dim pVal_Param As Ptr
			    Dim func As New SecurityDatabasePath_Get_Func1( mThis.Ptr( 0 ).Ptr( 12 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pVal_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( pVal_Param )
			    Else
			      Raise New COM.COMException("Failed on SecurityDatabasePath", resultCode )
			    End If
			  #endif
			  
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
			Name="InterfaceVersion"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SecurityDatabasePath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
