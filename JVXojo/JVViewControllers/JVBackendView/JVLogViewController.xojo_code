#tag Class
Protected Class JVLogViewController
Inherits NSViewController
Implements NSViewDelegate
	#tag Method, Flags = &h0
		Sub clearConsole()
		  if logView.isInstalled then
		    
		    console.Text = ""
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  super.constructor(new JVLogView, nil)
		  
		  console.Styled = True
		  console.MultiLine =True
		  console.LineSpacing = 1.25
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawSeperatorLine()
		  if logView.isInstalled then
		    
		    dim consoleText as String = ReplaceLineEndings( console.StyledText.text , EndOfLine)
		    dim seperatedLines() as String = consoleText.split(ENDOFLINE)
		    
		    dim longestLine as Integer = 0
		    for each line as String in seperatedLines
		      longestLine = Max(line.len, longestLine)
		    next line
		    
		    for underScoreNumber as Integer = 1 to longestLine
		      console.AppendText("＿")
		    next underScoreNumber
		    console.AppendText(ENDOFLINE)
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(message as String, optional logLevel as JVLogLevel = JVLoglevel.plain)
		  if logView.isInstalled then
		    
		    // Set formatting for each loglevel
		    dim icon as String
		    dim textColor as Color
		    dim boldState as Boolean
		    
		    select case logLevel
		    case JVLogLevel.ERROR
		      icon = "🛑"
		      textColor =  &cFF0000
		      boldState =  TRUE
		    case JVLogLevel.WARNING
		      icon = "⚠️"
		      textColor =  &cFF7F00
		      boldState =  TRUE
		    case JVLogLevel.INFO
		      icon = "ℹ️"
		      textColor =  &c4C4C4C
		      boldState =  FALSE
		    case JVLogLevel.MESSAGE
		      icon = "💬"
		      textColor =  &c4C4C4C
		      boldState =  FALSE
		    else
		      icon = ""
		      textColor=  &c4C4C4C
		      boldState =  FALSE
		    end select
		    
		    
		    // Compose the entire message
		    dim timestamp as Date = new date
		    dim timestampedMessage as String = timestamp.LongTime+": "+message+ENDOFLINE
		    
		    // Log it and apply formatting
		    console.AppendText(icon+Tab+timestampedMessage)
		    dim finalPosition as Integer = console.StyledText.text.Len
		    
		    console.selstart = finalPosition
		    
		    dim textLength as Integer = timestampedMessage.Len
		    dim startPosition as Integer = finalPosition-textLength
		    console.StyledText.Bold(startPosition, textLength) = boldState 
		    console.StyledText.TextColor(startPosition, textLength) = textColor
		    
		    console.ScrollPosition = console.LineNumAtCharPos(console.StyledText.text.len)
		    
		    
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


	#tag Enum, Name = JVLogLevel, Flags = &h0
		ERROR
		  WARNING
		  INFO
		  MESSAGE
		PLAIN
	#tag EndEnum


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
