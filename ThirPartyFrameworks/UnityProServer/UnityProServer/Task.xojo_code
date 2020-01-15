#tag Class
Protected Class Task
Inherits COM.IDispatch
	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Comment_Get_Func1(this As Ptr, ByRef pCurrentComment_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Comment_Put_Func1(this As Ptr, rhs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{7AFD0FF3-CCE7-11D4-A254-0006290515BB}" )
		    clsid = COM.IIDFromString( "{3F3C8460-1239-11D5-A249-0006296240B1}" )
		    
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
		Sub Delete()
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Delete_Func0(mThis.Ptr( 0 ).Ptr(15 * COM.SIZEOF_PTR ))
		    Call func.Invoke(mThis)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Delete_Func0(this As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Destructor()
		  #if TargetWin32
		    If ObjectMap <> Nil And ObjectMap.HasKey(Handle) Then ObjectMap.Remove(Handle)
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Export(FileNameToExport_Param As String, ExportOption_Param As Integer)
		  #if TargetWin32
		    If mThis = Nil Then Raise New NilObjectException
		    Dim func As New Export_Func2(mThis.Ptr( 0 ).Ptr(18 * COM.SIZEOF_PTR ))
		    Dim resultCode As Integer
		    Dim Local_FileNameToExport_Param As Ptr
		    Local_FileNameToExport_Param = COM.SysAllocString( FileNameToExport_Param )
		    resultCode = func.Invoke(mThis, Local_FileNameToExport_Param, ExportOption_Param)
		    COM.SysFreeString(Local_FileNameToExport_Param)
		    If resultCode = 0 Then
		    Else // Throw Exception
		      Raise New COM.COMException("Failed on Export", resultCode)
		    End If
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Export_Func2(this As Ptr, FileNameToExport_Param As Ptr, ExportOption_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Id_Get_Func1(this As Ptr, ByRef pCurrentId_Param As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Shared Function IID() As MemoryBlock
		  #if TargetWin32
		    Return COM.IIDFromString("{7AFD0FF3-CCE7-11D4-A254-0006290515BB}")
		  #endif
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Name_Get_Func1(this As Ptr, ByRef pCurrentName_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  #if TargetWin32
		    If rhs.Handle = Nil Then Return
		    Dim p As Ptr
		    If 0 = rhs.QueryInterface( UnityProServer.ITask.IID, p ) Then
		      mThis = p
		    Else
		      Raise New IllegalCastException
		    End If
		  #endif
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Periodicity_Get_Func1(this As Ptr, ByRef pCurrentPeriodicity_Param As epsrPeriodicity) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Periodicity_Put_Func1(this As Ptr, rhs_Param As epsrPeriodicity) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Sections_Get_Func1(this As Ptr, ByRef ppSections_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Srs_Get_Func1(this As Ptr, ByRef ppSrs_Param As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function WatchDog_Get_Func1(this As Ptr, ByRef pCurrentWatchDogType_Param As Int16) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function WatchDog_Put_Func1(this As Ptr, rhs_Param As Int16) As Integer
	#tag EndDelegateDeclaration


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pCurrentComment_Param As Ptr
			    Dim func As New Comment_Get_Func1( mThis.Ptr( 0 ).Ptr( 8 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pCurrentComment_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( pCurrentComment_Param )
			    Else
			      Raise New COM.COMException("Failed on Comment", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim func As New Comment_Put_Func1( mThis.Ptr( 0 ).Ptr( 9 * COM.SIZEOF_PTR ) )
			    Dim Local_rhs_Param As Ptr
			    Local_rhs_Param = COM.SysAllocString( value )
			    Dim resultCode As Integer = func.Invoke( mThis, Local_rhs_Param)
			    If 0 = resultCode Then
			    Else
			      Raise New COM.COMException("Failed on Comment", resultCode )
			    End If
			    COM.SysFreeString( Local_rhs_Param )
			  #endif
			  
			End Set
		#tag EndSetter
		Comment As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pCurrentId_Param As Integer
			    Dim func As New Id_Get_Func1( mThis.Ptr( 0 ).Ptr( 10 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pCurrentId_Param )
			    If 0 = resultCode Then
			      Return pCurrentId_Param
			    Else
			      Raise New COM.COMException("Failed on Id", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mCookie As UInt32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPtrToVTable As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mVTable As MemoryBlock
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pCurrentName_Param As Ptr
			    Dim func As New Name_Get_Func1( mThis.Ptr( 0 ).Ptr( 7 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pCurrentName_Param )
			    If 0 = resultCode Then
			      Return COM.BSTRToRBString( pCurrentName_Param )
			    Else
			      Raise New COM.COMException("Failed on Name", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Shared ObjectMap As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pCurrentPeriodicity_Param As epsrPeriodicity
			    Dim func As New Periodicity_Get_Func1( mThis.Ptr( 0 ).Ptr( 11 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pCurrentPeriodicity_Param )
			    If 0 = resultCode Then
			      Return pCurrentPeriodicity_Param
			    Else
			      Raise New COM.COMException("Failed on Periodicity", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim func As New Periodicity_Put_Func1( mThis.Ptr( 0 ).Ptr( 12 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, value )
			    If 0 = resultCode Then
			    Else
			      Raise New COM.COMException("Failed on Periodicity", resultCode )
			    End If
			    
			  #endif
			End Set
		#tag EndSetter
		Periodicity As epsrPeriodicity
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim ppSections_Param As Ptr
			    Dim func As New Sections_Get_Func1( mThis.Ptr( 0 ).Ptr( 16 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, ppSections_Param )
			    If 0 = resultCode Then
			      If Nil <> ppSections_Param Then
			        Return New UnityProServer.ISections( ppSections_Param )
			      End If
			    Else
			      Raise New COM.COMException("Failed on Sections", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Sections As UnityProServer.ISections
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim ppSrs_Param As Ptr
			    Dim func As New Srs_Get_Func1( mThis.Ptr( 0 ).Ptr( 17 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, ppSrs_Param )
			    If 0 = resultCode Then
			      If Nil <> ppSrs_Param Then
			        Return New UnityProServer.ISrs( ppSrs_Param )
			      End If
			    Else
			      Raise New COM.COMException("Failed on Srs", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		Srs As UnityProServer.ISrs
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim pCurrentWatchDogType_Param As Int16
			    Dim func As New WatchDog_Get_Func1( mThis.Ptr( 0 ).Ptr( 13 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, pCurrentWatchDogType_Param )
			    If 0 = resultCode Then
			      Return pCurrentWatchDogType_Param
			    Else
			      Raise New COM.COMException("Failed on WatchDog", resultCode )
			    End If
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if TargetWindows
			    If mThis = Nil Then Raise New NilObjectException
			    Dim func As New WatchDog_Put_Func1( mThis.Ptr( 0 ).Ptr( 14 * COM.SIZEOF_PTR ) )
			    Dim resultCode As Integer = func.Invoke( mThis, value )
			    If 0 = resultCode Then
			    Else
			      Raise New COM.COMException("Failed on WatchDog", resultCode )
			    End If
			    
			  #endif
			End Set
		#tag EndSetter
		WatchDog As Int16
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
		#tag ViewProperty
			Name="Comment"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Id"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Periodicity"
			Group="Behavior"
			Type="epsrPeriodicity"
			EditorType="Enum"
			#tag EnumValues
				"13792480017252352 - PSR_PERIODIC"
				"29555198972133376 - PSR_CYCLIC"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="WatchDog"
			Group="Behavior"
			Type="Int16"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
