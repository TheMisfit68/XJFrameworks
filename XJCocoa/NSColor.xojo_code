#tag Class
Protected Class NSColor
	#tag Method, Flags = &h0
		Shared Function RainBowColors() As Color()
		  return Array(NSColor.Red, NSColor.Orange, NSColor.Yellow, NSColor.Green, NSColor.Blue, NSColor.Indigo, NSColor.Violet)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &c000000
			End Get
		#tag EndGetter
		Shared Black As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &c76D6FF
			End Get
		#tag EndGetter
		Shared Blue As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &c66FFFF
			End Get
		#tag EndGetter
		Shared Cyan As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &c797979
			End Get
		#tag EndGetter
		Shared DarkGrey As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &c73FA79
			End Get
		#tag EndGetter
		Shared Green As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &c4B0082
			End Get
		#tag EndGetter
		Shared Indigo As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &cC0C0C0
			End Get
		#tag EndGetter
		Shared LightGrey As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &cFF00FF
			End Get
		#tag EndGetter
		Shared Magenta As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &cFFD479
			End Get
		#tag EndGetter
		Shared Orange As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &cD783FF
			End Get
		#tag EndGetter
		Shared Purple As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &cFF7E79
			End Get
		#tag EndGetter
		Shared Red As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &cEE82EE
			End Get
		#tag EndGetter
		Shared Violet As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &cFFFFFF
			End Get
		#tag EndGetter
		Shared White As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return &cFFFF66
			End Get
		#tag EndGetter
		Shared Yellow As Color
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
