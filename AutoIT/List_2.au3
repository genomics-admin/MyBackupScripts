#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <File.au3>
#include <Array.au3>
#include <Constants.au3>


Local $file = FileOpen(@ScriptDir&"\test.csv", 10)
;======================================================================
$masterPath="\\Ap8037fnp01\users8037"
Foldersearch($masterPath)
;======================================================================
Func Foldersearch($masterPath)

Filesearch($masterPath)
Local $FolderList = _FileListToArray($masterPath,"*",2)

If @error <> 4 Then
   for $j=1 to $FolderList[0]
	  Foldersearch($masterPath&"\"&$FolderList[$j])
   next
EndIf

EndFunc

;Filesearch($masterPath)
;======================================================================
Func Filesearch($Path)
Local $FileList = _FileListToArray($Path,"*",1)

If @error <> 4 Then
   for $i=1 to $FileList[0]
	  $Ftype=ftype($FileList[$i])
	  Writer("File,"&$Ftype&","&$Path&","&$FileList[$i],1)
   Next
EndIf

EndFunc
;======================================================================
Func ftype($file)
	  Local $extn = StringSplit($file, ".")
	  Return($extn[$extn[0]])
EndFunc

;======================================================================
Func writer($line,$NextLine)


; Check if file opened for writing OK
If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

if $NextLine=0 then 
   FileFlush($file)
   Local $n = FileSetPos($file, -2, $FILE_CURRENT)
   FileWriteLine($file,$line&",")
ElseIf $NextLine=1 then 
   FileWriteLine($file,$line&",")
EndIf

EndFunc

FileClose($file)