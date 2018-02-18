#tag Class
Protected Class JVTreeController
Implements JVTreeViewDelegate
	#tag Method, Flags = &h0
		Function child(index As Integer, item as Variant) As Variant
		  // Part of the JVTreeViewDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(treeView as JVTreeView, arrangedObjects as NSTreeNode)
		  me.treeView = treeView
		  
		  treeView.owner = me
		  treeView.treeViewDelegate = me
		  
		  me.arrangedObjects = arrangedObjects
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub displayNode(node as NSTreeNode)
		  // Adjust the number of columns if needed
		  dim numberOfFields as Integer = node.representedObject.keys.ubound+1
		  treeView.ColumnCount = Max(treeView.ColumnCount, numberOfFields)
		  
		  
		  // Proces the record
		  dim itsaParentNode as Boolean = not node.isLeaf
		  if   itsaParentNode then // Add an empty Folder or an empty row
		    treeView.AddFolder("")
		  else
		    treeView.AddRow()
		  end if
		  dim newRowNumber as Integer = treeView.LastIndex
		  treeview.RowTag(newRowNumber) = node
		  
		  
		  // Proces the individual fields
		  for  fieldNumber as Integer = 0 to numberOfFields-1
		    
		    dim key as Variant = node.representedObject.key(fieldNumber)
		    dim value as  Variant = node.representedObject.value(Key)
		    
		    treeView.cell(newRowNumber, fieldNumber) = value
		    
		    // Attach each field to the cell
		    dim field as  new Dictionary(key: value)
		    treeview.cellTag(newRowNumber, fieldNumber) = field
		    // and optionaly document each cell with the fieldName
		    // treeView.CellHelpTag(newRowNumber, fieldNumber) = key
		    
		  next
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isItemExpandable(item as Variant) As Boolean
		  // Part of the JVTreeViewDataSource interface.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function numberOfChildren(item as Variant) As Integer
		  // Part of the JVTreeViewDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onCellAction(sender as JVTreeview, row as Integer, column as Integer)
		  
		  
		  if row < treeView.listcount then
		    
		    dim fieldInfo as Dictionary = treeView.CellTag(row, column)
		    
		    if fieldInfo <> nil then
		      
		      dim fieldAliasName as STring = fieldInfo.key(0)
		      dim tableName as String = treeView.treeViewDataSource.sourceField(fieldAliasName)
		      
		      
		      
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onlistDoubleClick(sender as JVTreeView)
		  
		  dim rowNumber as Integer = treeView.ListIndex
		  
		  if treeview.RowIsFolder(rowNumber) then
		    treeView.Expanded(rowNumber) = not treeView.Expanded(rowNumber) // Toggle the expansion state
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListExpandRow(sender as JVTreeView, row as Integer)
		  // Part of the JVTreeViewDelegate interface.
		  
		  if sender.RowIsFolder(row) then
		    
		    dim parentNode as NStreeNode = sender.RowTag(row)
		    For each childNode as NSTreeNode in parentNode.children
		      displayNode(childNode)
		    next
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListOpen(sender as JVTreeView)
		  
		  syncInterface(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListSelectionDidChange(sender as JVTreeView)
		  // Part of the JVTreeViewDelegate interface.
		  
		  if sender.ListIndex >= 0 and sender.ListIndex < sender.ListCount then
		    selectedObject = treeView.rowTag(sender.ListIndex)
		  else
		    selectedObject = nil
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectItem(list as JVTreeView, data as RecordSet, optional selectAtIndentLevel as Integer = 0) As dictionary
		  // data.MoveFirst
		  // 
		  // dim parentRowAtSelectionLevel as Integer
		  // dim parentAtSelectionLevel as new dictionary
		  // dim selection as new dictionary
		  // 
		  // for  rowNumber as integer = 0 to list.ListCount-1
		  // 
		  // dim indentLevel as Integer
		  // dim rowInfo as Dictionary = list.rowtag(rowNumber)
		  // if (rowInfo <> nil) and rowInfo.HasKey("indentLevel") then
		  // indentLevel = rowInfo.value("indentLevel")
		  // end if
		  // 
		  // if list.RowIsFolder(rownumber) and (indentLevel=selectAtIndentLevel) then
		  // 
		  // parentRowAtSelectionLevel = rowNumber
		  // 
		  // // Uncheck the parentfolder and
		  // if list.ColumnType(parentRowAtSelectionLevel) = listbox.TypeCheckbox then
		  // list.CellState(parentRowAtSelectionLevel, 0) = CheckBox.CheckedStates.UnChecked
		  // end if
		  // 
		  // for fieldNumber as integer = 1 to data.FieldCount
		  // dim fieldName as Variant = data.IdxField(fieldNumber).name
		  // dim fieldValue as Variant = data.IdxField(fieldNumber)
		  // parentAtSelectionLevel.Value(fieldName) = fieldValue
		  // next
		  // 
		  // data.MovePrevious // Set the datapointer before  the beginning of the first child, there are no extra extra records for the enclosing folders
		  // 
		  // if list.Expanded(parentRowAtSelectionLevel) = FALSE then
		  // // Skip data for child rows dat are invisible/collapsed and therefore will not be processed
		  // if list.rowtag(rownumber) <> nil then
		  // dim hiddenChildrows(-1,-1) as String = list.RowTag(rownumber)
		  // for hiddenChildNumber as Integer = 0 to ubound(hiddenChildrows,1)
		  // data.MoveNext
		  // next
		  // end if
		  // 
		  // end if
		  // 
		  // end if
		  // 
		  // 
		  // if list.Selected(rowNumber) then
		  // 
		  // // Check the parentfolder if it has records selected within
		  // if list.ColumnType(parentRowAtSelectionLevel) = listbox.TypeCheckbox then
		  // list.CellState(parentRowAtSelectionLevel, 0) = CheckBox.CheckedStates.Checked
		  // end if
		  // 
		  // // and keep de data that was stored before for the parentlevel
		  // selection =  parentAtSelectionLevel
		  // 
		  // // Log each selection during debugging, since this is a complicated method
		  // #if DebugBuild then
		  // dim logValues() as String
		  // for each key as string in selection.Keys 
		  // logValues.Append(key+" = "+selection.value(key))
		  // next
		  // system.DebugLog("Selected record: "+join(logValues, ", "))
		  // #endif
		  // 
		  // end if
		  // 
		  // data.MoveNext  // Move to the next visible record
		  // next
		  // 
		  // return selection
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub syncInterface(optional up as Boolean = False)
		  if up then
		    
		    if  arrangedObjects <> nil then
		      
		      treeView.DeleteAllRows
		      dim nodesToDisplay() as NSTreeNode = arrangedObjects.children
		      For each node as NSTreeNode in nodesToDisplay
		        displayNode(node)
		      next
		      
		    end if
		    
		  else
		    
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		arrangedObjects As NSTreeNode
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedObject As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		treeView As JVTreeView
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
