#tag Class
Protected Class JVTreeController
Inherits JVTableViewController
Implements JVTreeViewDelegate,JVTreeViewDataSource
	#tag Method, Flags = &h0
		Function cellType(fieldName as String) As JVCell
		  // Part of the JVTableViewDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(treeView as JVTreeView, arrangedObjects as NSTreeNode)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(treeview)
		  
		  me.treeView.tableViewDelegate = me
		  me.treeView.treeViewDelegate = me
		  
		  me.treeView.tableViewDataSource = me
		  me.treeView.treeviewDataSource = me
		  
		  me.arrangedObjects = arrangedObjects
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteNode(node as NSTreeNode)
		  // Part of the JVTreeViewDataSource interface.
		  
		  
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
		    
		    // Proces the record
		    dim itsAnExpandableNode as Boolean =(treeView.treeViewDataSource.isItemExpandable(node))
		    if   itsAnExpandableNode then // Add an empty Folder or an empty row
		      treeView.AddFolder("")
		    else
		      treeView.AddRow()
		    end if
		    dim newRowNumber as Integer = treeView.LastIndex
		    treeview.RowTag(newRowNumber) = node
		    
		    // Proces the individual fields
		    dim columnNumber as Integer = 0
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
		      
		      dim backendCell as JVCell = cellType(fieldName)
		      backendCell.cellDelegate = me
		      if not (backendCell isa JVHiddenCell) then
		        
		        // Prepare the field in the backend
		        backendCell.listbox = treeview
		        backendCell.fill(fieldName :  fieldValue)
		        treeView.celltag(newRowNumber, columnNumber) = backendCell
		        
		        columnNumber =columnNumber+1
		      end if
		      
		    next
		    
		    // Adjust the number of columns if needed
		    treeView.ColumnCount = Max(columnNumber, treeView.ColumnCount)
		    
		  end  if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editField(row as Integer, column as Integer, field as Pair)
		  
		  dim node as NStreenode = treeview.rowTag(row)
		  treeView.treeViewDataSource.editNode(node, field)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editNode(node as NSTreeNode, fieldToChange as Pair)
		  // Part of the JVTreeViewDataSource interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isItemExpandable(node as NSTreeNode) As Boolean
		  // Part of the JVTreeViewDataSource interface.
		  
		  return (not node.isLeaf) 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onlistCollapseRow(sender as JVTreeView, row as Integer)
		  
		  // Part of the JVTreeViewDelegate interface.
		  if (row >= 0) and (row < sender.ListCount) then
		    
		    if sender.RowIsFolder(row) then
		      
		      dim pathString as String = pathForRow(row)
		      dim index as Integer = expandedNodes.IndexOf(pathString)
		      
		      if index >= 0 then
		        expandedNodes.Remove(index)
		      end if
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onlistDoubleClick(sender as JVTreeView)
		  
		  dim row as Integer = sender.ListIndex
		  if (row >= 0) and (row < sender.ListCount) then
		    
		    if sender.RowIsFolder(row) then
		      sender.Expanded(row) = not sender.Expanded(row) // Toggle the expansion state
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListExpandRow(sender as JVTreeView, row as Integer)
		  // Part of the JVTreeViewDelegate interface.
		  if (row >= 0) and (row < sender.ListCount) then
		    
		    if sender.RowIsFolder(row) then
		      
		      dim expandedNode as NStreeNode = sender.RowTag(row)
		      For each childNode as NSTreeNode in expandedNode.children
		        displayNode(childNode)
		      next
		      
		      // Remember this row as being expanded
		      dim pathString as String = pathForRow(row)
		      dim index as Integer = expandedNodes.IndexOf(pathString)
		      
		      if index < 0 then
		        expandedNodes.append(pathString)
		      end if
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onlistmouseMove(sender as JVTreeView, x as Integer, y as Integer)
		  
		  dim row as Integer = sender.RowFromXY(x, y)
		  dim column as Integer = sender.ColumnFromXY(x, y)
		  
		  if (row >= 0) and (row < sender.ListCount) and (column >= 0) and (column < sender.ColumnCount) then
		    
		    dim backendCell as JVCell = sender.celltag(row, column)
		    
		    if backendCell <> nil then
		      
		      dim tooltipText as String = backendCell.name
		      
		      dim parentView as Window = sender.Window
		      dim cursorX as Integer = parentView.left+sender.left+x
		      dim cursorY as Integer = parentView.top+sender.top+y
		      
		      while parentView <> sender.TrueWindow
		        dim embeddedView as ContainerControl = ContainerControl(parentView)
		        parentView = embeddedView.window
		        cursorX = cursorX + parentView.left
		        cursorY = cursorY + parentView.top
		      wend
		      
		      tooltip.show(tooltipText, cursorX+10, cursorY+10)
		      
		    else
		      
		      tooltip.hide
		      
		    end if
		    
		  else
		    
		    tooltip.hide
		    
		  end if
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListSelectionDidChange(sender as JVTableView)
		  // Part of the JVTableViewDelegate interface.
		  
		  dim row as integer = sender.ListIndex
		  
		  if (row >= 0) and (row < sender.ListCount) then
		    selectedNode = sender.rowTag(row)
		    
		    JVDebugger.debuglog("Selecting node "+selectedNode.keyPathString+" @ indexpath "+selectedNode.indexPathString)
		  else
		    selectedNode = nil
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pathForRow(row as Integer) As String
		  
		  if (row >= 0) and (row < treeView.ListCount) then
		    dim node as NSTreeNode = treeView.rowTag(row)
		    return node.indexPathString
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub restoreExpandedNodes()
		  
		  for row as Integer = 0 to treeView.ListCount -1
		    dim pathString as String = pathForRow(row)
		    dim wasExpandedBefore as Boolean = (expandedNodes.IndexOf(pathString) >= 0)
		    treeView.Expanded(row) = wasExpandedBefore
		  next row
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectedIndex(level as Integer) As Integer
		  if (selectedNode <> nil)  and (level<= selectedNode.indexPath.ubound) then
		    return selectedNode.indexPath(level)
		  else
		    return -1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub syncInterface(optional up as Boolean = False)
		  if up then
		    
		    if  arrangedObjects <> nil then
		      
		      // Store the view state before changing anything to the treeView
		      dim originalScrollPosition as Integer = treeView.ScrollPosition
		      dim originalSelection as Integer = treeview.ListIndex
		      
		      // Perform the actual interface update
		      treeView.DeleteAllRows
		      dim nodesToDisplay() as NSTreeNode = arrangedObjects.children
		      For each node as NSTreeNode in nodesToDisplay
		        displayNode(node)
		      next
		      
		      
		      // Restore the view state
		      restoreExpandedNodes
		      treeView.ListIndex = originalSelection
		      treeView.ScrollPosition = originalScrollPosition
		      
		    else
		      
		      treeView.DeleteAllRows
		      
		    end if
		    
		  else
		    
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Class Description
		
		JVTreeController is class that handles a JVTreeView (a.k.a a hiërchical listbox) on behalf of a viewcontroller.
		
		The controller needs a NSTreeNode as its datasource wich gets attached to the property 'arrangedObjects'
		
		This class is a superclass for the JVDatabaseTreeController
		
	#tag EndNote


	#tag Property, Flags = &h0
		arrangedObjects As NSTreeNode
	#tag EndProperty

	#tag Property, Flags = &h0
		destinationRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		expandedNodes() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedNode As NSTreeNode
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return JVTreeView(tableView)
			End Get
		#tag EndGetter
		treeView As JVTreeView
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="destinationRow"
			Group="Behavior"
			Type="Integer"
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
