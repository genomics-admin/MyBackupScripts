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

$file = FileOpen("test.txt", 0)

If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

; 1600X900 - 75% - IE
;side co-ord and gap, save n close, then details 1 coords and the gap, process 1 co-ord and the gap, resources 5 co-ords
;$coordinates="60,318,24,1447,784,358,297,30,270,300,30,pst,210,292,337,377,400,500"
$coordinates="60,318,24,1447,784,358,297,30,270,300,30,tst,210,292,337,377,400,500"
$coords = StringSplit($coordinates,",",2)

;;;; Body of program would go here ;;;;
TogglePause()
While 1
    $chars = FileReadLine($file)
    If @error = -1 Then ExitLoop
    ;MsgBox(0, "Char read:", $chars)
	$data = StringSplit($chars,";",2)

	;new task
	MouseClick("left",290,630)
	TogglePause()
	setdata1($data[0],$coords[0],$coords[1],$coords[5],$coords[6],$coords[7])
	TogglePause()
	setdata2($data[1],$data[2],$data[3],$data[4],$coords[0],$coords[1],$coords[2],$coords[8],$coords[9],$coords[10],$coords[11],$coords[3],$coords[4])
	TogglePause()
;~ 	setdata3($coords[0],$coords[1],$coords[2],$coords[3],$coords[4],$coords[12],$coords[13],$coords[14],$coords[15],$coords[16],$coords[17])
;~ 	TogglePause()
WEnd





;;;;;;;;;;;;;;;;;;;;;;;;;


func setdata1($str,$x1,$y1,$x2,$y2,$gap)
	;ConsoleWrite($str&@CRLF&$x1&@CRLF&$y1&@CRLF&$x2&@CRLF&$y2&@CRLF&$gap@CRLF)
	;TogglePause()
	MouseClick("left",$x1,$y1)
	Sleep(250)
	MouseClick("left",$x2,$y2)
	Sleep(250)
	Send("^a")
	Send($str)
	Sleep(250)
	MouseClick("left",$x2,$y2+$gap)
	Sleep(250)
	Send("^a")
	Send($str)
	send(" -Permit.AOD=False")
	Sleep(250)


	;TogglePause()
EndFunc

func setdata2($str1,$str2,$str3,$str4,$x1,$y1,$gap1,$x2,$y2,$gap2,$testpst,$x3,$y3)

	;TogglePause()
	MouseClick("left",$x1,$y1+$gap1)
	Sleep(250)

	MouseClick("left",$x2,$y2)
		Sleep(250)
	if $testpst="tst" Then
		MouseClick("left",$x2,$y2+20,2)
	ElseIf $testpst="pst" Then
		MouseClick("left",$x2,$y2+60,2)
	EndIf

	;TogglePause()
	Sleep(250)
	MouseClick("left",$x2,$y2+$gap2)
	Sleep(250)
	Send("{a}{d}{m}{i}{n}")

	;TogglePause()
	Sleep(250)
	MouseClick("left",$x2,$y2+($gap2*2))
	Sleep(250)
	Send("{s}{c}{o}{o}{b}{y}")

	Sleep(250)
	Sleep(1000)
	MouseClick("left",$x2,$y2+($gap2*3))
	Sleep(250)
	Sleep(1000)
	MouseClick("left",$x2,$y2+20+($gap2*3),2)

	Sleep(250)
	MouseClick("left",$x2,$y2+($gap2*4))
	Sleep(250)
	Send("^a")
	Send($str1)

	Sleep(250)
	MouseClick("left",$x2,$y2+($gap2*5))
	Sleep(250)
	Send("^a")
	Send($str2)

	Sleep(250)
	MouseClick("left",$x2,$y2+($gap2*6))
	Sleep(250)
	Send("^a")
	Send($str3)

	Sleep(250)
	MouseClick("left",$x2,$y2+($gap2*7))
	Sleep(250)
	Send("^a")
	Send($str4)

	Sleep(250)
	MouseClick("left",$x2,$y2+($gap2*8))
	Sleep(250)
	MouseClick("left",$x2,$y2+40+($gap2*8))

	Sleep(250)
	MouseClick("left",$x2,$y2+($gap2*9))
	Sleep(250)
	MouseClick("left",$x2,$y2+20+($gap2*9))

	Sleep(250)
	MouseClick("left",$x2,$y2+($gap2*10))
	Sleep(250)
	MouseClick("left",$x2,$y2+80+($gap2*10))

	Sleep(250)
	MouseClick("left",$x3,$y3)

	;TogglePause()

EndFunc



Func setdata3($x1,$y1,$gap,$x2,$y2,$x3,$y3,$y4,$y5,$y6,$y7)

	;TogglePause()
	Sleep(250)
	MouseClick("left",$x1,$y1+($gap*2))


	Sleep(250)
	MouseClick("left",$x3,$y4)
	Sleep(250)
	MouseClick("left",$x3,$y7)
	Sleep(250)
	MouseClick("left",$x3,$y5,2)
	Sleep(250)
	Send("{tab 4}")
	Sleep(250)
	send("MachineType")
	Sleep(250)
	Send("{tab 2}")
	Sleep(250)
	send("Functional")
	Sleep(250)
	Send("{tab}")
	Sleep(250)
	MouseClick("left",$x3,$y3)
	Sleep(250)
	MouseClick("left",$x3,$y4)
	Sleep(250)
	MouseClick("left",$x2,$y2)


EndFunc











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
	FileClose($file)
    Exit 0
EndFunc   ;==>Terminate

Func ShowMessage()
    MsgBox(4096, "", "This is a message.")
EndFunc   ;==>ShowMessage
