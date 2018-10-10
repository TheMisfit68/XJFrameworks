#tag Class
Protected Class JVEnumerator
	#tag Method, Flags = &h0
		Sub constructor(ParamArray minValuesAndOffsets as pair)
		  for each minValuesAndOffset as Pair in minValuesAndOffsets
		    
		    minValues.append(minValuesAndOffset.left)
		    offsets.append(minValuesAndOffset.right)
		    
		    addresses.append(minValuesAndOffset.left)
		    
		  next minValuesAndOffset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function nextValues(currentAddresses() as Integer, optional limits() as Pair = nil) As Integer()
		  
		  dim nextValues() as Integer
		  dim enumerationNumber as Integer = 0
		  for each address as Integer in currentAddresses
		    dim nextValue as integer = Max(minValues(enumerationNumber), address)+offsets(enumerationNumber) // Apply lower limit and offset
		    
		    if (limits <> nil)  and (limits(enumerationNumber) <> nil) then
		      
		      dim extraLimits as Pair = limits(enumerationNumber)
		      dim lowerLimit as Integer = extraLimits.left
		      dim upperLimit as Integer = extraLimits.right
		      
		      nextValue = Max(lowerLimit, nextValue)
		      nextValue = Min(nextValue, upperLimit)
		    end if
		    
		    nextValues.Append(nextValue)
		    
		    enumerationNumber = enumerationNumber+1
		  next address
		  
		  return nextValues
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		addresses() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		minValues() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		offsets() As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
