#tag Class
Protected Class NSViewController
Implements NSViewDelegate
	#tag Method, Flags = &h1000
		Sub constructor(view as NSView, model as Variant)
		  
		  self.view = view
		  self.view.show
		  
		  self.view.owner = me
		  self.view.viewDelegate = me
		  
		  if model.IsArray then
		    
		    // Encapsulate arrays using an NSArrayController
		    // Dim controller as NSArrayController = new NSArrayController(model)
		    // self.model = controller 
		    
		  else
		    self.represenTedObject = model
		  end if
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
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewClose(sender as NSView)
		  // Part of the NSViewDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewContentsChanged(sender as NSView)
		  // Part of the NSViewDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewOpen(sender as NSView)
		  // Part of the NSViewDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub syncInterface(optional up as Boolean = False)
		  Dim e As RuntimeException = New RuntimeException
		  e.ErrorNumber = -1
		  e.Message = "[NSViewController] You must override the syncInterface-method for the "+ me.className+"-class"
		  Raise e
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  
			  if self.view.isInstalled  then
			    dim myParentWindow as NSWindow = NSWindow(self.view.trueWindow)
			    dim myParentWindowController as NSWindowController = NSWindowController(myParentWindow.owner)
			    if (myParentWindowController.document <> nil) then
			      return myParentWindowController.document
			    end if
			  end if
			  
			  return representedObject
			End Get
		#tag EndGetter
		model As Variant
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		representedObject As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		view As NSView
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
