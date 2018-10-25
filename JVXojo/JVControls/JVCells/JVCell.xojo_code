#tag Class
Protected Class JVCell
	#tag Method, Flags = &h0
		Function activate(listBox as JVtableView, row as integer, column as Integer, x as Integer, y as Integer) As Boolean
		  
		  raise new FunctionNotFoundException // This is an abstract class, you must oveerirde this method in each subclass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintBackground(listBox as JVtableView, g as graphics, row as integer, column as integer) As Boolean
		  
		  raise new FunctionNotFoundException // This is an abstract class, you must oveerirde this method in each subclass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function paintText(listBox as JVtableView, g as graphics, row as integer, column as Integer, x as Integer, y as Integer) As Boolean
		  
		  raise new FunctionNotFoundException // This is an abstract class, you must oveerirde this method in each subclass
		End Function
	#tag EndMethod


	#tag Note, Name = Class Description
		
		This class gets stored behind a listbox-cell (in the celltag-property).
		It handles te drawing and activation of custom cell types
	#tag EndNote


	#tag Property, Flags = &h0
		activeArea As Graphics
	#tag EndProperty

	#tag Property, Flags = &h0
		fieldName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		fieldValue As Variant
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
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
