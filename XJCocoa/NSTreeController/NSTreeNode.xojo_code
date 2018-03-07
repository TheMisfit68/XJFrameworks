#tag Class
Protected Class NSTreeNode
Implements JVCustomStringConvertable
	#tag Method, Flags = &h0
		Sub constructor(records as Recordset, branchFields() as String)
		  // Create a basenode to be used as a container for the actual nodes
		  dim  baseNode as  NSTreeNode = me
		  baseNode.parent = nil
		  
		  dim activeBranchNumber as Integer = 0
		  dim activeBranches() as NSTreeNode
		  dim activeBranchValues() as Variant
		  for i as Integer = 0 to branchFields.Ubound
		    activeBranches.append(baseNode)
		    activeBranchValues.Append(nil)
		  next
		  
		  dim currentNode as  NSTreeNode
		  dim currentKeyPathString as String
		  dim currentParent as  NSTreeNode = baseNode
		  
		  // For every record that was found
		  records.MoveFirst
		  While Not records.EOF
		    
		    Dim oldBranchHasEnded as Boolean = False
		    Dim newBranchStarted as Boolean = False
		    Dim branchIsActive as Boolean = False
		    
		    dim columns() as Pair
		    
		    // Proces every field
		    for fieldNumber as Integer = 1 to records.FieldCount
		      
		      dim field as DatabaseField = records.IdxField(fieldNumber)
		      dim fieldName as String = field.Name
		      dim fieldValue as Variant = field.Value
		      
		      dim itsAkeyPathField as Boolean = fieldName.contains("keyPath")
		      if itsAkeyPathField then
		        currentKeyPathString = fieldValue
		      end if
		      
		      dim itsTheFirstField as Boolean = (fieldNumber = 1)
		      dim matchingBranch as Integer= branchFields.IndexOf(fieldName)
		      dim itsaBranchField as Boolean = matchingBranch>=0
		      dim itsTheLastField as Boolean = (fieldNumber = records.FieldCount)
		      
		      // Set the status of the branche
		      if itsTheFirstField then
		        oldBranchHasEnded = False
		        newBranchStarted = True 
		        branchIsActive =  False
		      elseif itsaBranchField then
		        oldBranchHasEnded = True
		        newBranchStarted = True 
		        branchIsActive =  False
		      else
		        oldBranchHasEnded = False
		        newBranchStarted = False 
		      end if
		      if  itsTheLastField then
		        oldBranchHasEnded = True
		        newBranchStarted = False
		      end if
		      
		      // Once a branch got started if there where changes within a branchField make the branch active
		      if  (newBranchStarted  and not branchIsActive)  and itsaBranchField then 
		        
		        if (activeBranchValues(matchingBranch) = nil) or (fieldValue <> activeBranchValues(matchingBranch)) then
		          branchIsActive =  True 
		          activeBranchNumber = matchingBranch
		        end if
		        
		      end if
		      
		      // Parse the remaining fields of an old branch
		      if oldBranchHasEnded and not newBranchStarted  and branchIsActive then
		        columns.Append(fieldName : fieldValue)
		      end if
		      
		      // add the completed branch to the nodetree
		      if  oldBranchHasEnded then
		        
		        if (currentNode <> nil) and (columns.Ubound>=0) then
		          
		          // Reverse te order while adding te columns because they are always inserted at index 0
		          for reverseColumNumber as Integer = columns.Ubound to 0 step -1
		            dim columnName as String = columns(reverseColumNumber).left
		            dim columnValue as String = columns(reverseColumNumber).Right
		            dim representedObject as DatabaseRecord =currentNode.representedObject
		            representedObject.Column(columnName) = columnValue
		          next reverseColumNumber
		          redim columns(-1)
		          
		          currentNode.parent = currentParent
		          
		          dim keys() as String = split(currentKeyPathString,".")
		          dim keyForBranch as Integer
		          for branchNumber as Integer = 0 to activeBranches.Ubound
		            if branchNumber <= activeBranchNumber then
		              keyForBranch = val(keys(branchNumber))
		            else
		              keyForBranch = 0
		            end if
		            currentNode.indexPath.append(keyForBranch)
		          next branchNumber
		          
		          currentNode.parent.children.Append(currentNode)
		          
		          system.debuglog("Creating node "+currentNode.indexString)
		          
		        end if
		        
		      end if
		      
		      if newBranchStarted and branchIsActive then
		        
		        // Next prepare a new Node and
		        currentNode = new NSTreeNode(new DatabaseRecord)
		        // determine the parent
		        if  (activeBranchNumber > 0) then
		          currentParent = activeBranches(activeBranchNumber-1)
		        else
		          currentParent = baseNode
		        end if
		        
		        // Adjust the current branches 
		        activeBranches(activeBranchNumber) = currentNode
		        activeBranchValues(activeBranchNumber) = fieldValue
		        // and subbranches
		        for subBrancheNumber as Integer= activeBranchNumber+1 to activeBranches.Ubound
		          activeBranches(subBrancheNumber) = nil
		          activeBranchValues(subBrancheNumber) = nil
		        next
		        
		      end if
		      
		      // Parse the  fields of the new branch
		      if (not oldBranchHasEnded or newBranchStarted)  and branchIsActive then
		        columns.Append(fieldName : fieldValue)
		      end if
		      
		    next fieldNumber
		    
		    records.MoveNext
		  Wend
		  
		  records.MoveFirst // Reset the cursor
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(representedObject as Variant= nil)
		  
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


	#tag Property, Flags = &h0
		children() As NSTreeNode
	#tag EndProperty

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
		indexString As String
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
		parent As NSTreeNode
	#tag EndProperty

	#tag Property, Flags = &h0
		representedObject As Variant
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
			Name="isLeaf"
			Group="Behavior"
			Type="Boolean"
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
