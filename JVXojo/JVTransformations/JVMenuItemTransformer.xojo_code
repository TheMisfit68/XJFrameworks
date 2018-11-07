#tag Class
Protected Class JVMenuItemTransformer
Implements JVTransFormer
	#tag Method, Flags = &h0
		Function representationFor(value as Variant) As Variant
		  
		  if (value <> nil) then
		    
		    if  textRepresentations.HasKey(value) then
		      
		      return textRepresentations.value(value).StringValue
		      
		    elseif  textRepresentations.HasKey(value.IntegerValue) then
		      
		      return textRepresentations.value(value.IntegerValue).StringValue
		      
		    elseif  textRepresentations.HasKey(value.StringValue) then
		      
		      return textRepresentations.value(value.StringValue).StringValue
		      
		    else
		      
		      return "Undefined value !"
		      
		    end if
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function valueFor(representation as Variant) As Variant
		  // Part of the JVTransFormer interface.
		  
		  if (representation <> nil) and not representation.StringValue.contains("Undefined") then
		    
		    dim values() as Variant = textRepresentations.Values
		    dim position as Integer = values.IndexOf(representation)
		    
		    return textRepresentations.Key(position)
		    
		  else
		    
		    return nil
		    
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mTextRepresentations As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mTextRepresentations = nil then
			    mTextRepresentations = new Dictionary // Lazy loading
			  end if
			  
			  return mTextRepresentations
			End Get
		#tag EndGetter
		textRepresentations As Dictionary
	#tag EndComputedProperty


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
