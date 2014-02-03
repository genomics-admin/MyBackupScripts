
; Press Esc to terminate script, Pause/Break to "pause"
Opt("WinTitleMatchMode", 2)
Global $Paused
$i=0
HotKeySet("{PAUSE}", "ShowMessage")
HotKeySet("+!d", "Terminate")
HotKeySet("{ESC}", "TogglePause") ;Shift-Alt-d


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
   TogglePause() ;-select the excel row with the proper name
   Send("^c")
   $str=ClipGet()
   TogglePause()
   $pos = MouseGetPos() ;-keep u'r mouse on the request u wanna modify
   $x=$pos[0]
   $y=$pos[1]
   $x=1299 ;-co ordinate of edit button
   MouseClick("left",$x,$y)
   TogglePause()
   MouseClick("left",86,403) ;- click details
   TogglePause()
   MouseClick("left",412,379) ;- select task name box
   Send("^a")
   Send("{BackSPace}")
   sleep(500)
   MouseClick("left",412,379,2) ;- select task name box
   sleep(500)
   send($str)
   send("{tab}")
   MouseClick("left",430,436,2) ;- select task description box
   Send("^a")
   Send("{BackSPace}")
   sleep(500)
   MouseClick("left",430,436,2) ;- select task description box
   sleep(500)
   send($str)
   MouseClick("left",430,436,2) ;- select task description box
   send("{END}")
   sleep(500)
   send("--Permit.AOD=True")
   TogglePause()
   MouseClick("left",92,468,2) ;-click resources
   MouseClick("left",281,429,2) ;-click advanced
   TogglePause()
   sleep(500)
   send("MachineType")
   Send("{tab 2}")
   sleep(500)
   send("Functional")
   Send("{tab 2}")
   TogglePause()
   send("Hostname")
   Send("{tab 2}")
   sleep(500)
   send("Advanced")
   sleep(500)
   Send("{tab}")
   MouseClick("left",300,367,2) ;-any available resources
   MouseClick("left",300,386,2) ;-any available resources
   MouseClick("left",281,429,2) ;-click advanced
   
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

