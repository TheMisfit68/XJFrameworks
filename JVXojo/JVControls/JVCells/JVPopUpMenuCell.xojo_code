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
		  
		  return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(node as NSTreeNode, textColumn as String)
		  super.constructor
		  
		  menu = new JVMenuItem(nil, node, textColumn)
		  me.valueTransformer = menu.valueTransformer
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(g as graphics) As Boolean
		  // Part of the JVCell interface.
		  
		  // Calculate all dimensions and
		  dim outerXPadding as Integer = 2
		  dim outerYPadding as Integer = 1
		  dim textXPadding as Integer = 10
		  dim textYPadding as Integer = 2
		  
		  activeRange = NSRange.NSMakeRange(disclosureRange.length, g.width-disclosureRange.length)
		  dim activeArea as Graphics = g.clip(activeRange.location, 0, activeRange.length, g.Height)
		  
		  // Draw an arrow to indicate that clicking this field will
		  // display a menu
		  dim menuArea as Graphics = activeArea.clip(outerXPadding, outerYPadding, activeArea.Width-(2*outerXPadding), activeArea.Height-(2*outerYPadding) )
		  
		  menuArea.ForeColor = &cDFDFDF // Ultra light gray
		  menuArea.PenHeight = 1
		  menuArea.FILLRoundRect(0, 0, menuArea.Width, menuArea.height, 10, 10)
		  
		  menuArea.ForeColor = NSColor.LightGrey
		  menuArea.DrawLine(25, 0, 25, menuArea.height)
		  
		  // Points for a triangle on the left side of the cell
		  Dim points(6) As Integer
		  points(1) = 10
		  points(2) = 4
		  points(3) = 20
		  points(4) = 4 
		  points(5) = 15
		  points(6) = 14 
		  
		  menuArea.FillPolygon(points)
		  
		  return True
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(g as graphics, x as Integer, y as Integer) As Boolean
		  Value = valueTransformer.representationFor(fieldValue)
		  
		  // Draw the cells value in place
		  dim textXPadding as Integer = 5
		  dim textYPadding as Integer = 1
		  
		  dim textualArea as Graphics = g.clip(activeRange.location+25, 0, g.width-(activeRange.location+25), g.Height)
		  textualArea = textualArea.clip(textXPadding, textYPadding, textualArea.width-(2*TextXPadding), textualArea.Height-(2*TextYPadding))
		  textualArea.ForeColor = NSColor.Black
		  textualArea.DrawString(Value, 0, textualArea.TextAscent)
		  
		  return True
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		menu As JVMenuItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="nativeType"
			Group="Behavior"
			Type="Integer"
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
