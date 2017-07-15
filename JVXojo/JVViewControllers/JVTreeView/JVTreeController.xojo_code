#tag Class
Protected Class JVTreeController
Implements JVTreeViewDelegate
	#tag Method, Flags = &h0
		Sub addFolder(optional rowText as String = "")
		  // Add a folder alongside the current row
		  Dim selectedRow As Integer = treeView.listIndex
		  
		  If selectedRow >= 0 Then
		    
		    dim rowNode as NSTreeNode = treeView.RowTag(selectedRow)
		    
		    // Get row indent level
		    Dim indexPath As NSIndexPath
		    dim indexSection as integer
		    if indexPath <> nil then
		      indexPath = rowNode.indexPath
		    Else
		      indexPath = new NSIndexPath(0,0)
		    end if
		    indexSection= indexPath.section
		    treevIew.InsertFolder(selectedRow+1, rowText,  indexSection+1)
		    
		    dim newRowNode as new NSTreeNode(nil)
		    newRowNode.indexPath = new NSIndexPath(0, indexSection+1)
		    treeView.RowTag(selectedRow+1) = newRowNode
		    
		  Else
		    
		    treeView.AddFolder(rowText)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(treeView as JVTreeView)
		  me.treeView = treeView
		  
		  treeView.owner = me
		  treeView.treeViewDelegate = me
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createTreeNodeFromData()
		  
		  dim indentLevels() as Integer
		  dim currentIndexLevel as Integer = 0
		  
		  dim numberOfDataFields as integer = data.FieldCount
		  dim previousTableName as String = ""
		  
		  for  fieldNumber as Integer = 1 to numberOfDataFields
		    dim tableName as String = ""
		    
		    dim fieldName as String = data.IdxField(fieldNumber).Name
		    system.DebugLog(fieldName)
		    
		    if fieldName.contains(".") then
		      dim fieldSections() as String = split(fieldName,".")
		      tableName = fieldSections(0)
		    end if
		    
		    if tableName <> previousTableName then
		      currentIndexLevel = currentIndexLevel+1
		    end if
		    
		    indentLevels.Append(currentIndexLevel)
		    previousTableName = tableName
		  next
		  
		  for each indentLevel as Integer in indentLevels
		    system.DebugLog(str(indentLevel))
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onListExpandRow(sender as JVTreeView, row as Integer)
		  // Part of the JVTreeViewDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectItem(list as JVTreeView, data as RecordSet, optional selectAtIndentLevel as Integer = 0) As dictionary
		  data.MoveFirst
		  
		  dim parentRowAtSelectionLevel as Integer
		  dim parentAtSelectionLevel as new dictionary
		  dim selection as new dictionary
		  
		  for  rowNumber as integer = 0 to list.ListCount-1
		    
		    dim indentLevel as Integer
		    dim rowInfo as Dictionary = list.rowtag(rowNumber)
		    if (rowInfo <> nil) and rowInfo.HasKey("indentLevel") then
		      indentLevel = rowInfo.value("indentLevel")
		    end if
		    
		    if list.RowIsFolder(rownumber) and (indentLevel=selectAtIndentLevel) then
		      
		      parentRowAtSelectionLevel = rowNumber
		      
		      // Uncheck the parentfolder and
		      if list.ColumnType(parentRowAtSelectionLevel) = listbox.TypeCheckbox then
		        list.CellState(parentRowAtSelectionLevel, 0) = CheckBox.CheckedStates.UnChecked
		      end if
		      
		      for fieldNumber as integer = 1 to data.FieldCount
		        dim fieldName as Variant = data.IdxField(fieldNumber).name
		        dim fieldValue as Variant = data.IdxField(fieldNumber)
		        parentAtSelectionLevel.Value(fieldName) = fieldValue
		      next
		      
		      data.MovePrevious // Set the datapointer before  the beginning of the first child, there are no extra extra records for the enclosing folders
		      
		      if list.Expanded(parentRowAtSelectionLevel) = FALSE then
		        // Skip data for child rows dat are invisible/collapsed and therefore will not be processed
		        if list.rowtag(rownumber) <> nil then
		          dim hiddenChildrows(-1,-1) as String = list.RowTag(rownumber)
		          for hiddenChildNumber as Integer = 0 to ubound(hiddenChildrows,1)
		            data.MoveNext
		          next
		        end if
		        
		      end if
		      
		    end if
		    
		    
		    if list.Selected(rowNumber) then
		      
		      // Check the parentfolder if it has records selected within
		      if list.ColumnType(parentRowAtSelectionLevel) = listbox.TypeCheckbox then
		        list.CellState(parentRowAtSelectionLevel, 0) = CheckBox.CheckedStates.Checked
		      end if
		      
		      // and keep de data that was stored before for the parentlevel
		      selection =  parentAtSelectionLevel
		      
		      // Log each selection during debugging, since this is a complicated method
		      #if DebugBuild then
		        dim logValues() as String
		        for each key as string in selection.Keys 
		          logValues.Append(key+" = "+selection.value(key))
		        next
		        system.DebugLog("Selected record: "+join(logValues, ", "))
		      #endif
		      
		    end if
		    
		    data.MoveNext  // Move to the next visible record
		  next
		  
		  return selection
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		data As recordset
	#tag EndProperty

	#tag Property, Flags = &h21
		Private treeView As JVTreeView
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
