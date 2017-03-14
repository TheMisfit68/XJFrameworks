#tag Class
Protected Class NSTreeController
Inherits NSViewController
	#tag Method, Flags = &h0
		Sub add()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addChild()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function arrangedObjects() As Object
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub arrangeObjects(contentToArange() as Object)
		  // 
		  // if (contentmode = CONTENTMODES.SQLITEBASED)  and (content <> nil) and (content isa Recordset) then
		  // 
		  // dim currentLevelObjects() as String
		  // dim nextLevelObjects() as String
		  // 
		  // dim data as recordset = content
		  // data.MoveFirst
		  // 
		  // while not data.EOF
		  // 
		  // 
		  // for fieldNumber as Integer = 1 to data.FieldCount
		  // dim fieldName as String = data.IdxField(fieldNumber).name
		  // dim fieldValue as String = data.field(fieldName).StringValue
		  // dim isChilnode as Boolean = (fieldName =childrenKeyPath)
		  // 
		  // if Not isChilnode then
		  // currentLevelObjects.append(fieldValue)
		  // end if
		  // 
		  // next
		  // 
		  // data.MoveNext
		  // wend
		  // 
		  // 
		  // else if (contentmode = CONTENTMODES.CLASSBASED) 
		  // 
		  // // Future implementation for object based content instead of SQLite
		  // 
		  // end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(model as Variant)
		  content = model
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub remove()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		childrenKeyPath As String = "Children"
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  mcontent = value
			  arrangeObjects(mcontent)
			End Set
		#tag EndSetter
		content As variant
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		contentMode As CONTENTMODES = CONTENTMODES.SQLITEBASED
	#tag EndProperty

	#tag Property, Flags = &h0
		isLeafKeypath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mcontent As variant
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		selectionIndexes As Integer
	#tag EndComputedProperty


	#tag Enum, Name = CONTENTMODES, Type = Integer, Flags = &h0
		SQLITEBASED
		CLASSBASED
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="childrenKeyPath"
			Group="Behavior"
			InitialValue="Children"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="contentMode"
			Group="Behavior"
			InitialValue="CONTENTMODES.SQLITE"
			Type="CONTENTMODES"
			EditorType="Enum"
			#tag EnumValues
				"0 - SQLITEBASED"
				"1 - CLASSBASED"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isLeafKeypath"
			Group="Behavior"
			InitialValue="isParent"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="selectionIndexes"
			Group="Behavior"
			Type="Integer"
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
