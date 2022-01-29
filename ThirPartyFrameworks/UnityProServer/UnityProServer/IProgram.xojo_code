#tag Class
Protected Class IProgram
Inherits COM.IDispatch
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{13639205-C7A6-11D4-A251-0006290515BB}")
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function IOEvents_Get_Func1(this As Ptr, ByRef ppIOEvents_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.IProgram.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Tasks_Get_Func1(this As Ptr, ByRef ppITasks_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function TimerEvents_Get_Func1(this As Ptr, ByRef ppITimerEvents_Param As Ptr) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim ppIOEvents_Param As Ptr
			    Dim func As New IOEvents_Get_Func1( mThis.Ptr( 0 ).Ptr( 7 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, ppIOEvents_Param )
			    If 0 = resultCode Then
			      If Nil <> ppIOEvents_Param Then
			        Return New UnityProServer.IIOEvents( ppIOEvents_Param )
			      End If
			    Else
			      Raise New COM.COMException("Failed on IOEvents", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		IOEvents As UnityProServer.IIOEvents
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim ppITasks_Param As Ptr
			    Dim func As New Tasks_Get_Func1( mThis.Ptr( 0 ).Ptr( 9 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, ppITasks_Param )
			    If 0 = resultCode Then
			      If Nil <> ppITasks_Param Then
			        Return New UnityProServer.ITasks( ppITasks_Param )
			      End If
			    Else
			      Raise New COM.COMException("Failed on Tasks", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Tasks As UnityProServer.ITasks
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim ppITimerEvents_Param As Ptr
			    Dim func As New TimerEvents_Get_Func1( mThis.Ptr( 0 ).Ptr( 8 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, ppITimerEvents_Param )
			    If 0 = resultCode Then
			      If Nil <> ppITimerEvents_Param Then
			        Return New UnityProServer.ITimerEvents( ppITimerEvents_Param )
			      End If
			    Else
			      Raise New COM.COMException("Failed on TimerEvents", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		TimerEvents As UnityProServer.ITimerEvents
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
	#tag EndViewBehavior
End Class
#tag EndClass
