#tag Class
Protected Class JVFilePathCell
Inherits JVCell
	#tag Method, Flags = &h0
		Function activate(x as Integer, y as Integer) As Boolean
		  
		  
		  if (listbox.ListIndex <> row) then
		    
		    // On the first click just make sure the row gets selected
		    listbox.ListIndex = row
		    return True
		    
		  else
		    
		    if (x >= activeRange.location) and (x <= activeRange.location+activeRange.length) then
		      
		      // The button was clicked
		      // Present the dialog and
		      dim choosenFile as FolderItem
		      if customDialog <> nil then
		        
		        choosenFile = customDialog.ShowModal()
		        
		      else
		        
		        choosenFile = GetFolderItem("")
		        
		      end if
		      
		      // Handle the reponse
		      if (choosenFile <> nil) and (choosenFile.Exists) Then
		        value = choosenFile.NativePath
		      end if
		      
		      return True
		      
		    else
		      
		      // Text was Clicked
		      // Once selected, rows and cells become editable
		      listbox.CellType(row, column) = listbox.TypeEditableTextField
		      listbox.EditCell(row, column)
		      
		      return False
		      
		    end if
		    
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(optional customizedOpenDialog as OpenDialog = nil)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(Listbox.TypeDefault, nil)
		  
		  customDialog = customizedOpenDialog
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(g as graphics) As Boolean
		  // Part of the JVCell interface.
		  
		  resetToNativeType
		  
		  // Calculate all dimensions and
		  dim outerXPadding as Integer = 5
		  dim outerYPadding as Integer = 1
		  dim textXPadding as Integer = 10
		  dim textYPadding as Integer = 2
		  
		  activeRange = NSRange.NSMakeRange(g.width-50, 50)
		  dim activeArea as Graphics = g.clip(activeRange.location, 0, activeRange.length, g.Height)
		  
		  dim buttonArea as Graphics = activeArea.clip(outerXPadding, outerYPadding, activeArea.Width-(2*outerXPadding), activeArea.Height-(2*outerYPadding) )
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
		  
		  
		  return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(g as graphics, x as Integer, y as Integer) As Boolean
		  
		  // Draw the cells value in place
		  dim textXPadding as Integer = 5
		  dim textYPadding as Integer = 1
		  
		  dim tekstLength as Double = g.StringWidth(Value)
		  
		  dim textualArea as Graphics = g.clip(0, 0, activeRange.location, g.Height)
		  textualArea = textualArea.clip(textXPadding, textYPadding, textualArea.width-(2*TextXPadding), textualArea.Height-(2*TextYPadding))
		  textualArea.ForeColor = NSColor.Black
		  textualArea.DrawString(Value, textualArea.Width-tekstLength, textualArea.TextAscent) // Right-align the path to display the most relevant part in a small column
		  
		  
		  return True
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		customDialog As OpenDialog
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="representation"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
