#tag Class
Protected Class JVTerminalViewController
Inherits NSViewController
	#tag Method, Flags = &h0
		Sub addToBatch(dosCommand as String)
		  
		  if batch = "" then
		    batch = dosCommand
		  else
		    batch = batch +" && " +dosCommand
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  super.constructor(new JVTerminalView, new Shell)
		  
		  batch = ""
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub execute(DOSCommand As String)
		  // Show each command in the Terminal-view
		  dim seperatedBatchCommands as String  = DOSCommand.Replace(" && ", EndOfLine)
		  dosField.appendText(seperatedBatchCommands)+EndOfLine
		  dosField.ScrollPosition = dosField.LineNumAtCharPos(len(dosField.Text))
		  
		  // When used remotely use WinRS to execute the command
		  if usedRemotely then
		    dim WINRSPrefix as String = "WINRS -r:"+remoteHost+" -u:"+remoteUserName+" -p:"+remotePassword+" "
		    DOSCommand = WINRSPrefix + DOSCommand
		  end if
		  terminal.Execute(DOSCommand)
		  
		  if terminal.ErrorCode <> 0 then
		    dim logger as JVLogViewController = JVBackendViewController.sharedBackendViewController.logController
		    logger.LogAsError("Error executing command: "+ENDOFLINE+DOSCommand+ENDOFLINE+terminal.result)
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onTerminalCompleted(sender as Shell)
		  // Part of the JVTerminalDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onTerminalDataAvailable(sender as Shell)
		  // Part of the JVTerminalDelegate interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewActivate(sender as NSView)
		  // Part of the NSViewDelegate interface.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewClose(sender as NSView)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub runBatch()
		  execute(batch)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private batch As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return TerminalView.DOSfield
			  
			End Get
		#tag EndGetter
		Private dosField As TextArea
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return JVBackendViewController.sharedBackendViewController.terminalController.terminalView
			End Get
		#tag EndGetter
		Shared MainTerminalView As JVTerminalView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if terminal.mode=2  then
			    return JVTerminalMode.Interactive
			  elseif terminal.mode=1 then
			    return JVTerminalMode.Asynchronous
			  else
			    return JVTerminalMode.Synchronous
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value = JVTerminalMode.Interactive then
			    terminal.mode=2
			  elseif value = JVTerminalMode.Asynchronous then
			    terminal.mode=1
			  else
			    terminal.mode=0
			  end if
			End Set
		#tag EndSetter
		mode As JVTerminalMode
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mTerminalDelegate As JVTerminalDelegate
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			the4elements.be
		#tag EndNote
		remoteHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		remotePassword As String
	#tag EndProperty

	#tag Property, Flags = &h0
		remoteUserName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Shell(representedObject)
			End Get
		#tag EndGetter
		terminal As Shell
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTerminalDelegate
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTerminalDelegate = value
			  
			  // redirect all events to the delegate
			  
			  if value <> nil then
			    
			    AddHandler terminal.Completed, AddressOf mterminalDelegate.onTerminalCompleted
			    AddHandler terminal.DataAvailable, AddressOf mterminalDelegate.onTerminalDataAvailable
			    
			  else
			    
			    removeHandler terminal.Completed, AddressOf mterminalDelegate.onTerminalCompleted
			    removeHandler terminal.DataAvailable, AddressOf mterminalDelegate.onTerminalDataAvailable
			    
			  end if
			  
			End Set
		#tag EndSetter
		terminalDelegate As JVTerminalDelegate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return JVTerminalView(view)
			End Get
		#tag EndGetter
		terminalView As JVTerminalView
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return (remotehost <> "")
			End Get
		#tag EndGetter
		Private usedRemotely As Boolean
	#tag EndComputedProperty


	#tag Enum, Name = JVTerminalMode, Type = Integer, Flags = &h0
		Synchronous
		  Asynchronous
		Interactive
	#tag EndEnum


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
			Name="mode"
			Group="Behavior"
			Type="JVTerminalMode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Synchronous"
				"1 - Asynchronous"
				"2 - Interactive"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="remoteHost"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="remotePassword"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="remoteUserName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
