#tag Class
Protected Class JVDatabaseRequest
Inherits databaseRecord
	#tag Method, Flags = &h0
		Sub constructor(optional record as DatabaseRecord = nil)
		  
		  if record <> nil then
		    
		    // Jus convert the recor to a request for typecasting
		    for fieldNumber as Integer = 0 to record.FieldCount-1
		      
		      dim fieldName as String = record.FieldName(fieldNumber)
		      dim fieldValue as Variant = record.Column(fieldName)
		      
		      column(fieldName) = fieldValue
		      
		    next fieldNumber
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function RequestsBasedOnRecords(records() as DatabaseRecord) As JVDatabaseRequest()
		  // This is a simple factory-method to create some requests based from a number of records
		  
		  dim requestsBasedOnrecords() as JVDatabaseRequest
		  
		  for each record as DatabaseRecord in records
		    dim requestBasedOnRecord as new JVDatabaseRequest(record)
		    requestsBasedOnrecords.Append(requestBasedOnRecord)
		  next record
		  
		  return requestsBasedOnrecords
		End Function
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
End Class
#tag EndClass
