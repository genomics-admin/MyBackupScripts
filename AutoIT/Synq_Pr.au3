#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: sandeep         

 Script Function:
	automatically synq all specified folders to the designated path

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <Date.au3>

;---------------Path selection------Source-----------------------------------
$Source_fpath_1=@ScriptDir
;---------------Path Selection------Destn------------------------------------
$Destn_fpath_pub="\\AP8037FNP01\USERS8037\slAIK\Public"
$Destn_fpath_priv="\\AP8037FNP01\USERS8037\slAIK\Private"
;-----------------Timecapsule--------------------------------------------------
$Dfolder=@YEAR&"_"&@MON&"_"&@MDAY&"_"&@HOUR&"_"&@MIN&"_"&@SEC
;---------------Folder name identification- 1---------------------------------------------------
$Sfolder_1=StringSplit($Source_fpath_1, "\")
$Sfolder_1=$Sfolder_1[$Sfolder_1[0]]
;---------------function call---------------------------------------------------------------
copy($Source_fpath_1,$Sfolder_1,1)
;------------Synq function--------------------------------------------------------------------------
Func copy($Source_fpath,$Folder,$Trig)
	  DirCopy($Source_fpath,$Destn_fpath_priv&"\"&$Dfolder&"\"&$Folder,1)
EndFunc
;----------------------Synq end-----------------------------------------------
	  