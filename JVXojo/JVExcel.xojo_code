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
		Function expandRangeDown(startRange as ExcelRange) As ExcelRange
		  dim firstCellValue as string = startRange.Cells(1,1).value
		  
		  // Like Ctrl+Shift+Down-arrow
		  if firstCellValue <> "" then
		    
		    dim expandedRange as ExcelRange = me.Range(startRange,startRange.End_(Office.xlDown))
		    return expandedRange
		    
		  else
		    
		    return startRange
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function expandRangeRight(startRange as ExcelRange) As ExcelRange
		  dim firstCellValue as string = me.range(startRange).Cells(1,1).value
		  
		  // Like Ctrl+Shift+Down-arrow
		  if firstCellValue <> "" then
		    
		    dim expandedRange as ExcelRange = me.Range(startRange,startRange.End_(Office.xlToRight))
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
