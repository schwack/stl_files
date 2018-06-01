
#z::
Loop, read, D:\stl_files\g.txt
{
	IfWinExist, ModuleWorks STL View
	{
		WinClose ModuleWorks STL View
		Sleep 500
	}
Run C:\Users\nunya\Downloads\STLView\STLView.exe %A_LoopReadLine%
Sleep 1320
WinWait, ModuleWorks STL View,, 4
Sleep 300
Send {F11}
Sleep 50
WinClose ModuleWorks STL View
}
MsgBox Finished
Return

