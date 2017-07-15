#tag Class
Protected Class JVBackgroundTask
Inherits Thread
	#tag Method, Flags = &h21
		Private Sub checkCurrentState(sender as Timer)
		  If  State= Thread.NotRunning and not mEventWasFired then
		    
		    mEventWasFired=  TRUE
		    RaiseEvent finished
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub constructor()
		  // mLock = New CriticalSection
		  
		  mEventWasFired = FALSE
		  
		  mTimer = New Timer
		  mTimer.Period = 500
		  mTimer.Mode = Timer.ModeMultiple
		  
		  AddHandler mTimer.Action, WeakAddressOf checkCurrentState
		  mTimer.Enabled = TRUE
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub run()
		  mEventWasFired = FALSE
		  super.run
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event finished()
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
			    RemoveHandler finished, AddressOf mbackgroundTaskDelegate.onTaskFinished
			    
			  end if
			  
			  // Set the delegate
			  mbackgroundTaskDelegate = value
			  
			  if mbackgroundTaskDelegate <> nil then
			    
			    // Redirect all events to the delegate
			    AddHandler finished, AddressOf mbackgroundTaskDelegate.onTaskFinished
			    
			  end if
			End Set
		#tag EndSetter
		backgroundTaskDelegate As JVBackgroundTaskDelegate
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBackgroundTaskDelegate As JVBackgroundTaskDelegate
	#tag EndProperty

	#tag Property, Flags = &h0
		mEventWasFired As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLock As CriticalSection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Timer
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
			Name="mEventWasFired"
			Group="Behavior"
			Type="Boolean"
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
