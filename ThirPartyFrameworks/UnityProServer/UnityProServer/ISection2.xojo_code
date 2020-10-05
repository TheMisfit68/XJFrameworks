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
		  #if TargetWin32
		    Return COM.IIDFromString("{F18B7E92-3562-45A6-876C-C2CD84199A51}")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.ISection2.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
			Name="Comment"
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
			Name="Language"
			Group="Behavior"
			Type="epsrLanguage"
			EditorType="Enum"
			#tag EnumValues
				"14355429970673798 - psrILlanguage"
				"29555198972133512 - psrSTlanguage"
				"29555198972133512 - psrLDlanguage"
				"29555198972133512 - psrFBDlanguage"
				"29555198972133512 - psrSFClanguage"
				"29555198972133704 - psrLL984language"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Protection"
			Group="Behavior"
			Type="epsrSectionProtection"
			EditorType="Enum"
			#tag EnumValues
				"14636909242351616 - PSR_SECTION_PROTECTION_NONE"
				"29555198972133376 - PSR_SECTION_PROTECTION_READ_ONLY"
				"29555198972133380 - PSR_SECTION_PROTECTION_NO_READ_WRITE"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GenLock"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
