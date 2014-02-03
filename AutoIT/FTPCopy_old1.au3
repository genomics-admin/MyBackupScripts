#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <IE.au3>
#include <Array.au3>
;--------------hotkey control----------------------
Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")

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

;-----------------------------------------------------------------------------

;Local $mainSource="ftp://ftp.wwpdb.org/pub/pdb/data/structures/divided/pdb/"
;Local $mainDestination= 'C:\FTP\'
$Overwrite='N'

Local $mainSource=InputBox("FTP source URL","Please enter the FTP source URL path in the box below"&@CRLF&@CRLF&"Example:- ","ftp://ftp.wwpdb.org/pub/pdb/data/structures/divided/pdb/")
Local $mainDestination=InputBox("Local Destination folder","Please enter the local destination folder path in the box below."&@CRLF&"Incase the folder doesn't exist, it will be created."&@CRLF&@CRLF&"Example:- ","C:\FTP\")
$Overwrite=InputBox("Confirm Overwrite","Do you wish to overwrite existing files?"&@CRLF&"select Y for Yes or N for No"&@CRLF&@CRLF&"Example:- ","N")

finder($mainSource,$mainDestination)

;----------------------------
Func finder($mainSource,$mainDestination)
	Local $Source=$mainSource
	Local $Destination=$mainDestination

	;--create the master destination folder if dont exists
	if StringRight($destination, 1)<>"\" Then
		$destination=$destination&"\"
	EndIf
	folderExists($destination)
	;---build arrey with the list of proper source and destination folder structure
	Local $arreyLinks[10][2]
	$oIE = _IECreate($source)
	_IELoadWait($oIE)

	$oLinks = _IELinkGetCollection($oIE)
	$iNumLinks = @extended
	;MsgBox(0, "Link Info", $iNumLinks & " links found")
	Local $arrCounter=1

	For $oLink In $oLinks
		$arrCounter=$arrCounter+1
	Next

	redim $arreyLinks[$arrCounter+1][2]
	$arreyLinks[0][0]=$arrCounter

	Local $arrCounter=1
	For $oLink In $oLinks
		$arreyLinks[$arrCounter][0]=$oLink.href
		if StringRight($destination, 1)<>"\" Then
			$arreyLinks[$arrCounter][1]=StringReplace(StringReplace($oLink.href,$Source,$Destination),"/","")
		Else
			$arreyLinks[$arrCounter][1]=$Destination
		EndIf

		pathfinder($Source,$arreyLinks[$arrCounter][0],$arreyLinks[$arrCounter][1])
		$arrCounter=$arrCounter+1
		;ConsoleWrite($oLink.href&@CRLF)
	Next



	ConsoleWrite($arrCounter&@CRLF)
	ConsoleWrite($Source&@CRLF&$arreyLinks[1][0]&@CRLF&$arreyLinks[$arrCounter-1][1]&@CRLF)
	_IEQuit($oIE)
EndFunc










Func pathfinder($source,$url,$destination)
	ConsoleWrite("S"&$source&@CRLF&"U"&$url&@CRLF&"D"&$destination&@CRLF)
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
			;ConsoleWrite("Source>"&$bkpurl&"--path>"&$path&@crlf)
			finder($bkpurl,$path)
		EndIf
		;---check if it's a file
		If StringRight($url, 1)<>"/" and StringInStr($url, ".gz") then
			if StringLeft($url, 1)="/" Then
				$url=StringTrimLeft($url, 1)
			EndIf
			;MsgBox(0, "Link Info : file", $url)
			ConsoleWrite("-->"&$bkpurl&"--->"&$destination&$url&"--->"&$url&@CRLF)
			if FileExists($destination&$url) and $Overwrite="N" Then
				ConsoleWrite("skipping on flag N")
			Else
				downloadfile($bkpurl,$destination&$url,$url)
			EndIf

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
	ConsoleWrite("--"&$dlto&"---"&$dlfrom&@CRLF)

ShellExecute($dlfrom)
WinWait("File Download",$filename,60)
WinActivate("File Download",$filename)
ControlClick("File Download",$filename,"[CLASS:Button; TEXT:&Save]","left",1)
WinWait("Save As","",5)
WinActivate("Save As")
;sleep(5000)
ControlSetText("Save As","","[CLASS:Edit; INSTANCE:1]",$dlto)
;sleep(5000)
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