#tag Class
Protected Class JVPrefsWindowController
Inherits NSWindowController
Implements NSWindowDelegate,JVPrefsChangedNotifier
	#tag Method, Flags = &h0
		Sub cancel()
		  syncInterface(True) // Cancel any adjustments
		  hideWindow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor(New JVPrefsWindow, new JVPrefs)
		  load
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub InsertPrefsMenu()
		  // Create the Prefsmenu
		  
		  if not JVPrefsMenuItem.isInstalled then
		    FilePrefsMenuItem = New JVPrefsMenuItem
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub load()
		  
		  If prefsFile <> Nil and prefsFile.exists Then
		    
		    Dim t As TextInputStream
		    Try
		      t = TextInputStream.Open(prefsFile)
		      // t.Encoding = Encodings.MacRoman
		      prefs.Load(t.ReadAll)
		      
		    Catch e As IOException
		      t.Close
		      MsgBox("Error loading preference file.")
		    End Try
		    
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub loadControlValue(prefsControl as Control)
		  if not (prefsControl isa Label) and _
		    not (prefsControl isa PushButton) and (prefsControl.name <> "PrefsOKButton") and (prefsControl.name <> "PrefsCancelButton") then
		    
		    if prefs.hasName(prefsControl.name) then
		      
		      if prefsControl isa TextField then
		        
		        if TextField(prefsControl).Password then
		          TextField(prefsControl).Text = prefs.value(prefsControl.name).StringValue.decrypt
		        else
		          TextField(prefsControl).Text = prefs.value(prefsControl.name).StringValue
		        end if
		        
		      elseIf prefsControl isa TextArea then
		        TextArea(prefsControl).Text =  prefs.value(prefsControl.name).StringValue
		        
		      elseIf prefsControl isa JVPopupMenu then
		        JVPopupMenu(prefsControl).listIndex = JVPopupMenu(prefsControl).indexFor(prefs.value(prefsControl.name))
		        
		      elseIf prefsControl isa CheckBox then
		        CheckBox(prefsControl).Value = prefs.value(prefsControl.name).BooleanValue
		        
		      else
		        Dim e As RuntimeException = New RuntimeException
		        e.ErrorNumber = -1
		        
		        Dim type As Introspection.TypeInfo = Introspection.GetType(prefsControl)
		        e.Message = "PrefsWindowController: "+type.name +" is an unsupported Type"
		        Raise e
		      end if
		      
		    end if
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub notifyObservers(sender as JVNotifier)
		  // Part of the JVNotifier interface.
		  
		  For Each observer As JVObserver In prefsChangedObservers
		    JVPrefsChangedObserver(observer).onPrefsChanged(prefs)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowActivate(sender as NSWindow)
		  // Part of the NSWindowDelegate interface.
		  
		  load
		  syncInterface(True)
		  prefsWindow.prefsOkButton.Enabled = FALSE
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function onWindowCancelClose(sender as NSWindow, appQuitting as Boolean) As Boolean
		  // Part of the NSWindowDelegate interface.
		  
		  prefsWindow.hide
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
		  // Part of the NSWindowDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub registerObserver(observer As JVObserver)
		  // Part of the JVNotifier interface.
		  prefsChangedObservers.Append(observer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeObserver(observer As JVObserver)
		  // Part of the JVNotifier interface.
		  Dim result As Integer
		  result = prefsChangedObservers.IndexOf(observer)
		  prefsChangedObservers.Remove(result)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub save()
		  syncInterface // adjust the model
		  
		  // And save it to disk
		  If prefsFile <> Nil then
		    
		    Dim t as TextOutputStream
		    try
		      t  = TextOutputStream.create(prefsFile)
		      t.Write(prefs.ToString)
		      t.Close
		      
		    Catch e As IOException
		      t.Close
		      MsgBox("Error saving preference file.")
		    End Try
		    
		  End If
		  
		  hideWindow
		  
		  notifyObservers(me)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub saveControlValue(prefsControl as Control)
		  if not (prefsControl isa Label) and _
		    not (prefsControl isa PushButton) and (prefsControl.name <> "PrefsOKButton") and (prefsControl.name <> "PrefsCancelButton") then
		    
		    if prefsControl isa TextField then
		      
		      if TextField(prefsControl).Password then
		        prefs.value(prefsControl.name) = TextField(prefsControl).Text.encrypt
		      else
		        prefs.value(prefsControl.name) = TextField(prefsControl).Text
		      end if
		      
		    elseIf prefsControl isa TextArea then
		      prefs.value(prefsControl.name) =  TextArea(prefsControl).Text
		      
		    elseIf prefsControl isa PopupMenu then
		      prefs.value(prefsControl.name) =   PopupMenu(prefsControl).Text
		      
		    elseIf prefsControl isa CheckBox then
		      prefs.value(prefsControl.name) =  CheckBox(prefsControl).Value
		      
		    else
		      
		      Dim e As RuntimeException = New RuntimeException
		      e.ErrorNumber = -1
		      
		      Dim type As Introspection.TypeInfo = Introspection.GetType(prefsControl)
		      e.Message = "PrefsWindowController: "+type.name +" is an unsupported Type"
		      Raise e
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub syncInterface(optional up as Boolean = False)
		  if up then
		    
		    
		    // Put each value in its corresponding control
		    for controlNumber as Integer  = 0 to prefsWindow.ControlCount-1
		      dim prefsControl as Control = prefsWindow.Control(controlNumber)
		      loadControlValue(prefsControl) 
		    next
		    
		    
		  else
		    
		    // Put every controlvalue in the prefs-JsonItem
		    for controlNumber as Integer  = 0 to prefsWindow.ControlCount-1
		      dim prefsControl as Control = prefsWindow.Control(controlNumber)
		      saveControlValue(prefsControl)
		    next
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Class description
		
		lazy loaded Singleton Class 
		that displayes a full featured prefsWindow that knows how to save itself
	#tag EndNote


	#tag Property, Flags = &h0
		Shared FilePrefsMenuItem As JVPrefsMenuItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared msharedPrefsWindowController As JVPrefsWindowController
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return JVprefs(representedObject)
			End Get
		#tag EndGetter
		prefs As JVPrefs
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		prefsChangedObservers() As JVObserver
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim prefsFolder As FolderItem = SpecialFolder.Preferences
			  dim prefsFile as FolderItem = prefsFolder.Child(app.shortName+".plist")
			  
			  return prefsFile
			End Get
		#tag EndGetter
		prefsFile As FolderItem
	#tag EndComputedProperty

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
