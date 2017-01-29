#tag Class
Protected Class JVDevelopmentViewController
Inherits NSViewController
Implements NSViewDelegate
	#tag Method, Flags = &h0
		Sub adaptView()
		  // Add or remove as necessary
		  
		  if not developmentView.isInstalled and (app.securityController.developerMode)  then
		    
		    showView
		    
		  elseif developmentView.isInstalled and not (app.securityController.developerMode) then
		    
		    hideView
		    
		  else
		    
		    // Everything is fine as it is
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addTestButton(caption as String, action as NSButton.Action)
		  // Define the basic mesurements
		  dim topBottomMargin as Integer = 20
		  dim leftRightMargin as Integer = 20
		  dim viewSize as new NSSize(150, 20)
		  dim xSpacing as Integer = 20
		  dim ySpacing as Integer = 20
		  
		  // Add the button to the view
		  dim newTestView as new JVTestView
		  newTestView.TestButton.caption = caption
		  newTestView.TestButton.action = action
		  newTestView.EmbedWithin(developmentView, nextOrigin.x, nextOrigin.y, viewSize.width, viewSize.height)
		  
		  // Calculate where the next button should be placed
		  nextOrigin.x = nextOrigin.x+viewSize.width+xSpacing
		  
		  if nextOrigin.x+viewSize.width >= developmentView.Width-leftRightMargin then
		    nextOrigin.x = leftRightMargin
		    nextOrigin.y = nextOrigin.y+viewSize.height+topBottomMargin
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor(new JVDevelopmentView, nil)
		  
		  tabindex = -1
		  nextOrigin = new NSPoint(20, 20)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub hideView()
		  // backup a copy of the view because it will be closed when the parnttab is removed and 
		  // there's nothing you can do about it
		  me.view = developmentView.copy
		  
		  superview.remove(tabIndex)
		  tabIndex = -1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewActivate(sender as NSView)
		  // Part of the NSViewDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function onViewCancelClose(sender as NSview, appQuiting as Boolean) As Boolean
		  // Part of the NSViewDelegate interface.
		  
		  system.debuglog("view will close")
		  return not appQuiting
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewClose(sender as NSView)
		  // Part of the NSViewDelegate interface.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewContentsChanged(sender as NSWindow)
		  // Part of the NSViewDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewOpen(sender as NSView)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showView()
		  superview.append(developmentView, "Development")
		  tabIndex = superView.PanelCount -1
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Class description
		
		lazy loaded Singleton Class 
		that displays a view for development en testing to the developer only
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return JVDevelopmentView(view)
			End Get
		#tag EndGetter
		developmentView As JVDevelopmentView
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared msharedDevelopmentViewController As JVDevelopmentViewController
	#tag EndProperty

	#tag Property, Flags = &h0
		nextOrigin As NSPoint
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if msharedDevelopmentViewController = nil then
			    msharedDevelopmentViewController =  new JVDevelopmentViewController
			  end if
			  
			  return msharedDevelopmentViewController
			End Get
		#tag EndGetter
		Shared sharedDevelopmentViewController As JVDevelopmentViewController
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		superView As JVTabPanel
	#tag EndProperty

	#tag Property, Flags = &h0
		tabIndex As Integer
	#tag EndProperty


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
			Name="tabIndex"
			Group="Behavior"
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
