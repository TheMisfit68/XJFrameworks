#tag Class
Protected Class JVTableViewController
Implements JVTableViewDataSource,JVTableViewDelegate
	#tag Method, Flags = &h0
		Function cellType(fieldName as String) As JVCustomCell
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
		Sub onCellAction(sender as JVTableView, row as Integer, column as Integer)
		  
		  dim backendField as Pair = sender.cellTag(row, column)
		  dim backendFieldName as String = backendField.left
		  dim backendFieldValue as Variant = backendField.right
		  
		  dim frontendFieldName as String = backendFieldName
		  dim frontendFieldValue as Variant = sender.cell(row, column)
		  if sender.CellType(row, column) = Listbox.TypeCheckbox then
		    dim rawValue as Integer = Integer(sender.CellState(row, column))
		    frontendFieldValue = rawValue
		  end if
		  
		  dim  frontendField as Pair =  frontendFieldName : frontendFieldValue
		  
		  if frontendFieldValue <> backendFieldValue then
		    tableView.tableViewDataSource.editField(row, column, frontendField)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onCellTagAction(sender as JVTableView, row as Integer, column as Integer)
		  
		  dim backendField as Pair = sender.cellTag(row, column)
		  dim backendFieldName as String = backendField.left
		  dim backendFieldValue as Variant = backendField.right
		  
		  dim frontendFieldName as String = backendFieldName
		  dim frontendFieldValue as Variant = sender.cell(row, column)
		  dim  frontendField as Pair =  frontendFieldName : frontendFieldValue
		  
		  if backendFieldValue <> frontendFieldValue then
		    tableView.tableViewDataSource.editField(row, column, backendField)
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
