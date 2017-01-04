#tag Class
Protected Class NSApplicationDelegate
Inherits Application
Implements JVPrefsChangedObserver
	#tag Event
		Sub Activate()
		  // JVPrefsWindowController.InsertPrefsMenu // No Preferences needed for this App
		  JVAboutWindowController.InsertAboutMenu
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  // Handle images with transparancy under Windows
		  #if TargetWindows
		    UseGDIPlus = True
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onPrefsChanged(prefs as JVPrefs)
		  // Part of the JVPrefsChangedObserver interface.
		  
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mainController isa NSDocumentController then
			    return NSDocumentController(mainController)
			  elseif mainController isa NSWindowController then
			    return nil
			  else
			    return nil
			  end if
			  
			End Get
		#tag EndGetter
		documentController As NSDocumentController
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Str(App.MajorVersion) + "." + Str(App.MinorVersion) + "." _
			  + Str(App.BugVersion) + "." + Str(App.NonReleaseVersion)
			  
			End Get
		#tag EndGetter
		fullVersion As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim icon as JVPicture
			  
			  // Find the icons File
			  Dim pathFinder as JVPathFinder =  new JVPathFinder
			  Dim iconFile As FolderItem =  pathFinder.findFile("AppIcon.png")
			  
			  if iconFile <> nil then
			     icon = JVPicture.Open(iconFile)
			    // set the icon by code
			    //...
			  else
			    icon = nil
			  end if
			  
			  return icon
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  // This setter is empty but needs this comment due to a bug see
			  // <feedback://showreport?report_id=45412>
			End Set
		#tag EndSetter
		icon As JVPicture
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		mainController As Object
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mainController isa NSDocumentController then
			    return NSWindowController(NSDocumentController(mainController).currentDocument.windowController)
			  elseif mainController isa NSWindowController then
			    return NSWindowController(mainController)
			  else
			    return nil
			  end if
			  
			End Get
		#tag EndGetter
		mainWindowController As NSWindowController
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		securityController As JVSecurityController
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim shortName as String = ExecutableFile.Name
			  
			  shortName = shortName.replace("\..{3,}$","", True)
			  shortName = shortName.replace("Debug","")
			  shortName = shortName.replace("Release","")
			  
			  return shortName
			End Get
		#tag EndGetter
		shortName As String
	#tag EndComputedProperty


	#tag Constant, Name = betaTesting, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \""
	#tag EndConstant

	#tag Constant, Name = developer, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Jan Verrept"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="fullVersion"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="shortName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
