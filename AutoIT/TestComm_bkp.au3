; Always available and Auto-Reply on Microsoft Communicator
;
; (1) Simulate mouse movement to make status always available
; (2) Auto-Reply for specific coworkers when they message you
;
; Written and Copyrighted by: Mythos and Rini
; Created on: 2010-03-03
;
; Required: AutoIt Version: 3.0
; Tested on: Windows XP SP3, Windows Vista SP1 with
;            Office Communicator 2007 R2
;

#include <Array.au3>

; This script requires full Administrative rights (Windows Vista)
#requireadmin

; ** Setup your name of your coworkers in array below **
; Array of coworkers, AutoIt has no class/type/list, so use Array
;
; [x] - Name of your coworker matches Communicator's Window
; [y] - Flag 0/1 indicating if this has been replied or not
;
; One message is supported here but it is very easy for you to
; modify this to have personalized message for each person

Dim $num = 3
Dim $coworkers[$num][2] = [["Pandey",0], ["Ken",0], ["Michael",0]]
Dim $message = "I am on the phone now, I will get back to you ASAP."

; Use AutoIt WindowsInfo or Microsoft Spy++ to get the class name
$IMClassName="[CLASS:IMWindowClass]"

; Move Mouse to 0,0
MouseMove(0, 0, 0)

; Loop forever until being stopped manually
While 1=1

  ; Random coordinates
  $x=Random(0,800)
  $y=Random(0,600)
  MouseMove($x, $y, 50)

  ; Get all the active/minimized communciator windows
  $winList = WinList($IMClassName)

  For $a = 0 to $winList[0][0]
     ; Debug
     ; MsgBox(0, "Title", $winList[$a][0])

     ; Activate Communicator window if there is any
     If WinActivate($winList[$a][0]) <> 0 Then

        ; Get title from IM
        $title = WinGetTitle($winList[$a][0], "")

        ; Loop thro all coworkers
        For $r = 0 to UBound($coworkers) - 1
	   ; Debug
	   ; MsgBox(0, "Title",  $coworkers[$r][0])

	   ; Send message if name matches + message hasn't been sent
	   If StringInStr($title, $coworkers[$r][0])>0 And $coworkers[$r][1]=0 Then	      
	      Sleep(1000)           
	      Send($coworkers[$r][0] & ", " & $message)
	      Send("{Enter}")
	      $coworkers[$r][1] = 1
	   EndIf
	Next
     ENdIf    
  Next

  ; Sleep for 20 seconds
  Sleep(20000) 

WEnd