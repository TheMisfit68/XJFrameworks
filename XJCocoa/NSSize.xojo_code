#tag Class
Protected Class NSSize
	#tag Method, Flags = &h0
		Sub constructor(width as Integer, height as Integer)
		  me.width =width
		  me.height = height
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		height As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		width As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return new NSSize(0, 0)
			End Get
		#tag EndGetter
		Shared ZeroSize As NSSize
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="height"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="width"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
