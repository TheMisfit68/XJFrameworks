#tag Module
Protected Module JVDictionaryExtensions
	#tag Method, Flags = &h0
		Function description(extends baseDict as Dictionary) As String
		  dim description as String = "{"+EndOfLine
		  
		  For each key as Variant in baseDict.keys
		    dim value as Variant = baseDict.value(key)
		    
		    Select Case value
		    Case IsA Dictionary
		      dim describedDictionary as Dictionary = value
		      description = description + key +" : "+describedDictionary.description+EndOfLine
		    Case else
		      description = description + key +" : "+value.StringValue+EndOfLine
		    End Select
		    
		  next key
		  description = description+ "}"
		  
		  return description
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pairs(extends baseDictionary as Dictionary) As Pair()
		  dim pairs() as Pair 
		  
		  for each key as Variant in baseDictionary.keys
		    dim value as Variant = baseDictionary.value(key)
		    dim pair as New Pair(key, value)
		    pairs.Append(pair)
		  next key
		  
		  return pairs
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
