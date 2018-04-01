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
		Sub constructor(node as NSTreeNode)
		  dim  thisMenuItem as JVMenuItem = me
		  
		  if node <> nil then
		    
		    
		    if node.representedObject isa Dictionary then
		      dim representedObject as Dictionary = node.representedObject
		    elseif node.representedObject isa DatabaseRecord then
		      dim representedObject as DatabaseRecord = node.representedObject
		    end if
		    
		    // Proces the individual fields
		    dim fieldName as Variant
		    dim fieldValue as  Variant
		    if node.representedObject isa Dictionary then
		      dim representedObject as Dictionary = node.representedObject
		      fieldName = representedObject.key(0)
		      fieldValue = representedObject.value(fieldName)
		    elseif node.representedObject isa DatabaseRecord then
		      dim representedObject as DatabaseRecord = node.representedObject
		      fieldName = representedObject.FieldName(0)
		      fieldValue = representedObject.Column(fieldName.StringValue)
		    end if
		    
		    thisMenuItem.Text = fieldValue.StringValue
		    
		    // Attach each field to the cell
		    dim field as  Pair =  fieldName: node.finalIndex
		    thisMenuItem.tag = field
		    
		    for each childNode as NSTreeNode in node.children
		      
		      thisMenuItem.Append(new JVMenuItem(ChildNode))
		      
		    next childNode
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(items() as String)
		  dim  thisMenuItem as JVMenuItem = me
		  
		  for each textItem as String in items
		    
		    thisMenuItem.Append(new MenuItem(textItem))
		    
		  next textItem
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub insert()
		  parentMenu.insert(index, me)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		index As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		owner As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		parentMenu As MenuItem
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
	#tag EndViewBehavior
End Class
#tag EndClass
