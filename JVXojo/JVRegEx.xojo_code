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
		Sub constructor(searchPattern as String, labelsForSubExpressions() as String)
		  me.SearchPattern = searchPattern
		  me.options.CaseSensitive =  FALSE
		  
		  if  (labelsForSubExpressions = nil) or (labelsForSubExpressions.ubound < 0) then
		    
		    me.labelsForSubExpressions = Array("MainExpression")
		    
		  else
		    
		    // Count the number of brackets that belong tot a capturing group…
		    dim numberOfOpeningBrackets as Integer = split(searchPattern, "(").ubound
		    dim numberOfClosingBrackets as Integer = split(searchPattern, ")").ubound
		    
		    // taking into account other sort of groups
		    dim numberOfBracketsForpassiveGroups as Integer = split(searchPattern, "(?").ubound
		    if numberOfBracketsForpassiveGroups > 0 then
		      numberofOpeningBrackets = numberOfOpeningBrackets-numberOfBracketsForpassiveGroups
		      numberofClosingBrackets = numberOfClosingBrackets-numberOfBracketsForpassiveGroups
		    end if
		    
		    dim numberOfEscapedOpeningBrackets as Integer = split(searchPattern, "\(").ubound
		    if numberOfEscapedOpeningBrackets > 0 then
		      numberofOpeningBrackets = numberOfOpeningBrackets-numberOfEscapedOpeningBrackets
		    end if
		    
		    dim numberOfEscapedClosingBrackets as Integer = split(searchPattern, "\)").ubound
		    if numberOfEscapedClosingBrackets > 0 then
		      numberofClosingBrackets = numberOfClosingBrackets-numberOfEscapedClosingBrackets
		    end if
		    
		    if(  (numberofOpeningBrackets = labelsForSubExpressions.ubound+1) and (numberofOpeningBrackets = numberOfClosingBrackets) ) then
		      
		      me.labelsForSubExpressions = labelsForSubExpressions
		      me.labelsForSubExpressions.Insert(0, "MainExpression")
		      
		    else
		      
		      me.labelsForSubExpressions = nil
		      
		      // Raise an exception
		      Dim e As RuntimeException = New RuntimeException
		      e.ErrorNumber = -1
		      e.Message = "[JVRegex] Number of subexpressions ("+Str(numberofOpeningBrackets)+") don't match the number of labels ("+Str(labelsForSubExpressions.ubound+1)+") provided for them"
		      Raise e
		      
		    end if
		    
		  end if
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(searchPattern as String, paramarray labelsForSubExpressions as String)
		  // Constructor using paramarray as convinience
		  // calls the designated initializer that uses a regular array
		  
		  constructor(searchPattern, labelsForSubExpressions)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function passiveGroup(uncapturedExpression as String) As String
		  return "(?:"+uncapturedExpression+")"
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

	#tag Method, Flags = &h0
		Shared Function stringToExpression(nonRegexString as String) As String
		  // Replace any special character with its Regex equivalent
		  
		  dim regexString as String = nonRegexString
		  
		  regexString = regexString.replace(" ","\s")
		  regexString = regexString.replace("/","\/")
		  
		  // ... complete expressions later
		  
		  return RegExString
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		labeledSubExpressions As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		labelsForSubExpressions() As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return passiveGroup(".*"+NewLinePattern)+"*?"
			End Get
		#tag EndGetter
		Shared MultipleLinesPattern As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  return "\R"
			End Get
		#tag EndGetter
		Shared NewLinePattern As String
	#tag EndComputedProperty


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
