#tag Class
Protected Class JVSQLiteDatabase
Inherits SQLiteDatabase
	#tag Method, Flags = &h0
		Function InsertOrUpdateRecords(baseTableName as String, requests() as DatabaseRecord, records() as DatabaseRecord) As Integer()
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
		    dim pk as Integer= lastPKFromTable(baseTableName)
		    affectedPKs.Append(pk)
		    
		    If Error Then
		      #if debugbuild then
		        system.debuglog( "[JVSQLiteDatabase] DB Error: " + ErrorMessage+ENDOFLINE)
		      #endif
		      
		    End If
		    
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
		Private Function lastRowIDFromTable(baseTableName as String) As Integer
		  dim sqlString as String = "select seq from sqlite_sequence where name=?"
		  dim sqlStatement as SQLitePreparedStatement = Prepare(sqlString)
		  
		  dim allVariables() as Variant = concatenate(array(baseTableName))
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
		  
		  return recordsFound.Field("seq").IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function lookupID(lookupTable as String, matchFields as DatabaseRecord) As Integer
		  
		  
		  Dim matchFieldNames() as String
		  dim fieldValues() as Variant
		  
		  For fieldNumber As Integer = 0 To matchFields.FieldCount-1
		    dim fieldName as String = matchFields.FieldName(fieldNumber)
		    dim fieldValue as String = matchfields.Column(fieldName)
		    
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
		  dim pkField As String = ""
		  
		  dim tablesInfo as RecordSet = FieldSchema(baseTableName)
		  while pkField = "" and not tablesInfo.eof
		    if tablesInfo.Field("IsPrimary").BooleanValue = TRUE then
		      pkField = tablesInfo.Field("ColumnName")
		    end if
		    tablesInfo.MoveNext
		  wend
		  
		  return pkField
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectRecords(baseTableName as String, requests() as DatabaseRecord) As Recordset
		  
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
		Function sqlExpressions(baseTableName as String, searchRequests() as DatabaseRecord) As Dictionary
		  dim sqlExpressions as new Dictionary
		  
		  dim matchFieldNames() as String
		  dim sqlString as String
		  dim matchFieldValues() as Variant
		  
		  if searchRequests.ubound >=0 then
		    
		    dim requests() as String
		    dim requestsString as String
		    for each request as DatabaseRecord in searchRequests
		      
		      For fieldNumber As Integer = 0 To request.FieldCount-1
		        dim fieldName as String = request.FieldName(fieldNumber)
		        dim fieldValue as String = request.Column(fieldName)
		        
		        matchFieldNames.append(fieldName+" = ?")
		        matchFieldValues.append(fieldValue)
		      next fieldNumber
		      requestsString = join(matchFieldNames, " AND ")
		      
		      requests.Append(requestsString)
		    next request
		    
		    requestsString = join(requests, ") OR (")
		    if requests.ubound > 0 then
		      requestsString = "("+requestsString+")"
		    end if
		    
		    // Form the SQL-Select- statement
		    sqlString = "SELECT * FROM "+baseTableName+" WHERE "+requestsString
		    
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
		Function updateRecords(baseTableName as String, records as RecordSet, newFields as DatabaseRecord, optional wholeSet as Boolean = False) As Integer()
		  
		  dim affectedPKs() as Integer
		  dim pkFieldName as String = pkForTable(baseTableName)
		  
		  If records <> Nil Then
		    
		    records.Edit
		    
		    newFields = stripPKsFromRecord(baseTableName, newFields)
		    
		    if wholeSet then
		      
		      // Replace the current recordset
		      records.MoveFirst
		      
		      While Not records.EOF
		        
		        For fieldNumber As Integer = 0 To newFields.FieldCount-1
		          dim fieldName as String = newFields.FieldName(fieldNumber)
		          dim fieldValue as String = newfields.Column(fieldName)
		          
		          records.field(fieldName).value = fieldValue
		          
		        next fieldNumber
		        
		        records.Update
		        dim pk as Integer = records.Field(pkFieldName).IntegerValue
		        affectedPKs.Append(pk)
		        
		        records.MoveNext
		      Wend
		    else
		      
		      // Replace the current record
		      For fieldNumber As Integer = 0 To newFields.FieldCount-1
		        dim fieldName as String = newFields.FieldName(fieldNumber)
		        dim fieldValue as String = newfields.Column(fieldName)
		        
		        records.field(fieldName).value = fieldValue
		        
		      next fieldNumber
		      
		      records.Update
		      
		    end if
		    
		    records.Close
		    
		  End If
		  
		  
		  Return affectedPKs
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // Lazy loading of tabelForField
			  
			  if (maliasSchema = nil) or (maliasSchema.Count = 0) then
			    
			    maliasSchema = new Dictionary
			    
			    dim tablesInfo as Recordset = SQLSelect("SELECT * FROM sqlite_master")
			    if tablesInfo <> nil then
			      while not tablesInfo.EOF
			        
			        dim baseTableName as String = tablesInfo.field("tbl_name")
			        dim baseTableType as String = tablesInfo.field("type")
			        
			        dim tableName as String
			        dim fieldName as String
			        dim fullyQualifiedAliasName as String
			        dim sourceInfo as Dictionary
			        
			        Select Case baseTableType
			        Case "table"
			          
			          dim fieldInfo  as RecordSet = fieldSchema(baseTableName)
			          while not fieldInfo.EOF
			            
			            fieldName = fieldInfo.field("ColumnName")
			            
			            // Assign to the result
			            sourceInfo = new Dictionary
			            sourceInfo.Value("table") = baseTableName
			            sourceInfo.Value("field") = fieldName
			            maliasSchema.value(fullyQualifiedAliasName) = sourceInfo
			            
			            fieldInfo.MoveNext
			          wend
			          
			        Case "view"
			          
			          // Filter out the relevant part
			          dim sqlString  as String = tablesInfo.field("sql")
			          sqlString = ReplaceLineEndings(sqlString,"")
			          sqlString = sqlString.Replace("^.*SELECT\s+(.*)\s+FROM.*$","$1",True)
			          sqlString = sqlString.Replace("\s*,\s*",ENDOFLINE, True)
			          dim fieldAssignments() as String =  Split(sqlString, ENDOFLINE)
			          
			          // Split into tablename, fieldname and alias
			          for each fieldAssignment as String in fieldAssignments
			            
			            dim fieldPart as String
			            dim aliasPart as String
			            if fieldAssignment.contains(" ") then
			              
			              fieldPart = fieldAssignment.replace("(.*)\s(?:AS\s)?(.*)?","$1", True)
			              aliasPart= fieldAssignment.replace("(.*)\s(?:AS\s)?(.*)?","$2", True)
			              
			            else
			              
			              fieldPart = fieldAssignment
			              aliasPart = fieldAssignment
			              
			            end if
			            
			            if fieldPart.contains(".") then
			              tableName = fieldPart.NthField( ".", 1)
			              fieldName = fieldPart.NthField( ".", 2)
			            else
			              tableName = baseTableName
			              fieldName = fieldPart
			            end if
			            
			            if aliasPart.contains(".") then
			              fullyQualifiedAliasName  = baseTableName+"."+aliasPart.NthField( ".", 2)
			            else
			              fullyQualifiedAliasName  = baseTableName+"."+aliasPart
			            end if
			            
			            // Assign to the result
			            sourceInfo = new Dictionary
			            sourceInfo.Value("table") = tableName
			            sourceInfo.Value("field") = fieldName
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

	#tag Property, Flags = &h21
		Private maliasSchema As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DatabaseFile"
			Visible=true
			Type="FolderItem"
			EditorType="FolderItem"
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
