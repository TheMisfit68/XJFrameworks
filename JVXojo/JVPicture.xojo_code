#tag Class
Protected Class JVPicture
Inherits Picture
	#tag Method, Flags = &h0
		Shared Function Open(file As FolderItem) As JVPicture
		  dim regularPicture as Picture = Picture.Open(file)
		  
		  dim jvPicture as JVPicture = new JVPicture(regularPicture.width, regularPicture.height)
		  jvPicture.Graphics.DrawPicture(regularPicture, 0, 0)
		  return jvPicture
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Open(file As FolderItem, width as Integer, height as integer) As JVPicture
		  dim regularPicture as Picture = Picture.Open(file)
		  
		  dim jvPicture as JVPicture = new JVPicture(width, height)
		  jvPicture.Graphics.DrawPicture(regularPicture, 0, 0,width, height, 0, 0, regularPicture.width, regularPicture.height) //Rescale
		  return jvPicture
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function rescale(width as integer, height as integer) As JVPicture
		  
		  dim scaledPicture as JVPicture = new JVPicture(width, height)
		  scaledPicture.Graphics.DrawPicture(me, 0, 0,width, height, 0, 0,me.width, me.height)
		  return scaledPicture
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Depth"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasAlphaChannel"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontalResolution"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
		#tag ViewProperty
			Name="Transparent"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="Types"
			EditorType="Enum"
			#tag EnumValues
				"0 - Image"
				"1 - Vector"
				"2 - MutableBitmap"
				"3 - ImmutableBitmap"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalResolution"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
