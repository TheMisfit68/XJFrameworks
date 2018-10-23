#tag Module
Protected Module UnityProServer
	#tag PathToTypeLibrary = C : \ Program Files ( x86 ) \ Common Files \ Schneider Electric Shared \ Tlb \ PServer . tlb
	#tag Enum, Name = epsrAccessRight, Type = Integer, Flags = &h0
		PSR_ACCESS_RIGHT_UNKNOWN = 0
		  PSR_ACCESS_RIGHT_NO_ACCESS = 1
		  PSR_ACCESS_RIGHT_READ_ONLY = 2
		  PSR_ACCESS_RIGHT_READ_WRITE = 3
		PSR_ACCESS_RIGHT_WRITE_ONLY = 4
	#tag EndEnum

	#tag Enum, Name = epsrBuildState, Type = Integer, Flags = &h0
		psrBuildStateNotBuilt = 0
		  psrBuildStateBuiltOk = 1
		  psrBuildStateAnalyzed = 2
		psrBuildStateUnknown = 3
	#tag EndEnum

	#tag Enum, Name = epsrConnectionMode, Type = Integer, Flags = &h0
		psrConnectionModeUnknown = 0
		  psrConnectionModePrimary = 1
		psrConnectionModeSecondary = 2
	#tag EndEnum

	#tag Enum, Name = epsrConnectionState, Type = Integer, Flags = &h0
		psrConnectionStateOffline = 0
		  psrConnectionStateDifferent = 1
		psrConnectionStateEqual = 2
	#tag EndEnum

	#tag Enum, Name = epsrDfbProtection, Type = Integer, Flags = &h0
		PSR_DFB_PROTECTION_UNKNOWN = 0
		  PSR_DFB_PROTECTION_NONE = 1
		  PSR_DFB_PROTECTION_READ_ONLY = 2
		PSR_DFB_PROTECTION_NO_READ_WRITE = 3
	#tag EndEnum

	#tag Enum, Name = epsrDtmType, Type = Integer, Flags = &h0
		psrDtmType_communication = 0
		  psrDtmType_gateway = 1
		  psrDtmType_block = 2
		  psrDtmType_module = 3
		psrDtmType_device = 4
	#tag EndEnum

	#tag Enum, Name = epsrExportOption, Type = Integer, Flags = &h0
		psrExportBasic = 0
		  psrExportWithDfb = 1
		  psrExportWithDdt = 2
		  psrExportWithSr = 4
		  psrExportWithConf = 128
		psrExportWithoutDependencies = -2147483648
	#tag EndEnum

	#tag Enum, Name = epsrHmiOptions, Type = Integer, Flags = &h0
		psrHmiReadOnly = 0
		psrHmiReadWrite = 1
	#tag EndEnum

	#tag Enum, Name = epsrIECType, Type = Integer, Flags = &h0
		PSR_IECTYPE_UNKNOWN = 0
		  PSR_IECTYPE_REAL = 1
		  PSR_IECTYPE_DINT = 2
		  PSR_IECTYPE_INT = 3
		  PSR_IECTYPE_UDINT = 4
		  PSR_IECTYPE_UINT = 5
		  PSR_IECTYPE_DWORD = 6
		  PSR_IECTYPE_WORD = 7
		  PSR_IECTYPE_BYTE = 8
		  PSR_IECTYPE_BOOL = 9
		  PSR_IECTYPE_EBOOL = 10
		  PSR_IECTYPE_STRING = 11
		  PSR_IECTYPE_WSTRING = 12
		  PSR_IECTYPE_TIME = 13
		  PSR_IECTYPE_DATE = 14
		  PSR_IECTYPE_TIME_OF_DAY = 15
		PSR_IECTYPE_DATE_AND_TIME = 16
	#tag EndEnum

	#tag Enum, Name = epsrImportOption, Type = Integer, Flags = &h0
		psrImportOptionOverwrite = 0
		  psrImportOptionKeepPrevious = 1
		psrImportOptionRename = 2
	#tag EndEnum

	#tag Enum, Name = epsrLanguage, Type = Integer, Flags = &h0
		psrILlanguage = 134
		  psrSTlanguage = 135
		  psrLDlanguage = 136
		  psrFBDlanguage = 137
		  psrSFClanguage = 138
		psrLL984language = 330
	#tag EndEnum

	#tag Enum, Name = epsrNetworkFilter, Type = Integer, Flags = &h0
		PSR_NETWORK_NOFILTER = 0
		  PSR_NETWORK_DETACHFILTER = 1
		PSR_NETWORK_ATTACHFILTER = 2
	#tag EndEnum

	#tag Enum, Name = epsrObjectType, Type = Integer, Flags = &h0
		PSR_OBJECTTYPE_UNKNOWN = 0
		  PSR_OBJECTTYPE_DFB = 1
		  PSR_OBJECTTYPE_DDT = 2
		  PSR_OBJECTTYPE_VARIABLE = 3
		  PSR_OBJECTTYPE_IOEVENT = 4
		  PSR_OBJECTTYPE_TIMER_EVENT = 5
		  PSR_OBJECTTYPE_TASK = 6
		  PSR_OBJECTTYPE_SECTION = 7
		  PSR_OBJECTTYPE_SR = 8
		  PSR_OBJECTTYPE_NETWORK = 9
		PSR_OBJECTTYPE_FCT_MODULE = 10
	#tag EndEnum

	#tag Enum, Name = epsrPeriodicity, Type = Integer, Flags = &h0
		PSR_PERIODIC = 0
		PSR_CYCLIC = 1
	#tag EndEnum

	#tag Enum, Name = epsrPlcCommand, Type = Integer, Flags = &h0
		psrPlcCommandStop = 0
		  psrPlcCommandInit = 1
		psrPlcCommandRun = 2
	#tag EndEnum

	#tag Enum, Name = epsrPlcState, Type = Integer, Flags = &h0
		psrPlcStateUnknown = 0
		  psrPlcStateStop = 1
		  psrPlcStateRun = 2
		  psrPlcStateDefault = 3
		  psrPlcStateNoConf = 4
		psrPlcStateHalt = 5
	#tag EndEnum

	#tag Enum, Name = epsrPublicVariableAttributs, Type = Integer, Flags = &h0
		PSR_VAR_ATT_VARIABLENAME = 1
		  PSR_VAR_ATT_VARIABLECOMMENT = 2
		  PSR_VAR_ATT_TOPOLOGICALADDRESS = 3
		  PSR_VAR_ATT_VARIABLENATURE = 4
		  PSR_VAR_ATT_VARIABLEIDENTIFICATOR = 5
		  PSR_VAR_ATT_VARIABLERANK = 6
		  PSR_VAR_ATT_VARIABLEOMC = 7
		  PSR_VAR_ATT_ALIASOF = 33
		  PSR_VAR_ATT_INITIALVALUE = 81
		  PSR_VAR_ATT_SAVE = 84
		  PSR_VAR_ATT_ISCONSTANT = 85
		  PSR_VAR_ATT_CUSTOMERSTRING = 113
		  PSR_VAR_ATT_REQUESTACCESSRIGHT = 130
		  PSR_VAR_ATT_PROGRAMACCESSRIGHT = 131
		  PSR_VAR_ATT_ENETVARIABLE = 144
		  PSR_VAR_ATT_ENETGROUP = 145
		  PSR_VAR_ATT_ENETDATAID = 146
		  PSR_VAR_ATT_ISTRANSECVARIABLE = 256
		  PSR_VAR_ATT_ISVARIABLEWITHFREENAME = 257
		  PSR_VAR_ATT_ISMACROSTEPVARIABLE = 258
		  PSR_VAR_ATT_TYPENAME = 1025
		  PSR_VAR_ATT_TYPECATEGORY = 1027
		  PSR_VAR_ATT_TYPECODE = 1038
		  PSR_VAR_ATT_MANAGEDKEY = 24
		PSR_VAR_ATT_OWNER = 263
	#tag EndEnum

	#tag Enum, Name = epsrSectionProtection, Type = Integer, Flags = &h0
		PSR_SECTION_PROTECTION_NONE = 1
		  PSR_SECTION_PROTECTION_READ_ONLY = 2
		PSR_SECTION_PROTECTION_NO_READ_WRITE = 3
	#tag EndEnum

	#tag Enum, Name = epsrShowState, Type = Integer, Flags = &h0
		psrShowStateUnknown = 0
		  psrMaximize = 1
		  psrMinimize = 2
		  psrRestore = 3
		  psrShow = 4
		  psrShowMaximized = 5
		  psrShowMinimized = 6
		psrShowNormal = 7
	#tag EndEnum

	#tag Enum, Name = epsrTargetConnection, Type = Integer, Flags = &h0
		psrConnectToPlc = 0
		psrConnectToSimulator = 1
	#tag EndEnum

	#tag Enum, Name = epsrTaskType, Type = Integer, Flags = &h0
		PSR_FAST_TASK = 3
		  PSR_MAST_TASK = 4
		  PSR_AUX0_TASK = 5
		  PSR_AUX1_TASK = 6
		  PSR_AUX2_TASK = 7
		PSR_AUX3_TASK = 8
	#tag EndEnum

	#tag Enum, Name = epsrTypeCategory, Type = Integer, Flags = &h0
		PSR_TYPECAT_UNKNOWN = 0
		  PSR_TYPECAT_EDT = 1
		  PSR_TYPECAT_DDT_STRUCT = 2
		  PSR_TYPECAT_DDT_ARRAY = 3
		  PSR_TYPECAT_IODDT = 4
		  PSR_TYPECAT_EFB = 5
		  PSR_TYPECAT_DFB = 6
		  PSR_TYPECAT_ANONYMOUS_ARRAY = 7
		  PSR_TYPECAT_ANY_ARRAY = 8
		  PSR_TYPECAT_ANY_REF = 9
		PSR_TYPECAT_ANY_DDT_REF = 10
	#tag EndEnum

	#tag Enum, Name = epsrTypeCode, Type = Integer, Flags = &h0
		PSR_TYPECODE_UNKNOWN = 0
		  PSR_TYPECODE_INT = 1
		  PSR_TYPECODE_DINT = 2
		  PSR_TYPECODE_BOOL = 3
		  PSR_TYPECODE_UINT = 4
		  PSR_TYPECODE_UDINT = 5
		  PSR_TYPECODE_REAL = 6
		  PSR_TYPECODE_TIME = 7
		  PSR_TYPECODE_DATE = 8
		  PSR_TYPECODE_BYTE = 9
		  PSR_TYPECODE_DT = 10
		  PSR_TYPECODE_DWORD = 11
		  PSR_TYPECODE_EBOOL = 12
		  PSR_TYPECODE_STRING = 13
		  PSR_TYPECODE_WSTRING = 14
		  PSR_TYPECODE_TOD = 15
		PSR_TYPECODE_WORD = 16
	#tag EndEnum

	#tag Enum, Name = epsrTypeSpecificInfo, Type = Integer, Flags = &h0
		PSR_TYPESPECIFICINFO_FB = 0
		  PSR_TYPESPECIFICINFO_SFCSTEP = 1
		  PSR_TYPESPECIFICINFO_SFCTRANSITION = 2
		  PSR_TYPESPECIFICINFO_SYSTEM = 3
		  PSR_TYPESPECIFICINFO_PATH = 4
		PSR_TYPESPECIFICINFO_DEBUG = 5
	#tag EndEnum

	#tag Enum, Name = epsrUsage, Type = Integer, Flags = &h0
		PSR_USAGE_UNKNOWN = 0
		  PSR_USAGE_READ = 1
		  PSR_USAGE_WRITE = 2
		  PSR_USAGE_LABELREF = 3
		  PSR_USAGE_CALL = 4
		  PSR_USAGE_ANIM = 5
		  PSR_USAGE_AT = 6
		  PSR_USAGE_DECLARATION = 7
		  PSR_USAGE_READ_WRITE = 8
		  PSR_USAGE_INIT = 9
		  PSR_USAGE_ADDRESS = 10
		  PSR_USAGE_LABELDEF = 11
		  PSR_USAGE_OVERLOADED_ATTRIBUTE = 12
		  PSR_USAGE_UNDEF = 13
		  PSR_USAGE_INTERMEDIATEREF = 14
		PSR_USAGE_PARAM_ASSIGN = 15
	#tag EndEnum

	#tag Enum, Name = epsrVariableNature, Type = Integer, Flags = &h0
		PSR_VARNATURE_UNKNOWN = 0
		  PSR_VARNATURE_PUBLIC = 1
		  PSR_VARNATURE_PRIVATE = 2
		  PSR_VARNATURE_INPUT = 3
		  PSR_VARNATURE_OUTPUT = 4
		  PSR_VARNATURE_INPUT_OUTPUT = 5
		  PSR_VARNATURE_DECLARED = 6
		  PSR_VARNATURE_ALIAS = 7
		  PSR_VARNATURE_SUB_VAR_DDT = 8
		PSR_VARNATURE_SUB_VAR_IODDT = 9
	#tag EndEnum


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
