#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
;~ while 1
;~ Sleep(5000)
;~ MsgBox(0,"MSG","Alive 1")
;~ kill("AutoIt3.exe")
;~ MsgBox(0,"MSG","Alive 2")
;~ Sleep(3000)
;~ WEnd


Local $file = FileOpen(@ScriptDir&"\Process.txt", 0)

; Check if file opened for reading OK
If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

; Read in lines of text until the EOF is reached
While 1
    Local $line = FileReadLine($file)
    If @error = -1 Then ExitLoop
    ;MsgBox(0, "Line read:", $line)
	while ProcessExists($line)
	kill($line)
	WEnd
WEnd

FileClose($file)



Func kill($line)
if ProcessExists($line) Then
ProcessClose($line)
EndIf
EndFunc