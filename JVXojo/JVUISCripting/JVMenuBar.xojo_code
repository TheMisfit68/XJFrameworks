#tag Class
Protected Class JVMenuBar
	#tag Method, Flags = &h0
		Sub selectItem(menuKey as string, subMenuNumber as Integer)
		  // Open the right menu
		  dim menuLetter as String
		  menuLetter = lowercase(left(menuKey,1))
		  
		  scriptEngine.Sendkeys("%") 'ALT
		  scriptEngine.Sendkeys(menuLetter) 'menukey
		  
		  // Move down to the right item
		  dim i as Integer
		  for i = 1 to subMenuNumber-1
		    scriptEngine.Sendkeys("{DOWN}")
		  next
		  
		  //Select it
		  scriptEngine.Sendkeys("{ENTER}")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub selectItem(menuKey as string, subMenuKey as String)
		  // Open the right menu
		  dim menuLetter as String
		  menuLetter = lowercase(left(menuKey,1))
		  
		  scriptEngine.Sendkeys("%") 'ALT
		  scriptEngine.Sendkeys(menuLetter) 'menukey
		  
		  // Move down to the right menuitem
		  dim subMenuLetter as String
		  subMenuLetter = lowercase(left(subMenuKey,1))
		  scriptEngine.Sendkeys(subMenuLetter) 
		  
		End Sub
	#tag EndMethod


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
