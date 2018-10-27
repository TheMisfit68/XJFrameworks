#tag Class
Protected Class JVEditableTextCell
Inherits JVCell
	#tag Method, Flags = &h0
		Function activate(x as Integer, y as Integer) As Boolean
		  
		  
		  if listbox.CellType(row, column) <> listbox.TypeEditableTextField then
		    listbox.CellType(row, column) = listbox.TypeEditableTextField // Just turn the default cell in EditableTextField the first time it gets clicked
		  else
		    listbox.EditCell(row, column) // Edit the cell if its gets clicked second time 
		  end if
		  
		  return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(g as graphics) As Boolean
		  
		  // While  drawing the field don't make it editable just yet, just draw a default cell
		  if listbox.CellType(row, column) <> Listbox.TypeDefault then
		    listbox.CellType(row, column) = Listbox.TypeDefault
		  end if
		  
		  return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(g as graphics, x as Integer, y as Integer) As Boolean
		  
		  if listbox.Cell(row, column) <> fieldValue then
		    listbox.Cell(row, column) = fieldValue
		  end if
		  
		  return False
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
