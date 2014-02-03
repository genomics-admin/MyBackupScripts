#include <IE.au3>
#include <FTPEx.au3>

$source="ftp://ftp.wwpdb.org/pub/pdb/data/structures/divided/pdb/"
$destination= 'C:\FTP'

init()

Func init()
$oIE = _IECreate($source)
_IELoadWait($oIE)

$oLinks = _IELinkGetCollection($oIE)
$iNumLinks = @extended
;MsgBox(0, "Link Info", $iNumLinks & " links found")
For $oLink In $oLinks
	pathfinder($source,$oLink.href,$destination)
Next

_IEQuit($oIE)
EndFunc

Func pathfinder($source,$url,$destination)
	;--create the master destination folder if dont exists
	if StringRight($destination, 1)<>"\" Then
		$destination=$destination&"\"
	EndIf
	folderExists($destination)
	;---get only the proper links/remove up or back button links
	if StringLen($source)<StringLen($url) Then
		$bkpurl=$url
		$url=StringReplace($url,$source,'')
		;---check if it's a folder
		If StringRight($url, 1)="/" then
			;MsgBox(0, "Link Info : folder", $url)
			$url=StringTrimRight($url, 1)
			if StringLeft($url, 1)="/" Then
				$url=StringTrimLeft($url, 1)
			EndIf
			$path=$destination&$url
			folderExists($path)
		EndIf
		;---check if it's a file
		If StringRight($url, 1)<>"/" and StringInStr($url, ".gz") then
			if StringLeft($url, 1)="/" Then
				$url=StringTrimLeft($url, 1)
			EndIf
			;MsgBox(0, "Link Info : file", $url)
			downloadfile($bkpurl,$destination&$url,$url)
		endif
	EndIf
EndFunc



;--------------------------------------------------------------
;------------------Create destination folder if not exist-------
Func folderExists($folder)
IF FileExists($folder) and StringInStr(FileGetAttrib($folder),"D") Then
	;MsgBox(0,"Folder Found","The folder " & $folder & " exists")
else
	;MsgBox(0,"Doesn't","exist")
	DirCreate($folder)
EndIf
EndFunc

;---------------------------------------------
;-------DownloadFile--------------------------
Func downloadfile($dlfrom,$dlto,$filename)
	;MsgBox(0, $dlto, $dlfrom)

ShellExecute($dlfrom)
WinWait("File Download",$filename,60)
WinActivate("File Download",$filename)
ControlClick("File Download",$filename,"[CLASS:Button; TEXT:&Save]","left",1)
WinWait("Save As","",5)
WinActivate("Save As")
ControlSetText("Save As","","[CLASS:Edit; INSTANCE:1]",$dlto)
if ControlClick("Save As","","[CLASS:Button; TEXT:&Save]","left",1)=0 Then
	ControlClick("Save As","","[CLASS:Button; TEXT:OK]","left",1)
EndIf
WinWait("Confirm Save As","",5)
if WinExists("Confirm Save As","") Then
	ControlClick("Confirm Save As","","[CLASS:Button; TEXT:&Yes]","left",1)
EndIf

WinWait("Download complete","Download complete",2)
WinActivate("Download complete","Download complete")
ControlClick("Download complete","Download complete","[CLASS:Button; TEXT:Close]","left",1)
WinWaitClose("Download complete","Download complete",2)


EndFunc

;-------------------test data-----------
;00/
;01/
;00/a.zip
;a.zip
;a.zip
;