#tag Window
Begin NSView JVBackendView
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Enabled         =   True
   EraseBackground =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   280
   HelpTag         =   ""
   ImplicitInstance=   True
   InitialParent   =   ""
   Left            =   0
   LiveResize      =   True
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Title           =   "Untitled"
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   514
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub embedWithinPanel(containingPanel As PagePanel, page As Integer, left As Integer = 0, top As Integer = 0, width As Integer = - 1, height As Integer = - 1)
		  super.EmbedWithinPanel(containingPanel, page, left, top, width, height)
		  
		  dim subView as containerControl
		  dim tabBarHeight as Integer = 15
		  
		  dim subViewsLeft as Integer = 0
		  dim subViewsTop as Integer =0
		  dim subViewsWidth as Integer = width
		  dim subViewsHeight as Integer = (height-tabBarHeight)/2 
		  
		  // Insert subview of logController
		  subView  = backendController.logController.view
		  subViewsTop  = tabBarHeight // Keep some space for the tabbar
		  
		  subView.EmbedWithin(me, subViewsLeft, subViewsTop, subViewsWidth, subViewsHeight)
		  
		  // Insert subview of terminalController
		  subView  = backendController.terminalController.view
		  subViewsTop  = tabBarHeight+subViewsHeight
		  
		  subView.EmbedWithin(me, subViewsLeft, subViewsTop, subViewsWidth, subViewsHeight)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return JVBackendViewController(owner)
			End Get
		#tag EndGetter
		backendController As JVBackendViewController
	#tag EndComputedProperty


#tag EndWindowCode

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
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
