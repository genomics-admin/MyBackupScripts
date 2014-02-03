#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: sandeep         

 Script Function:
	automatically synq all specified folders to the designated path

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <Date.au3>

;---------------Path selection------Source-----------------------------------
$Source_fpath_1="C:\Documents and Settings\slaik\My Documents\Sandeep\DL"
$Source_fpath_2="C:\Documents and Settings\slaik\My Documents\Sandeep\Doc"
$Source_fpath_3="C:\Documents and Settings\slaik\My Documents\Sandeep\Other data"
$Source_fpath_4="C:\Documents and Settings\slaik\My Documents\Sandeep\Scripts"
$Source_fpath_5="C:\Documents and Settings\slaik\My Documents\Sandeep\Sw"
$Source_fpath_6="C:\Documents and Settings\slaik\My Documents\Sandeep\SQLs"
;---------------Path Selection------Destn------------------------------------
$Destn_fpath_pub="\\AP8037FNP01\USERS8037\slAIK\Public"
$Destn_fpath_priv="\\AP8037FNP01\USERS8037\slAIK\Private"
;-----------------Timecapsule--------------------------------------------------
$Dfolder=@YEAR&"_"&@MON&"_"&@MDAY&"_"&@HOUR&"_"&@MIN&"_"&@SEC
;---------------Folder name identification- 1---------------------------------------------------
$Sfolder_1=StringSplit($Source_fpath_1, "\")
$Sfolder_1=$Sfolder_1[$Sfolder_1[0]]
$Sfolder_2=StringSplit($Source_fpath_2, "\")
$Sfolder_2=$Sfolder_2[$Sfolder_2[0]]
$Sfolder_3=StringSplit($Source_fpath_3, "\")
$Sfolder_3=$Sfolder_3[$Sfolder_3[0]]
$Sfolder_4=StringSplit($Source_fpath_4, "\")
$Sfolder_4=$Sfolder_4[$Sfolder_4[0]]
$Sfolder_5=StringSplit($Source_fpath_5, "\")
$Sfolder_5=$Sfolder_5[$Sfolder_5[0]]
$Sfolder_6=StringSplit($Source_fpath_6, "\")
$Sfolder_6=$Sfolder_6[$Sfolder_6[0]]
;---------------function call---------------------------------------------------------------
copy($Source_fpath_1,$Sfolder_1,1)
copy($Source_fpath_2,$Sfolder_2,1)
copy($Source_fpath_3,$Sfolder_3,1)
copy($Source_fpath_4,$Sfolder_4,1)
copy($Source_fpath_5,$Sfolder_5,1)
copy($Source_fpath_5,$Sfolder_6,1)
;------------Auto Synq function--------------------------------------------------------------------------
Func copy($Source_fpath,$Folder,$Trig)
   if $Trig=1 Then
	  DirCopy($Source_fpath,$Destn_fpath_priv&"\"&$Dfolder&"\"&$Folder,1)
   elseif $Trig=2 Then
	  ;DirCopy($Source_fpath,$Destn_fpath_pub&"\"&@YEAR&"_"&@MON&"_"&@MDAY&"_"&@HOUR&"_"&@MIN&"_"&@SEC&"\"&$Sfolder,1)
   EndIf
EndFunc
;----------------------AutoSynq end-----------------------------------------------
	  