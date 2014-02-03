#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Global $Paused
HotKeySet("{PAUSE}", "Terminate")
HotKeySet("{ESC}", "TogglePause")
HotKeySet("+!d", "ShowMessage") ;Shift-Alt-d

$match="Grower Operations-"
$match1="Grower Operations-IM-"
$match2="Grower Operations-FieldManager-"
$match3="Grower Operations-Field Manager-"
$match4="Grower Operations-Ship Center-"
$match5="GrowerOperations-"
;~ $match="GermplasmAndProductDev-"
$replace=""


;;;; Body of program would go here ;;;;
TogglePause()
$i=0
While ($i < 30)
	TogglePause()
	MouseClick("left",60,318)
	Sleep(250)
	MouseClick("left",358,297)
	Sleep(250)
	Send("^a")
	Sleep(250)
	send("^c")
	Sleep(250)
	$str=ClipGet()
	$str=StringReplace($str,$match1,$replace)
	$str=StringReplace($str,$match2,$replace)
	$str=StringReplace($str,$match3,$replace)
	$str=StringReplace($str,$match4,$replace)
	$str=StringReplace($str,$match5,$replace)
	$str=StringReplace($str,$match,$replace)
	MouseMove(1447,784)
	Send($str)
WEnd

;;;;;;;;;;;;;;;;;;;;;;;;;



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
