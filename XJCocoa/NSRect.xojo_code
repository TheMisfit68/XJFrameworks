#tag Class
Protected Class NSRect
	#tag Method, Flags = &h0
		Sub constructor(origin as NSpoint, size as NSSize)
		  me.origin =origin
		  me.size = size
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		origin As NSPoint
	#tag EndProperty

	#tag Property, Flags = &h0
		size As NSSize
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return new NSRect(NSpoint.ZeroPoint, NSSize.ZeroSize)
			End Get
		#tag EndGetter
		Shared ZeroRect As NSRect
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
