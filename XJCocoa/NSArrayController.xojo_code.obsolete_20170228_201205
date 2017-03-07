#tag Class
Protected Class NSArrayController
	#tag Method, Flags = &h0
		Sub add(object as Object)
		  arrangedObjects.Append(object)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(content() as object)
		  arrangedObjects = content
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub insert(object as Object)
		  arrangedObjects.Insert(selectionIndex, object)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub remove()
		  arrangedObjects.Remove(selectionIndex)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectedObject() As Object
		  return arrangedObjects(selectionIndex)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectedObjects() As Object()
		  dim objects() As Object
		  
		  for each index As Integer in selectionIndexes
		    objects.Append(arrangedObjects(index))
		  next
		  
		  return objects
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setSelectionIndex(index as Integer) As Boolean
		  dim returnValue As Boolean =  TRUE
		  
		  if (index < 0) or (index > arrangedObjects.ubound)  then
		    returnValue =  FALSE
		  end if
		  
		  if returnValue then
		    selectionIndexes(0) = index
		  end if
		  
		  return returnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function setSelectionIndexes(indexes() as Integer) As Boolean
		  dim returnValue As Boolean =  TRUE
		  
		  for each index as Integer in indexes
		    if (index < 0) or (index > arrangedObjects.ubound)  then
		      returnValue =  FALSE
		    end if
		  next
		  
		  if returnValue then
		    selectionIndexes = indexes
		  end if
		  
		  return returnValue
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		arrangedObjects() As Object
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return selectionIndexes(0)
			End Get
		#tag EndGetter
		selectionIndex As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		selectionIndexes() As Integer
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
			Name="selectionIndex"
			Group="Behavior"
			Type="Integer"
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
