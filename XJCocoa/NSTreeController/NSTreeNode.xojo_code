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
		Sub constructor(records as Recordset, optional keypathFieldName as String ="keyPath")
		  // Create a basenode to be used as a container for the actual nodes
		  dim  baseNode as  NSTreeNode = me
		  baseNode.parent = nil
		  
		  dim currentNode as  NSTreeNode
		  dim currentkeyPathString as String
		  
		  // For every record that was found
		  records.MoveFirst
		  While Not records.EOF
		    
		    dim reverseColumns() as Pair
		    
		    // Create a new child for the base node
		    dim newNode as new NSTreeNode(new DatabaseRecord)
		    currentNode =  baseNode.addChild(newNode)
		    
		    // Add every field
		    for fieldNumber as Integer = 1 to records.FieldCount
		      
		      dim currentField as DatabaseField = records.IdxField(fieldNumber)
		      dim fieldName as String = currentField.Name
		      dim fieldValue as Variant = currentField.Value
		      
		      if fieldName.contains(keypathFieldName) then
		        currentkeyPathString = fieldValue // When you come across a keypath store it for later use
		      else
		        reverseColumns.Append(fieldName : fieldValue) // Store the data of an field to capture
		      end if
		      
		    next fieldNumber
		    
		    
		    // Add any captured columns to the node
		    if (reverseColumns.Ubound>=0) then
		      // Reverse te order while adding te columns because they are always inserted at index 0
		      for reverseColumNumber as Integer = reverseColumns.Ubound to 0 step -1
		        dim columnName as String = reverseColumns(reverseColumNumber).left
		        dim columnValue as String = reverseColumns(reverseColumNumber).Right
		        dim representedObject as DatabaseRecord =currentNode.representedObject
		        representedObject.Column(columnName) = columnValue
		      next reverseColumNumber
		      redim reverseColumns(-1)
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
		Sub constructor(records as Recordset, branchFields() as String, optional keypathFieldName as String ="keyPath")
		  // Create a basenode to be used as a container for the actual nodes
		  dim  baseNode as  NSTreeNode = me
		  baseNode.parent = nil
		  dim currentBranches() as NSTreeNode
		  dim currentBranchValues() as Variant
		  for i as Integer = 0 to branchFields.Ubound
		    currentBranches.append(baseNode)
		    currentBranchValues.Append(nil)
		  next
		  
		  dim currentNode as  NSTreeNode
		  dim currentkeyPathString as String
		  
		  // For every record that was found
		  records.MoveFirst
		  While Not records.EOF
		    
		    dim currentField as DatabaseField
		    dim nextField as DatabaseField
		    dim startBranch as Boolean = False
		    dim activeBranch as Boolean = False
		    dim endBranch as Boolean = False
		    dim currentBranchNumber as Integer
		    dim reverseColumns() as Pair
		    
		    // Proces every field
		    for fieldNumber as Integer = 1 to records.FieldCount
		      
		      // Evaluate the current field
		      currentField  = records.IdxField(fieldNumber)
		      dim currentFieldName as String = currentField.Name
		      dim currentFieldValue as Variant = currentField.Value
		      
		      dim currentFieldBranchNumber as Integer = branchFields.IndexOf(currentFieldName)
		      dim currentFieldIsaBranchField as Boolean = currentFieldBranchNumber >=0
		      startBranch = currentFieldIsaBranchField and (currentFieldValue.StringValue <> "") and (currentFieldValue <> currentBranchValues(currentFieldBranchNumber))
		      
		      // Get some info about the next field upfront
		      dim nextFieldNumberWithinBounds as Integer = Min(fieldNumber+1, records.FieldCount)
		      nextField = records.IdxField(nextFieldNumberWithinBounds)
		      dim nextFieldName as String = nextField.Name
		      dim nextFieldValue as Variant = nextField.Value
		      
		      dim nextFieldBranchNumber as Integer = branchFields.IndexOf(nextFieldName)
		      dim nextFieldisaBranchField as Boolean = nextFieldBranchNumber >= 0
		      endBranch =  nextFieldisaBranchField or (fieldNumber = records.FieldCount)
		      
		      // Keep track of any changes from branch to branch
		      if  currentFieldIsaBranchField then
		        currentBranchNumber = currentFieldBranchNumber
		        currentBranchValues(currentBranchNumber) = currentFieldValue
		      end if
		      
		      // Remember the keyPath at the start of each record
		      if currentFieldName.contains(keypathFieldName)  then
		        currentkeyPathString = currentFieldValue   // When you come across an keypath store it for later use
		      end if
		      
		      if startBranch then
		        activeBranch = True
		        
		        // Find a valid parent for the current branch 
		        dim currentParent as NSTreeNode = nil
		        
		        for parentBranchNumber as Integer = 0 to currentBranchNumber-1
		          dim currentBranchValue as variant = currentBranchValues(parentBranchNumber) 
		          dim currentParentName as String = branchFields(parentBranchNumber)
		          dim currentParentValue as Variant = records.Field(currentParentName).value
		          
		          if currentParentValue <> currentBranchValue then
		            exit for parentBranchNumber
		          end if
		          
		          if currentBranchValue.StringValue <> "" then
		            currentParent = currentBranches(parentBranchNumber)
		          end if
		          
		        next
		        if currentParent  = nil then
		          currentParent = baseNode
		        end if
		        
		        // and create a new childNode for it
		        dim newNode as new NSTreeNode(new DatabaseRecord)
		        currentNode =  currentParent.addChild(newNode)
		        
		        // Adjust the current branches to the current node
		        if activeBranch then
		          currentBranches(currentBranchNumber) = currentNode
		        end if
		        // and subbranches
		        for subBrancheNumber as Integer= currentBranchNumber+1 to currentBranches.Ubound
		          currentBranches(subBrancheNumber) = nil
		          currentBranchValues(subBrancheNumber) = nil
		        next
		        
		        startBranch = False // Only perform once for each new branch
		      end if
		      
		      // Parse the node itself
		      if activeBranch then
		        reverseColumns.Append(currentFieldName : currentFieldValue)  // Store the data of an active branch
		        
		        if endBranch then
		          activeBranch = False
		          
		          // Add any captured columns to the node
		          if (reverseColumns.Ubound>=0) then
		            // Reverse te order while adding te columns because they are always inserted at index 0
		            for reverseColumNumber as Integer = reverseColumns.Ubound to 0 step -1
		              dim columnName as String = reverseColumns(reverseColumNumber).left
		              dim columnValue as String = reverseColumns(reverseColumNumber).Right
		              dim representedObject as DatabaseRecord =currentNode.representedObject
		              representedObject.Column(columnName) = columnValue
		            next reverseColumNumber
		            redim reverseColumns(-1)
		          end if
		          
		          // And add the keypath if it was found
		          if currentkeyPathString <> "" then
		            dim keys() as String = split(currentkeyPathString,".")
		            dim keyForBranch as Integer
		            for branchNumber as Integer = 0 to currentBranches.Ubound
		              if  (branchNumber <= currentBranchNumber) and (branchNumber <= keys.Ubound) then
		                keyForBranch = val(keys(branchNumber))
		              else
		                keyForBranch = 0
		              end if
		              currentNode.keyPath.append(keyForBranch)
		            next branchNumber
		          end if
		          
		          endBranch = False // Only perform once for each finished branch
		        end if
		        
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
		  if keyPathString <> "" then
		    myIndexPath = keyPathString+"@"+indexPathString+EndOfLine
		  else
		    myIndexPath = indexPathString+EndOfLine
		  end if
		  
		  for each child as NSTreeNode in children
		    myIndexPath = Tab+myIndexPath+child.description
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return (parent = nil)
			End Get
		#tag EndGetter
		isRoot As Boolean
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
