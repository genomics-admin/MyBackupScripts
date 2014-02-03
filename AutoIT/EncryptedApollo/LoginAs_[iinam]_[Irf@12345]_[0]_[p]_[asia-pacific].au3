;$oObj = ObjCreate( "WScript.Shell" )
;$Group = ObjGet( "WinNT://" & @ComputerName & "/Administrators,group" )
;$Group.Add ( "WinNT://<domain>/<groupname>,group" )
;------------------------------------------------------------------------



#include <String.au3>
#include <Array.au3>
#include <Crypt.au3>

;match any title
Opt("WinTitleMatchMode", 2)

;Apollo main url
$Apollo="C:\Documents and Settings\NA1000APP-TPS-QA-CI\Local Settings\Application Data\Monsanto\Apollo\"

;get the script/exe name
$getname=@ScriptName
;MsgBox(0,"",@ScriptFullPath)

;convert the file name to array
$aArray1 = _StringBetween($getname, '[', ']')
;_ArrayDisplay($aArray1, 'Default Search')

if UBound($aArray1)<>5 Then
   exit(0)
EndIf

;if no user name then exit
if $aArray1[0]<>"" Then
   $username=$aArray1[0]
Else
   Exit(0)
EndIf

if $aArray1[1]<>"" Then
   $pwd=$aArray1[1]
Else
   Exit(0)
EndIf

if $aArray1[2]<>"" Then
   $mode=$aArray1[2]
Else
   Exit(0)
EndIf

if $aArray1[3]="t" Then
   $testorpst="test"
elseif $aArray1[3]="p" Then
   $testorpst="PostProd"
Else
   Exit(0)
EndIf

if $aArray1[4]<>"" Then
   $Domain=$aArray1[4]
Else
   Exit(0)
EndIf

;start crypt library
_Crypt_Startup()

if $mode=0 Then
   $Edata=_Crypt_EncryptData($pwd,$username,$CALG_RC4)
   $Ddata=BinaryToString(_Crypt_DecryptData($Edata,$username,$CALG_RC4))
   if $Ddata=$pwd Then
	  ;MsgBox(0,$Edata,$username&":"&Random(213456,987654,1))
	  ;$input=InputBox("Crypto", ":Encrypted password is="&Random(213456,987654,1), $Edata, "", - 1, -1, 0, 0)
	  if @Compiled=1 then
		 FileMove(@ScriptFullPath,@ScriptDir&"\LoginAs_["&$username&"]_["&$Edata&"]_["&1&"]_["&$aArray1[3]&"]_["&$Domain&"].exe",9)
	  Else
		 FileMove(@ScriptFullPath,@ScriptDir&"\LoginAs_["&$username&"]_["&$Edata&"]_["&1&"]_["&$aArray1[3]&"]_["&$Domain&"].au3",9)
	  EndIf
   EndIf
else
   if WinExists(") Apollo") Then
	  WinClose(") Apollo")
	  WinWaitClose(") Apollo","",30)
   EndIf
   $Ddata=BinaryToString(_Crypt_DecryptData($pwd,$username,$CALG_RC4))
   $Apollo=$Apollo&$testorpst&"\"
   ;$batchstring="@echo off"&@CRLF&@CRLF&'CD "'&$Apollo&'"'&@CRLF&@CRLF&"runas /profile /env /user:"&$Domain&"\"&$username&" Apollo.exe"
   ;MsgBox(0,"",$username&@CRLF&$Domain&@CRLF&$Ddata&@CRLF&'"'&$Apollo&'Apollo.exe'&'"')
   ;Run(@ComSpec & " /c " & 'runas', "", @SW_HIDE)
   RunAs($username,$Domain,$Ddata,0,'"'&$Apollo&'Apollo.exe'&'"',@SystemDir,@SW_MAXIMIZE)

   $count=20
   While Not WinExists(") Apollo")
	  if $count=0 then
		 Exit(0)
	  EndIf
	  Sleep(5000)
	  $count=$count-1
	  ConsoleWrite($count)
   WEnd

EndIf

_Crypt_Shutdown()
