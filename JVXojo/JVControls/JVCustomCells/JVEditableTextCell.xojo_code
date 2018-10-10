#tag Class
Protected Class JVEditableTextCell
Implements JVCustomCell
	#tag Method, Flags = &h0
		Function activate(listBox as JVtableView, row as integer, column as Integer, x as Integer, y as Integer) As Boolean
		  
		  
		  if listbox.CellType(row, column) <> listbox.TypeEditableTextField then
		    listbox.CellType(row, column) = listbox.TypeEditableTextField // Just turn the default cell in EditableTextField the first time it gets clicked
		  else
		    listbox.EditCell(row, column) // Edit the cell if its gets clicked second time 
		  end if
		  
		  return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(listBox as JVtableView, g as graphics, row as integer, column as integer) As Boolean
		  
		  // While  drawing the field don't make it editable just yet, just draw a default cell
		  if listbox.CellType(row, column) <> Listbox.TypeDefault then
		    listbox.CellType(row, column) = Listbox.TypeDefault
		  end if
		  dim backValue as Pair = listbox.cellTag(row, column)
		  if backValue <> nil then
		    dim frontValue as String = backValue.right.StringValue
		    if listbox.Cell(row, column) <> frontValue then
		      listbox.Cell(row, column) = frontValue
		    end if
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(listBox as JVtableView, g as graphics, row as integer, column as Integer, x as Integer, y as Integer) As Boolean
		  
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
