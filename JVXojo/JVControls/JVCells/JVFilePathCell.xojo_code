#tag Class
Protected Class JVFilePathCell
Inherits JVCell
	#tag Method, Flags = &h0
		Function activate(x as Integer, y as Integer) As Boolean
		  listbox.ListIndex =row
		  listbox.Selected(row) = True
		  
		  // if (x >= activeRangeX.location) and (x <= activeRangeX.location+activeRangeX.length) and (y >= activeRangeY.location) and (Y<= activeRangeY.location+activeRangeY.length) then
		  
		  // Present the dialog and
		  dim choosenFile as FolderItem
		  if customDialog <> nil then
		    
		    choosenFile = customDialog.ShowModal()
		    
		  else
		    
		    choosenFile = GetFolderItem("")
		    
		  end if
		  
		  // Handle the reponse
		  if (choosenFile <> Nil) and (choosenFile.Exists) Then
		    
		    fieldValue = choosenFile.NativePath
		    
		  end if
		  
		  // end if
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(optional customizedOpenDialog as OpenDialog = nil)
		  
		  customDialog = customizedOpenDialog
		  
		  // Divide the dimensions of the cell over the button and the text
		  leftAreaPercentage = 80.0
		  rightAreaPercentage = 100.0-leftAreaPercentage
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(g as graphics) As Boolean
		  // Part of the JVCell interface.
		  
		  
		  // Calculate all dimensions and
		  dim outerXPadding as Integer = 5
		  dim outerYPadding as Integer = 1
		  dim textXPadding as Integer = 10
		  dim textYPadding as Integer = 2
		  
		  dim rightArea as Graphics = g.clip(g.width*leftAreaPercentage/100, 0, g.Width*rightAreaPercentage/100, g.Height)
		  dim buttonArea as Graphics = rightArea.clip(outerXPadding, outerYPadding, rightArea.Width-(2*outerXPadding), rightArea.Height-(2*outerYPadding) )
		  dim captionArea as Graphics = buttonArea.clip(textXPadding, textYPadding, buttonArea.width-(2*textXPadding), buttonArea.height-(2*textYPadding) )
		  
		  // draw a Browse-bullet
		  buttonArea.ForeColor = &cDFDFDF // Ultra light gray
		  buttonArea.PenHeight = 1
		  buttonArea.FILLRoundRect(0, 0, buttonArea.Width, buttonArea.Height, 10, 10)
		  
		  // and its caption
		  dim caption as string = "•••"
		  dim tekstLength as Double = g.StringWidth(caption)
		  captionArea.ForeColor = NSColor.white
		  captionArea.DrawString(caption, (captionArea.Width-tekstLength)/2, captionArea.TextAscent) // Center the caption in the button
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(g as graphics, x as Integer, y as Integer) As Boolean
		  
		  // Set the frontvalue
		  if listbox.Cell(row, column) <> fieldValue then
		    listbox.Cell(row, column) = fieldValue
		  end if
		  
		  dim textRepresentation as String= listbox.Cell(row, column)
		  dim tekstLength as Double = g.StringWidth(textRepresentation)
		  
		  // And draw it in place
		  dim textXPadding as Integer = 5
		  dim textYPadding as Integer = 1
		  
		  dim leftArea as Graphics = g.clip(0, 0, g.width*leftAreaPercentage/100, g.Height)
		  dim textualArea as Graphics = leftArea.clip(textXPadding, textYPadding, leftArea.width-(2*TextXPadding), leftArea.Height-(2*TextYPadding))
		  textualArea.DrawString(textRepresentation, textualArea.Width-tekstLength, textualArea.TextAscent) // Right-align the path to dsiplay the most relevant part in a small column
		  
		  if listbox.CellType(row, column) <> listbox.TypeEditableTextField then
		    listbox.CellType(row, column) = listbox.TypeEditableTextField
		  end if
		  
		  return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		activeRangeX As NSRange
	#tag EndProperty

	#tag Property, Flags = &h0
		activeRangeY As NSRange
	#tag EndProperty

	#tag Property, Flags = &h0
		cachedBackground As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		customDialog As OpenDialog
	#tag EndProperty

	#tag Property, Flags = &h0
		leftAreaPercentage As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		rightAreaPercentage As Double
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
		#tag ViewProperty
			Name="leftAreaPercentage"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="rightAreaPercentage"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="cachedBackground"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
