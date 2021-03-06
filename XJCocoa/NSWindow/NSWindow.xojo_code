#tag Class
Protected Class NSWindow
Inherits Window
	#tag Property, Flags = &h21
		Private mwindowDelegate As NSWindowDelegate
	#tag EndProperty

	#tag Property, Flags = &h0
		owner As NSWindowController
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mwindowDelegate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  if mwindowDelegate <> nil then
			    // Remove any previously set delegate
			    RemoveHandler Open, AddressOf mwindowDelegate.onWindowOpen
			    RemoveHandler Activate, AddressOf mwindowDelegate.onWindowActivate
			    RemoveHandler Paint, AddressOf mwindowDelegate.onWindowPaint
			    RemoveHandler CancelClose, AddressOf mwindowDelegate.onWindowCancelClose
			    RemoveHandler Close, AddressOf mwindowDelegate.onWindowClose
			    
			  end if
			  
			  // Set the delegate
			  mwindowDelegate = value
			  
			  if mwindowDelegate <> nil then
			    
			    // Redirect all events to the delegate
			    AddHandler Open, AddressOf mwindowDelegate.onWindowOpen
			    AddHandler Activate, AddressOf mwindowDelegate.onWindowActivate
			    AddHandler Paint, AddressOf mwindowDelegate.onWindowPaint
			    AddHandler CancelClose, AddressOf mwindowDelegate.onWindowCancelClose
			    AddHandler Close, AddressOf mwindowDelegate.onWindowClose
			    
			  end if
			  
			  
			  
			  
			End Set
		#tag EndSetter
		windowDelegate As NSWindowDelegate
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CloseButton"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Composite"
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Frame"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Document"
				"1 - Movable Modal"
				"2 - Modal Dialog"
				"3 - Floating Window"
				"4 - Plain Box"
				"5 - Shadowed Box"
				"6 - Rounded Window"
				"7 - Global Floating Window"
				"8 - Sheet Window"
				"9 - Metal Window"
				"11 - Modeless Dialog"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullScreen"
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullScreenButton"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBackColor"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="400"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImplicitInstance"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Interfaces"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LiveResize"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacProcID"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxHeight"
			Visible=true
			Group="Position"
			InitialValue="32000"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximizeButton"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxWidth"
			Visible=true
			Group="Position"
			InitialValue="32000"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MenuBar"
			Visible=true
			Group="Appearance"
			Type="MenuBar"
			EditorType="MenuBar"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MenuBarVisible"
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinHeight"
			Visible=true
			Group="Position"
			InitialValue="64"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimizeButton"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinWidth"
			Visible=true
			Group="Position"
			InitialValue="64"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Placement"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Parent Window"
				"2 - Main Screen"
				"3 - Parent Window Screen"
				"4 - Stagger"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Resizeable"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Visible=true
			Group="Appearance"
			InitialValue="Untitled"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="600"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
