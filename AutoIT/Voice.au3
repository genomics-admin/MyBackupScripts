#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

;#include<Sapi.au3>

Global $voice = ObjCreate("SAPI.SpVoice")
$string = "Execution"
$Voice.Speak($string,11)
Sleep(1000)
$string = "Complete"
$Voice.Speak($string,11)
Sleep(1000)