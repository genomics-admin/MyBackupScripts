
; Press Esc to terminate script, Pause/Break to "pause"

Global $Paused
$i=0
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("+!d", "Terminate")
HotKeySet("{ESC}", "ShowMessage") ;Shift-Alt-d

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
   send("{TAB}")
   Sleep(500)
   Send("^c")
   Sleep(500)
   $str=ClipGet()
   Sleep(500)
   $str=StringReplace($str,"ASM-Default Config WorkFlow","Utility Processes")
   Sleep(500)
   Send($str)
   Sleep(500)
   send("{TAB}")
   Sleep(500)
   ClipPut("")
   Sleep(500)
   TogglePause()
EndFunc

;~ Func ShowMessage()
;~    if $i=0 Then
;~     Send("-Permit.AOD=True")
;~ 	$i=$i+1
;~ 	TogglePause()
;~    ElseIf $i=1 Then
;~ 	Send("MachineType")
;~ 	$i=$i+1
;~ 	TogglePause()
;~    ElseIf $i=2 Then
;~ 	Send("Functional")
;~ 	$i=0
;~ 	TogglePause()
;~  EndIf
;~ EndFunc   ;==>ShowMessage

