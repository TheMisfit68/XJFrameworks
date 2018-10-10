#tag Module
Protected Module JVArrayExtensions
	#tag Method, Flags = &h0
		Function concatenate(ParamArray arraysToConcatenate() as Variant) As variant()
		  dim concatenatedArray() as Variant = arraysToConcatenate(0)
		  
		  for arrayNumber as Integer = 1 to arraysToConcatenate.ubound
		    dim currentArray() as Variant = arraysToConcatenate(arrayNumber)
		    for each element as Variant in currentArray
		      concatenatedArray.Append(element)
		    next
		  next
		  
		  return concatenatedArray
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function containsElement(extends arrayToSearch() as Variant, item as Variant) As Boolean
		  return (arrayToSearch.IndexOf(item) >=0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function description(extends baseArray() as Variant) As String
		  dim description as String = "["+EndOfLine
		  
		  For each value as Variant in baseArray
		    description = description +value.StringValue+EndOfLine
		  next value
		  description = description+ "]"
		  
		  return description
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function firstElement(extends baseArray() as Variant) As Variant
		  if baseArray.ubound >=0 then
		    Return baseArray(0)
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function lastElement(extends baseArray() as Variant) As Variant
		  if baseArray.ubound >=0 then
		    Return baseArray(baseArray.ubound)
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
End Module
#tag EndModule
