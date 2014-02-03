#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Sandeep laik

 Script Function:
	Modified Copy Paste

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Global $Paused
HotKeySet("{ESC}", "TogglePause")
HotKeySet("^1", "CopyMsg")
HotKeySet("^2", "CleanPaste")

While 1
    Sleep(100)

WEnd

Func TogglePause()
    $Paused = Not $Paused
    While $Paused
        Sleep(100)
        ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ToolTip("")
EndFunc

Func CopyMsg()
	Send("^a")
	Send("^c")

EndFunc

Func CleanPaste()
	Send("^a")
	Send("^v")
EndFunc

