#tag Class
Protected Class ISection2
Inherits UnityProServer.ISection
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{F18B7E92-3562-45A6-876C-C2CD84199A51}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.ISection2.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Comment"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GenLock"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Id"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Language"
			Group="Behavior"
			Type="epsrLanguage"
			EditorType="Enum"
			#tag EnumValues
				"134 - psrILlanguage"
				"135 - psrSTlanguage"
				"136 - psrLDlanguage"
				"137 - psrFBDlanguage"
				"138 - psrSFClanguage"
				"330 - psrLL984language"
			#tag EndEnumValues
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
			Name="Protection"
			Group="Behavior"
			Type="epsrSectionProtection"
			EditorType="Enum"
			#tag EnumValues
				"1 - PSR_SECTION_PROTECTION_NONE"
				"2 - PSR_SECTION_PROTECTION_READ_ONLY"
				"3 - PSR_SECTION_PROTECTION_NO_READ_WRITE"
			#tag EndEnumValues
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
