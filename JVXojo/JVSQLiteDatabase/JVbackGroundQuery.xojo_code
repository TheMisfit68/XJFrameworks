#tag Class
Protected Class JVbackGroundQuery
Inherits JVBackgroundTask
	#tag Event
		Sub Run()
		  foundRecords = preparedStatement.SQLSelect
		  
		  if (foundRecords <> nil)  and (foundRecords.RecordCount > 0)  and (branchfields <> nil) then
		    
		    me.treenNode = new NSTreeNode(foundRecords, branchfields)
		    
		  else
		    
		    me.treenNode = new NSTreeNode()
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub bindVariables(optional variables() as Variant = nil)
		  
		  
		  preparedStatement.bindVariables(variables)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(database as JVSQLiteDatabase, statementString as String, optional branchFields() as String = nil, optional ID as String)
		  me.debugIdentifier = ID
		  me.database = database
		  me.sqlString = statementString
		  me.preparedStatement = database.Prepare(statementString)
		  
		  me.branchFields = branchFields
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		branchFields() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		database As JVSQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		foundRecords As RecordSet
	#tag EndProperty

	#tag Property, Flags = &h0
		preparedStatement As SQLitePreparedStatement
	#tag EndProperty

	#tag Property, Flags = &h0
		sqlString As String
	#tag EndProperty

	#tag Property, Flags = &h0
		treenNode As NSTreeNode
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sqlString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
