#tag Class
Protected Class JVRegEx
Inherits regex
	#tag Method, Flags = &h0
		Shared Function capture(uncapturedExpression as String) As String
		  return "("+uncapturedExpression+")"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  
		  me.options.CaseSensitive =  FALSE
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(searchPattern as String, paramarray labelsForSubExpressions as String)
		  me.SearchPattern = searchPattern
		  me.options.CaseSensitive =  FALSE
		  
		  dim numberofOpeningBrackets as Integer = split(searchPattern, "(").ubound
		  dim numberofClosingBrackets as Integer = split(searchPattern, ")").ubound
		  dim numberOfBracketsForOptionalGroups as Integer = split(searchPattern, "(?:").ubound
		  if numberOfBracketsForOptionalGroups > 0 then
		    numberofOpeningBrackets = numberofOpeningBrackets-numberOfBracketsForOptionalGroups
		    numberofClosingBrackets = numberofClosingBrackets-numberOfBracketsForOptionalGroups
		  end if
		  
		  if (numberofOpeningBrackets = numberofClosingBrackets) and  (numberofOpeningBrackets = labelsForSubExpressions.ubound+1) then
		    
		    me.labelsForSubExpressions = labelsForSubExpressions
		    me.labelsForSubExpressions.Insert(0, "MainExpression")
		    
		  else
		    
		    me.labelsForSubExpressions = nil
		    
		    // Raise an exception
		    Dim e As RuntimeException = New RuntimeException
		    e.ErrorNumber = -1
		    e.Message = "[JVRegex] Number of subexpressions don't match the number of labels provided for them"
		    Raise e
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function optionalGroup(uncapturedExpression as String) As String
		  return "(?:"+uncapturedExpression+")*"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function search(sourceString as String) As RegExMatch
		  labeledSubExpressions = new Dictionary
		  dim match as regexMatch = super.search(sourceString)
		  
		  If (match <> Nil)  then
		    dim numberOfSubExpressions as integer = match.SubExpressionCount
		    dim numberOfLabels as Integer = labelsForSubExpressions.ubound+1
		    if (numberOfSubExpressions <= numberOfLabels) Then
		      
		      Dim label as String
		      Dim subExpression As String
		      
		      for subExpressionNumber as Integer = 0 to numberOfSubExpressions-1
		        
		        label = labelsForSubExpressions(subExpressionNumber)
		        subExpression = match.SubExpressionString(subExpressionNumber)
		        labeledSubExpressions.value(label) = subExpression
		        
		      next subExpressionNumber
		      
		    End If
		    
		    
		  end if
		  
		  return match
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		labeledSubExpressions As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		labelsForSubExpressions() As String
	#tag EndProperty


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
			Name="Options"
			Visible=true
			Type="RegExOptions"
			EditorType="RegExOptions"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReplacementPattern"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SearchPattern"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SearchStartPosition"
			Visible=true
			Type="Integer"
			EditorType="Integer"
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
