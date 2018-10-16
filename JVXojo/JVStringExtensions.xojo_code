#tag Module
Protected Module JVStringExtensions
	#tag Method, Flags = &h0
		Function contains(extends baseString as String, searchPattern as string, optional useRegex as Boolean = False) As Boolean
		  if useRegex then
		    
		    dim regex as RegEx = new RegEx
		    regex.SearchPattern = searchPattern 
		    dim matches as RegExMatch = regex.Search(baseString )
		    
		    return  (matches <> nil) and (matches.SubExpressionCount > 0)
		    
		  else
		    
		    return (baseString.InStr(searchPattern) <> 0)
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function decrypt(extends baseString as String) As String
		  // Remove the very basic encrypting applied the data
		  
		  dim characters() as String = split(baseString," ")
		  dim decryptedData as String =""
		  
		  for charNumber as Integer = 0 to characters.Ubound
		    dim character as String = characters(charNumber)
		    
		    // Determine an offset based on the characternumber
		    dim offset as Integer = charNumber 
		    
		    // Determine soms personal component based on the username
		    dim personalKeys as String = app.developer
		    if JVSecurityController.sharedSecurityController.currentWindowsUser <> "" then
		      personalKeys = JVSecurityController.sharedSecurityController.currentWindowsUser
		    end if
		    dim personalKeyPointer as Integer = charNumber mod personalKeys.len
		    dim personalKey as Byte = asc(mid(personalKeys,personalKeyPointer, 1))
		    
		    dim decryptedChar as String = chr(val(character)-offset+personalKey)
		    decryptedData = decryptedData+decryptedChar
		    
		  next
		  
		  return decryptedData
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function encrypt(extends baseString as String) As String
		  // Perform some very basic encrypting before storing the data
		  
		  dim characters() as string = split(baseString,"")
		  dim encryptedData as String =""
		  
		  for charNumber as Integer = 0 to characters.Ubound
		    dim character as String = characters(charNumber)
		    
		    // Determine an offset based on the characternumber
		    dim offset as Integer = charNumber
		    
		    // Determine soms personal component based on the username
		    dim personalKeys as String = app.developer
		    if JVSecurityController.sharedSecurityController.currentWindowsUser <> "" then
		      personalKeys = JVSecurityController.sharedSecurityController.currentWindowsUser
		    end if
		    dim personalKeyPointer as Integer = charNumber mod personalKeys.len
		    dim personalKey as Byte = asc(mid(personalKeys,personalKeyPointer, 1))
		    
		    dim encryptedChar as String = str(asc(character)+offset-personalKey)
		    encryptedData = encryptedData+encryptedChar + " "
		    
		  next
		  
		  return Rtrim(encryptedData) // Remove the extra added space at the end of the encrypted string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isEmpty(extends baseString as String) As Boolean
		  return (baseString = "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function matches(extends baseString as String, searchPattern as string, optional useRegex as Boolean = False) As Boolean
		  if useRegex then
		    
		    dim anchoredExpression as String = "^"+searchPattern+"$"
		    return baseString.contains(anchoredExpression, True)
		    
		  else
		    
		    return (baseString = searchPattern)
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pad(extends baseString as String, totalLength as Integer, char as String) As String
		  dim charcount as Integer = baseString.Len
		  dim paddingChar as String = left(char,1)
		  dim numberOfPaddingChars  as Integer = totalLength-charcount
		  dim paddingChars as String = ""
		  
		  for padding as integer = 1 to numberOfPaddingChars
		    paddingChars = paddingChars+paddingChar
		  next
		  
		  Return paddingChars+baseString
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function quote(unquotedString as String) As String
		  return DOUBLEQUOTEMARK+unquotedString +DOUBLEQUOTEMARK
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function replace(extends baseString as String, searchPattern as String, replacementPattern as String, useRegex as Boolean) As String
		  if useRegex then
		    
		    dim regex as RegEx = new RegEx
		    regex.SearchPattern = searchPattern
		    regex.ReplacementPattern = replacementPattern
		    regex.Options.ReplaceAllMatches = True
		    
		    Return regex.Replace(baseString)
		    
		  else
		    
		    return baseString.replace(searchPattern, replacementPattern)
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function singleQuote(unquotedString as String) As String
		  return SINGLEQUOTEMARK+unquotedString+SINGLEQUOTEMARK
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return chr(13)
			End Get
		#tag EndGetter
		CR As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return chr(34)
			End Get
		#tag EndGetter
		DOUBLEQUOTEMARK As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return chr(10)
			End Get
		#tag EndGetter
		LF As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return chr(39)
			End Get
		#tag EndGetter
		SINGLEQUOTEMARK As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return chr(9)
			End Get
		#tag EndGetter
		Tab As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CR"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DOUBLEQUOTEMARK"
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
			Name="LF"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SINGLEQUOTEMARK"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tab"
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
	#tag EndViewBehavior
End Module
#tag EndModule
