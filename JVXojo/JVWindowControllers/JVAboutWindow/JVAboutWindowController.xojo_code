#tag Class
Protected Class JVAboutWindowController
Inherits NSWindowController
Implements NSWindowDelegate
	#tag Method, Flags = &h0
		Sub constructor()
		  // Calling the overridden superclass constructor.
		  super.constructor(new JVAboutWindow, nil) // Typically aboutwindows don't have a model layer
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub InsertAboutMenu()
		  // Creat the Aboutmenu
		  if not JVAboutMenuItem.isInstalled then
		    HelpAboutMenuItem = New JVAboutMenuItem
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowActivate(sender as NSWindow)
		  // Part of the NSWindowDelegate interface.
		  
		  // Set the applications name
		  aboutwindow.AppNameLabel.Text = App.shortName
		  
		  
		  // Set the icon
		  If app.icon <> Nil Then
		    dim iconbox as Canvas =  aboutwindow.iconBox
		    iconbox.Backdrop = app.icon.rescale(iconbox.width, iconbox.height)
		  End If
		  
		  //Set the applications version
		  aboutwindow.appVersionLabel.text = "Version "+app.fullVersion + Chr(9) + Str(app.BuildDate.Year)
		  
		  // Set the developer
		  aboutwindow.developerLabel.text = "Developed by: " + app.developer
		  
		  // Set the beta testing
		  if app.betaTesting <> "" then
		    aboutwindow.betaTestingLabel.text = "Beta testing performed by: " + app.betaTesting
		  else
		    aboutwindow.betaTestingLabel.text = ""
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function onWindowCancelClose(sender as NSWindow, appQuitting as Boolean) As Boolean
		  // Part of the NSWindowDelegate interface.
		  
		  aboutWindow.hide
		  return not appQuitting
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowClose(sender as NSWindow)
		  // Part of the NSWindowDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowContentsChanged(sender as NSWindow)
		  // Part of the NSWindowDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowOpen(sender as NSWindow)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Class description
		
		lazy loaded Singleton Class 
		that displayes a full featured aboutWindow
	#tag EndNote


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return JVAboutWindow(window)
			End Get
		#tag EndGetter
		Private aboutWindow As JVAboutWindow
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Shared HelpAboutMenuItem As JVAboutMenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared mSharedAboutWindowController As JVAboutWindowController
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mSharedAboutWindowController = nil then
			    mSharedAboutWindowController =  new JVAboutWindowController
			  end if
			  return mSharedAboutWindowController
			End Get
		#tag EndGetter
		Shared sharedAboutWindowController As JVAboutWindowController
	#tag EndComputedProperty


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
End Class
#tag EndClass
