#tag Class
Protected Class JVSequencer
	#tag Method, Flags = &h0
		Sub add(keyString as String, EOL as String = "", delay as Integer = -1, expectedResponse as String = "")
		  dim stroke as JVKeyStroke = new JVKeyStroke
		  
		  dim keys as String = keyString
		  if EOL <> "" then
		    keys =  keys+EOL
		  end if
		  stroke.keyString = keys
		  stroke.delay = delay
		  stroke.response = expectedResponse
		  
		  sequence.append(stroke)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub clear()
		  Redim sequence(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(appName as String)
		  targetApp = appname // Either a String or a ID
		  
		  menuBar = new JVMenuBar
		  keyboard =  new JVKeyboard
		  clipboard = new JVClipboard
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub focusTargetApp()
		  // Select the proper App
		  #If TargetWin32
		    scriptEngine.appActivate(targetApp)
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub runSequence()
		  dim runNext as Boolean = true
		  while runNext and ubound(sequence) <> -1
		    runNext = runStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function runStep() As Boolean
		  // Pop the initial element from teh sequence stack
		  dim keyStroke as JVKeyStroke= sequence(0)
		  sequence.Remove(0)
		  
		  // Push the right buttons
		  focusTargetApp
		  JVKeyboard.press(keyStroke.keyString)
		  
		  if keyStroke.delay > 0 then
		    app.SleepCurrentThread(keyStroke.delay)
		  end if
		  
		  // Check response when possible
		  // Not possible at current time because as we're simply scripting the UI
		  
		  // if (expectedResponse <> "") and  instr(data, expectedResponse) = 0 then
		  // JVLogViewController.logAsError("Unexpected result encountered:"+ENDOFLINE+"[ "+data+" ]")
		  // exit
		  // Else
		  // JVLogViewController.logAsPlainText("Setting entered succesfull")
		  // end if
		  
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub selectMenuItem(menuKey as string, subMenuNumber as Integer)
		  focusTargetApp
		  menuBar.selectItem(menuKey, subMenuNumber)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub selectMenuItem(menuKey as string, subMenuKey as String)
		  focusTargetApp
		  menuBar.selectItem(menuKey, subMenuKey)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		clipboard As JVClipboard
	#tag EndProperty

	#tag Property, Flags = &h0
		keyboard As JVKeyboard
	#tag EndProperty

	#tag Property, Flags = &h0
		menuBar As JVMenuBar
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mscriptEngine As OLEObject
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  // Lazy loading
			  
			  if mscriptEngine = nil then
			    #If TargetWin32
			      mscriptEngine = new OLEObject("WScript.Shell")
			    #endif
			  end if
			  
			  return mscriptEngine
			End Get
		#tag EndGetter
		Private scriptEngine As OLEObject
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private sequence() As JVKeyStroke
	#tag EndProperty

	#tag Property, Flags = &h21
		Private targetApp As String
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
