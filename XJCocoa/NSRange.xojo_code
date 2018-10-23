#tag Class
Protected Class NSRange
	#tag Method, Flags = &h0
		Shared Function NSMakeRange(location as Integer, length as Integer) As NSRange
		  dim newRange as NSRange = new NSRange
		  newRange.location = location
		  newRange.length = length
		  
		  return newRange
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ZeroRange() As NSRange
		  Return NSMakeRange(0,0)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		length As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		location As Integer
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
			Name="length"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="location"
			Group="Behavior"
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
