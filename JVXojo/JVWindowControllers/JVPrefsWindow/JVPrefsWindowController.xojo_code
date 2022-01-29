#tag Class
Protected Class JVPrefsWindowController
Inherits NSWindowController
Implements NSWindowDelegate
	#tag Method, Flags = &h0
		Sub cancel()
		  
		  prefsViewController.syncInterface(True) // Cancel any adjustments
		  hideWindow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub confirm()
		  
		  prefsViewController.syncInterface() // Write to model
		  prefsViewController.savePrefsFile
		  prefsViewController.notifyObservers
		  
		  hideWindow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor(New JVPrefsWindow, nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub InsertPrefsMenu()
		  // Create the Prefsmenu
		  
		  if not JVPrefsMenuItem.isInstalled then
		    PrefsMenuItem = New JVPrefsMenuItem
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowActivate(sender as NSWindow)
		  // Part of the NSWindowDelegate interface.
		  prefsViewController.syncInterface(True)
		  syncInterface(True)
		  
		  if prefsViewController.view.window = nil  then // Make sure to embed only once or strange things might happen
		    prefsViewController.view.EmbedWithin(prefsWindow, 0, 0, window.Width, window.Height-40)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function onWindowCancelClose(sender as NSWindow, appQuitting as Boolean) As Boolean
		  // Part of the NSWindowDelegate interface.
		  
		  hideWindow
		  return not appQuitting
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub syncInterface(optional up as Boolean = False)
		  // Calling the overridden superclass method.
		  if up then
		    
		    prefsWindow.prefsOkButton.Enabled = (prefsViewController.newPrefs.tostring <> prefsViewController.activePrefs.tostring)
		    
		  else
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Class description
		
		lazy loaded Singleton Class for the preference window in any application
		
		Is able to insert the preference menu in your app by means of a class method (to be used by your app)
		Has a property of Class JVPrefsViewController that (needs to be defined by your app)
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private Shared msharedPrefsWindowController As JVPrefsWindowController
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared PrefsMenuItem As JVPrefsMenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		prefsViewController As JVPrefsViewController
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return JVPrefsWindow(window)
			End Get
		#tag EndGetter
		prefsWindow As JVPrefsWindow
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if msharedPrefsWindowController = nil then
			    
			    msharedPrefsWindowController =  new JVPrefsWindowController
			    
			  end if
			  
			  return msharedPrefsWindowController
			End Get
		#tag EndGetter
		Shared sharedPrefsWindowController As JVPrefsWindowController
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
