#tag Class
Protected Class NSCoder
	#tag Method, Flags = &h1000
		Sub constructor()
		  // 
		  // IncludePrivate = True
		  // IncludeProtected = True
		  // IncludeComputed =True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function serialize(rootObject as Variant) As Text
		  // if rootObject <> nil then
		  // 
		  // dim thirdPartySerializer As Serializer_MTC = new Serializer_MTC
		  // 
		  // dim rootObjectAsJSONString As String = thirdPartySerializer.ToJSON(rootObject)
		  // 
		  // // For now go through a JSONItem to do some for formatting
		  // dim ji as new JSONItem(rootObjectAsJSONString)
		  // ji.Compact = false
		  // 
		  // return  ji.ToString.ToText
		  // 
		  // else
		  // return ""
		  // end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function unserialize(rootText as Text) As Variant
		  // 
		  // if rootText <> "" then
		  // 
		  // dim thirdPartySerializer As frameworks.thirdPartyModelEncoding.Serializer_MTC = new frameworks.thirdPartyModelEncoding.Serializer_MTC
		  // 
		  // dim rootObjectAsJSONString As String = rootText
		  // return thirdPartySerializer.FromJSON(rootObjectAsJSONString)
		  // 
		  // else
		  // return nil
		  // end if
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
End Class
#tag EndClass
