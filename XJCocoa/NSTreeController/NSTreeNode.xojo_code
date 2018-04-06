#tag Class
Protected Class NSTreeNode
Implements JVCustomStringConvertable
	#tag Method, Flags = &h0
		Function addChild(child as NStreeNode) As NSTreeNode
		  //Set the childs properties based on the parent
		  child.parent = me
		  for each component as Integer in indexPath
		    child.indexPath.Append(component)
		  next component
		  
		  // Add the child to the parent
		  me.children.Append(child)
		  
		  // and move the indexpath down to the next level
		  child.indexPath.Append(children.ubound+1)
		  
		  return child
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(records as Recordset)
		  // Create a basenode to be used as a container for the actual nodes
		  dim  baseNode as  NSTreeNode = me
		  baseNode.parent = nil
		  
		  dim currentNode as  NSTreeNode
		  dim currentkeyPathString as String
		  
		  // For every record that was found
		  records.MoveFirst
		  While Not records.EOF
		    
		    dim columns() as Pair
		    
		    // Create a new child for the base node
		    dim newNode as new NSTreeNode(new DatabaseRecord)
		    currentNode =  baseNode.addChild(newNode)
		    
		    // Add every field
		    for fieldNumber as Integer = 1 to records.FieldCount
		      
		      dim currentField as DatabaseField = records.IdxField(fieldNumber)
		      dim fieldName as String = currentField.Name
		      dim fieldValue as Variant = currentField.Value
		      
		      if fieldName.contains("keyPath") then
		        currentkeyPathString = fieldValue // When you come across an keypath store it for later use
		      else
		        columns.Append(fieldName : fieldValue) // Store the data of an field to capture
		      end if
		      
		    next fieldNumber
		    
		    // Add any captured columns to the new node
		    if (columns.Ubound>=0) then
		      // Reverse te order while adding te columns because they are always inserted at index 0
		      for reverseColumNumber as Integer = columns.Ubound to 0 step -1
		        dim columnName as String = columns(reverseColumNumber).left
		        dim columnValue as String = columns(reverseColumNumber).Right
		        dim representedObject as DatabaseRecord =currentNode.representedObject
		        representedObject.Column(columnName) = columnValue
		      next reverseColumNumber
		      redim columns(-1)
		    end if
		    
		    // And add the keypath if it was found
		    if currentkeyPathString <> "" then
		      dim keys() as String = split(currentkeyPathString,".")
		      dim keyForBranch as Integer = val(keys(0))
		      currentNode.keyPath.append(keyForBranch)
		    end if
		    
		    records.MoveNext
		  wend
		  
		  records.MoveFirst // Reset the cursor
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(records as Recordset, branchFields() as String)
		  // Create a basenode to be used as a container for the actual nodes
		  dim  baseNode as  NSTreeNode = me
		  baseNode.parent = nil
		  
		  dim activeBranchNumber as Integer = 0
		  dim activeBranches() as NSTreeNode
		  dim activeBranchValues() as Variant
		  for i as Integer = 0 to branchFields.Ubound
		    keyPath.append(0)
		    activeBranches.append(baseNode)
		    activeBranchValues.Append(nil)
		  next
		  
		  dim currentNode as  NSTreeNode
		  dim currentkeyPathString as String
		  
		  // For every record that was found
		  records.MoveFirst
		  While Not records.EOF
		    
		    Dim branchIsActive as Boolean = False
		    dim columns() as Pair
		    
		    // Proces every field
		    for fieldNumber as Integer = 1 to records.FieldCount
		      
		      dim currentField as DatabaseField = records.IdxField(fieldNumber)
		      dim fieldName as String = currentField.Name
		      dim fieldValue as Variant = currentField.Value
		      dim matchingBranch as Integer= branchFields.IndexOf(fieldName)
		      dim itsaBranchField as Boolean = matchingBranch >=0
		      
		      // Changes within a branchField make the branch active
		      if  itsaBranchField and not branchIsActive  then 
		        
		        if (fieldValue <> activeBranchValues(matchingBranch)) then
		          branchIsActive =  True
		          activeBranchNumber = matchingBranch
		          activeBranchValues(activeBranchNumber) = fieldValue
		        end if
		        
		      end if
		      
		      if fieldName.contains("keyPath") then
		        currentkeyPathString = fieldValue     // When you come across an keypath store it for later use
		      elseif branchIsActive then
		        columns.Append(fieldName : fieldValue)  // Store the data of an active branch
		      end if
		      
		      // Look ahead to the next field to predict the end of a branch
		      dim lastFieldOfCurrentBranch as Boolean =False
		      if branchIsActive then
		        if (fieldNumber = records.FieldCount) then
		          lastFieldOfCurrentBranch = True
		        else
		          dim nextField as DatabaseField = records.IdxField(fieldNumber+1)
		          dim nextFieldName as String = nextField.Name
		          dim nextFieldValue as Variant = nextField.value
		          dim nextFieldIsBranchField as Boolean = (branchFields.IndexOf(nextFieldName)>=0)
		          lastFieldOfCurrentBranch = nextFieldIsBranchField
		        end if
		      end if
		      
		      // At the end of each branch store the data in a new TreeNode
		      if lastFieldOfCurrentBranch then
		        
		        // Create a new child for the current parent
		        dim newNode as new NSTreeNode(new DatabaseRecord)
		        dim currentParent as NSTreeNode = nil
		        dim parentBranchNumber as Integer = activeBranchNumber-1
		        if  (activeBranchNumber > 0) then
		          while (currentParent = nil) and (parentBranchNumber >= 0)
		            currentParent = activeBranches(parentBranchNumber)
		            parentBranchNumber= parentBranchNumber-1
		          wend
		        end if
		        if currentParent  = nil then
		          currentParent = baseNode
		        end if
		        currentNode =  currentParent.addChild(newNode)
		        
		        // Add any captured columns to the new node
		        if (columns.Ubound>=0) then
		          // Reverse te order while adding te columns because they are always inserted at index 0
		          for reverseColumNumber as Integer = columns.Ubound to 0 step -1
		            dim columnName as String = columns(reverseColumNumber).left
		            dim columnValue as String = columns(reverseColumNumber).Right
		            dim representedObject as DatabaseRecord =currentNode.representedObject
		            representedObject.Column(columnName) = columnValue
		          next reverseColumNumber
		          redim columns(-1)
		        end if
		        
		        // And add the keypath if it was found
		        if currentkeyPathString <> "" then
		          dim keys() as String = split(currentkeyPathString,".")
		          dim keyForBranch as Integer
		          for branchNumber as Integer = 0 to activeBranches.Ubound
		            if  (branchNumber <= activeBranchNumber) and (branchNumber <= keys.Ubound) then
		              keyForBranch = val(keys(branchNumber))
		            else
		              keyForBranch = 0
		            end if
		            currentNode.keyPath.append(keyForBranch)
		          next branchNumber
		        end if
		        
		        
		        // Adjust the current branches to the current node
		        activeBranches(activeBranchNumber) = currentNode
		        // and subbranches
		        for subBrancheNumber as Integer= activeBranchNumber+1 to activeBranches.Ubound
		          activeBranches(subBrancheNumber) = nil
		          activeBranchValues(subBrancheNumber) = nil
		        next
		        
		        branchIsActive = False
		      end if
		      
		      
		    next fieldNumber
		    
		    records.MoveNext
		  Wend
		  
		  records.MoveFirst // Reset the cursor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(representedObject as Variant=nil)
		  
		  me.representedObject = representedObject
		  
		  dim emptyArray() as NSTreeNode
		  me.children = emptyArray
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function description() As String
		  // Part of the JVCustomStringConvertable interface.
		  
		  dim myIndexPath as String
		  for each index as Integer in indexPath
		    myIndexPath = myIndexPath+Str(index)+EndOfLine
		  next
		  
		  for each child as NSTreeNode in children
		    myIndexPath = myIndexPath+child.description
		  next
		  
		  return myIndexPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function itemAtIndexPath(indexPath() as Integer) As NSTreeNode
		  
		  if indexPath.ubound >= 1 then
		    
		    dim currentIndex as Integer = indexPath(0)-1
		    indexpath.Remove(0)
		    return children(currentIndex).itemAtIndexPath(indexpath)
		    
		  elseif indexPath.ubound = 0 then
		    
		    // end recursion
		    dim currentIndex as Integer = indexPath(0)-1
		    return me.children(currentIndex) 
		    
		  else 
		    
		    return nil
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Class description
		
		An NSTreeNode provides an hiërarchical tree of objects that each contain 
		an representedObject 
		an indexpath to describe their place in the tree
		and a keypath to represent their place in the backend dbase
		
		NSTreeNode are used as the model layer for JVTreeViews and  to build hiërarchical menu's
		
		NSTreeNode can be constructed from a recordset for convinience
		
	#tag EndNote


	#tag Property, Flags = &h0
		children() As NSTreeNode
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  dim lastFilledKey as Integer = 0
			  for each key as Integer in keypath
			    if key <> 0 then
			      lastFilledKey = key
			    end if
			  next key
			  
			  Return lastFilledKey
			End Get
		#tag EndGetter
		finalKey As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		indexPath() As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  dim pathComponents() as String
			  for each component as Integer in indexPath
			    pathComponents.append(Str(component))
			  next component
			  
			  return  join(pathComponents, ".")
			End Get
		#tag EndGetter
		indexPathString As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return (children.Ubound <0)
			End Get
		#tag EndGetter
		isLeaf As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		keyPath() As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  dim pathComponents() as String
			  for each component as Integer in keyPath
			    pathComponents.append(Str(component))
			  next component
			  
			  return  join(pathComponents, ".")
			End Get
		#tag EndGetter
		keyPathString As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		parent As NSTreeNode
	#tag EndProperty

	#tag Property, Flags = &h0
		representedObject As Variant
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="finalKey"
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
			Name="indexPathString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isLeaf"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="keypathString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
