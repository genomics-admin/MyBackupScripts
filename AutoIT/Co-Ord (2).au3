#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Co ordinate tracking.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
While 1
$pos = MouseGetPos()

ToolTip($pos[0]&","$pos[1]&, $pos[0]+10, $pos[1]+10)
WEnd

While 1
    Sleep(100)
WEnd
