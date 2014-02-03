#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "TogglePause")
HotKeySet("+!d", "ShowMessage") ;Shift-Alt-d

$file = FileOpen("test.txt", 10)

If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf




;;;; Body of program would go here ;;;;
;While 1

TogglePause()
ClipPut("")
send("^a")
send("^c")
$str = ClipGet()
ConsoleWrite($str)
send($str)
TogglePause()
ClipPut("")

;WEnd
FileClose($file)
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
    MsgBox(4096, "", "This is a message.")
EndFunc   ;==>ShowMessage
