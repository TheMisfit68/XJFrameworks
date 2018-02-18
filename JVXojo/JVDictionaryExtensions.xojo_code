#tag Module
Protected Module JVDictionaryExtensions
	#tag Method, Flags = &h0
		Function description(extends baseDict as Dictionary) As String
		  dim description as String = "{"+EndOfLine
		  
		  For each key as String in baseDict.keys
		    dim value as Variant = baseDict.value(key)
		    description = description + key +" : "+value.StringValue+EndOfLine
		  next key
		  description = description+ "}"
		  
		  return description
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function pairs(extends dictionary as Dictionary) As Pair()
		  dim pairs() as Pair 
		  
		  for each key as Variant in dictionary.keys
		    dim value as Variant = dictionary.value(key)
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
