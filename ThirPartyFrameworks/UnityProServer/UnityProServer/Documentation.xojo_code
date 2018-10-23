#tag Class
Protected Class Documentation
Inherits COM.IDispatch
	#tag Method, Flags = &h0
		Sub CloseEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditor_Func0(mThis.Ptr( 0 ).Ptr(40 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CloseEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New CloseEditorControl_Func1(mThis.Ptr( 0 ).Ptr(56 ))
		  Dim resultCode As Integer
		  Dim Local_bstrHMIRWPasswrd_Param As Ptr
		  Local_bstrHMIRWPasswrd_Param = COM.SysAllocString( bstrHMIRWPasswrd_Param )
		  resultCode = func.Invoke(mThis, Local_bstrHMIRWPasswrd_Param)
		  COM.SysFreeString(Local_bstrHMIRWPasswrd_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on CloseEditorControl", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CloseEditorControl_Func1(this As Ptr, bstrHMIRWPasswrd_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function CloseEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{7CE218B2-21E4-11D5-B23C-0002553484A6}" )
		    clsid = COM.IIDFromString( "{7CE218B1-21E4-11D5-B23C-0002553484A6}" )
		    
		    Dim p As Ptr
		    If COM.CoCreateInstance( clsid, nil, COM.CLSCTX_INPROC_SERVER or COM.CLSCTX_LOCAL_SERVER, riid, p ) = 0 then
		      If ObjectMap = Nil Then ObjectMap = New Dictionary
		      Super.Constructor( p )
		      If Not connectEvents Then Return
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If ObjectMap <> Nil And ObjectMap.HasKey(Handle) Then ObjectMap.Remove(Handle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditor()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditor_Func0(mThis.Ptr( 0 ).Ptr(36 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayEditorControl(bstrHMIRWPasswrd_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New DisplayEditorControl_Func1(mThis.Ptr( 0 ).Ptr(52 ))
		  Dim resultCode As Integer
		  Dim Local_bstrHMIRWPasswrd_Param As Ptr
		  Local_bstrHMIRWPasswrd_Param = COM.SysAllocString( bstrHMIRWPasswrd_Param )
		  resultCode = func.Invoke(mThis, Local_bstrHMIRWPasswrd_Param)
		  COM.SysFreeString(Local_bstrHMIRWPasswrd_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on DisplayEditorControl", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayEditorControl_Func1(this As Ptr, bstrHMIRWPasswrd_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function DisplayEditor_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Generate()
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New Generate_Func0(mThis.Ptr( 0 ).Ptr(28 ))
		  Call func.Invoke(mThis)
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Generate_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{7CE218B2-21E4-11D5-B23C-0002553484A6}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IDocumentation.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Printer_Get_Func1(this As Ptr, ByRef Printer_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub SelectPrinter(Printer_Param As String)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New SelectPrinter_Func1(mThis.Ptr( 0 ).Ptr(44 ))
		  Dim resultCode As Integer
		  Dim Local_Printer_Param As Ptr
		  Local_Printer_Param = COM.SysAllocString( Printer_Param )
		  resultCode = func.Invoke(mThis, Local_Printer_Param)
		  COM.SysFreeString(Local_Printer_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on SelectPrinter", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function SelectPrinter_Func1(this As Ptr, Printer_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub StartPrint(BeginPage_Param As Integer = 0, EndPage_Param As Integer = 0)
		  If mThis = Nil Then Raise New NilObjectException
		  Dim func As New StartPrint_Func2(mThis.Ptr( 0 ).Ptr(32 ))
		  Dim resultCode As Integer
		  resultCode = func.Invoke(mThis, BeginPage_Param, EndPage_Param)
		  If resultCode = 0 Then
		  Else // Throw Exception
		    Raise New COM.COMException("Failed on StartPrint", resultCode)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function StartPrint_Func2(this As Ptr, BeginPage_Param As Integer, EndPage_Param As Integer) As Integer
	#tag EndDelegateDeclaration


	#tag Property, Flags = &h1
		Protected mCookie As UInt32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPtrToVTable As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mVTable As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared ObjectMap As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mThis = Nil Then Raise New NilObjectException
			  Dim Printer_Param As Ptr
			  Dim func As New Printer_Get_Func1( mThis.Ptr( 0 ).Ptr( 48 ) )
			  Dim resultCode As Integer = func.Invoke( mThis, Printer_Param )
			  If 0 = resultCode Then
			    Return COM.BSTRToRBString( Printer_Param )
			  Else
			    Raise New COM.COMException("Failed on Printer", resultCode )
			  End If
			  
			End Get
		#tag EndGetter
		Printer As String
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
			Name="Printer"
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
