#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

HotKeySet("{ESC}", "Terminate")
HotKeySet("^+d", "Replacer")

;;;; Body of program would go here ;;;;
While 1
    Sleep(100)
WEnd
;;;;;;;;

Func Terminate()
    Exit 0
EndFunc 

Func Replacer()
   
Sleep(1000)
;Send("^a")
Send("^c")

$String=ClipGet()

;$String=InputBox("map attribute changer","Enter the complete attribute string")
;$String='<object platform="Java" type="window" version="6" wid="1"><learnname>1-(test) Apollo - Ship Center_frame</learnname><physicalname>(test) Apollo - Ship Center_frame</physicalname><logicalname>(test) Apollo - Ship Center</logicalname><certifyclass>Window</certifyclass><class>com.monsanto.tcc.apollo.core.workbench.internal.DefaultWorkbenchWindow</class><caption>(test) Apollo - Ship Center</caption></object>'

If $String ="" Then
   Terminate()
Else 
   $text = StringReplace($String, '>(test) ', ' match="contains">')
   $text = StringReplace($text, '>1-(test) ', ' match="contains">')
   
;~    MsgBox(0,"",$text)
;~    ConsoleWrite($text)

send($text)

EndIf

EndFunc