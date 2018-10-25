#tag Class
Protected Class JVTableViewController
Implements JVTableViewDataSource,JVTableViewDelegate
	#tag Method, Flags = &h0
		Function cellType(fieldName as String) As JVCell
		  // Part of the JVTableViewDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(tableView as JVTableView)
		  
		  me .tableView = tableView
		  me.tableView.tableViewDelegate = me
		  // me.arrangedObjects = ??
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editField(row as Integer, column as Integer, field as Pair)
		  // Part of the JVTableViewDataSource interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub formatCell(row as Integer, column as Integer)
		  // Part of the JVTableViewDataSource interface.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onCellAction(sender as JVTableView, row as Integer, column as Integer)
		  
		  dim attachedCell as JVCell = sender.cellTag(row, column)
		  dim fieldName as String = attachedCell.fieldName
		  
		  dim backendFieldValue as Variant = attachedCell.fieldValue
		  dim newFrontFieldValue as Variant = sender.cell(row, column)
		  if sender.CellType(row, column) = Listbox.TypeCheckbox then
		    dim rawFrontValue as Integer = Integer(sender.CellState(row, column))
		    newFrontFieldValue = rawFrontValue
		  end if
		  
		  if newFrontFieldValue <> backendFieldValue then
		    tableView.tableViewDataSource.editField(row, column, fieldName : newFrontFieldValue)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onCellTagAction(sender as JVTableView, row as Integer, column as Integer)
		  
		  dim attachedCell as JVCell = sender.cellTag(row, column)
		  dim fieldName as String = attachedCell.fieldName
		  
		  dim newBackendFieldValue as Variant = attachedCell.fieldValue
		  dim frontFieldValue as Variant = sender.cell(row, column)
		  
		  if newBackendFieldValue <> frontFieldValue then
		    tableView.tableViewDataSource.editField(row, column, fieldName : newBackendFieldValue)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListOpen(sender as JVTableView)
		  
		  syncInterface(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListSelectionDidChange(sender as JVTableView)
		  // Part of the JVTableViewDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub syncInterface(optional up as Boolean = False)
		  // Not yet implemented !!
		End Sub
	#tag EndMethod


	#tag Note, Name = Class description
		
		NOT YET IMPLEMENTED
		
		Handles a non-hiërarchical (flat) tableView a.k.a Listbox
	#tag EndNote


	#tag Property, Flags = &h0
		tableView As JVTableView
	#tag EndProperty


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
