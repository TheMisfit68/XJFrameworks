#tag Module
Protected Module JVDebugger
	#tag Method, Flags = &h0
		Sub debugLog(msg As String)
		  #if DebugBuild then
		    if loggingIsEnabled then
		      system.debuglog(msg)
		    end if
		  #endif
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mloggingIsEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  mloggingIsEnabled = value
			  
			  debugLog("DebugLogging for this application is now turned on") // This wil not show if logging was in fact turned of
			  
			End Set
		#tag EndSetter
		loggingIsEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mloggingIsEnabled As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="loggingIsEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
