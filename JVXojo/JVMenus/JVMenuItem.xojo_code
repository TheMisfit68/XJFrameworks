#tag Class
Protected Class JVMenuItem
Inherits menuItem
	#tag Method, Flags = &h0
		Sub constructor(parentMenu as MenuItem, node as NSTreeNode, textColumn as String)
		  
		  dim  thisMenuItem as JVMenuItem = me
		  thisMenuItem.parentMenu = parentMenu
		  
		  textualRepresentations = new Dictionary
		  
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
		      
		      textSegments = array(Text)
		      dim parentItem as JVMenuItem = JVMenuItem(parentMenu)
		      while not parentItem.isMainMenu
		        textSegments.insert(0, parentItem.text)
		        parentItem = JVMenuItem(parentItem.parentMenu)
		      wend
		      parentItem.textualRepresentations.value(tag) =  join(textSegments, " > ")
		      
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return (parentMenu = nil)
			End Get
		#tag EndGetter
		isMainMenu As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		owner As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		parentMenu As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		textSegments() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		textualRepresentations As Dictionary
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
