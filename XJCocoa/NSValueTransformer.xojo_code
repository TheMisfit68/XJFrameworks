#tag Interface
Protected Interface NSValueTransformer
	#tag Method, Flags = &h0
		Function allowsReverseTransformation() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function reverseTransformedValue(value as Variant) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function transformedValue(string As String) As Variant
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Protocol description
		Defines the protocol all NSValueTransformers must conform to
		
		
	#tag EndNote


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
End Interface
#tag EndInterface
