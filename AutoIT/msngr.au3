#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

$oCommunicator = ObjCreate("Communicator.UIAutomation")
$oComm = ObjCreate("Communicator")
$MyName = $oCommunicator.MyFriendlyName
$MyLogin = $oCommunicator.MySigninName
$MyStatus = $oCommunicator.MyStatus
$Friend = $oCommunicator.GetContact("siddharthan.v@monsanto.com","")
$oComm.Close()
MsgBox(0, $MyStatus, 'Hi!' & @CR & 'My name is "' & $MyName & '" (e-mail: ' & $MyLogin & ')')
