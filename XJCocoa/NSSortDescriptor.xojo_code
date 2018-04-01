#tag Class
Protected Class NSSortDescriptor
	#tag Method, Flags = &h0
		Sub constructor(sortKey as String, optional ascending as Boolean = True)
		  me.sortKey = sortKey
		  me.ascending = ascending
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ascending As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		sortKey As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ascending"
			Group="Behavior"
			Type="Boolean"
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
			Name="sortKey"
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
