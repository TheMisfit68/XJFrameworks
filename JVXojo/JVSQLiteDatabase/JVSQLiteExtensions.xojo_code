#tag Module
Protected Module JVSQLiteExtensions
	#tag Method, Flags = &h21
		Private Sub bindType(extends statement as SQLitePreparedStatement, variables() as Variant)
		  dim fieldNumber as Integer = 0
		  for  each variable as Variant in variables
		    
		    select case variable.type
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
		  next variable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub bindVariables(extends statement as SQLitePreparedStatement, variables() as Variant)
		  
		  statement.BindType(variables)
		  statement.Bind(variables)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function description(extends baseRecord as DatabaseRecord) As String
		  dim description as String = "["+EndOfLine
		  
		  For fieldNumber As Integer = 0 To baseRecord.FieldCount-1
		    dim fieldName as String = baseRecord.FieldName(fieldNumber)
		    dim fieldValue as String = baseRecord.Column(fieldName)
		    
		    description = description + fieldName +" : "+fieldValue+EndOfLine
		    
		  next fieldNumber
		  description = description+ "]"
		  
		  return description
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function hasColumn(extends baseRecord as DatabaseRecord , columnName as String) As Boolean
		  
		  dim fieldFound as Boolean = False
		  
		  dim fieldNumber as Integer = 0
		  While not fieldFound and (fieldNumber < baseRecord.FieldCount)
		    dim fieldName as String = baseRecord.FieldName(fieldNumber)
		    fieldFound = (fieldName = columnName)
		    fieldNumber= fieldNumber+1
		  wend
		  
		  return fieldFound
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function nilableColumn(extends baseRecord as DatabaseRecord, columnName as String) As Variant
		  
		  dim textualValue as Variant =  baseRecord.Column(columnName)
		  
		  if textualValue.StringValue = "" then
		    return nil
		  end if
		  
		  return textualValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub nilableColumn(extends baseRecord as DatabaseRecord, columnName as String, assigns optionalValue as Variant)
		  
		  if optionalValue.Type = Variant.TypeNil  then
		    baseRecord.column(columnName) = optionalValue
		  else
		    baseRecord.IntegerColumn(columnName) = optionalValue
		  end if
		  
		End Sub
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
