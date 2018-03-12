#tag Class
Protected Class JVTreeView
Inherits ListBox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  me.drawCellType(g, row, column)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  
		  dim rowAndColumn as Pair = rowAndColumnClicked(x, y)
		  dim row as Integer = rowAndColumn.left
		  dim column as Integer = rowAndColumn.right
		  
		  activateCellType(row, column)
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub activateCellType(row as integer, column as integer)
		  if (row >= 0 ) and (row < listCount) and (column >=0) and (column < ColumnCount) then
		    
		    dim fieldInfo as Pair = me.CellTag(row, column)
		    dim fieldName as String
		    if fieldInfo <> nil then
		      fieldName = FieldInfo.left
		    end if
		    
		    dim currentCellType as JVCellType = treeViewDataSource.cellType(fieldName)
		    Select Case currentCellType.type
		      
		    Case JVCellType.TYPES.PopUpMenu
		      
		      Me.ListIndex = row
		      Me.Selected(row) = True
		      
		      // Create a pupmenu and pop it open
		      dim lookupValues() as String = currentCellType.lookupValues
		      if (lookupValues <> nil) and (lookupValues.Ubound >= 0) then
		        dim popUpMenu as new MenuItem
		        for each lookupValue as String in lookupValues
		          popUpmenu.Append(New MenuItem(lookupValue))
		        next
		        
		        Dim selectedMenu As MenuItem
		        selectedMenu = popUpMenu.PopUp
		        If selectedMenu <> Nil Then
		          // Change te value of the Field here eventualy
		        end if
		        InvalidateCell(row, column)
		      end if
		      
		    Case Else
		      // Do nothing special when any regular cell is clicked
		    End Select
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  hierarchical=TRUE
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawCellType(g as Graphics, row as integer, column as integer)
		  
		  if (row >= 0 ) and (row < listCount) and (column >=0) and (column < ColumnCount) then
		    
		    dim fieldInfo as Pair = me.CellTag(row, column)
		    dim fieldName as String
		    if fieldInfo <> nil then
		      fieldName = FieldInfo.left
		    end if
		    
		    dim currentCellType as JVCellType = treeViewDataSource.cellType(fieldName)
		    Select Case currentCellType.type
		      
		    Case JVCellType.TYPES.PopUpMenu
		      
		      dim extraOffset as Integer =0
		      if column = 0 then
		        extraOffset  = rowDepth(row)*14
		      end if
		      
		      // Draw an arrow to indicate that clicking this field will
		      // display a menu
		      g.ForeColor = &cDFDFDF // Ultra light gray
		      
		      g.PenHeight = 1
		      g.FILLRoundRect(extraOffset+2, 1, g.Width-extraOffset-4, g.Height-2, 10, 10)
		      
		      // 
		      g.ForeColor = NSColor.LightGrey
		      g.DrawLine(extraOffset+30, 1, extraOffset+30,1+g.Height-2)
		      
		      // Points for a triangle on the left side of the cell
		      Dim points(6) As Integer
		      points(1) = extraOffset+10
		      points(2) = 4
		      points(3) = extraOffset+20
		      points(4) = 4 
		      points(5) = extraOffset+15
		      points(6) = 14 
		      
		      g.FillPolygon(points)
		      
		      me.CellAlignmentOffset(row, column) =30
		      
		      
		    Case JVCellType.TYPES.PopupList
		      
		      // Not yet implemented
		      
		    Case JVCellType.TYPES.CheckBox
		      
		      CellType(row, column) = Listbox.TypeCheckbox
		      
		    Case JVCellType.TYPES.Radiobutton
		      
		      // Not yet implemented
		      
		    Case JVCellType.TYPES.TextField
		      
		      CellType(row, column) = Listbox.TypeEditableTextField
		      
		    Case Else
		      
		      CellType(row, column) = Listbox.TypeDefault
		      
		    End Select
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function rowAndColumnClicked(x as Integer, y as integer) As pair
		  
		  Dim row As Integer = RowFromXY(x, y)
		  Dim column As Integer = ColumnFromXY(x, y)
		  dim rowAndColumn as pair =  row : column
		  
		  return rowAndColumn
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		mTreeViewDelegate As JVTreeViewDelegate
	#tag EndProperty

	#tag Property, Flags = &h0
		owner As JVTreeController
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return JVTreeController(owner)
			End Get
		#tag EndGetter
		treeController As JVTreeController
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		treeViewDataSource As JVTreeViewDataSource
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTreeViewDelegate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  if mTreeViewDelegate <> nil then
			    
			    // Remove any previously set delegate
			    RemoveHandler Open, AddressOf mTreeViewDelegate.onListOpen
			    RemoveHandler ExpandRow, AddressOf mTreeViewDelegate.onListExpandRow
			    RemoveHandler CollapseRow, AddressOf mTreeViewDelegate.onListCollapseRow
			    RemoveHandler Change, AddressOf mTreeViewDelegate.onListSelectionDidChange
			    RemoveHandler DoubleClick, AddressOf mTreeViewDelegate.onListDoubleClick
			    
			    
			    RemoveHandler CellAction, AddressOf mTreeViewDelegate.onCellAction
			  end if
			  
			  // Set the delegate
			  mTreeViewDelegate = value
			  
			  if mTreeViewDelegate <> nil then
			    
			    // Redirect all events to the delegate
			    AddHandler Open, AddressOf mTreeViewDelegate.onListOpen
			    AddHandler ExpandRow, AddressOf mTreeViewDelegate.onListExpandRow
			    AddHandler CollapseRow, AddressOf mTreeViewDelegate.onListCollapseRow
			    AddHandler Change, AddressOf mTreeViewDelegate.onListSelectionDidChange
			    AddHandler DoubleClick, AddressOf mTreeViewDelegate.onListDoubleClick
			    
			    AddHandler CellAction, AddressOf mTreeViewDelegate.onCellAction
			    
			  end if
			  
			  
			  
			  
			  
			  
			End Set
		#tag EndSetter
		treeViewDelegate As JVTreeViewDelegate
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowDropIndicator"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
