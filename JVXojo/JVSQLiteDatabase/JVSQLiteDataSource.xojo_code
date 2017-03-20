#tag Class
Protected Class JVSQLiteDataSource
	#tag Method, Flags = &h0
		Sub constructor(dataBase as JVSQLiteDatabase,Statement as String)
		  me.dataBase = dataBase
		  me.preparedStatement = dataBase.Prepare(statement)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function fieldLevels() As Integer()
		  
		  
		  if mfieldLevels = nil then
		    
		    dim tables as recordSet = dataBase.TableSchema
		    
		    // Store the tableNames in an array
		    dim tableNames() as String
		    while not tables.EOF
		      tableNames.Append(tables.IdxField(1).StringValue)
		      tables.MoveNext
		    wend
		    
		    for fieldNumber as Integer = 1 to foundRecords.FieldCount
		      dim fieldName as String = foundRecords.IdxField(fieldNumber).Name
		    next
		    
		  end if
		  
		  return mfieldLevels
		End Function
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

	#tag Property, Flags = &h21
		Private mfieldLevels() As Integer
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
