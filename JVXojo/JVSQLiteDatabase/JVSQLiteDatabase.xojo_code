#tag Class
Protected Class JVSQLiteDatabase
Inherits SQLiteDatabase
	#tag Method, Flags = &h0
		Function baseTableForAlias(fullyQualifiedAliasName as String) As String
		  
		  if aliasSchema.HasKey(fullyQualifiedAliasName) then
		    return aliasSchema.value(fullyQualifiedAliasName)
		  else
		    return ""
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function fkForRelationship(relatedTables as Pair) As String
		  dim relationshipKey as String = relatedTables.Left.StringValue+" : "+relatedTables.Right.StringValue // Real pairs might not work as dictionary-keys because they are not value-types
		  if fkSchema.HasKey(relationshipKey) then
		    return fkSchema.value(relationshipKey)
		  else
		    return ""
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getColumns(records() as databaseRecord,  paramarray columnNames as String) As DatabaseRecord()
		  dim columns() as DatabaseRecord
		  
		  for each record as databaserecord in records
		    dim recordSubset as new DatabaseRecord
		    
		    for fieldNumber as Integer = 0 to record.FieldCount-1
		      dim fieldName as String = record.fieldName(fieldNumber)
		      if columnNames.indexof(fieldName) >=0 then
		        recordSubset.Column(fieldName) =  record.Column(fieldName)
		      end 
		      
		    next fieldnumber
		    
		    if recordSubset.fieldcount > 0 then
		      columns.append(recordSubset)
		    end if
		    
		  next record
		  
		  return columns
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InsertOrUpdateRecords(baseTableName as String, requests() as JVDataBaseRequest, records() as DatabaseRecord) As Integer()
		  dim affectedPKs() as Integer
		  
		  for each record as DatabaseRecord in records
		    
		    dim recordsToUpdate as RecordSet = selectRecords(baseTableName, requests)
		    
		    if recordsToUpdate <> nil  and recordsToUpdate.RecordCount > 0 then 
		      affectedPKs = updateRecords(baseTableName, recordsToUpdate, record)
		    else
		      affectedPKs = insertRecords(baseTableName, records)
		    end if
		    
		  next record
		  
		  return affectedPKs
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function insertRecords(baseTableName as String, records() as DatabaseRecord) As Integer()
		  dim affectedPKs() as Integer
		  
		  for each record as DatabaseRecord in records
		    
		    dim newfields as DatabaseRecord = stripPKsFromRecord(baseTableName, record)
		    
		    InsertRecord(baseTableName, newfields)
		    If Error Then
		      #if debugbuild then
		        system.debuglog( "[JVSQLiteDatabase] DB Error: " + ErrorMessage+ENDOFLINE)
		      #endif
		      
		    End If
		    
		    dim pk as Integer= lastPKFromTable(baseTableName)
		    affectedPKs.Append(pk)
		    
		  next record
		  
		  return affectedPKs
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function lastPKFromTable(baseTableName as String) As Integer
		  dim lastRowID as Variant = lastRowIDFromTable(baseTableName)
		  dim pkFieldName as String = pkForTable(baseTableName)
		  
		  dim sqlString as String = "select "+pkFieldName+ " from "+baseTableName+" where rowid=?"
		  dim sqlStatement as SQLitePreparedStatement = Prepare(sqlString)
		  
		  
		  dim allVariables() as Variant = array(lastRowID)
		  sqlStatement.bindVariables(allVariables)
		  
		  dim recordsFound as recordset = sqlStatement.SQLSelect
		  
		  If Error Then
		    #if debugbuild then
		      system.debuglog( _
		      "[JVSQLiteDatabase] DB Error: " + ErrorMessage+ENDOFLINE+ _
		      sqlString)
		    #endif
		    Return -1
		  End If
		  
		  return recordsFound.Field(pkFieldName).IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function lastRowIDFromTable(baseTableName as Variant) As Integer
		  dim sqlString as String = "select seq from sqlite_sequence where name=?"
		  dim sqlStatement as SQLitePreparedStatement = Prepare(sqlString)
		  
		  dim variables() as Variant = array(baseTableName)
		  sqlStatement.bindVariables(variables)
		  
		  dim recordsFound as recordset = sqlStatement.SQLSelect
		  
		  If Error Then
		    #if debugbuild then
		      system.debuglog( _
		      "[JVSQLiteDatabase] DB Error: " + ErrorMessage+ENDOFLINE+ _
		      sqlString)
		    #endif
		    Return -1
		  End If
		  
		  return recordsFound.Field("seq").IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function lookupID(lookupTable as String, matchFields as JVDatabaseRequest) As Integer
		  
		  
		  Dim matchFieldNames() as String
		  dim fieldValues() as Variant
		  
		  For fieldNumber As Integer = 0 To matchFields.FieldCount-1
		    dim fieldName as String = matchFields.FieldName(fieldNumber)
		    dim fieldValue as Variant = matchfields.Column(fieldName)
		    
		    matchFieldNames.append(fieldName+" = ?")
		    fieldValues.append(fieldValue)
		    
		  next fieldNumber
		  dim matchFieldsString as String= join(matchFieldNames, " AND ")
		  
		  dim pkfield as String= pkForTable(lookupTable)
		  dim sqlString as String = "SELECT "+pkField+" FROM "+lookupTable+" WHERE "+matchFieldsString
		  dim sqlStatement as SQLitePreparedStatement = Prepare(sqlString)
		  
		  sqlStatement.bindVariables(fieldValues)
		  
		  dim foundRecords as RecordSet = sqlStatement.SQLSelect
		  
		  If Error Then
		    #if debugbuild then
		      system.debuglog( _
		      "[JVSQLiteDatabase] DB Error: " + ErrorMessage+ENDOFLINE+ _
		      sqlString)
		    #endif
		    return -1
		  End If
		  
		  if foundRecords <> nil then
		    foundRecords.moveFirst
		    return foundRecords.field(pkField).IntegerValue
		  else
		    return -1
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pkForTable(baseTableName as String) As String
		  if pkSchema.HasKey(baseTableName) then
		    return pkSchema.value(baseTableName)
		  else
		    return ""
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectRecords(baseTableName as String, requests() as JVDatabaseRequest) As Recordset
		  
		  dim sqlExpresions  as Dictionary =  sqlExpressions(baseTableName, requests)
		  dim sqlString as String = sqlExpresions.value("Statement")
		  
		  dim sqlStatement as SQLitePreparedStatement = Prepare(sqlString)
		  sqlStatement.bindvariables(sqlExpresions.value("Values"))
		  dim foundRecords as RecordSet = sqlStatement.SQLSelect
		  
		  If Error Then
		    #if debugbuild then
		      system.debuglog( _
		      "[JVSQLiteDatabase] DB Error: " + ErrorMessage+ENDOFLINE+ _
		      sqlString)
		    #endif
		    Return nil
		  End If
		  
		  return foundRecords
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlExpressions(baseTableName as String, searchRequests() as JVDatabaseRequest) As Dictionary
		  dim sqlExpressions as new Dictionary
		  
		  dim sqlString as String
		  dim matchFieldValues() as Variant
		  
		  if searchRequests.ubound >=0 then
		    
		    dim individualRequests() as String
		    for each request as JVDatabaseRequest in searchRequests
		      
		      dim requestString as String
		      dim matchFieldNames() as String
		      
		      For fieldNumber As Integer = 0 To request.FieldCount-1
		        dim fieldName as String = request.FieldName(fieldNumber)
		        
		        dim fieldValue as Variant
		        select case request.FieldType(fieldNumber)
		        case 3
		          fieldValue = request.IntegerColumn(fieldName)
		        case 5
		          fieldValue = request.Column(fieldName)
		        case 12
		          fieldValue = request.BooleanColumn(fieldName)
		        else
		          fieldValue = request.Column(fieldName)
		        end select
		        
		        matchFieldNames.append(fieldName+" = ?")
		        matchFieldValues.append(fieldValue)
		      next fieldNumber
		      requestString = join(matchFieldNames, " AND ")
		      
		      individualRequests.Append(requestString)
		    next request
		    
		    dim conditionString as String = join(individualRequests, ") OR (")
		    if individualRequests.ubound > 0 then
		      conditionString = "("+conditionString+")"
		    end if
		    
		    // Form the SQL-Select- statement
		    sqlString = "SELECT * FROM "+baseTableName+" WHERE "+conditionString
		    
		  else
		    
		    // Form the SQL-Select- statement
		    sqlString = "SELECT * FROM "+baseTableName
		    
		  end if
		  
		  
		  sqlExpressions.value("Statement") = sqlString
		  sqlExpressions.value("Values") = matchFieldValues
		  
		  return sqlExpressions
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function stripPKsFromRecord(baseTableName as String, fields as DatabaseRecord) As DatabaseRecord
		  
		  dim recordWithoutPKs as new DatabaseRecord
		  dim primaryFieldName as String = pkForTable(baseTableName)
		  
		  For fieldNumber As Integer = 0 To fields.FieldCount-1
		    dim fieldName as String = fields.FieldName(fieldNumber)
		    dim fieldValue as String = fields.Column(fieldName)
		    
		    if fieldName <> primaryFieldName then
		      recordWithoutPKs.Column(fieldName) = fieldValue
		    end if
		    
		  Next
		  
		  
		  
		  return recordWithoutPKs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function summarizeRecords(records() as databaseRecord, summaryFieldName as String) As DatabaseRecord()
		  dim summarizedSet() as DatabaseRecord
		  dim previousSummaryValue as Variant  = nil
		  
		  for each record as databaserecord in records
		    dim summaryValue as Variant = record.Column(summaryFieldName)
		    if summaryValue <> previousSummaryValue then
		      summarizedSet.append(record)
		    end 
		    
		    previousSummaryValue = summaryValue
		  next record
		  
		  return summarizedSet
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function updateRecords(baseTableName as String, records as RecordSet, newFields as DatabaseRecord, optional wholeSet as Boolean = False) As Integer()
		  dim pk as Integer 
		  dim affectedPKs() as Integer
		  dim pkFieldName as String = pkForTable(baseTableName)
		  
		  If (records <> Nil) and (records.RecordCount > 0) Then
		    
		    
		    newFields = stripPKsFromRecord(baseTableName, newFields)
		    
		    if wholeSet then
		      
		      // Replace the current recordset
		      records.MoveFirst
		      
		      While Not records.EOF
		        
		        records.Edit
		        For fieldNumber As Integer = 0 To newFields.FieldCount-1
		          dim fieldName as String = newFields.FieldName(fieldNumber)
		          dim fieldValue as Variant = newfields.nilableColumn(fieldName)
		          
		          records.field(fieldName).value = fieldValue
		          
		        next fieldNumber
		        records.Update
		        
		        pk = records.Field(pkFieldName).IntegerValue
		        affectedPKs.Append(pk)
		        
		        records.MoveNext
		      Wend
		      
		    else
		      
		      records.Edit
		      
		      // Replace the current record
		      For fieldNumber As Integer = 0 To newFields.FieldCount-1
		        dim fieldName as String = newFields.FieldName(fieldNumber)
		        dim fieldValue as String = newfields.Column(fieldName)
		        
		        records.field(fieldName).value = fieldValue
		        
		      next fieldNumber
		      
		      records.Update
		      pk = records.Field(pkFieldName).IntegerValue
		      affectedPKs.Append(pk)
		      
		    end if
		    
		    if records.EOF then
		      records.Close
		    end if
		    
		  End If
		  
		  
		  Return affectedPKs
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Lazy loading of the tables that are attached to each alias
			  
			  if (maliasSchema = nil) or (maliasSchema.Count = 0) then
			    
			    maliasSchema = new Dictionary
			    
			    dim tablesInfo as Recordset = SQLSelect("SELECT * FROM sqlite_master ORDER BY type")
			    if tablesInfo <> nil then
			      while not tablesInfo.EOF
			        
			        dim viewName as String= tablesInfo.field("tbl_name")
			        dim viewType as String = tablesInfo.field("type")
			        
			        dim fullyQualifiedAliasName as String
			        dim baseTableName as String
			        dim fieldName as String
			        
			        Select Case viewType
			        Case "table"
			          baseTableName = viewName
			          
			          dim fieldInfo  as RecordSet = fieldSchema(baseTableName)
			          while not fieldInfo.EOF
			            
			            fieldName = fieldInfo.field("ColumnName")
			            
			            // Assign to the result
			            dim sourceInfo as new Dictionary("table" : baseTableName, "field" : fieldName)
			            fullyQualifiedAliasName = baseTableName+"."+fieldName
			            maliasSchema.value(fullyQualifiedAliasName) = sourceInfo
			            
			            fieldInfo.MoveNext
			          wend
			          
			        Case "view"
			          
			          // Filter out the relevant part
			          dim sqlString  as String = tablesInfo.field("sql")
			          sqlString = ReplaceLineEndings(sqlString," ")
			          dim fieldsWithAliasesString as String = sqlString.Replace(SQLstatementPattern,"$1",True)
			          baseTableName = sqlString.Replace(SQLstatementPattern,"$2",True)
			          
			          fieldsWithAliasesString = fieldsWithAliasesString.Replace("\s*,\s*",ENDOFLINE, True)
			          dim fieldsWithAliases() as String =  Split(fieldsWithAliasesString, ENDOFLINE)
			          
			          // Split into viewName, fieldname and alias
			          for each fieldsWithAlias as String in fieldsWithAliases
			            
			            dim fieldsWithAliasPattern as String = "(.*)\s(?:AS\s)?(.*)?"
			            fieldName = fieldsWithAlias.replace(fieldsWithAliasPattern,"$1", True)
			            
			            dim aliasName as String
			            if fieldsWithAlias.contains(fieldsWithAliasPattern, true) then
			              aliasName = fieldsWithAlias.replace(fieldsWithAliasPattern,"$2", True)
			            else
			              aliasName = fieldName.NthField( ".", fieldName.CountFields("."))
			            end if
			            
			            // Only store the result if the fieldName includes the tableName
			            if fieldName.contains(".") then
			              
			              baseTableName = fieldName.NthField( ".", 1)
			              fieldName = fieldName.NthField( ".", fieldName.CountFields("."))
			              
			            else
			              
			              // otherwise try to find the matching table from the exisitng entries
			              for each existingEntry as Dictionary  in maliasSchema.values
			                
			                if existingEntry.value("field") = fieldName then
			                  baseTableName = existingEntry.value("table")
			                end if
			              next existingEntry
			              
			            end if
			            
			            // Assign to the result
			            dim sourceInfo as new Dictionary("table" : baseTableName, "field" : fieldName)
			            fullyQualifiedAliasName  = viewName+"."+aliasName
			            maliasSchema.value(fullyQualifiedAliasName) = sourceInfo
			            
			          next
			          
			        Case "index"
			          
			        Else
			          
			        End Select
			        
			        
			        tablesInfo.MoveNext
			      wend
			      
			    end if
			    
			    #if DebugBuild
			      system.DebugLog(maliasSchema.description)
			    #Endif
			    
			  end if
			  
			  return maliasSchema
			End Get
		#tag EndGetter
		aliasSchema As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Lazy loading of the dictionary that holds the FKs for each relationship
			  if (mfkSchema = nil) or (mpkSchema.Count = 0) then
			    
			    mfkSchema = new Dictionary
			    
			    dim tablesInfo as Recordset = TableSchema
			    if tablesInfo <> nil then
			      while not tablesInfo.EOF
			        dim childTable as String = tablesInfo.IdxField(1).StringValue
			        
			        dim fkInfo as RecordSet = SQLSELECT("PRAGMA foreign_key_list("+childTable+")")
			        
			        if fkInfo <> nil then
			          while not fkinfo.eof
			            
			            dim parentTable as String = fkInfo.Field("table").StringValue
			            dim relatedTables as String = parentTable+" : "+childTable // Real pairs might not work as dictionary-keys because they are not value-types
			            mfkSchema.value(relatedTables) = fkInfo.Field("to").stringvalue
			            
			            fkInfo.MoveNext
			          wend
			        end if
			        
			        tablesInfo.MoveNext
			      wend
			    end if
			    
			  end if
			  
			  return mfkSchema
			End Get
		#tag EndGetter
		fkSchema As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private maliasSchema As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mfkSchema As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mpkSchema As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Lazy loading of the dictionary that holds the PKs for each table
			  if (mpkSchema = nil) or (mpkSchema.Count = 0) then
			    
			    mpkSchema = new Dictionary
			    
			    dim tablesInfo as Recordset = TableSchema
			    if tablesInfo <> nil then
			      while not tablesInfo.EOF
			        dim tableName as String = tablesInfo.IdxField(1).StringValue
			        
			        dim fieldsInfo as RecordSet = FieldSchema(tableName)
			        if fieldsInfo <> nil then
			          while not mpkSchema.HasKey(tableName) and not fieldsInfo.eof
			            
			            if fieldsInfo.Field("IsPrimary").BooleanValue = TRUE then
			              mpkSchema.value(tableName) = fieldsInfo.Field("ColumnName").stringvalue
			            end if
			            
			            fieldsInfo.MoveNext
			          wend
			        end if
			        
			        tablesInfo.MoveNext
			      wend
			    end if
			    
			  end if
			  
			  return mpkSchema
			End Get
		#tag EndGetter
		pkSchema As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return  "^.*SELECT\s+(.*?)\s+FROM\s+'?([^ ]+)'?.*$"
			End Get
		#tag EndGetter
		Shared SQLstatementPattern As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DatabaseName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Error"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Host"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LibraryVersion"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugMode"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EncryptionKey"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LoadExtensions"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MultiUser"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShortColumnNames"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadYieldInterval"
			Visible=true
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Timeout"
			Visible=true
			Type="Double"
			EditorType="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
