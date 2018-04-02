#tag Class
Protected Class JVPopUpMenuCell
Inherits JVMenuItem
Implements JVCustomCell
	#tag Method, Flags = &h0
		Sub activate(listBox as ListBox, row as integer, column as Integer)
		  // Part of the JVCustomCell interface.
		  
		  listbox.ListIndex = row
		  listbox.Selected(row) = True
		  dim celltag as Pair = listbox.celltag(row, column)
		  dim existingCellName as String = celltag.left
		  
		  // Process the contained popup
		  dim selectedMenu as menuItem = PopUp
		  if selectedMenu <> nil then
		    
		    dim cellFormatter as NSFormatter = selectedMenu.Tag
		    dim newCellValue as Integer = cellFormatter.objectValue
		    
		    listbox.celltag(row, column) = existingCellName : newCellValue
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub draw(listBox as ListBox , g as graphics, row as integer, column as integer)
		  // Part of the JVCustomCell interface.
		  
		  dim extraOffset as Integer =0
		  if column = 0 then
		    extraOffset  = listbox.rowDepth(row)*14
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
		  
		  dim fieldInfo as Pair = listbox.celltag(row, column)
		  dim pk as Integer = fieldInfo.Right
		  
		  
		  g.ForeColor = NSColor.Black
		  // g.DrawString(stringValue, 35, g.height-4)
		  
		  
		  
		End Sub
	#tag EndMethod


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
