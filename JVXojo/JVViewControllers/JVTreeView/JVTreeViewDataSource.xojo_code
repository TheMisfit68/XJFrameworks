#tag Interface
Protected Interface JVTreeViewDataSource
Implements JVTableViewDataSource
	#tag Method, Flags = &h0
		Sub deleteNode(node as NSTreeNode)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editNode(node as NSTreeNode, fieldToChange as Pair)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isItemExpandable(node as NSTreeNode) As Boolean
		  
		End Function
	#tag EndMethod


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
