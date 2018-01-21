#tag Interface
Protected Interface JVTreeViewDataSource
	#tag Method, Flags = &h0
		Function child(index As Integer, item as Variant) As Variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isItemExpandable(item as Variant) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function numberOfChildren(item as Variant) As Integer
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Protocol description
		Defines the protocol all JVTreeView-dataSources must conform to
		
		
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
