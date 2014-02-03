#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

Global $Paused
HotKeySet("{ESC}", "TogglePause")
$Topcap="Test-Apollo~GermplasmAndProductDev"
$Process="DriverProcesses\MainDriver"

TogglePause()
Send("^c")
$Layout=ClipGet()
;TogglePause()
Send("{RIGHT}")
Send("^c")
$RecSet=ClipGet()
;TogglePause()
Send("{RIGHT}")
Send("^c")
$Result=ClipGet()
Send("{LEFT 2}")
Send("{DOWN}")
TogglePause()
MouseClick("Left",350,745)
TogglePause()
MouseClick("Left",76,370)
TogglePause()
MouseClick("Left",442,351,2)
Send($Topcap&"-"&$RecSet)
sleep(1000)
MouseClick("Left",520,400,2)
Send($Topcap&"-"&$RecSet)
MouseClick("LEFT",76,400)
TogglePause()
MouseClick("LEFT",379,348)
MouseClick("LEFT",375,375)
Send("{TAB}")
MouseClick("LEFT",375,380,2)
Send("admin")
Send("{TAB}")
MouseClick("LEFT",375,410,2)
Send("scooby")
TogglePause()
Send("{TAB}")
MouseClick("LEFT",375,444)
MouseClick("LEFT",375,470)
TogglePause()
Send("{TAB}")
Send($Process)
TogglePause()
Send("{TAB}")
Send($Result)
TogglePause()
Send("{TAB}")
MouseClick("LEFT",375,548)
Send($Layout)
TogglePause()
Send("{TAB}")
MouseClick("LEFT",375,584)
Send($RecSet)
TogglePause()
Send("{TAB}")
Send("{DOWN 2}")
MouseClick("LEFT",375,612)
MouseClick("LEFT",375,659)
TogglePause()
Send("{TAB}")
Send("{DOWN}")
MouseClick("LEFT",375,646)
MouseClick("LEFT",375,674)
TogglePause()
Send("{TAB}")
Send("{DOWN}")
MouseClick("LEFT",375,680)
TogglePause()
MouseClick("LEFT",83,435)
TogglePause()
MouseClick("LEFT",250,397)
MouseClick("LEFT",384,442,2)
Send("^a")
Send("Functional")
TogglePause()
MouseClick("LEFT",1410,791)


Func TogglePause()
    $Paused = Not $Paused
    While $Paused
        Sleep(100)
        ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ToolTip("")
EndFunc   ;==>TogglePause

