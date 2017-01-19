#tag Class
Protected Class JVSQLiteDatabase
Inherits SQLiteDatabase
	#tag Method, Flags = &h0
		Shared Function Create(file as FolderItem) As AutomationProjectsDbase
		  Dim database As  New AutomationProjectsDbase
		  database.databaseFile = file
		  
		  if database.createDatabaseFile then
		    
		    database.updateDbaseDiagram
		    database.fillLookupTabelSignalTypes
		    
		    return database
		    
		  else
		    
		    msgbox("[AutomationProjectsDbase] Error creating database-file  'AutomationProjectsDbase' "+database.ErrorMessage)
		    return nil
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InsertOrUpdate(tableName as String, matchFields() as String, fields as Dictionary) As Boolean
		  // WORKING EXAMPLE !!!
		  
		  // Dim updateCondition as String= "KostenPlaats = '"+kostenplaats+"'"
		  // Dim updateStatement as SQLitePreparedStatement = Prepare("UPDATE Projects SET Name=?, KostenPlaats=?, Number=? WHERE "+updateCondition)
		  // updateStatement.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		  // updateStatement.BindType(1, SQLitePreparedStatement.SQLITE_TEXT)
		  // updateStatement.BindType(2, SQLitePreparedStatement.SQLITE_TEXT)
		  // updateStatement.SQLExecute(name, kostenplaats, number)
		  // 
		  // If Error Then
		  // MsgBox("DB Error: " + ErrorMessage)
		  // Return False
		  // End If
		  // 
		  // Dim InsertStatement As SQLitePreparedStatement = Prepare("INSERT INTO Projects (Name, KostenPlaats, Number) SELECT ?, ?, ? WHERE Changes() = 0")
		  // InsertStatement.BindType(0, SQLitePreparedStatement.SQLITE_TEXT)
		  // InsertStatement.BindType(1, SQLitePreparedStatement.SQLITE_TEXT)
		  // InsertStatement.BindType(2, SQLitePreparedStatement.SQLITE_TEXT)
		  // InsertStatement.SQLExecute(name, kostenplaats, number)
		  // 
		  // If Error Then
		  // MsgBox("DB Error: " + ErrorMessage)
		  // Return False
		  // End If
		  
		  if fields.HasKey("ID") then
		    fields.Remove("ID") // Never update or insert a PK
		  end if
		  
		  dim updatesFields() as String
		  redim updatesFields(-1)
		  dim insertFields() as String
		  redim insertFields(-1)
		  dim insertPlaceholders() as String
		  redim insertPlaceholders(-1)
		  
		  for each fieldKey as Variant in fields.Keys
		    dim fieldName as String = fieldKey.StringValue
		    updatesFields.append(fieldName+ "=?") 
		    insertFields.append(fieldName) 
		    insertPlaceholders.Append("?")
		  next
		  dim updatesFieldsString as String= join(updatesFields, " AND ")
		  dim insertFieldsString as String= join(insertFields, ", ")
		  dim insertPlaceholdersString as String= join(insertPlaceholders, ", ")
		  
		  Dim updateConditions() as String
		  redim updateConditions(-1)
		  for each matchfield as String in matchFields
		    updateConditions.append(matchfield+" = '"+fields.value(matchfield)+"'")
		  next
		  dim updateConditionsString as String = Join(updateConditions, " AND ")
		  
		  dim tempTestUpdate as string = "UPDATE "+tableName+" SET "+updatesFieldsString+" WHERE "+updateConditionsString
		  
		  Dim updateStatement as SQLitePreparedStatement = Prepare("UPDATE "+tableName+" SET "+updatesFieldsString+" WHERE "+updateConditionsString)
		  setBindTypes(updateStatement, fields)
		  updateStatement.SQLExecute(fields.values)
		  
		  If Error Then
		    MsgBox("DB Error: " + ErrorMessage)
		    Return False
		  End If
		  
		  dim tempTestInsert as string = "INSERT INTO "+tableName+" ("+insertFieldsString+") SELECT "+insertPlaceholdersString+" WHERE Changes() = 0"
		  
		  Dim InsertStatement As SQLitePreparedStatement = Prepare("INSERT INTO "+tableName+" ("+insertFieldsString+") SELECT "+insertPlaceholdersString+" WHERE Changes() = 0")
		  setBindTypes(InsertStatement, fields)
		  InsertStatement.SQLExecute(fields.values)
		  
		  If Error Then
		    MsgBox("DB Error: " + ErrorMessage)
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Open(file as FolderItem) As AutomationProjectsDbase
		  
		  If  (file <> nil) and (file.exists) Then
		    
		    // or Open
		    Dim database As New AutomationProjectsDbase
		    database.databaseFile = file
		    
		    if database.connect Then
		      database.updateDbaseDiagram
		      return database
		    else
		      msgbox("[AutomationProjectsDbase] Error connecting to database Automation Projects' "+database.ErrorMessage)
		      return nil
		    end if
		    
		  else
		    
		    // Create
		    return JVSQLiteDatabase.Create(file)
		    
		  end if
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setBindTypes(statement as SqlitePreparedStatement, fields as Dictionary)
		  dim fieldNumber as Integer = 0
		  for  each fieldValue as Variant in fields.Values
		    
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
