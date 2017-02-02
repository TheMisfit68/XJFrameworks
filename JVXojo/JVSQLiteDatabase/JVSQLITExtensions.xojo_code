#tag Module
Protected Module JVSQLITExtensions
	#tag Method, Flags = &h0
		Sub bindType(extends statement as SqlitePreparedStatement, fieldValues() as Variant)
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


End Module
#tag EndModule
