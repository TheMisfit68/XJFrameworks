#tag Class
Protected Class JVCheckBoxCell
Inherits JVCell
	#tag Method, Flags = &h0
		Function activate(x as Integer, y as Integer) As Boolean
		  
		  // Do nothing special, let Xojo handle the native checkbox
		  return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor(Listbox.TypeCheckbox)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(g as graphics) As Boolean
		  
		  resetToNativeType
		  
		  dim value as CheckBox.CheckedStates = fieldValue
		  if ListBox.CellState(row, column) <> value then
		    ListBox.CellState(row, column) = value
		  end if
		  
		  // Do nothing special, let Xojo handle the native checkbox
		  return False
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(g as graphics, x as Integer, y as Integer) As Boolean
		  
		  
		  // Do nothing special, let Xojo handle the native checkbox
		  return False
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Select case fieldValue
			  case 0
			    return checkBox.CheckedStates.Unchecked
			  case 1
			    return checkBox.CheckedStates.Indeterminate
			  case 2
			    return checkBox.CheckedStates.Checked
			  end select
			  
			End Get
		#tag EndGetter
		cellValue As Variant
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="nativeType"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isDirty"
			Group="Behavior"
			Type="Boolean"
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
