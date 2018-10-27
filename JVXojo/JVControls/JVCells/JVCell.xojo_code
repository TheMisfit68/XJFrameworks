#tag Class
Protected Class JVCell
	#tag Method, Flags = &h0
		Function activate(x as Integer, y as Integer) As Boolean
		  
		  raise new FunctionNotFoundException // This is an abstract class, you must override this method in each subclass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(g as graphics) As Boolean
		  
		  raise new FunctionNotFoundException // This is an abstract class, you must override this method in each subclass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(g as graphics, x as Integer, y as Integer) As Boolean
		  
		  raise new FunctionNotFoundException // This is an abstract class, you must override this method in each subclass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateRowAndColumn(rowAndColumn as pair)
		  row = rowAndColumn.left
		  column = rowAndColumn.right
		End Sub
	#tag EndMethod


	#tag Note, Name = Class Description
		
		This class gets stored behind a listbox-cell (in the celltag-property).
		It handles te drawing and activation of custom cell types
	#tag EndNote


	#tag Property, Flags = &h0
		activeArea As Graphics
	#tag EndProperty

	#tag Property, Flags = &h0
		column As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		fieldName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		fieldValue As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		listbox As Listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		row As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="fieldName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="column"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="row"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
