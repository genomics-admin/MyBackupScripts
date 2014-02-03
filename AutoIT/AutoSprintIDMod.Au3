Global $Paused
HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")
HotKeySet("+!d", "ShowMessage") ;Shift-Alt-d

;;;; Body of program would go here ;;;;
	man1(30)
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
    Exit 0
EndFunc   ;==>Terminate

Func ShowMessage()
   
   ClipPut("")
   WinActivate("Microsoft Excel - 1.csv")
   sleep(250)
   Send("{F2}")
   sleep(250)
   Send("+{HOME}")
   sleep(250)
   Send("^c")
   sleep(250)
   $TS=ClipGet()
   ;MsgBox(0,$TS,"")
Man($TS)
   
EndFunc   ;==>ShowMessage

Func Man($TS)
   WinActivate("Worksoft Certify")
   sleep(250)
   send("{Enter}")
   WinWaitActive("Edit Requirement")
   sleep(250)
   Send("^c")
   $TS1=ClipGet()
   ;MsgBox(0,$TS1,"")
   If $TS=$TS1 Then
	  sleep(250)
	  Send("^+{TAB}")
	  sleep(250)   
	  Send("{TAB 9}")
	  sleep(250)  
	  Send("M")
	  sleep(250) 
	  WinActivate("Microsoft Excel - 1.csv")
	  sleep(250)
	  Send("{Enter}")
	  sleep(250)	  
	  WinActivate("Edit Requirement")
   EndIf
   sleep(250)  
   Send("{Enter}")
   WinWaitClose("Edit Requirement")
   sleep(250)  
   Send("{DOWN}")
   
EndFunc   

Func Man1($Count)
   while $Count>1
   WinActivate("Worksoft Certify")
   sleep(250)
   send("{Enter}")
   WinWaitActive("Edit Requirement")
   sleep(250)
   Send("^+{TAB}")
   sleep(250)   
   Send("{TAB 9}")
   sleep(250)  
   Send("M")
   sleep(250)  
   Send("{Enter}")
   WinWaitClose("Edit Requirement")
   sleep(250)  
   Send("{DOWN}")
   $Count=$Count-1
   WEnd
EndFunc   

