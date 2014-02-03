HotKeySet("{ESC}", "Terminate")


Opt("WinTitleMatchMode", 2)

$count=0
$user="na1000app-tps-qa-ci"
$value=""

while $count<30

if WinExists("- Google Chrome") Then

WinActivate("- Google Chrome")

if WinWaitActive("- Google Chrome","Authentication Required",30)  Then
	TrayTip("Monsanto - Web Automation", "Message: Chrome authentication", 30, 1)
	WinActivate("- Google Chrome","Authentication Required")
	Sleep(2000)
	BlockInput(0)
	while $value<>$user
		WinActivate("- Google Chrome","Authentication Required")
		sleep(500)
		Send("^a")
		Send("na1000app-tps-qa-ci")
		sleep(500)
		Send("^a")
		sleep(500)
		Send("^c")
		sleep(500)
		$value=ClipGet()
		Send("{TAB}")
		sleep(2000)
	WEnd
	WinActivate("- Google Chrome","Authentication Required")
	sleep(500)
	Send("^a")
	Send("Abc_123{!}")
	Send("{ENTER}")
	BlockInput(0)

Else
	sleep(1000)
	TrayTip("Monsanto - Web Automation", "Message: Chrome authentication screen not found", 30, 1)
EndIf

Exit


Else
	sleep(1000)
	TrayTip("Monsanto - Web Automation", "Message: Chrome not found", 30, 1)
	$count=$count+1
 EndIf

WEnd


Func Terminate()
    Exit 0
EndFunc