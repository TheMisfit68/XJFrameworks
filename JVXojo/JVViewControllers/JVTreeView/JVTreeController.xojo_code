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

	#tag Method, Flags = &h1
		Protected Sub displayNode(node as NSTreeNode)
		  
		  if node <> nil then
		    
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
		      dim field as  Pair =  fieldName: fieldValue
		      treeview.cellTag(newRowNumber, fieldNumber) = field
		      
		    next
		    
		  end  if
		  
		  
		  
		  
		  
		  
		  
		  
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
		  
		  dim currentNode as NSTreeNode = sender.rowtag(row)
		  dim previousField as Pair = sender.cellTag(row, column)
		  dim previousFieldName as String = previousField.left
		  dim previousFieldValue as Variant = previousField.right
		  
		  dim changedFieldName as String = previousFieldName
		  dim changedFieldValue as Variant = sender.cell(row, column)
		  dim  changedField as Pair =  changedFieldName : changedFieldValue
		  
		  if changedFieldValue <> previousField then
		    sender.treeViewDataSource.editNode(currentnode, changedField)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onlistCollapseRow(sender as JVTreeView, row as Integer)
		  
		  // Part of the JVTreeViewDelegate interface.
		  
		  if sender.RowIsFolder(row) then
		    
		    dim collapsedNode as NStreeNode = sender.RowTag(row)
		    dim indexString as String = collapsedNode.indexString
		    dim index as Integer = expandedNodes.IndexOf(indexString)
		    
		    if index <= 0 then
		      expandedNodes.Remove(index)
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
		    
		    dim expandedNode as NStreeNode = sender.RowTag(row)
		    For each childNode as NSTreeNode in expandedNode.children
		      displayNode(childNode)
		    next
		    
		    dim indexString as String = expandedNode.indexString
		    dim index as Integer = expandedNodes.IndexOf(indexString)
		    
		    if index < 0 then
		      expandedNodes.append(indexString)
		    end if
		    
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
		    selectedNode = treeView.rowTag(sender.ListIndex)
		  else
		    selectedNode = nil
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub restoreExpandedNodes()
		  
		  
		  for row as Integer = 0 to treeView.ListCount -1
		    dim node as NSTreeNode = treeview.RowTag(row)
		    dim indexString as String = node.indexString
		    dim wasExpandedBefore as Boolean = (expandedNodes.IndexOf(indexString) >= 0)
		    treeView.Expanded(row) = wasExpandedBefore
		  next row
		  
		  
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
		      
		      restoreexpandedNodes
		      
		    end if
		    
		  else
		    
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Class Description
		
		JVTreeController is class that handles a JVTreeView (a.k.a a hiërchical listbox) on behalf of a viewcontroller.
		
		The controller needs a NSTreeNode as its datasource wich gets attached to the property 'arrangedObjects'
		The constructors for NSTreeNode create a hiërarchical node-tree from a flat source (e.g. a recordset)
	#tag EndNote


	#tag Property, Flags = &h0
		arrangedObjects As NSTreeNode
	#tag EndProperty

	#tag Property, Flags = &h0
		expandedNodes() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedNode As NSTreeNode
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
