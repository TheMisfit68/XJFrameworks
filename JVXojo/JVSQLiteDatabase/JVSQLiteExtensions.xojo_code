#tag Module
Protected Module JVSQLiteExtensions
	#tag Method, Flags = &h21
		Private Sub bindType(extends statement as SQLitePreparedStatement, fieldValues() as Variant)
		  dim fieldNumber as Integer = 0
		  for  each fieldValue as Variant in fieldValues
		    
		    select case fieldValue.type
		    case Variant.TypeBoolean
		      statement.BindType(fieldNumber, SQLitePreparedStatement.SQLITE_BOOLEAN)
		    case Variant.TypeDouble
		      statement.BindType(fieldNumber, SQLitePreparedStatement.SQLITE_DOUBLE)
		    case Variant.TypeInt64
		      statement.BindType(fieldNumber, SQLitePreparedStatement.SQLITE_INT64)
		    case Variant.TypeInteger
		      statement.BindType(fieldNumber, SQLitePreparedStatement.SQLITE_INTEGER)
		    case Variant.TypeNil
		      statement.BindType(fieldNumber, SQLitePreparedStatement.SQLITE_NULL)
		    case Variant.TypeString
		      statement.BindType(fieldNumber, SQLitePreparedStatement.SQLITE_TEXT)
		    else
		      statement.BindType(fieldNumber, SQLitePreparedStatement.SQLITE_BLOB)
		    end select
		    
		    fieldNumber = fieldNumber+1
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub bindVariables(extends statement as SQLitePreparedStatement, variables() as Variant)
		  statement.BindType(variables)
		  statement.Bind(variables)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function treeNode(extends records as RecordSet, branchFields() as String) As NSTreeNode
		  // Create a basenode to be used as a container for the actual nodes
		  dim  baseNode as new  NSTreeNode(nil)
		  baseNode.parent = nil
		  
		  dim currentBranches() as NSTreeNode
		  dim currentBranchNumber as Integer = 0
		  dim previousBranchFieldValues as new Dictionary
		  
		  dim currentIndexPath() as Integer
		  for i as Integer = 0 to branchFields.Ubound
		    currentBranches.append(baseNode)
		    currentIndexPath.append(0)
		  next
		  
		  dim currentNode as  NSTreeNode
		  dim currentParent as  NSTreeNode = baseNode
		  
		  // For every record that was found
		  records.MoveFirst
		  While Not records.EOF
		    
		    // Check every field to see if it is a branchfield and if it might have changed
		    Dim fieldNumber as Integer =1
		    Dim startOfBranchDetected as Boolean = False
		    Dim endOfbranchDetected as Boolean = False
		    Dim Representedobject as new Dictionary
		    
		    While (fieldNumber<=records.FieldCount) and not(startOfBranchDetected and endOfbranchDetected)
		      
		      dim field as DatabaseField = records.IdxField(fieldNumber)
		      dim fieldName as String = field.Name
		      dim fieldValue as Variant = field.Value
		      
		      dim matchingBranch as Integer= branchFields.IndexOf(fieldName)
		      dim itsaBranchField as Boolean = matchingBranch>=0
		      if  itsaBranchField  then
		        
		        if not startOfBranchDetected  then 
		          
		          if (not  previousBranchFieldValues.hasKey(fieldName)) or  (previousBranchFieldValues.value(fieldName) <> fieldValue) then
		            startOfBranchDetected =  True // Start capturing a new branch when a branchfield has changed  in value
		            currentBranchNumber = matchingBranch
		          end if
		          previousBranchFieldValues.value(fieldName) = fieldValue
		          
		        else
		          
		          endOfbranchDetected = True // Always stop capturing fields when another branchfield was reached
		          
		        end if
		        
		      end if
		      
		      // Parse the data for the current branch
		      if  startOfBranchDetected and not endOfbranchDetected then
		        
		        // Determine the parent
		        if currentBranchNumber > 0 then
		          currentParent = currentBranches(currentBranchNumber-1)
		        else
		          currentParent = baseNode
		        end if
		        
		        // The indexPath
		        currentIndexPath(currentBranchNumber) = currentIndexPath(currentBranchNumber)+1
		        for subBrancheNumber as Integer = currentBranchNumber+1 to currentBranches.Ubound
		          currentIndexPath(subBrancheNumber) = 0
		          dim subBrancheName as String = branchFields(subBrancheNumber)
		          if previousBranchFieldValues.HasKey(subBrancheName) then
		            previousBranchFieldValues.remove(subBrancheName)
		          end if
		        Next
		        
		        
		        // And the Representedobject
		        representedObject.value(fieldName) = fieldValue
		        
		      end if
		      
		      fieldNumber =  fieldNumber+1
		    wend
		    
		    
		    // Add the currentNode to the nodetree
		    if representedObject.Values.ubound >=0 then
		      
		      currentNode = new NSTreeNode(representedObject)
		      currentNode.parent = currentParent
		      currentNode.indexPath = currentIndexPath
		      currentParent.children.Append(currentNode)
		      
		      // Adjust the current branches 
		      for subBrancheNumber as Integer= currentBranchNumber to currentBranches.Ubound
		        currentBranches(subBrancheNumber) = currentNode
		      next
		      
		    end if
		    
		    records.MoveNext
		  Wend
		  
		  records.MoveFirst // Reset the cursor
		  return baseNode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function treeNode(extends records as RecordSet, paramArray branchFields as String) As NSTreeNode
		  
		  // Overload of the same method that uses an array instead of the paramarray
		  return records.treeNode(branchFields)
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
