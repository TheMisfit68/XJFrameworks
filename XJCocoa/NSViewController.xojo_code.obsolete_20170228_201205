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
		    Dim controller as NSArrayController = new NSArrayController(model)
		    self.representedObject = controller 
		    
		  else
		    self.representedObject = model
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
		Sub syncInterface(up as Boolean)
		  Dim e As RuntimeException = New RuntimeException
		  e.ErrorNumber = -1
		  e.Message = "You must overide the syncInterface-method for te NSViewController-class"
		  Raise e
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  dim windowController as NSWIndowController = NSWindow(me.view.trueWindow).owner
			  if windowController.document <> nil then
			    return windowController.document
			  end if
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
