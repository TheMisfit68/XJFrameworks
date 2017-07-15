#tag Class
Protected Class NSDocument
	#tag Method, Flags = &h0
		Sub close()
		  windowController.window.close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  
		  documentEdited =  false
		  
		  file = nil
		  
		  representedObject = nil
		  
		  windowController = nil
		  
		  archiver = new NSKeyedArchiver
		  unarchiver = new NSKeyedUnarchiver
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadData()
		  representedObject = NSKeyedUnarchiver.unarchiveObject(file)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub save()
		  if file = nil then
		    file = NSDocumentController.SaveDialog(App.documentController.currentDocument.file)
		  end if
		  
		  if file <> nil then
		    
		    NSKeyedArchiver.archiveObject(representedObject, file)
		    
		    if isSaved then
		      windowController.window.title = file.DisplayName
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveAs()
		  
		  file = NSDocumentController.SaveDialog(file)
		  
		  if file <> nil then
		    
		    NSKeyedArchiver.archiveObject(representedObject, file)
		    
		    if isSaved then
		      windowController.window.title = file.DisplayName
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = The NSDocument role
		This is an abstract class, needs to be subclassed!
		
		The classes in this Model controller load, store, and access model data
		
		This 'model controller' mediates between the persistent store and the applications model
		It has a NSFileWrapper property for writing all the data to a folder on disk
	#tag EndNote


	#tag Property, Flags = &h0
		archiver As NSKeyedArchiver
	#tag EndProperty

	#tag Property, Flags = &h0
		documentEdited As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		file As FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim e As RuntimeException = New RuntimeException
			  e.ErrorNumber = -1
			  e.Message = "You must overide the fileType-property for te NSDocument-class"
			  Raise e
			End Get
		#tag EndGetter
		fileType As FileType
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		isSaved As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		representedObject As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		unArchiver As NSKeyedUnarchiver
	#tag EndProperty

	#tag Property, Flags = &h0
		windowController As NSWindowController
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="documentEdited"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isSaved"
			Group="Behavior"
			Type="Boolean"
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
