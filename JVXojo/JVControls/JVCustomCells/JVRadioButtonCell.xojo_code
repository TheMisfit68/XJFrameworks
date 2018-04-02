#tag Class
Protected Class JVRadioButtonCell
Implements JVCustomCell
	#tag Method, Flags = &h0
		Sub activate(listBox as ListBox, row as integer, column as Integer)
		  // Part of the JVCustomCell interface.
		  
		  // Not yet implemented !!!
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub draw(listBox as ListBox , g as graphics, row as integer, column as integer)
		  // Part of the JVCustomCell interface.
		  
		  // Not yet implemented !!!
		End Sub
	#tag EndMethod


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
			Name="stringValue"
			Group="Behavior"
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
