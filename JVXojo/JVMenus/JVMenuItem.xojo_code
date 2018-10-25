#tag Class
Protected Class JVMenuItem
Inherits menuItem
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
		Sub constructor(node as NSTreeNode, textColumn as String)
		  
		  dim  thisMenuItem as JVMenuItem = me
		  textualRepresentations = new Dictionary
		  dim currentValue as Variant = nil
		  
		  if node <> nil then
		    
		    // Proces the individual fields
		    if node.representedObject isa Dictionary then
		      dim representedObject as Dictionary = node.representedObject
		      
		      thisMenuItem.tag = node.finalKey
		      
		      if representedObject.HasKey(textColumn) then
		        thisMenuItem.Text = representedObject.value(textColumn)
		      else
		        dim key as String = representedObject.key(0)
		        thisMenuItem.Text = representedObject.value(key)
		      end if
		      
		    elseif node.representedObject isa DatabaseRecord then
		      dim representedObject as DatabaseRecord = node.representedObject
		      
		      thisMenuItem.tag = node.finalKey
		      
		      if representedObject.hasColumn(textColumn) then
		        thisMenuItem.Text = representedObject.Column(textColumn)
		      else
		        dim columName as String = representedObject.FieldName(0)
		        thisMenuItem.Text = representedObject.Column(columName)
		      end if
		      
		    end if
		    
		    if not node.isLeaf then
		      
		      for each childNode as NSTreeNode in node.children
		        
		        dim childMenu as new JVMenuItem(ChildNode, textColumn)
		        Append(childMenu)
		        
		        // Copy the textualRepresentations from the lower level menu's to the current level
		        for each key as Variant in childMenu.textualRepresentations.Keys
		          textualRepresentations.Value(key) = childMenu.textualRepresentations.value(key)
		        next key
		        
		      next childNode
		      
		    else
		      
		      // Store them together for future reference
		      dim textSegments() as String
		      textSegments.Append(thisMenuItem.Text)
		      dim parent as JVMenuItem = JVMenuItem(thisMenuItem.parentMenu)
		      while parent <> nil
		        textSegments.Insert(0, parentMenu.Text)
		        parent = JVMenuItem(parent.parentMenu)
		      wend
		      textualRepresentations.Value(node.finalKey) = join(textSegments, " > ")
		      
		    end if
		    
		    
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(items() as String)
		  dim  thisMenuItem as JVMenuItem = me
		  
		  dim index as Integer = 0
		  for each textItem as String in items
		    
		    dim childItem as new MenuItem
		    // Build the menu based from the values in the nodetree
		    childItem.Text = textItem
		    // Store the indexpath(string) with it
		    childItem.tag = index
		    
		    // Store them togeter for future reference
		    textualRepresentations.Value(childItem.tag) = childItem.Text
		    
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
		Function textRepresentation(value as Variant) As String
		  
		  if (value <> nil) then
		    
		    if  textualRepresentations.HasKey(value) then
		      
		      return textualRepresentations.value(value).StringValue
		      
		    elseif  textualRepresentations.HasKey(value.IntegerValue) then
		      
		      return textualRepresentations.value(value.IntegerValue).StringValue
		      
		    elseif  textualRepresentations.HasKey(value.StringValue) then
		      
		      return textualRepresentations.value(value.StringValue).StringValue
		      
		    else
		      
		      return "Undefined value !"
		      
		    end if
		    
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		owner As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		parentMenu As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private textualRepresentations As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  dim value as Variant
			  if me <> nil then
			    value = tag
			  else
			    value = nil
			  end if
			  
			  dim textualRepresentation as String = textRepresentation(value)
			  return  value : textualRepresentation
			  
			End Get
		#tag EndGetter
		valueAndText As Pair
	#tag EndComputedProperty


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
	#tag EndViewBehavior
End Class
#tag EndClass
