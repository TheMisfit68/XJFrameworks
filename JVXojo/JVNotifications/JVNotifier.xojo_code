#tag Interface
Protected Interface JVNotifier
	#tag Method, Flags = &h0
		Sub notifyObservers(sender as JVNotifier)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub registerObserver(observer As JVObserver)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeObserver(observer As JVObserver)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Class interface description
		
		This is an abstract class interface
		
	#tag EndNote


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
End Interface
#tag EndInterface
