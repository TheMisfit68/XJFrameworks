#tag Window
Begin NSView JVDevelopmentView
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
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
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
		Function copy() As JVDevelopmentView
		  dim copiedView as new JVDevelopmentView
		  
		  For controlNumber as Integer = 0 to ControlCount-1
		    dim control as Control =  control(controlNumber)
		    System.DebugLog(control.classname)
		    
		    if control isa JVTestView then
		      dim oldTestView  as JVTestView = JVTestView(control)
		      dim newTestView as new JVTestView
		      newTestView.TestButton.Caption = oldTestView.TestButton.Caption
		      newTestView.TestButton.action = oldTestView.TestButton.action
		      newTestView.EmbedWithin(copiedView, oldTestView.Left, oldTestView.Top, oldTestView.width, oldTestView.Height)
		    end if
		    
		  next
		    
		  
		  return copiedView
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return JVDevelopmentViewController(owner)
			End Get
		#tag EndGetter
		developmentViewController As JVDevelopmentViewController
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
