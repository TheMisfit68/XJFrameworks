#tag Class
Protected Class IPSBSubscription
Inherits COM.IUnknown
	#tag Method, Flags = &h0
		Function ChangeApplication(StuFileName_Param As String, Subscriber_Param As COM.IUnknown) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 1
		  If memID = -1Then Raise New COM.COMException("Failed on ChangeApplication", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_StuFileName_Param As MemoryBlock = COM.RBVariantToVARIANT(StuFileName_Param)
		  params.cArgs = params.cArgs + 1
		  Dim Local_Subscriber_Param As MemoryBlock = COM.RBVariantToVARIANT(Subscriber_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_StuFileName_Param <> Nil Then mbParams.StringValue(1 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_StuFileName_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  If Local_Subscriber_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_Subscriber_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_StuFileName_Param)
		  COM.FreeVARIANT(Local_Subscriber_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on ChangeApplication", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub ChangeApplication_Func4(this As Ptr, StuFileName_Param As Ptr, Subscriber_Param As Ptr, ByRef plRetval_Param As Integer, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{4388C3D5-1C5C-11D4-A1DA-000629A2F326}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProBroker.IPSBSubscription.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Subscribe(pSubscriber_Param As COM.IUnknown) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 2
		  If memID = -1Then Raise New COM.COMException("Failed on Subscribe", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_pSubscriber_Param As MemoryBlock = COM.RBVariantToVARIANT(pSubscriber_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_pSubscriber_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_pSubscriber_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_pSubscriber_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Subscribe", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub Subscribe_Func2(this As Ptr, pSubscriber_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function UnSubscribe(pUnSubscriber_Param As COM.IUnknown) As Integer
		  If mThis = Nil Then Raise New NilObjectException
		  Dim disp As New COM.IDispatch(mThis)
		  Call disp.AddRef
		  Dim memID As Integer = 3
		  If memID = -1Then Raise New COM.COMException("Failed on UnSubscribe", -1)
		  Dim params As COM.DISPPARAMS
		  Dim Local_pUnSubscriber_Param As MemoryBlock = COM.RBVariantToVARIANT(pUnSubscriber_Param)
		  params.cArgs = params.cArgs + 1
		  Dim mbParams As New MemoryBlock(params.cArgs * COM.SIZEOF_VARIANT)
		  params.rgvarg = mbParams
		  If Local_pUnSubscriber_Param <> Nil Then mbParams.StringValue(0 * COM.SIZEOF_VARIANT, COM.SIZEOF_VARIANT) = Local_pUnSubscriber_Param.StringValue(0, COM.SIZEOF_VARIANT)
		  Dim resultCode As Integer
		  Dim result As New MemoryBlock(COM.SIZEOF_VARIANT)
		  Dim err As UInt32
		  resultCode = disp.Invoke(memID, COM.IID_NULL, COM.LOCALE_USER_DEFAULT, COM.DISPATCH_METHOD + COM.DISPATCH_PROPERTYGET, params, result, nil, err)
		  COM.FreeVARIANT(Local_pUnSubscriber_Param)
		  If resultCode = COM.S_OK Then
		    Dim retVal As Variant = COM.VARIANTToRBVariant(result)
		    COM.FreeVARIANT(result)
		    Return retVal
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on UnSubscribe", resultCode)
		  End If
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub UnSubscribe_Func2(this As Ptr, pUnSubscriber_Param As Ptr, OutVal_Param As Integer)
	#tag EndDelegateDeclaration


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
