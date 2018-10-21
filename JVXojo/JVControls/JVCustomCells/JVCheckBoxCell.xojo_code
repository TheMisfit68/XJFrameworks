#tag Class
Protected Class JVCheckBoxCell
Implements JVCustomCell
	#tag Method, Flags = &h0
		Function activate(listBox as JVtableView, row as integer, column as Integer, x as Integer, y as Integer) As Boolean
		  // Do nothing special, let Xojo handle the standard checkbox
		  return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(listBox as JVtableView, g as graphics, row as integer, column as integer) As Boolean
		  // Part of the JVCustomCell interface.
		  if ListBox.CellType(row, column) <> Listbox.TypeCheckbox then
		    ListBox.CellType(row, column) = Listbox.TypeCheckbox
		  end if
		  
		  dim fieldInfo as Pair = listbox.celltag(row, column)
		  dim value as CheckBox.CheckedStates = fieldInfo.Right
		  
		  if ListBox.CellState(row, column) <> value then
		    ListBox.CellState(row, column) = value
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
