#tag Class
Protected Class JVTerminal
Inherits Shell
	#tag Method, Flags = &h21
		Private Shared Sub executeWithUAC(dosCommand As String,)
		  
		  // Split the program and its arguments first
		  dim components() as String = split(dosCommand, " ")
		  dim program as String = components(0)
		  components.Remove(0)
		  dim args As String  = Join(components, " ")
		  
		  
		  // Third party code to run doscommand with admin-priveleges
		  dim f As FolderItem
		  dim t As TextOutputStream
		  dim script As String = "Set objShell = CreateObject(""Shell.Application"")" + EndOfLine _
		  + "objShell.ShellExecute ""<Program>"", ""<Args>"", """", ""runas"", 1" + EndOfLine
		  
		  dim s As String
		  f = GetTemporaryFolderItem
		  f = New FolderItem(f.NativePath + ".vbs")
		  t = TextOutputStream.Create(f)
		  s = script.ReplaceAll("<Program>", program)
		  s = s.ReplaceAll("<Args>", ReplaceAll(args, Chr(34), Chr(34) + Chr(34)))
		  t.WriteLine(s)
		  t.Close
		  
		  dim sh As New Shell
		  sh.Mode = 0
		  sh.TimeOut = 10000
		  sh.Execute("Wscript.exe " + f.NativePath)
		  f.delete
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
