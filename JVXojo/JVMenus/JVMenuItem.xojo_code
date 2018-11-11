#tag Class
Protected Class JVMenuItem
Inherits menuItem
Implements JVTransFormer
	#tag Method, Flags = &h0
		Sub constructor(parentMenu as MenuItem, node as NSTreeNode, textColumn as String, optional showFullTextPath as Boolean = True)
		  
		  dim  thisMenuItem as JVMenuItem = me
		  thisMenuItem.parentMenu = parentMenu
		  
		  me.valueTransformer = me
		  dim fullTextPath() as String
		  
		  if node <> nil then
		    
		    // Proces the individual fields
		    if node.representedObject isa Dictionary then // When its a Dictionary
		      dim representedObject as Dictionary = node.representedObject
		      
		      thisMenuItem.tag = node.finalKey 
		      
		      if representedObject.HasKey(textColumn) then
		        thisMenuItem.Text = representedObject.value(textColumn)
		      else
		        // Use the value of the first field if there is no explicit textfield
		        dim key as String = representedObject.key(0)
		        thisMenuItem.Text = representedObject.value(key)
		      end if
		      
		    elseif node.representedObject isa DatabaseRecord then  // When its a DatabaseRecord
		      dim representedObject as DatabaseRecord = node.representedObject
		      
		      thisMenuItem.tag = node.finalKey
		      
		      if not representedObject.hasColumn(textColumn) then
		        textColumn = representedObject.FieldName(0)
		      end if
		      thisMenuItem.Text = representedObject.Column(textColumn)
		      
		    end if
		    
		    if node.isLeaf then
		      
		      fullTextPath = array(Text)
		      dim parentItem as JVMenuItem = JVMenuItem(parentMenu)
		      
		      if showFullTextPath then
		        while not parentItem.isMainMenu
		          fullTextPath.insert(0, parentItem.text)
		          parentItem = JVMenuItem(parentItem.parentMenu)
		        wend
		      end if
		      
		      parentItem.textRepresentations.value(tag) = join(fullTextPath, " > ")
		      
		    else
		      
		      for each childNode as NSTreeNode in node.children
		        dim childMenu as new JVMenuItem(me, childNode, textColumn)
		      next childNode
		      
		    end if
		    
		  end if
		  
		  if parentMenu <> nil then
		    parentMenu.Append(thisMenuItem)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(parentMenu as MenuItem, name as String, index as Integer)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From MenuItem
		  // Constructor(copy as MenuItem) -- From MenuItem
		  // Constructor(Text As String, Tag As Variant = Nil) -- From MenuItem
		  Super.Constructor(name)
		  
		  me.parentMenu = parentMenu
		  me.index = index
		  Insert
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(items() as String)
		  dim  thisMenuItem as JVMenuItem = me
		  me.valueTransformer = me
		  
		  dim index as Integer = 0
		  for each textItem as String in items
		    
		    dim childItem as new MenuItem
		    // Build the menu based from the values in the nodetree
		    childItem.Text = textItem
		    // Store the indexpath(string) with it
		    childItem.tag = index
		    
		    // Store them togeter for future reference
		    textRepresentations.Value(childItem.tag) = childItem.Text
		    
		    thisMenuItem.Append(childItem)
		    
		    index = index+1
		  next textItem
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub insert()
		  parentMenu.insert(index, me)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function representationFor(value as Variant) As Variant
		  
		  if (value <> nil) then
		    
		    if  textRepresentations.HasKey(value) then
		      
		      return textRepresentations.value(value).StringValue
		      
		    elseif  textRepresentations.HasKey(value.IntegerValue) then
		      
		      return textRepresentations.value(value.IntegerValue).StringValue
		      
		    elseif  textRepresentations.HasKey(value.StringValue) then
		      
		      return textRepresentations.value(value.StringValue).StringValue
		      
		    else
		      
		      return "Undefined value !"
		      
		    end if
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function valueFor(representation as Variant) As Variant
		  // Part of the JVTransFormer interface.
		  
		  if (representation <> nil) and not representation.StringValue.contains("Undefined") then
		    
		    dim values() as Variant = textRepresentations.Values
		    dim position as Integer = values.IndexOf(representation)
		    
		    return textRepresentations.Key(position)
		    
		  else
		    
		    return nil
		    
		  end if
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return (parentMenu = nil)
			End Get
		#tag EndGetter
		isMainMenu As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mTextRepresentations As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		owner As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		parentMenu As MenuItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mTextRepresentations = nil then
			    mTextRepresentations = new Dictionary // Lazy loading
			  end if
			  
			  return mTextRepresentations
			End Get
		#tag EndGetter
		textRepresentations As Dictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  dim textualRepresentation as String = valueTransformer.representationFor(tag)
			  
			  return  tag : textualRepresentation
			  
			End Get
		#tag EndGetter
		valueAndText As Pair
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		valueTransformer As JVTransformer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="index"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isMainMenu"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
