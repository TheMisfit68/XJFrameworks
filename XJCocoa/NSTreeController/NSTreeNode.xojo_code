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
		        
		        if (activeBranchValues(matchingBranch) = nil) or (fieldValue <> activeBranchValues(matchingBranch)) then
		          branchIsActive =  True 
		          activeBranchNumber = matchingBranch
		          activeBranchValues(activeBranchNumber) = fieldValue
		        end if
		        
		      end if
		      
		      // Parse the  fields of the new branch
		      if branchIsActive then
		        columns.Append(fieldName : fieldValue)
		      end if
		      
		      // When you come across an indexpath store it for later use
		      dim itsAkeyPathField as Boolean = fieldName.contains("keyPath")
		      if itsAkeyPathField then
		        currentKeyPathString = fieldValue
		      end if
		      
		      // Look ahead to the next field to predict the end of a branch
		      dim lastFieldOfCurrentBranch as Boolean =False
		      if branchIsActive then
		        if (fieldNumber = records.FieldCount) then
		          lastFieldOfCurrentBranch = True
		        else
		          dim nextField as DatabaseField = records.IdxField(fieldNumber+1)
		          dim nextFieldName as String = nextField.Name
		          lastFieldOfCurrentBranch = (branchFields.IndexOf(nextFieldName)>=0)
		        end if
		      end if
		      
		      // At the end of each branch store the data in a new TreeNode
		      if lastFieldOfCurrentBranch then
		        
		        currentNode = new NSTreeNode(new DatabaseRecord)
		        
		        // Adjust the current branches 
		        activeBranches(activeBranchNumber) = currentNode
		        // and subbranches
		        for subBrancheNumber as Integer= activeBranchNumber+1 to activeBranches.Ubound
		          activeBranches(subBrancheNumber) = nil
		          activeBranchValues(subBrancheNumber) = nil
		        next
		        
		        // Add the represented databaseRecord
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
		        
		        // Create the relitionships between the parent and the children
		         if  (activeBranchNumber > 0) then
		          currentNode.parent = activeBranches(activeBranchNumber-1)
		        else
		          currentNode.parent = baseNode
		        end if
		        currentNode.parent.children.Append(currentNode)
		        
		        //  And add the keypath
		        dim keys() as String = split(currentKeyPathString,".")
		        dim keyForBranch as Integer
		        for branchNumber as Integer = 0 to activeBranches.Ubound
		          if  branchNumber <= activeBranchNumber then
		            keyForBranch = val(keys(branchNumber))
		          else
		            keyForBranch = 0
		          end if
		          currentNode.indexPath.append(keyForBranch)
		        next branchNumber
		        
		        
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
			Name="indexString"
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
