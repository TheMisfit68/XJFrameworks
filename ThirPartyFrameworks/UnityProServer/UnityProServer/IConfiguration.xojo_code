#tag Class
Protected Class IConfiguration
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub Change(NewPartNumber_Param As String, NewVersion_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Change_Func2(mThis.Ptr( 0 ).Ptr(40 ))
		  Dim resultCode As Integer
		  Dim Local_NewPartNumber_Param As Ptr
		  Local_NewPartNumber_Param = COM.SysAllocString( NewPartNumber_Param )
		  Dim Local_NewVersion_Param As Ptr
		  Local_NewVersion_Param = COM.SysAllocString( NewVersion_Param )
		  resultCode = func.Invoke(mThis, Local_NewPartNumber_Param, Local_NewVersion_Param)
		  COM.SysFreeString(Local_NewPartNumber_Param)
		  COM.SysFreeString(Local_NewVersion_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Change", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Change_Func2(this As Ptr, NewPartNumber_Param As Ptr, NewVersion_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  // This class is not instantiable
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Cpu_Get_Func1(this As Ptr, ByRef ppCpu_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Export(FileNameToExport_Param As String, ExportOption_Param As Integer = 0)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Export_Func2(mThis.Ptr( 0 ).Ptr(32 ))
		  Dim resultCode As Integer
		  Dim Local_FileNameToExport_Param As Ptr
		  Local_FileNameToExport_Param = COM.SysAllocString( FileNameToExport_Param )
		  resultCode = func.Invoke(mThis, Local_FileNameToExport_Param, ExportOption_Param)
		  COM.SysFreeString(Local_FileNameToExport_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Export", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Export_Func2(this As Ptr, FileNameToExport_Param As Ptr, ExportOption_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{D07185B1-00D0-11D5-A242-0006296240B1}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Import(FileNameToImport_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Import_Func1(mThis.Ptr( 0 ).Ptr(28 ))
		  Dim resultCode As Integer
		  Dim Local_FileNameToImport_Param As Ptr
		  Local_FileNameToImport_Param = COM.SysAllocString( FileNameToImport_Param )
		  resultCode = func.Invoke(mThis, Local_FileNameToImport_Param)
		  COM.SysFreeString(Local_FileNameToImport_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on Import", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Import_Func1(this As Ptr, FileNameToImport_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IConfiguration.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim ppCpu_Param As Ptr
			  Dim func As New Cpu_Get_Func1( mThis.Ptr( 0 ).Ptr( 36 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, ppCpu_Param )
			  If 0 = resultCode Then
			    If Nil <> ppCpu_Param Then
			      Return New UnityProServer.ICpu( ppCpu_Param )
			    End If
			  Else
			    Raise New COM.COMException("Failed on Cpu", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Cpu As UnityProServer.ICpu
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
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
