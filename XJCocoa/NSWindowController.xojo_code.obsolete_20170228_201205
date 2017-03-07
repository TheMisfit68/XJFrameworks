#tag Class
Protected Class NSWindowController
Implements NSWindowDelegate
	#tag Method, Flags = &h1000
		Sub constructor(window as NSWIndow, model as Variant)
		  
		  self.window = window
		  hideWindow
		  self.window.owner = me
		  self.window.windowDelegate = me
		  
		  if model isa NSDocument then
		    
		    self.document = model
		    self.representedObject = document.representedObject
		    
		  else
		    
		    self.document = nil
		    self.representedObject = model
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub hideWindow()
		  window.hide
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onWindowActivate(sender as NSWindow)
		  // Part of the NSViewDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function onWindowCancelClose(sender as NSWindow, appQuitting as Boolean) As Boolean
		  // Part of the NSWindowDelegate interface.
		  
		  if document isa NSDocument then
		    
		    if  document.file = nil or not document.isSaved then
		      // Try to save first when necessary
		      document.saveAs
		    end if
		    
		    return (document.file = nil or not document.isSaved)
		    
		  else
		    return false
		  end
		  
		  
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
		Sub onWindowPaint(sender as NSWindow, g as Graphics, areas() as REALbasic.Rect)
		  // Part of the NSWindowDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showModalWindow()
		  window.ShowModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub syncInterface(optional up as Boolean = False)
		  Dim e As RuntimeException = New RuntimeException
		  e.ErrorNumber = -1
		  e.Message = "You must overide the syncInterface-method for te NSWindowController-class"
		  Raise e
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		document As NSDocument
	#tag EndProperty

	#tag Property, Flags = &h0
		representedObject As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		window As NSWindow
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
