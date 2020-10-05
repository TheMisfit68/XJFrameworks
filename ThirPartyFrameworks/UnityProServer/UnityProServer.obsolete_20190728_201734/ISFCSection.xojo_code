#tag Class
Protected Class ISFCSection
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub AnalyzeSFCStepIDs(varPEOStepsWish_Param As Variant, pvarPEOStepsChecked_Param As Variant, pvarSourceErrListStrings_Param As Variant)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New AnalyzeSFCStepIDs_Func3(mThis.Ptr( 0 ).Ptr(32 ))
		  Dim resultCode As Integer
		  Dim Local_varPEOStepsWish_Param As MemoryBlock = COM.RBVariantToVARIANT(varPEOStepsWish_Param)
		  Dim Local_pvarPEOStepsChecked_Param As New MemoryBlock(16)
		  Dim Local_pvarSourceErrListStrings_Param As New MemoryBlock(16)
		  resultCode = func.Invoke(mThis, Local_varPEOStepsWish_Param, Local_pvarPEOStepsChecked_Param, Local_pvarSourceErrListStrings_Param)
		  pvarPEOStepsChecked_Param = COM.VARIANTToRBVariant(Local_pvarPEOStepsChecked_Param)
		  pvarSourceErrListStrings_Param = COM.VARIANTToRBVariant(Local_pvarSourceErrListStrings_Param)
		  COM.FreeVARIANT(Local_varPEOStepsWish_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on AnalyzeSFCStepIDs", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function AnalyzeSFCStepIDs_Func3(this As Ptr, varPEOStepsWish_Param As Ptr, pvarPEOStepsChecked_Param As Ptr, pvarSourceErrListStrings_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStepIdFromVariableName(stepName_Param As String) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New GetStepIdFromVariableName_Func2(mThis.Ptr( 0 ).Ptr(28 ))
		  Dim resultCode As Integer
		  Dim Local_stepName_Param As Ptr
		  Local_stepName_Param = COM.SysAllocString( stepName_Param )
		  Dim Return_pStepID_Param As Integer
		  resultCode = func.Invoke(mThis, Local_stepName_Param, Return_pStepID_Param)
		  COM.SysFreeString(Local_stepName_Param)
		  If resultCode = 0 Then
		    Return Return_pStepID_Param
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on GetStepIdFromVariableName", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function GetStepIdFromVariableName_Func2(this As Ptr, stepName_Param As Ptr, ByRef pStepID_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{A0DD7B67-9206-4EF0-BBA2-CE33225569A1}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.ISFCSection.IID, p ) Then
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
