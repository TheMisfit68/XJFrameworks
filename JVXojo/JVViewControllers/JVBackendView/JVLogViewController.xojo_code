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
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawSeperatorLine(optional lineColor as Color = &c797979)
		  
		  if logView.isInstalled then
		    
		    dim seperator as new StyleRun
		    seperator.textcolor = lineColor
		    
		    // Draw the line as long as the longest existing textline
		    dim consoleText as String = ReplaceLineEndings( console.StyledText.text , EndOfLine)
		    dim seperatedLines() as String = consoleText.split(ENDOFLINE)
		    
		    dim longestLine as Integer = 0
		    for each line as String in seperatedLines
		      // Don't parse existing seperatorlines
		      dim itsATextLine as Boolean = (line.ReplaceAll("_","").len > 0)
		      if itsATextLine then
		        longestLine = Max(line.len*2, longestLine) // * 2 to make sure enough underscores will be generated
		      end if
		    next line
		    
		    dim  underscores as String =""
		    underscores=underscores.pad(longestLine, "_")
		    seperator.Text = underscores+ENDOFLINE
		    
		    console.StyledText.AppendStyleRun(seperator)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(message as string, optional logLevel as JVLogLevel = JVLoglevel.plain)
		  
		  if logView.isInstalled then
		    
		    
		    
		    dim icon as Text
		    dim timestamp as Date = new date
		    dim formattedText as new Stylerun
		    
		    select case logLevel
		    case JVLogLevel.ERROR
		      icon = "🛑"
		      formattedText.textColor =  &cFF0000
		      formattedText.Bold =  TRUE
		    case JVLogLevel.WARNING
		      icon = "⚠️"
		      formattedText.textColor =  &cFF7F00
		      formattedText.Bold =  TRUE
		    case JVLogLevel.INFO
		      icon = "ℹ️"
		      formattedText.textColor =  &c4C4C4C
		      formattedText.Bold =  FALSE
		    case JVLogLevel.MESSAGE
		      icon = "💬"
		      formattedText.textColor =  &c4C4C4C
		      formattedText.Bold =  FALSE
		    else
		      icon = ""
		      formattedText.textColor=  &c4C4C4C
		      formattedText.Bold =  FALSE
		    end select
		    
		    // Compose the complete message
		    formattedText.Size =12
		    formattedText.text = (icon+TAB+timestamp.LongTime+": "+message+ENDOFLINE)
		    
		    // Workaround!:
		    // Compensate for the fact that under Windows an oneven number of characters doesn't display/ format correctly 
		    #if TargetWindows then
		      dim extraCharacterNeeded as boolean = (formattedText.text.Len mod 2 <> 0)
		      if extraCharacterNeeded then
		        formattedtext.text = formattedText.text+" "
		      end if
		    #endif
		    
		    //  Log it
		    console.Styledtext.AppendStyleRun(formattedText)
		    
		    // Scroll down
		    console.LineHeight = 18.0
		    console.LineSpacing = 1.25
		    console.ScrollPosition = console.LineNumAtCharPos(console.Styledtext.text.len)
		    
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
