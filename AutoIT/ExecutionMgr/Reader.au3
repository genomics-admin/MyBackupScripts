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

$file = FileOpen("test.txt", 9)

If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf




;;;; Body of program would go here ;;;;
While 1
   TogglePause()
   MouseClick("left",68,318)
   TogglePause()
   MouseClick("left",363,298)
   ;TogglePause()
   Sleep(250)
   ClipPut("")
   Sleep(250)
   send("^a")
   Sleep(250)
   send("^c")
   Sleep(250)
   $data1=ClipGet()
   ;TogglePause()
   MouseClick("left",70,343)
   ;TogglePause()
   Sleep(250)
   MouseClick("left",280,419)
   ;TogglePause()
   Sleep(250)
   ClipPut("")
   Sleep(250)
   send("^a")
   Sleep(250)
   send("^c")
   Sleep(250)
   $data2=ClipGet()
   ;TogglePause()
   Sleep(250)
   MouseClick("left",280,446)
   Sleep(250)
   ;TogglePause()
   ClipPut("")
   Sleep(250)
   send("^a")
   Sleep(250)
   send("^c")
   Sleep(250)
   $data3=ClipGet()
   ;TogglePause()
   Sleep(250)
   MouseClick("left",280,477)
   Sleep(250)
   ;TogglePause()
   ClipPut("")
   Sleep(250)
   send("^a")
   Sleep(250)
   send("^c")
   Sleep(250)
   $data4=ClipGet()
   ;TogglePause()
   Sleep(250)
   MouseClick("left",280,505)
   Sleep(250)
   ;TogglePause()
   ClipPut("")
   Sleep(250)
   send("^a")
   Sleep(250)
   send("^c")
   Sleep(250)
   $data5=ClipGet()
   ConsoleWrite($data1&@CRLF&$data2&@CRLF&$data3&@CRLF&$data4&@CRLF&$data5)
   FileWriteLine($file,$data1&";"&$data2&";"&$data3&";"&$data4&";"&$data5)

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
	FileClose($file)
    Exit 0
EndFunc   ;==>Terminate

Func ShowMessage()
    MsgBox(4096, "", "This is a message.")
EndFunc   ;==>ShowMessage
