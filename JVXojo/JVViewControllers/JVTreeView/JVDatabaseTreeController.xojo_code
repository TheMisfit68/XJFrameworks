#tag Class
Protected Class JVDatabaseTreeController
Inherits JVTreeController
Implements JVBackgroundTaskDelegate
	#tag Method, Flags = &h0
		Sub constructor(treeView as JVTreeView, backGroundQuery as JVbackGroundQuery, paramarray branchfields as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(treeView, nil)
		  
		  me.branchfields = branchfields
		  
		  me.backGroundQuery = backGroundQuery
		  me.backGroundQuery.backgroundTaskDelegate =  me
		  me.backGroundQuery.run
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editNode(node as NSTreeNode, fieldToChange as Pair)
		  // Part of the JVTreeViewDataSource interface.
		  
		  #if DebugBuild then
		    system.DebugLog("Changing record with keypad "+node.indexString)
		  #Endif
		  
		  dim database as JVFPProxy = JVFPProxy(backGroundQuery.dataBase)
		  dim sqlString as String = backGroundQuery.sqlString
		  dim viewOrTabelName as String =  sqlString.Replace(JVFPProxy.SQLstatementPattern, "$2", True)
		  dim fieldName as String = fieldToChange.Left
		  dim newfieldValue as String = fieldToChange.Right
		  
		  dim primaryKeyValue as Integer = node.finalIndex
		  
		  dim sourceInfo as Dictionary = app.dataModel.aliasSchema.value(viewOrTabelName+"."+fieldName)
		  dim sourceTable as String = sourceInfo.Value("table")
		  dim sourceField as String = sourceInfo.Value("field")
		  dim pkFieldName as String = app.dataModel.pkForTable(sourceTable)
		  
		  dim request as new JVDatabaseRequest
		  request.IntegerColumn(pkFieldName) = primaryKeyValue
		  
		  dim record as new DatabaseRecord
		  record.Column(sourceField) = newfieldValue
		  
		  // Perform the update
		  dataBase.goToLayoutOrView(sourceTable)
		  dataBase.enterMode(JVFPProxy.MODES.Find)
		  dataBase.addRequest(request)
		  dataBase.executeFind
		  
		  call dataBase.editRecord(record)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onTaskFinished(sender as JVBackgroundTask)
		  // Part of the JVBackgroundTaskDelegate interface.
		  dim records as recordSet = backGroundQuery.foundRecords
		  
		  if (records <> nil)  and (records.RecordCount > 0) then
		    
		    arrangedObjects = new NSTreeNode(records, branchfields)
		    syncInterface(True)
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub reloadData(SQLStatement as String)
		  dim previousDataBase as JVSQLiteDatabase = backGroundQuery.database
		  backGroundQuery = new JVbackGroundQuery(previousDataBase, SQLStatement )
		  backGroundQuery.backgroundTaskDelegate = me
		  backGroundQuery.run
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		backGroundQuery As JVbackGroundQuery
	#tag EndProperty

	#tag Property, Flags = &h0
		branchfields() As String
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
