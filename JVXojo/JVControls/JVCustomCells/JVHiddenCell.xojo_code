#tag Class
Protected Class JVHiddenCell
Implements JVCustomCell
	#tag Method, Flags = &h0
		Sub activate(listBox as JVtableView, row as integer, column as Integer)
		  // Part of the JVCustomCell interface.
		  
		  // A hidden cell can't be activated
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub draw(listBox as JVtableView , g as graphics, row as integer, column as integer)
		  // Part of the JVCustomCell interface.
		  
		  // A hidden cell doesn't do any drawing at all
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
