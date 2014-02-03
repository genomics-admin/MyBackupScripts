#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.0.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

#include <String.au3>
#include <array.au3>
#include <Date.au3>

; Script Start - Add your code below here
$LastComand=""
$latestComandString=""
$clickflag=0
$moveflag=0
$xco=0
$yco=0

;846,483 -- top left corner
while ($latestComandString<>'Stop')
	
;WinWaitActive('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')

if WinExists('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer') or WinExists("laik.sandeep says… - Windows Internet Explorer") then 
	Sleep(10000)
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	WinActivate('laik.sandeep says… - Windows Internet Explorer')
EndIf	

MouseClick("left",968,709)

MouseClickDrag("left",859,581,1245,669)

send("^c")

$Chatmsg=ClipGet()
Clipput("")

$latestComand = _StringBetween($Chatmsg, 'c:', ';')

;msgbox(0,"",$latestComand[0])

$latestComandString=_ArrayToString($latestComand,"", 0, 0)

;msgbox(0,"",$latestComandString)


if($LastComand<>$latestComandString) and $latestComandString<>'stop' and $latestComandString<>'' then 
;------------open----------------------
If($LastComand<>$latestComandString) and $latestComandString='open' then 
	$xco1=_StringBetween($Chatmsg, ';', ';')
	$xco=_ArrayToString($xco1,"", 0, 0)
	;msgbox(0,"",$xco)
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	MouseClick("left",968,705)
	send("^a")
	Sleep(500)
	send("{del}")
	Sleep(1000)
	for $i=1 to 5
		Send(".{Enter}")
		Sleep(1000)
	Next 
	;Send("Opening :" & $xco &"{Enter}")
	Sleep(1000)
	WinSetState("laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer", "", @SW_MINIMIZE)
	WinSetState("laik.sandeep says… - Windows Internet Explorer", "", @SW_MINIMIZE)
	Sleep(1000)
	Run($xco, "", @SW_MAXIMIZE)
;------------type----------------------
ElseIf($LastComand<>$latestComandString) and $latestComandString='type' then 
	$xco1=_StringBetween($Chatmsg, ';', ',')
	$xco=_ArrayToString($xco1,"", 0, 0)
	$yco1=_StringBetween($Chatmsg, ',', ';')
	$yco=_ArrayToString($xco1,"", 0, 0)
	$msg1=_StringBetween($Chatmsg, ';"<', '>"')
	$msg=_ArrayToString($msg1,"", 0, 0)
	;msgbox(0,"",$xco)
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	MouseClick("left",968,705)
	send("^a")
	Sleep(500)
	send("{del}")
	Sleep(1000)
	for $i=1 to 5
		Send(".{Enter}")
		Sleep(1000)
	Next 
	;Send("Opening :" & $xco &"{Enter}")
	Sleep(1000)
	WinSetState("laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer", "", @SW_MINIMIZE)
	WinSetState("laik.sandeep says… - Windows Internet Explorer", "", @SW_MINIMIZE)
	Sleep(1000)
	MouseClick("left",$xco,$yco)
	Sleep(1000)
	send($msg)
;-----------system status------------
ElseIf($LastComand<>$latestComandString) and $latestComandString='Stat' then 
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	MouseClick("left",968,705)
	send("^a")
	Sleep(500)
	send("{del}")
	Sleep(1000)
	for $i=1 to 5
		Send(".{Enter}")
		Sleep(1000)
	Next 	

	$sShortDayName = _DateDayOfWeek( @WDAY, 1 )
	$mem=MemGetStats()
	$list = ProcessList()

	send("Free Memory : " & $mem[2]*100/$mem[1] &"{Enter}")
	sleep(1000)
	send($sShortDayName & " (" & _DateTimeFormat( _NowCalc(),0) & "){Enter}")	
	sleep(1000)
	Send("No of process: "&$list[0][0]&"{Enter}")
;-------------move--------------
ElseIf($LastComand<>$latestComandString) and $latestComandString='Move' then 
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	$xco1=_StringBetween($Chatmsg, ';', ',')
	$xco=_ArrayToString($xco1,"", 0, 0)
	$yco1=_StringBetween($Chatmsg, ',', ';')
	$yco=_ArrayToString($yco1,"", 0, 0)
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	MouseClick("left",968,705)
	send("^a")
	Sleep(500)
	send("{del}")
	Sleep(1000)
	for $i=1 to 5
		Send(".{Enter}")
		Sleep(1000)
	Next 
	;Send("Moving  @ " & $xco & "," & $yco &"{Enter}")
	Sleep(1000)
	WinSetState("laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer", "", @SW_MINIMIZE)
	WinSetState("laik.sandeep says… - Windows Internet Explorer", "", @SW_MINIMIZE)
	Sleep(1000)
	MouseMove($xco,$yco)

;---------------left click-------------------	
ElseIf($LastComand<>$latestComandString) and $latestComandString='lClick' then 
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	$xco1=_StringBetween($Chatmsg, ';', ',')
	$xco=_ArrayToString($xco1,"", 0, 0)
	$yco1=_StringBetween($Chatmsg, ',', ';')
	$yco=_ArrayToString($yco1,"", 0, 0)
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	MouseClick("left",968,705)
	send("^a")
	Sleep(500)
	send("{del}")
	Sleep(1000)
	for $i=1 to 5
		Send(".{Enter}")
		Sleep(1000)
	Next 
	;Send("left clicking  @ " & $xco & "," & $yco &"{Enter}")
	Sleep(1000)
	WinSetState("laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer", "", @SW_MINIMIZE)
	WinSetState("laik.sandeep says… - Windows Internet Explorer", "", @SW_MINIMIZE)
	Sleep(1000)
	Mouseclick("left",$xco,$yco)
;----------right click ----------------------------
ElseIf($LastComand<>$latestComandString) and $latestComandString='rClick' then 
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	$xco1=_StringBetween($Chatmsg, ';', ',')
	$xco=_ArrayToString($xco1,"", 0, 0)
	$yco1=_StringBetween($Chatmsg, ',', ';')
	$yco=_ArrayToString($yco1,"", 0, 0)
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	MouseClick("left",968,705)
	send("^a")
	Sleep(500)
	send("{del}")
	Sleep(1000)
	for $i=1 to 5
		Send(".{Enter}")
		Sleep(1000)
	Next 
	;Send("right clicking  @ " & $xco & "," & $yco &"{Enter}")
	Sleep(1000)
	WinSetState("laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer", "", @SW_MINIMIZE)
	WinSetState("laik.sandeep says… - Windows Internet Explorer", "", @SW_MINIMIZE)
	Sleep(1000)
	Mouseclick("right",$xco,$yco)
;----------------if nothing matches
Else
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	MouseClick("left",968,705)
	send("^a")
	Sleep(500)
	send("{del}")
	Sleep(1000)
	Send($latestComandString & " <Unknown>")
	Sleep(1000)
	for $i=1 to 5
		Send(".{Enter}")
		Sleep(1000)
	Next 	
	$LastComand=$latestComandString
EndIf

ElseIf $latestComandString='stop' Then
	;_ArrayDisplay($latestComandString, 'Default Search')
	WinActivate('laik.sandeep - chat - sandeeplaik@gmail.com - Windows Internet Explorer')
	MouseClick("left",968,705)
	send("^a")
	Sleep(500)
	send("{del}")
	Sleep(1000)
	Send("Bye{Enter}")
	$LastComand=$latestComandString
	Exit
EndIf

WEnd
;_ArrayDisplay($aArray2, 'Default Search')


 