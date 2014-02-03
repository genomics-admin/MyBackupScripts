#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
Global $Paused
HotKeySet("{ESC}", "TogglePause")
Opt("WinTitleMatchMode", 2)


Func TogglePause()
    $Paused = Not $Paused
    While $Paused
        Sleep(100)
        ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ToolTip("")
EndFunc   

Func Terminate()
    Exit 0
EndFunc 

;---------------------------------------------------------------------------------------

$FileName="Algo.jpg"

buildingBlocks()

Func buildingBlocks()
   $x_axis=InputBox("Construction","What is your starting x axis?","800")
   if $x_axis="" Then
	  $x_axis=100
   EndIf

   $y_axis=InputBox("Construction","What is your starting y axis?","600")
   if $y_axis="" Then
	  $y_axis=100
   EndIf
   
   $gap=InputBox("Construction","Excepted gap?","10")
   if $gap="" Then
	  $gap=100
   EndIf
   

Create($FileName)
builder($FileName,$x_axis,$y_axis)

EndFunc
;---------------------------------------------------------------------------------
Func builder($FileName,$x_axis,$y_axis)

   Relaunch($FileName)
   ;$i=65
   $j=400
   $i=400
   $Seed=1
   
   While $i<=$x_axis or $j<=$y_axis
	  $Seed=$Seed+1
	  Painter1($FileName,$i,$j,$i+$Seed,$j+$seed)
	  $i=$i+$Seed
	  $j=$j+$Seed
	  $Seed=$Seed+1
	  Painter1($FileName,$i,$j,$i+$Seed,$j-$Seed)
	  $i=$i+$Seed
	  $j=$j-$Seed
	  $Seed=$Seed+1
	  Painter1($FileName,$i,$j,$i-$Seed,$j-$Seed)
	  $i=$i-$Seed
	  $j=$j-$Seed
	  $Seed=$Seed+1
	  Painter1($FileName,$i,$j,$i-$Seed,$j+$Seed)
	  $i=$i-$Seed
	  $j=$j+$Seed
   WEnd
EndFunc
;------------------------------------------------------------------------------------
Func Painter1($FileName,$i,$j,$i1,$j1)
   WinActivate("- paint")
   ;MouseClick("left",$i,$j)
   ;MouseClick("left",$i1,$j1)
   MouseClickDrag("left",$i,$j,$i1,$j1)
EndFunc
;------------------------------------------------------------------------------------
Func Create($FileName)
   
Local $file = FileOpen(@ScriptDir&"\"&$FileName, 0)

; Another sample which automatically creates the directory structure
$file = FileOpen(@ScriptDir&"\"&$FileName, 10) ; which is similar to 2 + 8 (erase + create dir)

If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

FileClose($file)

EndFunc
;--------------------------------------------------------------------------------------
Func Relaunch($FileName)
   
   Local $PID = ProcessExists("mspaint.exe") 
   If $PID Then 
	  ProcessClose($PID)
		 ;msgbox(0,"1","mspaint.exe "&@ScriptDir&"\"&$FileName)
	  Run('mspaint.exe "'&@ScriptDir&"\"&$FileName&'"', "", @SW_MAXIMIZE)
   Else
		 ;msgbox(0,"2","mspaint.exe "&@ScriptDir&"\"&$FileName)
	  Run('mspaint.exe "'&@ScriptDir&"\"&$FileName&'"', "", @SW_MAXIMIZE)
   EndIf
   
EndFunc
;--------------------------------------------------------------------------------------
Func Launch($FileName)

Run("mspaint.exe "&@ScriptDir&"\"&$FileName, "", @SW_MAXIMIZE)

EndFunc