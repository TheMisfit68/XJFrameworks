#tag Class
Protected Class JVSQLiteRelationship
	#tag Method, Flags = &h0
		Sub constructor(relationshipInDotNotation as String)
		  dim tables() as String = split(relationshipInDotNotation , ".")
		  baseTable =  tables(0)
		  
		  SQLiteView = "SELECT * FROM "+baseTable
		  
		  for tableNumber as Integer = 1 to tables.Ubound
		    dim currentTable as String = tables(tableNumber)
		    relatedTables.Append(currentTable)
		    
		    dim previousTable as string = tables(tableNumber-1)
		    dim foreignKeyField as String = previousTable
		    if Right(foreignKeyField, 1) = "s" then
		      foreignKeyField = left(foreignKeyField, len(foreignKeyField)-1)
		    end if
		    
		    SQLiteView =  SQLiteView + " ON " +previousTable+".ID="+currentTable+"."+foreignKeyField
		  next
		  
		  // dim fieldSchema as RecordSet = database.FieldSchema(baseTable)
		  // If fieldSchema <> Nil Then
		  // While Not fieldSchema.EOF
		  // dim fieldName as String = fieldSchema.IdxField(1).StringValue
		  // baseFields.value(fieldName)=nil    
		  // fieldSchema.MoveNext
		  // Wend
		  // end if
		  // 
		  // 
		  // 
		  // 
		  // me.relatedFields =  new Dictionary
		  // 
		  // for each relatedFieldKeys as String in relatedFields.keys
		  // 
		  // dim relatedTableKey as string = NthField(relatedFieldKeys,".",1)
		  // relatedTables.Append(relatedTableKey)
		  // 
		  // dim relatedFieldKey as string = NthField(relatedFieldKeys,".", CountFields(relatedFieldKeys,"."))
		  // 
		  // dim relatedFieldSchema as RecordSet = database.FieldSchema(relatedTableKey)
		  // If relatedFieldSchema <> Nil Then
		  // While Not fieldSchema.EOF
		  // dim relatedFieldName as String = fieldSchema.IdxField(1).StringValue
		  // if relatedFieldName = relatedFieldKey then
		  // relatedFields.value(relatedFieldName)=nil    
		  // end if
		  // fieldSchema.MoveNext
		  // Wend
		  // end if
		  // 
		  // next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		baseTable As String
	#tag EndProperty

	#tag Property, Flags = &h0
		relatedTables() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sortOrder() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SQLiteView As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="baseTable"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
