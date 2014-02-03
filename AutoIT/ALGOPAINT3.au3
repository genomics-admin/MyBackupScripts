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
   $i=($x_axis-65)/2
   $j=($y_axis-65)/2
   
   $Seed=1
   
   Painter1($FileName,$i,$j,$x_axis,$j)
   Painter1($FileName,$i,$j,$i,$y_axis)
   Painter1($FileName,$i,$j,65,$j)
   Painter1($FileName,$i,$j,$i,65)
  
   Painter1($FileName,$i+100,$j,$i,$j-100)
   
   ;Painter3($FileName,$i,$j,90,40)
   ;Painter3($FileName,$i,$j,180,50)
   ;Painter3($FileName,$i,$j,270,60)
   ;Painter3($FileName,$i,$j,360,70)
   ;Painter3($FileName,$i,$j,450,80)
   
   ;Painter4($FileName,$i,$j,90,70)
   
   ;Painter5($FileName,$i,$j,90,70)
   
   painter6($FileName,$i,$j,90,70)
   
EndFunc
;------------------------------------------------------------------------------------
Func Painter($FileName,$i,$j)
   WinActivate("- paint")
   MouseClick("left",$i,$j)
EndFunc
;------------------------------------------------------------------------------------
Func Painter1($FileName,$i,$j,$i1,$j1)
   WinActivate("- paint")
   MouseClickDrag("left",$i,$j,$i1,$j1)
EndFunc
;------------------------------------------------------------------------------------
Func Painter3($FileName,$h,$k,$theta,$r)
   WinActivate("- paint")
   
   Local $pi = 3.14159265358979
   Local $degToRad = $pi / 180
   $degree = 0;  // angle that will be increased each loop
   ;$h = $i      // x coordinate of circle center
   ;$k = $j      // y coordinate of circle center
   $step = 1;  // amount to add to theta each time (degrees)
   ;$r=10;		// Redius      

   while $theta>=$degree
	  
	  $x = $h + $r*cos($degree * $degToRad)
	  $y = $k + $r*Sin($degree * $degToRad)
	  
	  MouseClick("left",$x,$y)
	  
	  $degree=$degree+$step
   WEnd
  
   
   
EndFunc
;------------------------------------------------------------------------------------
Func Painter4($FileName,$h,$k,$theta,$r)
   WinActivate("- paint")
   
   Local $pi = 3.14159265358979
   Local $degToRad = $pi / 180
   $degree = 0;  // angle that will be increased each loop
   ;$h = $i      // x coordinate of circle center
   ;$k = $j      // y coordinate of circle center
   $step = 30;  // amount to add to theta each time (degrees)
   ;$r=10;		// Redius      
   $r1=1
   
   while $r1<>$r
	  $x = $h + $r1*cos($degree * $degToRad)
	  $y = $k + $r1*Sin($degree * $degToRad)
	  
	  MouseClick("left",$x,$y)
	  
	  $r1=$r1+1
	  $step=$step-0.01
	  $degree=$degree+$step
   WEnd
EndFunc
;------------------------------------------------------------------------------------
Func Painter5($FileName,$h,$k,$theta,$r)
   WinActivate("- paint")
   
   Local $pi = 3.14159265358979
   Local $degToRad = $pi / 180
   $degree = 0;  // angle that will be increased each loop
   ;$h = $i      // x coordinate of circle center
   ;$k = $j      // y coordinate of circle center
   $step = 30;  // amount to add to theta each time (degrees)
   ;$r=10;		// Redius      
   $r1=1
   
   $x1=$h
   $y1=$k
   
   while $r1<>$r
	  $x = $h + $r1*cos($degree * $degToRad)
	  $y = $k + $r1*Sin($degree * $degToRad)
	  
	  MouseClickDrag("left",$x1,$y1,$x,$y)
	  
	  $x1 = $x
	  $y1 = $y
	  
	  $r1=$r1+1
	  $step=$step-0.01
	  $degree=$degree+$step
   WEnd
EndFunc
;------------------------------------------------------------------------------------
Func Painter6($FileName,$h,$k,$theta,$r)
   WinActivate("- paint")
   
   Local $pi = 3.14159265358979
   Local $degToRad = $pi / 180
   $degree = 0;  // angle that will be increased each loop
   ;$h = $i      // x coordinate of circle center
   ;$k = $j      // y coordinate of circle center
   $step = 30;  // amount to add to theta each time (degrees)
   ;$r=10;		// Redius      
   $r1=1
   
   $x1=$h
   $y1=$k
   
   while $r1<>$r
	  $x = $h + $r1*cos($degree * $degToRad)
	  $y = $k + $r1*Sin($degree * $degToRad)
	  
	  MouseClickDrag("left",$x1,$y1,$x,$y)
	  
	  $x1 = $x
	  $y1 = $y
	  
	  $r1=$r1+1
	  $step=$step-0.001
	  $degree=$degree+$step
   WEnd
   
   $h=$h+$r*2
   $k=$y-$r
   
   while $r1<>0
	  $x = $h + $r1*cos($degree * $degToRad)
	  $y = $k + $r1*Sin($degree * $degToRad)
	  
	  MouseClickDrag("left",$x1,$y1,$x,$y)
	  
	  $x1 = $x
	  $y1 = $y
	  
	  $r1=$r1-1
	  $step=$step+0.001
	  $degree=$degree-$step
   WEnd
   
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