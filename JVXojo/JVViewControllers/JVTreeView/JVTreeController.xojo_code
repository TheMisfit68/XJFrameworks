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
		  
		  dim numberOfFields as Integer
		  
		  if node.representedObject isa Dictionary then
		    dim representedObject as Dictionary = node.representedObject
		    numberOfFields = representedObject.keys.ubound+1
		  elseif node.representedObject isa DatabaseRecord then
		    dim representedObject as DatabaseRecord = node.representedObject
		    numberOfFields = representedObject.FieldCount
		  end if
		  // Adjust the number of columns if needed
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
		    
		    dim fieldName as Variant
		    dim fieldValue as  Variant
		    if node.representedObject isa Dictionary then
		      dim representedObject as Dictionary = node.representedObject
		      fieldName = representedObject.key(fieldNumber)
		      fieldValue = representedObject.value(fieldName)
		    elseif node.representedObject isa DatabaseRecord then
		      dim representedObject as DatabaseRecord = node.representedObject
		      fieldName = representedObject.FieldName(fieldNumber)
		      fieldValue = representedObject.Column(fieldName.StringValue)
		    end if
		    
		    treeView.cell(newRowNumber, fieldNumber) = fieldValue.StringValue
		    
		    // Attach each field to the cell
		    dim field as new Dictionary(fieldName: fieldValue)
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
		  // This is a mere test, this code should be refactored out of JVTreecontroller into the application level
		  
		  dim viewOrTabelName as String = "ProjectsList"
		  dim fieldInfo as Dictionary = sender.cellTag(row, column)
		  dim fieldName as String = fieldInfo.Key(0)
		  dim newfieldValue as String = sender.cell(row, column)
		  dim representedObject as NSTreenode = Sender.RowTag(row)
		  
		  dim keyPaths() as integer = representedObject.indexpath
		  dim primaryKeyValue as integer = keyPaths(sender.RowDepth(row))
		  
		  dim sourceInfo as Dictionary = app.dataModel.aliasSchema.value(viewOrTabelName+"."+fieldName)
		  dim sourceTable as String = sourceInfo.Value("table")
		  dim sourcField as String = sourceInfo.Value("field")
		  dim pkFieldName as String = app.dataModel.pkForTable(sourceTable)
		  
		  
		  dim request as new DatabaseRecord
		  request.IntegerColumn(pkFieldName) = primaryKeyValue
		  
		  dim record as new DatabaseRecord
		  record.Column(sourcField) = newfieldValue
		  
		  // Perform the update
		  app.dataModel.goToLayoutOrView(sourceTable)
		  app.dataModel.enterMode(JVFPProxy.MODES.Find)
		  app.dataModel.addRequest(request)
		  app.dataModel.executeFind
		  
		  dim test as Integer = app.dataModel.editRecord(record)
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
