#tag Class
Protected Class JVSecurityController
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Run mode-command from the commandline
			  dim windowsUserFinder as  new JVTerminalViewController
			  windowsUserFinder.view = JVTerminalViewController.MainTerminalView
			  windowsUserFinder.mode =JVTerminalViewController.JVTerminalMode.Synchronous
			  
			  dim dosCommand as String ="echo %username%"
			  windowsUserFinder.execute(dosCommand)
			  dim resultText as String = windowsUserFinder.terminal.Result
			  
			  return resultText
			End Get
		#tag EndGetter
		currentWindowsUser As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  #if DebugBuild
			    
			    return TRUE
			    
			  #else
			    
			    return (UpperCase(currentWindowsUser) = "USER2418")  or (Titlecase(currentWindowsUser) = Titlecase(app.developer) )
			    
			    
			  #Endif
			End Get
		#tag EndGetter
		developerMode As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = JVSecurityRoles, Type = Integer, Flags = &h0
		Developer
		  Administrator
		  User
		BetaTester
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="currentWindowsUser"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="developerMode"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
End Class
#tag EndClass
