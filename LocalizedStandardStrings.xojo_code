#tag Module
Protected Module LocalizedStandardStrings
	#tag Constant, Name = kBackend, Type = String, Dynamic = True, Default = \"Backend", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Backend"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Backend"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Achtergrondinfo"
	#tag EndConstant

	#tag Constant, Name = kDelete, Type = String, Dynamic = True, Default = \"Delete", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Delete"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Delete"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Wis"
	#tag EndConstant

	#tag Constant, Name = kExport, Type = String, Dynamic = True, Default = \"Export", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Export"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Export"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Exporteer\t"
	#tag EndConstant

	#tag Constant, Name = kFilterListHere, Type = String, Dynamic = True, Default = \"Filter list here", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Filter list here\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Filter List here\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Filter lijst hier\xE2\x80\xA6"
	#tag EndConstant

	#tag Constant, Name = kImport, Type = String, Dynamic = True, Default = \"Import", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Import"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Import"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Importeer"
	#tag EndConstant

	#tag Constant, Name = kProject, Type = String, Dynamic = True, Default = \"Project", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Project"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Project"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Project"
	#tag EndConstant

	#tag Constant, Name = kTemplates, Type = String, Dynamic = True, Default = \"Templates", Scope = Protected
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Templates"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Templates"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Sjablonen"
	#tag EndConstant

	#tag Constant, Name = kTesting, Type = String, Dynamic = True, Default = \"Testing", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Testing"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Testing"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Testen"
	#tag EndConstant

	#tag Constant, Name = kUntitled, Type = String, Dynamic = True, Default = \"Untitled", Scope = Protected
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Untitled"
		#Tag Instance, Platform = Any, Language = en-GB, Definition  = \"Untitled"
		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Naamloos"
	#tag EndConstant


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
End Module
#tag EndModule
