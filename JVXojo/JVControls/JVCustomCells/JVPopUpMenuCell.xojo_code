#tag Class
Protected Class JVPopUpMenuCell
Inherits JVMenuItem
Implements JVCustomCell
	#tag Method, Flags = &h0
		Function activate(listBox as JVtableView, row as integer, column as Integer, x as Integer, y as Integer) As Boolean
		  // Part of the JVCustomCell interface.
		  
		  listbox.ListIndex = row
		  listbox.Selected(row) = True
		  dim celltag as Pair = listbox.celltag(row, column)
		  dim existingCellName as String = celltag.left
		  
		  // Process the contained popup
		  dim selectedMenu as JVMenuItem = JVMenuItem(PopUp) // Cast the result
		  if selectedMenu <> nil then
		    
		    dim newValue as Variant =  selectedMenu.values.left
		    listbox.celltag(row, column) = existingCellName : newValue
		    
		  end if
		  
		  return False
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(listBox as JVtableView, g as graphics, row as integer, column as integer) As Boolean
		  // Part of the JVCustomCell interface.
		  
		  // In an hiërarchical cell leave some extra space for the disclosure triangle
		  dim extraOffset as Integer = 0
		  if (listbox.Hierarchical) and (column = 0)  then
		    if listbox.RowIsFolder(row) then
		      extraOffset  = (listbox.rowDepth(row)+1)*15
		    else
		      extraOffset  = listbox.rowDepth(row)*15
		    end if
		  end if
		  
		  // Draw an arrow to indicate that clicking this field will
		  // display a menu
		  g.ForeColor = &cDFDFDF // Ultra light gray
		  
		  g.PenHeight = 1
		  g.FILLRoundRect(extraOffset+2, 1, g.Width-extraOffset-4, g.Height-2, 10, 10)
		  
		  g.ForeColor = NSColor.LightGrey
		  g.DrawLine(extraOffset+30, 1, extraOffset+30,1+g.Height-1)
		  
		  // Points for a triangle on the left side of the cell
		  Dim points(6) As Integer
		  points(1) = extraOffset+10
		  points(2) = 4
		  points(3) = extraOffset+20
		  points(4) = 4 
		  points(5) = extraOffset+15
		  points(6) = 14 
		  
		  g.FillPolygon(points)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(listBox as JVtableView, g as graphics, row as integer, column as Integer, x as Integer, y as Integer) As Boolean
		  dim fieldInfo as Pair = listbox.celltag(row, column)
		  dim value as Integer = fieldInfo.Right
		  dim text as String = textRepresentation(value)
		  
		  // In an hiërarchical cell leave some extra space for the disclosure triangle
		  dim extraOffset as Integer = 0
		  if (listbox.Hierarchical) and (column = 0)  then
		    if listbox.RowIsFolder(row) then
		      extraOffset  = (listbox.rowDepth(row)+1)*15
		    else
		      extraOffset  = listbox.rowDepth(row)*15
		    end if
		  end if
		  
		  listBox.CellAlignmentOffset(row, column) = 30+extraOffset
		  listBox.cell(row, column) = text
		  
		  return False
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		textArea As Graphics
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
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
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
