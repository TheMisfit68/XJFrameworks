#tag Class
Protected Class JVClipboard
	#tag Method, Flags = &h0
		Shared Sub backup()
		  previousContents = contents
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub clear()
		  contents = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub copy()
		  
		  scriptEngine.sendKeys("^c")
		  app.SleepCurrentThread(1000)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub cut()
		  scriptEngine.sendKeys("^x")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub paste()
		  scriptEngine.sendKeys("^v")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub restore()
		  contents = previousContents
		End Sub
	#tag EndMethod


	#tag Note, Name = Class description
		The standard clipboard class supports multiple instances but always refers to a single (system) clipboard which is confusing to work with.
		This class uses class methods to illustrate the use of a single clipboard.
		It allso adds several handy extensions and properties compared to the standard clipboard class.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim c As Clipboard  = New Clipboard
			  
			  If c.textAvailable Then
			    return c.text
			  else
			    return ""
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim c As Clipboard = New Clipboard
			  c.SetText(value)
			  c.close
			End Set
		#tag EndSetter
		Shared contents As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared mscriptEngine As OLEObject
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared previousContents As String
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
		Private Shared scriptEngine As OLEObject
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
