#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Sleep(5000)


Local $pos = MouseGetPos()
MouseClick("left",$pos[0],$pos[1])

Sleep(2000)

$i=100

while $i<>0
	  tip($i)
	  SEND("{up}")
	  ;Sleep(10)
	  SEND("{down}")
	  ;Sleep(10)
	  $i=$i-1
WEnd
   
$i=100

while $i<>0
	  tip($i)
	  SEND("{up}")
	  ;Sleep(10)
	  SEND("{down}")
	  ;Sleep(10)
	  $i=$i-1
WEnd

$i=100

while $i<>0
	  tip($i)
	  SEND("{up}")
	  ;Sleep(10)
	  SEND("{down}")
	  ;Sleep(10)
	  $i=$i-1
WEnd

$i=100

while $i<>0
	  tip($i)
	  SEND("{up}")
	  ;Sleep(10)
	  SEND("{down}")
	  ;Sleep(10)
	  $i=$i-1
WEnd

$i=100

while $i<>0
	  tip($i)
	  SEND("{up}")
	  ;Sleep(10)
	  SEND("{down}")
	  ;Sleep(10)
	  $i=$i-1
WEnd

$i=100

while $i<>0
	  tip($i)
	  SEND("{up}")
	  ;Sleep(10)
	  SEND("{down}")
	  ;Sleep(10)
	  $i=$i-1
WEnd

$i=100

while $i<>0
	  tip($i)
	  SEND("{up}")
	  ;Sleep(10)
	  SEND("{down}")
	  ;Sleep(10)
	  $i=$i-1
WEnd

$i=100

while $i<>0
	  tip($i)
	  SEND("{up}")
	  ;Sleep(10)
	  SEND("{down}")
	  ;Sleep(10)
	  $i=$i-1
WEnd

func tip($i)
   Local $pos = MouseGetPos()
   ToolTip($i,$pos[0]+10,$pos[1]+10)
EndFunc   