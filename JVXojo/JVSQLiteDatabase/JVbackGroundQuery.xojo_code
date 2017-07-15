#tag Class
Protected Class JVbackGroundQuery
Inherits JVBackgroundTask
	#tag Event
		Sub Run()
		  foundRecords = preparedStatement.SQLSelect
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub bindVariables(optional variables() as Variant = nil)
		  
		  if variables =  nil then
		    variables = emptyVariables
		  end if
		  
		  preparedStatement.bindVariables(variables)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(database as sqliteDatabase , statementString as String)
		  super.constructor
		  
		  me.preparedStatement = database.Prepare(statementString)
		  
		  dim splitVariables() as string = statementString.Split("?")
		  dim lastVariable as Integer = splitVariables.Ubound-1
		  for  variableNumber as Integer = 0 to lastVariable
		    dim variableString as String = splitVariables(variableNumber)
		    if variableString.contains("Like") then
		      emptyVariables.append ("%")
		    else
		      emptyVariables.append ("")
		    end if
		    
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		emptyVariables() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		foundRecords As RecordSet
	#tag EndProperty

	#tag Property, Flags = &h0
		preparedStatement As SQLitePreparedStatement
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return foundRecords.RecordCount
			End Get
		#tag EndGetter
		recordCount As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mEventWasFired"
			Group="Behavior"
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="recordCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
