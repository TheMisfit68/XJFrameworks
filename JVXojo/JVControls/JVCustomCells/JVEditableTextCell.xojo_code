#tag Class
Protected Class JVEditableTextCell
Implements JVCustomCell
	#tag Method, Flags = &h0
		Sub activate(listBox as JVtableView, row as integer, column as Integer)
		  
		  if listbox.CellType(row, column) <> listbox.TypeEditableTextField then
		    listbox.CellType(row, column) = listbox.TypeEditableTextField
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub draw(listBox as JVtableView , g as graphics, row as integer, column as integer)
		  
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
End Class
#tag EndClass
