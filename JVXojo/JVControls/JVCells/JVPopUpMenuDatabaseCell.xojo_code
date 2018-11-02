#tag Class
Protected Class JVPopUpMenuDatabaseCell
Inherits JVPopUpMenuCell
	#tag Method, Flags = &h0
		Sub constructor(database as SQLIteDatabase, sqlString as String, branchFields() as String, TextAndValueField as Pair)
		  // Calling the overridden superclass constructor.
		  
		  preparedStatement = database.Prepare(sqlString)
		  me.branchFields = branchFields
		  me.keypathField = TextAndValueField.right
		  
		  menu = new JVMenuItem(nil, treenode, TextAndValueField.left)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private branchFields() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private keypathField As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTreenode As NSTreeNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private preparedStatement As SQLitePreparedStatement
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if mTreenode = nil then  //Lazy loading of records from the dbase
			    
			    dim records as Recordset = preparedStatement.SQLSelect
			    mTreenode = new NStreeNode(records, branchFields, keypathField)
			    
			  end if
			  
			  Return mTreenode
			End Get
		#tag EndGetter
		Private treenode As NSTreeNode
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="nativeType"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="column"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="row"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="fieldName"
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
