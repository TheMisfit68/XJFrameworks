#tag Class
Protected Class JVCheckBoxCell
Inherits JVCell
	#tag Method, Flags = &h0
		Function activate(x as Integer, y as Integer) As Boolean
		  // Do nothing special, let Xojo handle the standard checkbox
		  return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(g as graphics) As Boolean
		  // Part of the JVCell interface.
		  if ListBox.CellType(row, column) <> Listbox.TypeCheckbox then
		    ListBox.CellType(row, column) = Listbox.TypeCheckbox
		  end if
		  
		  
		  dim value as CheckBox.CheckedStates = fieldValue
		  if ListBox.CellState(row, column) <> value then
		    ListBox.CellState(row, column) = value
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(g as graphics, x as Integer, y as Integer) As Boolean
		  
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
