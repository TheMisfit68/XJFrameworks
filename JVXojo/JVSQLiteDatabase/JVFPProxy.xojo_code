#tag Class
Protected Class JVFPProxy
Inherits JVSQLiteDatabase
Implements JVBackgroundTaskDelegate
	#tag Method, Flags = &h0
		Function addRecord(record as DatabaseRecord) As Integer
		  
		  dim affectedPKs() as Integer
		  
		  if currentMode = MODES.Browse then
		    
		    affectedPKs= insertRecords(currentLayout, array(record))
		    
		  end if
		  
		  if affectedPKs.Ubound >=0 then
		    return affectedPKs(0)
		  else
		    return -1
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addRequest(request as JVDatabaseRequest)
		  
		  if currentMode = MODES.Find then
		    
		    requests.Append(request)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteAllRecords(optional withoutDialog as Boolean = False)
		  if currentMode = MODES.Browse then
		    
		    dim okToDelete as Integer = 1
		    if (recordCount > 1) and not withoutDialog then
		      okToDelete = MsgBox("Are you sure you want to delete all "+Str(recordCount)+" records" , 305)
		    end if
		    
		    // If it is  still OK to delete
		    if okToDelete = 1 then
		      
		      for recordNumber as Integer = 0 to recordCount-1
		        deleteRecord(recordNumber)
		      next recordNumber
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteRecord(optional recordNumber as Integer = -1)
		  if currentMode = MODES.Browse then
		    
		    goToRecord(recordNumber)
		    mfoundSet.DeleteRecord
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteRequest(optional requestNumber as Integer = -1)
		  
		  if currentMode = MODES.Find then
		    
		    if requestNumber >=0 then
		      requests.Remove(requestNumber)
		    else
		      // When no number provided just remove the latest one
		      requests.Remove(requests.Ubound)
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function editRecord(newValues as DatabaseRecord) As integer
		  dim affectedPKs() as Integer
		  
		  if currentMode = MODES.Browse then
		    
		    affectedPKs = updateRecords(currentLayout, mfoundSet, newValues)
		    
		  end if
		  
		  if affectedPKs.Ubound >=0 then
		    return affectedPKs(0)
		  else
		    return -1
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enterMode(mode as MODES)
		  
		  
		  Select Case mode
		  Case MODES.Browse
		    //
		  Case MODES.Find
		    ReDim requests (-1)
		  Case MODES.Layout
		    // 
		  End Select
		  
		  currentMode = mode
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub executeFind(optional asynchronious as Boolean = False)
		  if currentMode = MODES.Find then
		    
		    
		    if asynchronious then
		      
		      mfoundSet = nil
		      dim sqlStatement as String = sqlExpressions(currentLayout, requests).value("Statement")
		      engine = new JVbackGroundQuery(me, sqlStatement)
		      engine.bindVariables()
		      engine.backgroundTaskDelegate =  me
		      engine.run
		      
		    else
		      
		      mfoundSet = nil
		      mfoundSet = selectRecords(currentLayout, requests)
		      enterMode(MODES.Browse)
		      goToRecord(1)
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub executeFindAll(optional asynchronious as Boolean = False)
		  
		  // Perform find without any find requests to find all recoxrds in a table
		  enterMode(MODES.Find)
		  executeFind(asynchronious)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function foundSet() As DatabaseRecord()
		  // This method acts as a computed property derived from mfoundSet,
		  // because Xojo doesn't support computed properties of type array
		  
		  dim databaseRecords() as  DatabaseRecord
		  
		  if mfoundSet <> nil then
		    
		    mfoundSet.MoveFirst
		    while not mfoundSet.EOF
		      dim record as new DatabaseRecord
		      
		      for  fieldNumber as Integer =  1 to mfoundSet.FieldCount
		        dim field as DatabaseField = mfoundSet.IdxField(fieldNumber)
		        dim fieldName as String = field.Name
		        dim fieldValue as Variant = field.Value
		        record.Column(fieldName) =  fieldValue
		      next fieldNumber
		      
		      databaseRecords.Append(record)
		      
		      mfoundSet.MoveNext
		    wend
		    
		    mfoundSet.MoveFirst
		    
		  end if 
		  
		  return databaseRecords
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub goToLayoutOrView(baseLayoutOrView as String)
		  currentLayout = baseLayoutOrView
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub goToNextRecord()
		  if currentMode = MODES.browse then
		    
		    if (recordCount > 0) and (currentRecordNumber < recordCount) then
		      mfoundSet.MoveNext
		      currentRecordNumber = currentRecordNumber+1
		    end if
		    
		  end if 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub goToPreviousRecord()
		  if currentMode = MODES.browse then
		    
		    if (recordCount > 0) and (currentRecordNumber > 2) then 
		      mfoundSet.MovePrevious
		      currentRecordNumber = currentRecordNumber-1
		    end if
		    
		  end if 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub goToRecord(optional recordNumber as Integer = -1)
		  if currentMode = MODES.browse then
		    
		    if recordNumber >=0 then
		      
		      if (recordCount > 0) and (recordNumber <= recordCount) then
		        
		        // Browse the recordset in the SQL-backend 
		        mfoundSet.MoveFirst
		        if recordNumber >= 2 then
		          for recordsBrowsed as Integer = 1 to recordNumber-1
		            mfoundSet.MoveNext  // Browse extra records
		          next
		        end if
		        
		        // and the record in the FP-Frontend
		        currentRecordNumber = recordNumber
		      end if
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onTaskFinished(sender as JVBackgroundTask)
		  // Part of the JVBackgroundTaskDelegate interface.
		  
		  mfoundSet = engine.foundRecords
		  enterMode(MODES.Browse)
		  goToRecord(1)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function replaceAll(newValues as DataBaseRecord) As Integer()
		  
		  dim affectedPKs() as Integer = updateRecords(currentLayout, mfoundSet, newValues, True)
		  
		  return affectedPKs
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Class decription
		
		This class is a subclass of the JVSQLiteDatabase-class
		In this way it provides a shell around SQL,
		that allows for a workflow similar to the one used in a FP-database
		
		Essential are
		the mFoundset-private propety, a recordset used for all write-operations to the SQL-background
		the foundSet-method that acts as a computed property that provides a DatabaseRecord() and 
		is used to read and parse the SQL-data on a higher level
	#tag EndNote


	#tag Property, Flags = &h0
		currentLayout As String
	#tag EndProperty

	#tag Property, Flags = &h0
		currentMode As MODES
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  dim allrecords() as DatabaseRecord = foundSet
			  return allrecords(currentRecordNumber-1)
			End Get
		#tag EndGetter
		currentRecord As DatabaseRecord
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		currentRecordNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private engine As JVbackGroundQuery
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mfoundSet As RecordSet
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  if  (mfoundSet <> nil)  and (mfoundSet.RecordCount > 0)  and not (mfoundSet.EOF) then
			    return mfoundSet.RecordCount
			  else
			    return 0
			  end if
			  
			End Get
		#tag EndGetter
		recordCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		requests() As JVDatabaseRequest
	#tag EndProperty


	#tag Enum, Name = MODES, Flags = &h0
		Browse
		  Find
		Layout
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="currentLayout"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentMode"
			Group="Behavior"
			Type="MODES"
			EditorType="Enum"
			#tag EnumValues
				"0 - Browse"
				"1 - Find"
				"2 - Layout"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentRecordNumber"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
