HotKeySet("{ESC}", "Terminate")

Func Terminate()
    Exit 0
EndFunc   ;==>Terminate

Sleep(5000)
$i=100
while $i>0
   WinActivate("H:\Entertainment\Movies\English","")
   Send("{F2}")
   Send("^c")
   Send("{ENTER}")
   Send("{DOWN}")
   WinActivate("Microsoft Excel - movie.xlsx","")
   Send("^v")
   Send("{DOWN}")
   $i=$i-1
WEnd