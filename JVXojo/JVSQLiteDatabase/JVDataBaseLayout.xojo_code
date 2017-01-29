#tag Class
Protected Class JVDataBaseLayout
	#tag Method, Flags = &h0
		Sub constructor(database as JVSQLiteDatabase, baseTable as String, relatedFields as Dictionary)
		  
		  me.database = database
		  me.baseTable = baseTable
		  me.baseFields = new Dictionary
		  
		  dim fieldSchema as RecordSet = database.FieldSchema(baseTable)
		  If fieldSchema <> Nil Then
		    While Not fieldSchema.EOF
		      dim fieldName as String = fieldSchema.IdxField(1).StringValue
		      baseFields.value(fieldName)=nil    
		      fieldSchema.MoveNext
		    Wend
		  end if
		  
		  
		  
		  
		  me.relatedFields =  new Dictionary
		  
		  for each relatedFieldKeys as String in relatedFields.keys
		    
		    dim relatedTableKey as string = NthField(relatedFieldKeys,".",1)
		    relatedTables.Append(relatedTableKey)
		    
		    dim relatedFieldKey as string = NthField(relatedFieldKeys,".", CountFields(relatedFieldKeys,"."))
		    
		    dim relatedFieldSchema as RecordSet = database.FieldSchema(relatedTableKey)
		    If relatedFieldSchema <> Nil Then
		      While Not fieldSchema.EOF
		        dim relatedFieldName as String = fieldSchema.IdxField(1).StringValue
		        if relatedFieldName = relatedFieldKey then
		          relatedFields.value(relatedFieldName)=nil    
		        end if
		        fieldSchema.MoveNext
		      Wend
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub performCommit()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub performSearch()
		  
		  dim allFieldsString as String = join(concatenate(baseFields.keys, relatedFields.keys), ", ")
		  dim allRequestsString as String = join(concatenate(baseFields.keys, relatedFields.keys), "=?, ")
		  dim allValues() as String = concatenate(baseFields.values, relatedFields.values)
		  
		  dim preparedStatement as SQLitePreparedStatement
		  if relatedFields.Count > 0 then
		    preparedStatement = dataBase.Prepare("SELECT " +allFieldsString+" FROM "+baseTable)
		  else
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setField(fieldName as String, fieldValue as Variant)
		  
		  dim relatedTableKey as string = NthField(fieldName,".",1)
		  dim relatedFieldKey as string = NthField(fieldName,".", CountFields(fieldName,"."))
		  
		  if not fieldName.contains(".")  and baseFields.HasKey(fieldName) then
		    baseFields.Value(fieldName) = fieldValue
		  elseif  fieldName.contains(".") and relatedFields.hasKey(relatedFieldKey) then
		    relatedFields.Value(relatedFieldKey) = fieldValue
		  else
		    #if DebugBuild then
		      system.DebugLog("[JVDatabaseLayout] Field '"+FieldName+"' not available")
		    #endif
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		baseFields As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		baseTable As String
	#tag EndProperty

	#tag Property, Flags = &h0
		dataBase As JVSQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		relatedFields As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		relatedTables() As String
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
