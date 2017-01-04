#tag Class
Protected Class NSDocumentController
	#tag Method, Flags = &h0
		Shared Sub addNewDocument(newDocument as NSDocument)
		  
		  documents.Insert 0, newdocument
		  newDocument.windowcontroller.window.show
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function documentForWindow(window as NSWindow) As NSDocument
		  return window.owner.document
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function openDialog(fileType as FIleType) As FolderItem
		  dim newFolderitem as folderItem = GetOpenFolderItem(fileType.Name)
		  return newFolderitem
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub openDocument()
		  // Choose a File
		  dim newDocument as NSDocument = new NSDocument
		  newDocument.file = openDialog(newDocument.fileType)
		  
		  // and use its contents
		  if newDocument.file <> nil then
		    
		    newDocument.representedObject = NSKeyedUnarchiver(newDocument.file)
		    newDocument.windowController.window.title = newDocument.file.DisplayName
		    
		    documents.Insert 0, newdocument
		    
		    newDocument.windowcontroller.window.show
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub removeDocument(document as NSDocument)
		  documents.remove(documents.indexof(document))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub saveAllDocuments()
		  for each document as NSDocument in documents
		    document.save
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function saveDialog(existingFile as FolderItem) As FolderItem
		   // Propose current filename and type if it exist
		  //  or default to "Untitled"
		  
		  dim fileName  as String = "Untitled"
		  dim fileType as String = ""
		  
		  if existingFile <> nil then
		    fileName = existingFile.name
		    fileType =  existingFile.type
		  end if
		  dim newFolderItem as folderItem = GetSaveFolderItem(fileType,fileName)
		  
		  if newFolderItem = nil then
		    dim newFile as FolderItem =  new FolderItem
		    // Second chance to choose a file
		    Dim warning as New MessageDialog                       //declare the MessageDialog object
		    Dim choise as MessageDialogButton                     //for handling the result
		    warning.title= fileType +" niet bewaard"
		    warning.Message="Weet u zeker dat u het " + fileType + " wil sluiten zonder de wijzigingen te bewaren"
		    warning.Explanation="Indien u het " + fileType + " niet bewaard, gaan alle wijzigingen verloren"
		    
		    warning.icon=MessageDialog.GraphicCaution     //display warning icon
		    warning.ActionButton.Caption="Bewaar niet"
		    warning.ActionButton.Default=False
		    warning.CancelButton.Visible=True                      //show the Cancel button and make it the default
		    warning.CancelButton.Default=True
		    
		    choise=warning.ShowModal                         //display the dialog in the window
		    Select Case choise                                       //determine which button was pressed.
		    Case warning.ActionButton
		      // Discard
		      newFile = nil
		    Case warning.CancelButton
		      // Cancel
		      newFile = existingFile
		    End select
		    
		    return newFile
		    
		  else
		    dim newFile as FolderItem =  new FolderItem(newFolderitem)
		    return newFile
		  end if
		  
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return documentForWindow(NSWindow(window(0)))
			End Get
		#tag EndGetter
		Shared currentDocument As NSDocument
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Shared documents() As NSDocument
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mSharedDocumentController As NSDocumentController
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mshareddocumentController = nil then
			    mshareddocumentController = new NSDocumentController
			  end if
			  
			  return mshareddocumentController
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mshareddocumentController = value
			End Set
		#tag EndSetter
		Shared sharedDocumentController As NSDocumentController
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
