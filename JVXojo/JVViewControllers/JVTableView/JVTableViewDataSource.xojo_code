#tag Interface
Protected Interface JVTableViewDataSource
	#tag Method, Flags = &h0
		Function cellType(fieldName as String) As JVCustomCell
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editField(row as Integer, column as Integer, field as Pair)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub formatCell(row as Integer, column as Integer)
		  
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
End Interface
#tag EndInterface
