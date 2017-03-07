#tag Interface
Protected Interface NSWindowDelegate
	#tag Method, Flags = &h0
		Sub onWindowActivate(sender as NSWindow)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function onWindowCancelClose(sender as NSWindow, appQuitting as Boolean) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowClose(sender as NSWindow)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowContentsChanged(sender as NSWindow)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowOpen(sender as NSWindow)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowPaint(sender as NSWindow, g as Graphics, areas() as REALbasic.Rect)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Protocol description
		Defines the protocol all NSWindow-delegates must conform to
		
		
	#tag EndNote


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
End Interface
#tag EndInterface
