#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
$i=1

while $i>0 
WinWaitActive("Edit Requirement")



if WinExists("Edit Requirement") Then
   WinActivate("Edit Requirement")
   
   Send("^c")
   
   $temp=ClipGet()
   
   $temp=StringTrimLeft($temp,2)
   
   $temp="Legacy-TP"&$temp&"-FCE"
   
   send("^{TAB}")
   
   Sleep(1000)
   
   send("{TAB 26}")
   
   Send($temp)
   
   Sleep(1000)
;~    
   send("{TAB 2}")
   
   Sleep(1000)
   
   send("{SPACE}")
   
   while WinExists("Edit Requirement")
	  sleep(1000)
   WEnd  
   
   Sleep(1000)
   
   Send("{DOWN}")
   
   Sleep(1000)
   
   send("{ENTER}")
EndIf
$i=$i-1
WEnd