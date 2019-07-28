#tag Class
Protected Class IHealthServerGen
Inherits COM.IDispatch
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCountForRelease() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetCountForRelease_Func1(mThis.Ptr( 0 ).Ptr(44 ))
		  Dim resultCode As Integer
		  Dim Return_piBound_Param As Integer
		  resultCode = func.Invoke(mThis, Return_piBound_Param)
		  If resultCode = 0 Then
		    Return Return_piBound_Param
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetCountForRelease", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetCountForRelease_Func1(this As Ptr, ByRef piBound_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetMultipleInstanceCount() As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetMultipleInstanceCount_Func1(mThis.Ptr( 0 ).Ptr(36 ))
		  Dim resultCode As Integer
		  Dim Return_piCount_Param As Integer
		  resultCode = func.Invoke(mThis, Return_piCount_Param)
		  If resultCode = 0 Then
		    Return Return_piCount_Param
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetMultipleInstanceCount", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetMultipleInstanceCount_Func1(this As Ptr, ByRef piCount_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function GetMultipleInstanceInterfaces(ByRef piCount_Param As Integer) As Variant
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetMultipleInstanceInterfaces_Func2(mThis.Ptr( 0 ).Ptr(32 ))
		  Dim resultCode As Integer
		  Dim Return_pvarIntf_Param As Ptr
		  Dim pvarIntf_Param_MB As New MemoryBlock(16)
		  Return_pvarIntf_Param = pvarIntf_Param_MB
		  resultCode = func.Invoke(mThis, piCount_Param, Return_pvarIntf_Param)
		  If resultCode = 0 Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(Return_pvarIntf_Param)
		    COM.FreeVARIANT(Return_pvarIntf_Param)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetMultipleInstanceInterfaces", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetMultipleInstanceInterfaces_Func2(this As Ptr, ByRef piCount_Param As Integer, pvarIntf_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub GetServerNames(ByRef pbstrProductName_Param As String, ByRef pbstrFileName_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetServerNames_Func2(mThis.Ptr( 0 ).Ptr(40 ))
		  Dim resultCode As Integer
		  Dim Local_pbstrProductName_Param As Ptr = COM.SysAllocString( pbstrProductName_Param )
		  Dim Local_pbstrFileName_Param As Ptr = COM.SysAllocString( pbstrFileName_Param )
		  resultCode = func.Invoke(mThis, Local_pbstrProductName_Param, Local_pbstrFileName_Param)
		  pbstrProductName_Param = COM.BSTRToRBString(Local_pbstrProductName_Param)
		  pbstrFileName_Param = COM.BSTRToRBString(Local_pbstrFileName_Param)
		  COM.SysFreeString(Local_pbstrProductName_Param)
		  COM.SysFreeString(Local_pbstrFileName_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetServerNames", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetServerNames_Func2(this As Ptr, ByRef pbstrProductName_Param As Ptr, ByRef pbstrFileName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{44E3A703-D9AD-11D5-86A7-00062999CA47}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAlive() As Int16
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New IsAlive_Func1(mThis.Ptr( 0 ).Ptr(28 ))
		  Dim resultCode As Integer
		  Dim Return_piContinue_Param As Int16
		  resultCode = func.Invoke(mThis, Return_piContinue_Param)
		  If resultCode = 0 Then
		    Return Return_piContinue_Param
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on IsAlive", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IsAlive_Func1(this As Ptr, ByRef piContinue_Param As Int16) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProBroker.IHealthServerGen.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod


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
	#tag EndViewBehavior
End Class
#tag EndClass
