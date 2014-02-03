#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

$MC="TPSTESTMRC"

Local $file = FileOpen("test.txt", 0)

; Another sample which automatically creates the directory structure
$file = FileOpen("test.txt", 10) ; which is similar to 2 + 8 (erase + create dir)

If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf


for $i=0 to 4
   $MC1=$MC & $i
   
   $CMD = "ping "& $MC1 & " -t > " & $file
   RunWait('"' & @ComSpec & '" /k ' & $CMD, @ScriptDir, @SW_SHOW)
   
Next

FileClose($file)


