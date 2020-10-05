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
		Function constrainFoundset(extraRequests() as JVDatabaseRequest) As DatabaseRecord()
		  
		  // Inject the extra requests into the existing requests and copy them to a backup-array while doing so
		  
		  dim newRequests() as JVDatabaseRequest
		  
		  for each extraRequest as databaseRecord in extraRequests
		    
		    for fieldNumber as Integer = 0 to extraRequest.FieldCount-1
		      dim fieldName as String = extraRequest.FieldName(fieldNumber)
		      dim fieldValue as Variant = extraRequest.Column(fieldName)
		      
		      for each existingRequest as JVDatabaseRequest in requests
		        
		        newRequests.Append(existingRequest)
		        existingRequest.Column(fieldname) = fieldValue
		        
		      next existingRequest
		      
		    next fieldNumber
		    
		  next extraRequest
		  
		  
		  // Then use the new requests to perform a new find
		  
		  enterMode(MODES.find)
		  requests = newRequests
		  
		  executeFind
		  
		  return foundset
		  
		  
		End Function
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
		      
		      goToRecord(1)
		      for recordNumber as Integer = 1 to recordCount
		        deleteRecord()
		      next recordNumber
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteRecord()
		  if currentMode = MODES.Browse then
		    
		    foundset.Remove(currentRecordNumber-1)
		    mfoundSet.DeleteRecord
		    
		    If Error Then
		      MsgBox("DB Error: " + ErrorMessage)
		    End If
		    
		    Commit
		    
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
		    
		    JVDebugger.debuglog("Changing fields: "+EndOfLine+newValues.description)
		    
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
		Function extendFoundSet(extraRequests() as JVDatabaseRequest) As DatabaseRecord()
		  // add the extra requests to the existing requests and copy them to a new-array while doing so
		  
		  dim newRequests() as JVDatabaseRequest
		  
		  for each existingRequest as JVDatabaseRequest in requests
		    
		    newRequests.Append(existingRequest)
		    
		  next existingRequest
		  
		  for each extraRequest as JVDatabaseRequest in extraRequests
		    
		    newRequests.Append(extraRequest)
		    
		  next extraRequest
		  
		  // Then use the new requests to perform a new find
		  
		  enterMode(MODES.find)
		  requests = newRequests
		  
		  executeFind
		  
		  return foundset
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub findAndGotoRelatedRecords(relationship as String)
		  
		  dim remainingTables() as String = relationship.Split(".")
		  
		  // If there are related tables left to process then do so
		  if remainingTables.ubound >= 1 then
		    
		    // Get both tables from the relationship and adjust the relationship one level down
		    dim parentTable As String = remainingTables(0)
		    dim primaryKey as String = pkForTable(parentTable)
		    
		    dim childTable As String = remainingTables(1)
		    dim foreignKey as String = fkForRelationship(parentTable : childTable)
		    
		    remainingTables.Remove(0)
		    
		    // Find the FK's in the related table 
		    goToLayoutOrView(childTable)
		    enterMode(MODES.Find)
		    for each record as DatabaseRecord in foundset
		      dim request as new JVDatabaseRequest
		      request.IntegerColumn(foreignKey) = record.IntegerColumn(primaryKey)
		      addRequest(request)
		    next record
		    executeFind
		    
		    //Try to process the next level using recursion
		    dim remainingRelationship as String = join(remainingTables, ".")
		    findAndGotoRelatedRecords(remainingRelationship)
		    
		  elseif remainingTables.ubound = 0 then
		    
		    // otherwise end-recursion with the current foundset using the last table as the final layout 
		    dim finalLayout as String=  remainingTables(0)
		    goToLayoutOrView(finalLayout)
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findRecordwithPK(lookupTable as String, pk as Integer) As DatabaseRecord
		  
		  goToLayoutOrView(lookupTable)
		  dim pkfield as String= pkForTable(lookupTable)
		  
		  dim request as new JVDatabaseRequest
		  request.IntegerColumn(pkfield) = pk
		  
		  enterMode(JVFPProxy.MODES.Find)
		  addRequest(request)
		  executeFind
		  
		  if recordCount > 0 then
		    return currentRecord
		  else
		    return nil
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function foundset() As DatabaseRecord()
		  // This method acts as a computed property derived from mfoundSet,
		  // because Xojo doesn't support computed properties of type array
		  
		  dim databaseRecords() as  DatabaseRecord
		  
		  if (mfoundSet <> nil) and (mfoundSet.RecordCount > 0) then
		    
		    mfoundSet.MoveFirst
		    while not mfoundSet.EOF
		      dim record as new DatabaseRecord
		      
		      for  fieldNumber as Integer =  1 to mfoundSet.FieldCount
		        dim field as DatabaseField = mfoundSet.IdxField(fieldNumber)
		        dim fieldName as String = field.Name
		        dim fieldValue as Variant = field.Value
		        
		        // Do not include unfilled fields 
		        // beacause they wil get a defaultvalue when copied from the recordset to a DatabaseRecord
		        // (nil doesn't exist in a DatabaseRecord)
		        // this will produce unwanted changes when de DatabaseRecord-class is used to edit a recordset
		        if fieldValue <> nil then 
		          record.nilableColumn(fieldName) =  fieldValue
		        end if
		        
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
		Sub foundset(assigns records as recordset)
		  
		  // This method allows a regular SQLite.Recordset to be used by JVFPProxy for easier processing
		  mfoundSet = records
		  
		End Sub
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
		    
		    if (recordCount > 0) and (currentRecordNumber > 1) then
		      mfoundSet.MovePrevious
		      currentRecordNumber = currentRecordNumber-1
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub goToRecord(optional recordNumber as Integer = -1)
		  if currentMode = MODES.browse then
		    
		    if (recordCount > 0) and (recordNumber >= 1) and (recordNumber <= recordCount) then
		      
		      if currentRecordNumber > recordNumber then
		        while(currentRecordNumber > recordNumber)
		          goToPreviousRecord
		        wend
		      end if
		      
		      if currentRecordNumber < recordNumber then
		        while(currentRecordNumber < recordNumber)
		          goToNextRecord
		        wend
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
		Sub onTaskStarting(sender as JVBackgroundTask)
		  // Part of the JVBackgroundTaskDelegate interface.
		  
		  
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

	#tag Property, Flags = &h0
		mfoundSet As RecordSet
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  if  (mfoundSet <> nil)  then
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
			Name="DatabaseName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Error"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorCode"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Host"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LibraryVersion"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
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
