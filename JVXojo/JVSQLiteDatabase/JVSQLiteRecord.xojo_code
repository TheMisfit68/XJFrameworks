#tag Class
Protected Class JVSQLiteRecord
Inherits Xojo.Core.Dictionary
Implements JVBackgroundTaskDelegate
	#tag Method, Flags = &h0
		Sub archive(inDbase as SQLiteDatabase)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onTaskFinished(sender as JVBackgroundTask)
		  // Part of the JVBackgroundTaskDelegate interface.
		  #pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub select_(sqlString as String)
		  dim values() as String = sqlExpressions.values
		  try
		    return try dataBase.inDatabase {db in
		    JVBackendViewController.sharedBackendViewController.logController.log(debugLevel: .message, sqlString, values)
		    return try Row.fetchAll(db, sqlString)
		  catch
		    JVBackendViewController.sharedBackendViewController.logController.log(debugLevel: .error, error, values)
		    return nil
		  end try
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  try
			    
			    return try dataBase.inDatabase {db in
			    let newID = try Int.fetchOne(db, "SELECT seq FROM sqlite_sequence WHERE name="+typeAndTableName)
			    if lastStoredID != newID{
			      lastStoredID = newID
			      return newID
			      }else{
			      return nil
			      }
			      
			      }
			  catch
			    return nil
			  end try
			End Get
		#tag EndGetter
		lastPrimaryKey As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		matchFields() As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim propertyNames() as String
			  dim placeholderStrings() as string
			  dim propertyPairs() as String
			  dim propertyValues() as Variant
			  dim propertyMatches() as String
			  
			  For Each keyValuePair as Xojo.Core.DictionaryEntry In self
			    
			    dim propertyName as String = keyValuePair.Key
			    dim propertyValue as String = keyValuePair.value
			    
			    propertyNames.append(propertyName)
			    propertyPairs.append(propertyName+" = ?")
			    placeholderStrings.Append("?")
			    propertyValues.append(propertyValue)
			    
			    dim matchNames() as Variant
			    for i as integer =0 to matchFields.Ubound
			      matchNames.append(matchFields(i))
			    next
			    
			    if matchNames <> nil then
			      
			      dim searchValue as String =  propertyValue
			      if (matchNames.contains(propertyName) and (searchValue <> "") ) then
			        
			        // Use FileMaker compatible search-symbols
			        dim searchExpression as String = propertyName+" = "+searchValue
			        
			        if searchValue = "=" then
			          // Use = to find empty fields
			          searchExpression = propertyName+" = ''"
			        elseif searchValue.Left(1) = "!" then
			          // Use ! to find non-matching fields
			          searchExpression = propertyName+" <> "+searchValue
			        end if
			        
			        propertyMatches.append(searchExpression)
			        
			      end if
			      
			    end if
			    
			  next
			  
			  dim fieldNames as String = join(propertyNames, ",")
			  dim placeholders as String = join(placeholderStrings, ",")
			  dim fieldPairs as String = join(propertyPairs,  ",")
			  dim fieldValues() as Variant = propertyValues
			  dim matchConditions as String = join(propertyMatches, " AND ")
			  
			  dim result As New Dictionary
			  result.value("names") = fieldNames
			  result.value("placeholders") = placeholders
			  result.value("pairs") = fieldPairs
			  result.value("values") = fieldValues
			  result.value("conditions") = matchConditions
			  
			  return result
			End Get
		#tag EndGetter
		SQLExpressions As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return introspection.GetType(self).name
			End Get
		#tag EndGetter
		typeAndTableName As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
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
