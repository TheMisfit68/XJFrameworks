#tag Class
Protected Class JVLogViewController
Inherits NSViewController
Implements NSViewDelegate
	#tag Method, Flags = &h0
		Sub Constructor()
		  super.constructor(new JVLogView, nil)
		  
		  console.Styled = True
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function log(message as String) As NSRange
		  
		  dim timestamp as Date = new date
		  dim timestampedMessage as String = timestamp.LongTime+" "+message+ENDOFLINE+ENDOFLINE
		  
		  if logView.isInstalled then
		    
		    dim start as Integer = len(console.StyledText.text)
		    dim length as Integer = timestampedMessage.Len
		    
		    console.StyledText.text = console.StyledText.text+timestampedMessage
		    console.ScrollPosition = console.LineNumAtCharPos(len(console.StyledText.text))
		    
		    return NSRange.NSMakeRange(start, length)
		    
		  else
		    
		    return NSRange.ZeroRange
		    
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub logAsError(message as String)
		  // Log the message
		  dim messageRange as NSRange = log(message)
		  
		  // In Bold and Red
		  if messageRange.length > 0 then
		    console.StyledText.Bold(messageRange.location, messageRange.length) = TRUE 
		    console.StyledText.TextColor(messageRange.location, messageRange.length)  = &cFF0000 
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub logAsPlainText(message as String)
		  
		  // Log the message
		  dim messageRange as NSRange = log(message)
		  
		  // In Plain and Dark gray
		  if messageRange.length > 0 then
		    console.StyledText.Bold(messageRange.location, messageRange.length) = FALSE 
		    console.StyledText.TextColor(messageRange.location, messageRange.length)  = &c4C4C4C
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub logAsWarning(message as String)
		  
		  // Log the message
		  dim messageRange as NSRange = log(message)
		  
		  // In Bold and Orange
		  
		  if messageRange.length > 0 then
		    console.StyledText.Bold(messageRange.location, messageRange.length) = TRUE 
		    console.StyledText.TextColor(messageRange.location, messageRange.length)  = &cFF7F00
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewActivate(sender as NSView)
		  // Part of the NSViewDelegate interface.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function onViewCancelClose(sender as NSview, appQuiting as Boolean) As Boolean
		  // Part of the NSViewDelegate interface.
		  
		  
		End Function
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


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return logView.console
			End Get
		#tag EndGetter
		Private console As TextArea
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return JVlogView(View)
			End Get
		#tag EndGetter
		Private logView As JVLogView
	#tag EndComputedProperty


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
