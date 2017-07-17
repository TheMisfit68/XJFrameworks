#tag Class
Protected Class JVSQLiteDataSource
	#tag Method, Flags = &h0
		Sub constructor()
		  // me.dataBase = dataBase
		  // me.preparedStatement = dataBase.Prepare(statement)
		  // 
		  // // Combine each tableName and fieldName in to a longFieldName
		  // 
		  // dim tables as recordSet = dataBase.TableSchema
		  // while not tables.EOF
		  // dim tableName as String= tables.field("TableName").StringValue
		  // 
		  // dim fields as RecordSet = database.FieldSchema(tableName)
		  // while not fields.EOF
		  // 
		  // dim fieldName as String = fields.Field("ColumnName").StringValue
		  // dim longFieldName as String = tableName+"."+fieldName
		  // 
		  // // dim isPrimaryKeyField as Boolean = fields.Field("IsPrimary").BooleanValue
		  // // dim isIntegerField as Boolean = (fields.Field("FieldType").IntegerValue = 19)
		  // // dim isForeignKeyField as Boolean =  (not isPrimaryKeyField) and isIntegerField and (fieldName.right(2) = "ID")
		  // // 
		  // // if  not isForeignKeyField and not fieldTables.HasKey(longFieldName) then
		  // longFieldNames.Append(longFieldName)
		  // System.DebugLog("Field "+longFieldName+" exists on table "+tableName)
		  // // end if
		  // 
		  // fields.MoveNext
		  // 
		  // wend
		  // 
		  // tables.MoveNext
		  // wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub reload()
		  foundRecords =  preparedStatement.SQLSelect
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // reload
			  //
			  // objects = nil
			  //
			  // if foundRecords <> nil then
			  //
			  // while not foundRecords.eof
			  //
			  //
			  // foundRecords.MoveNext
			  // wend
			  //
			  // end if
			  //
			  // return objects
			  
			  
			  
			End Get
		#tag EndGetter
		arrangedObjects As Object
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		dataBase As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		foundRecords As recordSet
	#tag EndProperty

	#tag Property, Flags = &h0
		longFieldNames() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		preparedStatement As SQLitePreparedStatement
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
