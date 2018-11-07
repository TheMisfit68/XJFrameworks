#tag Class
Protected Class JVCheckBoxTransformer
Implements JVTransFormer
	#tag Method, Flags = &h0
		Function representationFor(value as Variant) As Variant
		  // Part of the JVTransFormer interface.
		  
		  Select case value
		  case 0
		    return checkBox.CheckedStates.Unchecked
		  case 1
		    return checkBox.CheckedStates.Indeterminate
		  case 2
		    return checkBox.CheckedStates.Checked
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function valueFor(representation as Variant) As Variant
		  // Part of the JVTransFormer interface.
		  
		  Select case representation
		  case checkBox.CheckedStates.Unchecked
		    return 0
		  case checkBox.CheckedStates.Indeterminate
		    return 1
		  case checkBox.CheckedStates.Checked
		    return 2
		  end select
		  
		End Function
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
		#tag ViewProperty
			Name="rawValue"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
