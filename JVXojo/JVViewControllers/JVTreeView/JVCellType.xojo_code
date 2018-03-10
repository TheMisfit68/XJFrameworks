#tag Class
Protected Class JVCellType
	#tag Method, Flags = &h0
		Sub constructor(type as TYPES, optional lookupValues() as String = nil)
		  me.type =type
		  me.lookupValues = lookupValues
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		lookupValues() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		type As TYPES
	#tag EndProperty


	#tag Enum, Name = TYPES, Type = Integer, Flags = &h0
		PopUpMenu
		  PopupList
		  CheckBox
		  Radiobutton
		  TextField
		TextArea
	#tag EndEnum


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
			Name="lookupValues()"
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
		#tag ViewProperty
			Name="type"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
