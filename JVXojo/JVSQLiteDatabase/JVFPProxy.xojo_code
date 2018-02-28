#tag Class
Protected Class JVFPProxy
Inherits JVSQLiteDatabase
Implements JVBackgroundTaskDelegate
	#tag Method, Flags = &h0
		Function addRecord(baseTableName as String, record as DatabaseRecord) As Integer
		  return insertRecords(baseTableName, array(record))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addRequest(request as DatabaseRecord)
		  requests.Append(request)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteAllRecords(optional withoutDialog as Boolean = False)
		  
		  dim okToDelete as Integer = 1
		  if not withoutDialog then
		    okToDelete = MsgBox("Are you sure you want to delete all "+Str(recordCount)+" records" , 305)
		  end if
		  
		  // If it is  stiil OK to delete
		  if okToDelete = 1 then
		    foundset.MoveFirst
		    
		    while not foundSet.EOF
		      
		      deleteRecord
		      
		      foundSet.MoveNext
		    wend
		    
		    foundset.MoveFirst
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteRecord(optional recordNumber as Integer = -1)
		  
		  if recordNumber <> -1 then
		    goToRecord(recordNumber)
		  end if
		  
		  currentRecord.DeleteRecord
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteRequest(optional requestNumber as Integer = -1)
		  
		  if requestNumber <> -1 then
		    requests.Remove(requestNumber)
		  else
		    // When no number provided just remove the latest one
		    requests.Remove(requests.Ubound)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editRecord(baseTableOrView as String , newValues as DatabaseRecord)
		  updateRecords(baseTableOrView, foundSet, newValues )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub goToNextRecord()
		  foundSet.MoveNext
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub goToPreviousRecord()
		  foundSet.MovePrevious
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub goToRecord(recordNumber as Integer)
		  foundSet.MoveFirst
		  dim numberOfRecordsToBrowse as Integer = recordNumber-1
		  
		  for browseCount as Integer = 1 to numberOfRecordsToBrowse
		    foundSet.MoveNext
		  next browseCount
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onTaskFinished(sender as JVBackgroundTask)
		  // Part of the JVBackgroundTaskDelegate interface.
		  
		  foundSet = engine.foundRecords
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub performFind(baseTableOrView as String, optional asynchronious as Boolean = False)
		  if asynchronious then
		    
		    foundSet = nil
		    engine = new JVbackGroundQuery(me, sqlExpressions(baseTableOrView, requests).value("Statement"))
		    engine.bindVariables()
		    engine.backgroundTaskDelegate =  me
		    engine.run
		    
		  else
		    
		    foundSet = selectRecords(baseTableOrView, requests)
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub perFormFindAll(baseTableOrView as String, optional asynchronious as Boolean = False)
		  redim requests (-1)
		  perFormFind(baseTableOrView, asynchronious)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub replaceAll(baseTableOrView as String , newValues as DataBaseRecord)
		  
		  
		  foundset.MoveFirst
		  
		  while not foundSet.EOF
		    
		    editRecord(baseTableOrView, newValues)
		    
		    foundSet.MoveNext
		  wend
		  
		  foundset.MoveFirst
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		#tag Note
			return foundSet
		#tag EndNote
		currentRecord As RecordSet
	#tag EndProperty

	#tag Property, Flags = &h0
		engine As JVbackGroundQuery
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return engine.foundRecords
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFoundSet = value
			End Set
		#tag EndSetter
		foundSet As RecordSet
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mFoundSet As RecordSet
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return engine.foundRecords.RecordCount
			End Get
		#tag EndGetter
		recordCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		requests() As DatabaseRecord
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DatabaseFile"
			Visible=true
			Type="FolderItem"
			EditorType="FolderItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugMode"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EncryptionKey"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
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
			Name="LoadExtensions"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MultiUser"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="recordCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShortColumnNames"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadYieldInterval"
			Visible=true
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Timeout"
			Visible=true
			Type="Double"
			EditorType="Double"
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
