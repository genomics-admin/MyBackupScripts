#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
;@author=Sandeep.kumar.laik@monsanto.com
; a small yet complicated turn based game of defender where the player either makes a move to stop the script from reaching the far right  
;makes a move to reach 
;
;
;
;
;###############################################################


$FileName="Algo.txt"



buildingBlocks()

Func buildingBlocks()
   $x_axis=InputBox("Construction","What is your x-axis length of matrics size?","31")
   if $x_axis="" Then
	  $x_axis=10
   EndIf

   $y_axis=InputBox("Construction","What is your y-axis length of matrics size?","98")
   if $y_axis="" Then
	  $y_axis=10
   EndIf

Create($FileName)
builder($FileName,$x_axis,$y_axis) 
Relaunch($FileName)

EndFunc

Func builder($FileName,$x_axis,$y_axis)

   Local $file = FileOpen($FileName, 2)
   $i=1
   
   While $i<=$x_axis
	  $j=1
	  While $j<=$y_axis
		 if $j<$y_axis Then
			FileWrite($file,"O ")
		 ElseIf $j=$y_axis Then
			FileWrite($file,"O"&@CRLF)
		 EndIf
		 
		 $j=$j+1
	  WEnd
	  
	  if $i<$x_axis Then
		 $j=1
		 While $j<=$y_axis
			if $j<$y_axis Then
			   FileWrite($file," ")
			ElseIf $j=$y_axis Then
			   FileWrite($file," "&@CRLF)
			EndIf
			
			$j=$j+1
		 WEnd
	  EndIf
	  $i=$i+1
   WEnd
   
FileClose($file)

EndFunc

Func Create($FileName)
   
Local $file = FileOpen($FileName, 0)

; Another sample which automatically creates the directory structure
$file = FileOpen($FileName, 10) ; which is similar to 2 + 8 (erase + create dir)

If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

FileClose($file)

EndFunc

Func Relaunch($FileName)
   
   Local $PID = ProcessExists("notepad.exe") 
   If $PID Then 
	  ProcessClose($PID)
	  Run("notepad.exe "&@ScriptDir&"\"&$FileName, "", @SW_MAXIMIZE)
   Else
	  Run("notepad.exe "&@ScriptDir&"\"&$FileName, "", @SW_MAXIMIZE)
   EndIf
   
EndFunc

Func Launch($FileName)

Run("notepad.exe "&@ScriptDir&"\"&$FileName, "", @SW_MAXIMIZE)

EndFunc
