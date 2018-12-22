#tag Class
Protected Class JVBackgroundTask
Inherits Thread
	#tag Method, Flags = &h0
		Sub run()
		  
		  RaiseEvent starting
		  
		  super.run
		  
		  while State = Thread.Running
		    app.YieldToNextThread
		  wend
		  
		  RaiseEvent finished
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event finished()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event starting()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbackgroundTaskDelegate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  if mbackgroundTaskDelegate <> nil then
			    
			    // Remove any previously set delegate
			    RemoveHandler starting, AddressOf mbackgroundTaskDelegate.onTaskStarting
			    RemoveHandler finished, AddressOf mbackgroundTaskDelegate.onTaskFinished
			    
			  end if
			  
			  // Set the delegate
			  mbackgroundTaskDelegate = value
			  
			  if mbackgroundTaskDelegate <> nil then
			    
			    // Redirect all events to the delegate
			    AddHandler starting, AddressOf mbackgroundTaskDelegate.onTaskStarting
			    AddHandler finished, AddressOf mbackgroundTaskDelegate.onTaskFinished
			    
			    
			  end if
			End Set
		#tag EndSetter
		backgroundTaskDelegate As JVBackgroundTaskDelegate
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBackgroundTaskDelegate As JVBackgroundTaskDelegate
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
