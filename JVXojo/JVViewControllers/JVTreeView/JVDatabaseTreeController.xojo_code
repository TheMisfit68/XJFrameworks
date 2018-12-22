#tag Class
Protected Class JVDatabaseTreeController
Inherits JVTreeController
Implements JVBackgroundTaskDelegate
	#tag Method, Flags = &h0
		Sub constructor(treeView as JVTreeView, backGroundQuery as JVbackGroundQuery)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(treeView, nil)
		  
		  me.backGroundQuery = backGroundQuery
		  me.backGroundQuery.backgroundTaskDelegate =  me
		  me.backGroundQuery.run
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteNode(node as NSTreeNode)
		  // Part of the JVTreeViewDataSource interface.
		  
		  JVDebugger.debuglog("Delete node "+node.keyPathString+" @ indexpath "+node.indexPathString)
		  
		  // Find the right sourcetable, sourceField and name of the PK-field
		  dim database as JVFPProxy = JVFPProxy(backGroundQuery.dataBase)
		  dim sqlString as String = backGroundQuery.sqlString
		  dim viewOrTabelName as String =  sqlString.Replace(JVFPProxy.SQLstatementPattern, "$2", True)
		  
		  dim recordValues as DatabaseRecord = node.representedObject
		  dim fieldName as String = recordValues.FieldName(0)
		  dim newfieldValue as String = recordValues.Column(fieldName)
		  
		  dim sourceInfo as Dictionary = app.dataModel.aliasSchema.value(viewOrTabelName+"."+fieldName)
		  dim sourceTable as String = sourceInfo.Value("table")
		  dim sourceField as String = sourceInfo.Value("field")
		  dim pkFieldName as String = app.dataModel.pkForTable(sourceTable)
		  
		  // Find the record with the right PK in the right sourcetable
		  dataBase.goToLayoutOrView(sourceTable)
		  dataBase.enterMode(JVFPProxy.MODES.Find)
		  dim request as new JVDatabaseRequest
		  dim primaryKeyValue as Integer = node.finalKey
		  request.IntegerColumn(pkFieldName) = primaryKeyValue
		  dataBase.addRequest(request)
		  dataBase.executeFind
		  
		  // And delete it
		  dataBase.deleteAllRecords
		  
		  reloadData
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub editNode(node as NSTreeNode, fieldToChange as Pair)
		  // Part of the JVTreeViewDataSource interface.
		  
		  JVDebugger.debuglog("Changing node "+node.keyPathString+" @ indexpath "+node.indexPathString)
		  
		  // Find the right sourcetable, sourceField and name of the PK-field
		  dim database as JVFPProxy = JVFPProxy(backGroundQuery.dataBase)
		  dim sqlString as String = backGroundQuery.sqlString
		  dim viewOrTabelName as String =  sqlString.Replace(JVFPProxy.SQLstatementPattern, "$2", True)
		  dim fieldName as String = fieldToChange.Left
		  dim newfieldValue as String = fieldToChange.Right
		  
		  dim sourceInfo as Dictionary = app.dataModel.aliasSchema.value(viewOrTabelName+"."+fieldName)
		  dim sourceTable as String = sourceInfo.Value("table")
		  dim sourceField as String = sourceInfo.Value("field")
		  dim pkFieldName as String = app.dataModel.pkForTable(sourceTable)
		  
		  // And perform the update
		  dim recordtoChange as DatabaseRecord = database.findRecordwithPK(sourceTable, node.finalKey)
		  if recordtoChange <> nil then
		    dim record as new DatabaseRecord
		    record.Column(sourceField) = newfieldValue
		    call dataBase.editRecord(record)
		    
		    reloadData
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onTaskFinished(sender as JVBackgroundTask)
		  // Part of the JVBackgroundTaskDelegate interface.
		  
		  arrangedObjects = JVbackGroundQuery(sender).treenNode
		  
		  syncInterface(True)
		  reloadBusy = False
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onTaskStarting(sender as JVBackgroundTask)
		  // Part of the JVBackgroundTaskDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function pathForRow(row as Integer) As String
		  
		  if (row >= 0) and (row < treeView.ListCount) then
		    dim node as NSTreeNode = treeView.rowTag(row)
		    return node.keyPathString
		  else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub reloadData(optional SQLStatement as String = "")
		  reloadBusy = True
		  if SQLStatement <> "" then
		    dim previousDataBase as JVSQLiteDatabase = backGroundQuery.database
		    backGroundQuery = new JVbackGroundQuery(previousDataBase, SQLStatement )
		  end if
		  backGroundQuery.backgroundTaskDelegate = me
		  backGroundQuery.run
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function selectedKey(level as Integer) As Integer
		  if (selectedNode <> nil)  and (level<= selectedNode.keyPath.ubound) then
		    return selectedNode.keyPath(level)
		  else
		    return -1
		  end if
		End Function
	#tag EndMethod


	#tag Note, Name = Class Description
		
		JVDatabaseTreeController is class that handles a JVTreeView (a.k.a a hiërchical listbox) on behalf of a viewcontroller.
		its datasource is an SQL(ite) dbase
		
	#tag EndNote


	#tag Property, Flags = &h0
		backGroundQuery As JVbackGroundQuery
	#tag EndProperty

	#tag Property, Flags = &h0
		reloadBusy As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="destinationRow"
			Group="Behavior"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="reloadBusy"
			Group="Behavior"
			Type="Boolean"
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
