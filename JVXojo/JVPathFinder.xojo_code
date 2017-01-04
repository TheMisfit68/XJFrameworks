#tag Class
Protected Class JVPathFinder
	#tag Method, Flags = &h0
		Sub constructor()
		  // Return a resourceFolder based on the platform and build state
		  #if debugBuild then
		    #if TargetWindows then
		      baseFolder = app.ExecutableFile.Parent.Parent
		    #else
		      baseFolder = app.ExecutableFile.Parent.Parent.parent.Parent
		    #Endif
		  #else
		    #if TargetWindows then
		      baseFolder = app.ExecutableFile.Parent
		    #else
		      baseFolder = app.ExecutableFile.Parent.Parent.Parent
		    #Endif
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findFile(fileName as String) As FolderItem
		  dim subDirectoriesToSearch() as folderitem = Array(baseFolder)
		  dim completeMatch as FolderItem
		  dim partialMatch as FolderItem
		  
		  while (completeMatch = nil) and (subDirectoriesToSearch.Ubound >= 0) 
		    
		    dim currentDirectory as folderItem = subDirectoriesToSearch(0)
		    
		    for i as Integer=1 to currentDirectory.Count
		      dim currentItem as FolderItem = currentDirectory.Item(i)
		      
		      if currentItem.Directory then
		        subDirectoriesToSearch.Append(currentItem)
		      else
		        
		        if currentItem.name = fileName  then
		          completeMatch = currentItem
		          exit for
		        elseif instr(currentItem.name,fileName)<>0  then
		          partialMatch = currentItem
		        end if
		        
		      end if
		      
		    next
		    
		    subDirectoriesToSearch.Remove(0)
		    
		  wend
		  
		  if completeMatch <> nil then
		    return completeMatch
		  elseIf partialMatch <> nil then
		    return partialMatch
		  else
		    return nil
		  end if
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		baseFolder As folderitem
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
