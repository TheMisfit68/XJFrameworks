#tag Class
Protected Class JVHiddenCell
Implements JVCustomCell
	#tag Method, Flags = &h0
		Sub activate(listBox as JVtableView, row as integer, column as Integer)
		  // Part of the JVCustomCell interface.
		  
		  // A hidden cell can't be activated
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub draw(listBox as JVtableView , g as graphics, row as integer, column as integer)
		  // Part of the JVCustomCell interface.
		  
		  // A hidden cell doesn't do any drawing at all
		End Sub
	#tag EndMethod


End Class
#tag EndClass
