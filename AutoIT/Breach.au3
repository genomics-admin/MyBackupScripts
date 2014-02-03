Global $Paused
HotKeySet("{ESC}", "TogglePause")
HotKeySet("{PAUSE}", "Terminate")
HotKeySet("+!d", "ShowMessage") ;Shift-Alt-d

;;;; Body of program would go here ;;;;
While 1
    Sleep(100)
WEnd
;;;;;;;;

Func TogglePause()
    $Paused = Not $Paused
    While $Paused
        Sleep(100)
        ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ToolTip("")
EndFunc   ;==>TogglePause

Func Terminate()
    Exit 0
EndFunc   ;==>Terminate

Func ShowMessage()
	$i=0
	while $i<=100
    TogglePause()
	MouseClick("left",1121,258)

    TogglePause()
	MouseClick("left",1060,446)
	WEnd
EndFunc   ;==>ShowMessage

