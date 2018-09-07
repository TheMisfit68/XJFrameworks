#tag Class
Protected Class Project
Inherits UnityProServer.IProject
	#tag Method, Flags = &h0
		Sub Constructor(connectEvents As Boolean = False)
		  #if TargetWin32
		    Dim clsid As MemoryBlock
		    Dim riid As MemoryBlock
		    
		    riid = COM.IIDFromString( "{EFEBB186-AEAE-4E74-BEDC-51F40DAA26B4}" )
		    clsid = COM.IIDFromString( "{06BEE8ED-42B8-11D4-A1E9-000629A2F326}" )
		    
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
		Shared Function IID() As MemoryBlock
		  Return COM.IIDFromString("{EFEBB186-AEAE-4E74-BEDC-51F40DAA26B4}")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(rhs As COM.IUnknown)
		  If rhs.Handle = Nil Then Return
		  Dim p As Ptr
		  If 0 = rhs.QueryInterface( UnityProServer.IProject2.IID, p ) Then
		    mThis = p
		  Else
		    Raise New IllegalCastException
		  End If
		End Sub
	#tag EndMethod


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


	#tag ViewBehavior
		#tag ViewProperty
			Name="Comment"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasProjectFileName"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Id"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InfoBuildState"
			Group="Behavior"
			Type="epsrBuildState"
			EditorType="Enum"
			#tag EnumValues
				"0 - psrBuildStateNotBuilt"
				"1 - psrBuildStateBuiltOk"
				"2 - psrBuildStateAnalyzed"
				"3 - psrBuildStateUnknown"
			#tag EndEnumValues
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
			Name="PrivateInfo"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProjectFileName"
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
