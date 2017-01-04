#tag Class
Protected Class JVKeyboard
	#tag Method, Flags = &h0
		Shared Sub press(keyString as String)
		  #if DebugBuild
		    
		    //Replace curly braces with square brackets when printing to the log
		    dim regEx as new RegEx
		    regEx.SearchPattern ="{([^{}]+)}"
		    regEx.ReplacementPattern =" \[$1\]"
		    regEx.Options.ReplaceAllMatches = True
		    
		    dim debugString as String = regEx.Replace(keyString )
		    system.DebugLog("Pressing "+debugString+" on keyboard")
		    
		  #endIf
		  
		  
		  #If TargetWin32
		    // Windows-specific code here
		    
		    scriptEngine.Sendkeys(keyString)
		    
		  #ElseIf TargetMacOS
		    
		    //
		    
		  #EndIf
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mscriptEngine As OLEObject
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
