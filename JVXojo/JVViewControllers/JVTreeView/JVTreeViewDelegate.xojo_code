#tag Interface
Protected Interface JVTreeViewDelegate
	#tag Method, Flags = &h0
		Sub onCellAction(sender as JVTreeview, row as Integer, column as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListCollapseRow(sender as JVTreeView, row as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListDoubleClick(sender as JVTreeView)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListExpandRow(sender as JVTreeView, row as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListOpen(sender as JVTreeView)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListSelectionDidChange(sender as JVTreeView)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Protocol description
		Defines the protocol all JVTreeView-delegates must conform to
		
		
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
