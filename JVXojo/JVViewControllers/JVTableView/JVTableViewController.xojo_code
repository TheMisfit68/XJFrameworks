#tag Class
Protected Class JVTableViewController
Implements JVTableViewDataSource,JVTableViewDelegate,JVCellDelegate
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
		  
		  dim backendCell as JVCell = sender.cellTag(row, column)
		  
		  If backendCell isa JVCheckBoxCell then
		    backendCell.representation = sender.CellState(row, column)
		  else
		    backendCell.representation = sender.cell(row, column)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function onCellClick(sender as JVTableView, row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  if (row >= 0 ) and (row < sender.listCount) and (column >=0) and (column < sender.ColumnCount) then
		    
		    // In an hiërarchical cell leave some extra space for the disclosure triangle
		    if sender.Hierarchical and (column = 0)  and sender.RowIsFolder(row) and (x < (sender.rowdepth(row)+1)*15) then
		      
		      return False
		      
		    elseif sender.Hierarchical and (column = 0)  and not sender.RowIsFolder(row) and (x < (sender.rowdepth(row))*15) then
		      
		      return False
		      
		    else
		      
		      dim backendCell as JVCell = sender.cellTag(row, column)
		      if  backendCell isa JVCell then
		        
		        backendCell.updateRowAndColumn(row : column)
		        return backendCell.activate(x, y)
		        
		      else
		        
		        return False
		        
		      end if
		      
		      
		    end if
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onCellValueHasChanged(sender as JVCell, newValue as Variant)
		  // Part of the JVCellDelegate interface.
		  
		  dim changedCell as JVcell = sender
		  tableView.tableViewDataSource.editField(changedCell.row, changedCell.column, changedCell.name : newValue)
		  
		  tableView.InvalidateCell(changedCell.row, changedCell.column)
		  
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
