#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Opt("WinTitleMatchMode", 2)

HotKeySet("{ESC}", "Terminate")
HotKeySet("z","copy")
HotKeySet("^z","delete")
HotKeySet("^x","reset")

Func MSG1($msg,$sec)
	$pos = MouseGetPos()
			ToolTip($msg,$pos[0]+10,$pos[1]+10)
    sleep($sec)
    ToolTip("")
EndFunc

$var = FileSelectFolder("Choose a folder.", "",1,@MyDocumentsDir & "\My Pictures\")
;msgbox(0,"",$var)
DirCreate($var&"\bkp")
$var1=$var&"\bkp\"
$var2=""
$var3=""
$title=""

;$var = FileOpenDialog($message, @DocumentsCommonDir & "\My Pictures\", "Images (*.jpg;*.bmp)", 1 )

msg1("Z - copy, Ctrl+Z - Delete,Ctrl+X - Change location",3000)

While 1
    Sleep(100)
WEnd

Func copy()
	;uodate - in win7 the tittle has been changed from "Windows Photo Viewer" to "Windows Photo Viewer"
    if WinActive("Windows Photo Viewer","") then
		$title=WinGetTitle("Windows Photo Viewer","")
		;msgbox(0,"",$title)
		$title=StringReplace($title," - Windows Photo Viewer","")
		;msgbox(0,"",$title)
		$var2=$var&"\"&$title
		;msgbox(0,"",$var2)
		$var3=$var1&$title
		;msgbox(0,"",$var3)
		FileCopy($var2,$var1,9)
		Msg($title&" - Copied")
	EndIf
EndFunc

Func reset()
	$var = FileSelectFolder("Choose a folder.", "",1,@MyDocumentsDir & "\My Pictures\")
	;msgbox(0,"",$var)
	DirCreate($var&"\bkp")
	$var1=$var&"\bkp\"
EndFunc

Func msg($msg)
	$pos = MouseGetPos()
	ToolTip($msg,$pos[0]+10,$pos[1]+10)
EndFunc

func delete()
	if $var3<>"" Then
		if FileExists($var3) Then
			FileDelete($var3)
			Msg($title&" - removed")
		endif
	EndIf
EndFunc

Func Terminate()
    Exit 0
EndFunc
