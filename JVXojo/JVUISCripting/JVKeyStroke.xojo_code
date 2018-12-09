#tag Class
Protected Class JVKeyStroke
	#tag Note, Name = Class description
		
		Model class that holds all the data for a keystroke that will be handled by JVSequencer
	#tag EndNote


	#tag Property, Flags = &h0
		delay As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		keyString As String = """"""
	#tag EndProperty

	#tag Property, Flags = &h0
		response As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="delay"
			Group="Behavior"
			InitialValue="-1"
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
			Name="keyString"
			Group="Behavior"
			InitialValue=""""""""""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="response"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
