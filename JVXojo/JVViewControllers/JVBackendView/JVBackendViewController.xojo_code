#tag Class
Protected Class JVBackendViewController
Inherits NSViewController
Implements NSViewDelegate
	#tag Method, Flags = &h0
		Sub Constructor()
		  super.constructor(new JVBackendView, nil)
		  
		  // Create subcontrollers
		  logController = new JVLogViewController
		  terminalController = new JVTerminalViewController
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewActivate(sender as NSView)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewClose(sender as NSView)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewContentsChanged(sender as NSWindow)
		  // Part of the NSViewDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewOpen(sender as NSView)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return JVBackendView(view)
			End Get
		#tag EndGetter
		backendView As JVBackendView
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		logController As JVLogViewController
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared msharedBackendViewController As JVBackendViewController
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  if msharedBackendViewController = nil then
			    msharedBackendViewController =  new JVBackendViewController
			  end if
			  
			  return msharedBackendViewController
			End Get
		#tag EndGetter
		Shared sharedBackendViewController As JVBackendViewController
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		terminalController As JVTerminalViewController
	#tag EndProperty


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
End Class
#tag EndClass
