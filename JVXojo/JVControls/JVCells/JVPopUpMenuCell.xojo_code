#tag Class
Protected Class JVPopUpMenuCell
Inherits JVCell
	#tag Method, Flags = &h0
		Function activate(x as Integer, y as Integer) As Boolean
		  // Part of the JVCell interface.
		  
		  listbox.ListIndex = row
		  listbox.Selected(row) = True
		  
		  // Process the contained popup
		  dim selectedMenu as JVMenuItem = JVMenuItem(menu.PopUp)
		  if selectedMenu <> nil then
		    
		    fieldValue =  selectedMenu.valueAndText.left
		    
		  end if
		  
		  return False
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(node as NSTreeNode, textColumn as String)
		  
		  menu = new JVMenuItem(node, textColumn)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(g as graphics) As Boolean
		  // Part of the JVCell interface.
		  
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
		  
		  return True
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(g as graphics, x as Integer, y as Integer) As Boolean
		  
		  // In an hiërarchical cell leave some extra space for the disclosure triangle
		  dim extraOffset as Integer = 0
		  if (listbox.Hierarchical) and (column = 0)  then
		    if listbox.RowIsFolder(row) then
		      extraOffset  = (listbox.rowDepth(row)+1)*15
		    else
		      extraOffset  = listbox.rowDepth(row)*15
		    end if
		  end if
		  
		  dim textRepresentation as String = menu.textRepresentation(fieldValue)
		  listBox.CellAlignmentOffset(row, column) = 30+extraOffset
		  listBox.cell(row, column) = textRepresentation
		  
		  return False
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		menu As JVMenuItem
	#tag EndProperty


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
