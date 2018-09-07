#tag Module
Protected Module JVUnityBugFixes
	#tag Method, Flags = &h0
		Function VariantToUnityEnum(var as Variant) As UnityEnum
		  
		  // This methods solves the prolem that Variants (used for UDE enums), by default, are passed by reference to the dll's
		  // by converting them in a struct that wiil be passed by reference
		  
		  Dim oleVariant As MemoryBlock = COM.RBVariantToVARIANT(var)
		  dim unityEnum as UnityEnum
		  unityEnum.variantType = oleVariant.UInt64Value(0)
		  unityEnum.variantValue = oleVariant.UInt64Value(8)
		  
		  COM.FreeVARIANT(oleVariant)
		  
		  return unityEnum
		End Function
	#tag EndMethod


	#tag Note, Name = Bug With Enums in Unity Pro Server
		Enums defined in Unity Pro Server are passed to the dll-functions as ptr (hence byref, which doesn't work)
		Therefore the Xojo variant needs to be converted to a struct of type 'UnityEnum' using the method VariantToUnityEnum() whicj can be passed by value.
		The method functions parametertype of te delegate needs to be changed from ptr to 'UnityEnum' accordingly
		
		Example:
		
		If mThis = Nil Then Raise New NilObjectException
		Dim func As New Item_Func3(mThis.Ptr( 0 ).Ptr(36 ))
		Dim resultCode As Integer
		
		// Dim Local_EnumTaskName_Param As MemoryBlock = COM.RBVariantToVARIANT(EnumTaskName_Param) //Original with memoryblock passed byRef
		Dim Local_EnumTaskName_Param As UnityEnum = VariantToUnityEnum(EnumTaskName_Param) // New version with Structure passed byVal
		Dim Return_ppNewTask_Param As Ptr
		resultCode = func.Invoke(mThis, Local_EnumTaskName_Param, Id_Param, Return_ppNewTask_Param)
		
		// No memoryblock needs to be released anumore
		// COM.FreeVARIANT(Local_EnumTaskName_Param)
		
		If resultCode = 0 Then
		If Nil = Return_ppNewTask_Param  Then Return Nil
		Return New UnityProServer.ITask(Return_ppNewTask_Param)
		Else // Throw Exception
		Raise New COM.COMException("Failed on Item", resultCode)
		End If
		
		Delegate variable:
		//Item_Func3(this As Ptr,EnumTaskName_Param As ptr, Id_Param As Integer, ByRef ppNewTask_Param As Ptr) //Original with ptr passed byRef
		Item_Func3(this As Ptr,EnumTaskName_Param As UnityEnum, Id_Param As Integer, ByRef ppNewTask_Param As Ptr) // New version with Structure passed byVal
		
	#tag EndNote


	#tag Structure, Name = UnityEnum, Flags = &h0
		variantType as Uint64
		variantValue as Uint64
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
End Module
#tag EndModule
