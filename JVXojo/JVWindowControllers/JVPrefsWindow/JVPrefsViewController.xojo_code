#tag Class
Protected Class JVPrefsViewController
Inherits NSViewController
Implements JVPrefsChangedNotifier
	#tag Method, Flags = &h0
		Sub constructor(view as NSView, model as Variant)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(view, model)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub notifyObservers()
		  // Part of the JVNotifier interface.
		  
		  For Each observer As JVObserver In prefsChangedObservers
		    JVPrefsChangedObserver(observer).onPrefsChanged(me, oldPrefs, newPrefs)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onviewActivate(sender as NSView)
		  // Calling the overridden superclass method.
		  Super.onviewActivate(sender)
		  
		  syncInterface(True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onviewContentsChanged(sender as NSView)
		  // Calling the overridden superclass method.
		  Super.onviewContentsChanged(sender)
		  
		  JVPrefsWindowController.sharedPrefsWindowController.syncInterface(True)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub openPrefsFile()
		  
		  If prefsFile <> Nil and prefsFile.exists Then
		    
		    Dim t As TextInputStream
		    Try
		      t = TextInputStream.Open(prefsFile)
		      // t.Encoding = Encodings.MacRoman
		      activePrefs.Load(t.ReadAll)
		      
		    Catch e As IOException
		      t.Close
		      MsgBox("Error loading preference file.")
		    End Try
		    
		  End If
		  
		  
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
		  
		  dim index As Integer =  prefsChangedObservers.IndexOf(observer)
		  prefsChangedObservers.Remove(index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub savePrefsFile()
		  
		  // And save it to disk
		  If prefsFile <> Nil then
		    
		    Dim t as TextOutputStream
		    try
		      t  = TextOutputStream.create(prefsFile)
		      t.Write(activePrefs.ToString)
		      t.Close
		      
		    Catch e As IOException
		      t.Close
		      MsgBox("Error saving preference file.")
		    End Try
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub syncInterface(optional up as Boolean = False)
		  if up then
		    
		    newPrefs = activePrefs
		    
		  else
		    
		    oldPrefs = activePrefs
		    activePrefs = newPrefs
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Class description
		
		Acts as an abstract class for the prefsViewController for your application
		know how to save every element in its view to disk and read it back as a JVPrefs (subclas of JSONItem)
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return JVPrefs(representedObject)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  representedObject = value
			End Set
		#tag EndSetter
		activePrefs As JVPrefs
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim newPrefs as new JVPrefs
			  
			  for controlNumber as Integer  = 0 to prefsView.ControlCount-1
			    dim prefsControl as Control = prefsView.Control(controlNumber)
			    
			    if (prefsControl isa RectControl) and not (prefsControl isa PushButton) then
			      dim rectCtl as RectControl = RectControl(prefsControl)
			      
			      if rectCtl.enabled then
			        
			        if prefsControl isa TextField then
			          
			          if TextField(prefsControl).Password then
			            newPrefs.value(prefsControl.name) = TextField(prefsControl).Text.encrypt
			          else
			            newPrefs.value(prefsControl.name) = TextField(prefsControl).Text
			          end if
			          
			        elseIf prefsControl isa TextArea then
			          newPrefs.value(prefsControl.name) =  TextArea(prefsControl).Text
			          
			        elseIf prefsControl isa PopupMenu then
			          newPrefs.value(prefsControl.name) =   PopupMenu(prefsControl).Text
			          
			        elseIf prefsControl isa CheckBox then
			          newPrefs.value(prefsControl.name) =  CheckBox(prefsControl).Value
			          
			        else
			          
			          Dim e As RuntimeException = New RuntimeException
			          e.ErrorNumber = -1
			          
			          Dim type As Introspection.TypeInfo = Introspection.GetType(prefsControl)
			          e.Message = "["+CurrentMethodName+"]: "+type.name +" is an unsupported Type"
			          Raise e
			          
			        end if
			        
			      end if
			      
			    end if
			    
			    
			  next controlNumber
			  
			  return newPrefs
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  dim newPrefs as JVPrefs = value
			  
			  for controlNumber as Integer  = 0 to prefsView.ControlCount-1
			    dim prefsControl as Control = prefsView.Control(controlNumber)
			    
			    if (prefsControl isa RectControl) and not (prefsControl isa PushButton) then
			      dim rectCtl as RectControl = RectControl(prefsControl)
			      
			      if rectCtl.enabled then
			        
			        if newPrefs.hasName(prefsControl.name) then
			          
			          if prefsControl isa TextField then
			            
			            if TextField(prefsControl).Password then
			              TextField(prefsControl).Text = newPrefs.value(prefsControl.name).StringValue.decrypt
			            else
			              TextField(prefsControl).Text = newPrefs.value(prefsControl.name).StringValue
			            end if
			            
			          elseIf prefsControl isa TextArea then
			            TextArea(prefsControl).Text =  newPrefs.value(prefsControl.name).StringValue
			            
			          elseIf prefsControl isa JVPopupMenu then
			            JVPopupMenu(prefsControl).listIndex = JVPopupMenu(prefsControl).indexFor(newPrefs.value(prefsControl.name))
			            
			          elseIf prefsControl isa CheckBox then
			            CheckBox(prefsControl).Value = newPrefs.value(prefsControl.name).BooleanValue
			            
			          else
			            Dim e As RuntimeException = New RuntimeException
			            e.ErrorNumber = -1
			            
			            Dim type As Introspection.TypeInfo = Introspection.GetType(prefsControl)
			            e.Message = "["+CurrentMethodName+"]: "+type.name +" is an unsupported Type"
			            Raise e
			          end if
			          
			        end if
			        
			      end if
			      
			    end if
			    
			  next controlNumber
			End Set
		#tag EndSetter
		newPrefs As JVPrefs
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		oldPrefs As JVPrefs
	#tag EndProperty

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
			  
			  return view
			End Get
		#tag EndGetter
		prefsView As NSView
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
