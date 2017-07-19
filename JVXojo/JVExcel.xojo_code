#tag Class
Protected Class JVExcel
Inherits ExcelApplication
	#tag Method, Flags = &h0
		Sub clearClipboard()
		  dim c as new Clipboard
		  c.Text = ""
		  c.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub clearMarchingAntsSelection()
		  
		  me.Application.CutCopyMode = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub copyDownFrom(sheetNumber as Integer = 1, startRange as String = "A1")
		  
		  expandRangeDown(me.sheets(sheetNumber).range(startRange)).copy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub copyRightFrom(sheetNumber as Integer = 1, startRange as String = "A1")
		  
		  expandRangeRight(me.sheets(sheetNumber).range(startRange)).copy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function expandRangeDown(startRange as ExcelRange, numberOfTimes as Integer =1) As ExcelRange
		  dim firstCellValue as string = startRange.Cells(1,1).value
		  dim firstColumn as Integer = startRange.Column
		  dim finalRow as Integer = startRange.Worksheet.Rows.count
		  dim lastUsedRow as Integer
		  dim expandedRange as ExcelRange
		  
		  if firstCellValue <> "" then
		    
		    if skipEmptyLines then
		      // Like Ctrl+Up-arrow starting at the bottom of the sheet
		      lastUsedRow = startRange.Worksheet.cells(finalRow, firstColumn).End_(Office.xlUp).row
		    else
		      // Like Ctrl+Down-arrow
		      lastUsedRow = StartRange.End_(Office.xlDown).Row
		    end if
		    
		    expandedRange = startRange .resize(lastUsedRow-startRange.row+1, startRange.columns.count)
		    
		    return expandedRange
		    
		  else
		    
		    return startRange
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function expandRangeRight(startRange as ExcelRange, numberOfTimes  as Integer=1) As ExcelRange
		  dim firstCellValue as string = startRange.Cells(1,1).value
		  dim firstRow as Integer = startRange.row
		  dim finalColumn as Integer = startRange.Worksheet.Columns.count
		  dim lastUsedColumn as Integer
		  dim expandedRange as ExcelRange
		  
		  if firstCellValue <> "" then
		    
		    if skipEmptyLines then
		      // Like Ctrl+Left-arrow but starting at the far right of the sheet
		      lastUsedColumn = startRange.Worksheet.cells(firstRow, finalColumn).End_(Office.xlleft).row
		    else
		      // Like Ctrl+Right-arrow
		      lastUsedColumn = StartRange.End_(Office.xlRight).Column
		    end if
		    
		    expandedRange = startRange .resize(startRange.rows.count,lastUsedColumn-startRange.Column+1)
		    
		    return expandedRange
		    
		  else
		    
		    return startRange
		    
		  end if
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
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
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
