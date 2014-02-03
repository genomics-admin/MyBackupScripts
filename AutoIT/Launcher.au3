#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

; Checking if you are at office
Opt("WinTitleMatchMode", 2)

$file = FileOpen("config.log", 2)
FileClose($file)

RunWait('"' & @ComSpec & '" /c ipconfig/all >>config.log', '', @SW_HIDE)
$file = FileOpen("config.log", 0)

If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

; Read in lines of text until the EOF is reached
$b = ""
While 1
    $a = FileReadLine($file)
    If @error = -1 Then ExitLoop
	If StringInStr($a,"Connection-Specific DNS Suffix")>0 and StringInStr($a,".monsanto.com")>0 Then
 	  While 1
	  $a = FileReadLine($file)
	  If @error = -1 Then ExitLoop
		 If StringInStr($a,"IP Address")>0 and StringInStr($a,"10.210")>0 Then
			$a="Ofc"
			$b="Ofc"
			;MsgBox(0, "A", $a)
		 Elseif $a<>"Ofc" Then 
			$a="others"
			$b="others"
			;MsgBox(0, "A", $a)
		 EndIf
	  WEnd
	EndIf
WEnd
FileClose($file)
FileDelete(@ScriptDir&"\config.log")

;If $b="Ofc" then 
;If $b="others" then 
   ;Launch outlook silently
   
;~    $ol_path = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\OUTLOOK.EXE\", "PATH");
;~    $ol_path = $ol_path & "outlook.exe"; Append the outlook executable   
;~    ; Run outlook
;~    Run($ol_path, "", @SW_MINIMIZE); Takes care of #1
;~    WinWait("Microsoft Outlook")
;~    Sleep(10000)
;~    WinSetState("Microsoft Outlook","",@SW_MINIMIZE)
;~    Sleep(5000)
   
   ;MSTSC to mc 16 & 19
   $Remote="TPSTESTMRC11"
   Run("mstsc -v:"&$Remote&" -console /W:1280 /H:1024")
   ;Run("mstsc -v:"&$Remote&" -console /W:1024 /H:768")
   WinWait($Remote)
   Sleep(5000)
   WinActivate($Remote,"")
   Sleep(5000)
   ControlSend($Remote,"","","{ENTER}")
   Sleep(5000)
;~    find()
;~    Sleep(5000)
;~    ControlSend($Remote,"","","NA1000APP-TPS-QA-CI")
;~    Sleep(5000)
   WinActivate($Remote,"")
   Sleep(5000)
;~    ControlSend($Remote,"","","!p")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","K1ngF1sher")
   ControlSend($Remote,"","","Washington42")
   Sleep(5000)
   WinActivate($Remote,"")
   Sleep(5000)
   ControlSend($Remote,"","","{ENTER}")
   Sleep(5000)
   WinSetState($Remote,"",@SW_MINIMIZE)
   Sleep(5000)
   
   $Remote="TPSTESTMRC32"
   Run("mstsc -v:"&$Remote&" -console /W:1440 /H:900")
   WinWait($Remote)
   Sleep(5000)
   WinActivate($Remote,"")
   Sleep(5000)
   ControlSend($Remote,"","","{ENTER}")
   Sleep(5000)
;~    find()
;~    Sleep(5000)
;~    ControlSend($Remote,"","","NA1000APP-TPS-QA-CI")
;~    Sleep(5000)
   WinActivate($Remote,"")
   Sleep(5000)
;~    ControlSend($Remote,"","","!p")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","K1ngF1sher")
   ControlSend($Remote,"","","Washington42")
   Sleep(5000)
   WinActivate($Remote,"")
   Sleep(5000)
   ControlSend($Remote,"","","{ENTER}")
   Sleep(5000)
   WinSetState($Remote,"",@SW_MINIMIZE)
   Sleep(5000)
   
   ;launch Symantec pcAnywhere
;~    Run("C:\Program Files\Symantec\pcAnywhere\Winaw32.exe")
;~    $Anywhere="Symantec pcAnywhere"
;~    WinWait($Remote)
;~    Sleep(5000)   
;~    WinSetState($Remote,"",@SW_MINIMIZE)
;~    Sleep(5000)
   
;EndIf   

;~ func find()
;~ 	  
;~    
;~    ControlSend($Remote,"","","{TAB}")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","ABCDEFGH")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","{TAB}")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","ABCDEFGH")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","{TAB}")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","ABCDEFGH")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","{TAB}")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","ABCDEFGH")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","{TAB}")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    ControlSend($Remote,"","","ABCDEFGH")
;~    Sleep(5000)
;~    WinActivate($Remote,"")
;~    Sleep(5000)
;~    $cancelcount=0
;~    ControlSend($Remote,"","","{Enter}")
;~    while WinExists($Remote,"")
;~ 	  ControlSend($Remote,"","","{Enter}")
;~ 	  Sleep(5000)
;~ 	  ControlSend($Remote,"","","{TAB}")
;~ 	  Sleep(5000)
;~ 	  $cancelcount=$cancelcount+1
;~ 	  
;~    WEnd
;~ EndFunc