#include <File.au3>
#include <Array.au3>
#include <IE.au3>



Global $tempLink, $drive, $dir, $file, $ext
Local $oIE = _IECreate("ftp://ftp.wwpdb.org/pub/pdb/data/structures/divided/pdb/00")
Local $oLinks = _IELinkGetCollection($oIE)
Local $iNumLinks = @extended

DirCreate("C:\Downloads")

For $oLink In $oLinks
$tempLink = $oLink.href
_PathSplit($tempLink, $drive, $dir, $file, $ext)
If $ext <> "" Then
ConsoleWrite("in: "&$tempLink&@CRLF&$drive&@CRLF&$dir&@CRLF&$file&@CRLF&$ext&@CRLF)
Inetget ($tempLink, "C:\Downloads\" & $file &  $ext)
ConsoleWrite("out: "&"C:\Downloads\" & $file & $ext&@CRLF)
EndIf
Next
_IEQuit($oIE)


;~ #include <File.au3>
;~ #include <Array.au3>
;~ #include <IE.au3>

;~ Global $tempLink, $drive, $dir, $file, $ext
;~ Local $oIE = _IECreate("ftp://ftp.wwpdb.org/pub/pdb/data/structures/divided/pdb/00/")
;~ Local $oLinks = _IELinkGetCollection($oIE)
;~ Local $iNumLinks = @extended

;~ DirCreate(@DesktopDir & "\Downloads")

;~ For $oLink In $oLinks
;~ $tempLink = $oLink.href
;~ _PathSplit($tempLink, $drive, $dir, $file, $ext)
;~ If $ext <> "" Then
;~ Inetget ($tempLink, @DesktopDir & "\Downloads\" & $file & "." & $ext)
;~ EndIf
;~ Next


;~ InetGet("ftp://ftp.wwpdb.org/pub/pdb/data/structures/divided/pdb/00/", @DesktopDir & "pdb100d.ent.gz", 1)