#cs ----------------------------------------------------------------------------
	
	AutoIt Version: 3.3.8.1
	Author:         myName
	
	Script Function:
	Template AutoIt script.
	
#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <IE.au3>

$oIE = _IECreate("http://stlwswfprd01/rightsrequest7", 0)
_IELinkClickByText($oIE, "Continue with Request")
$oForm = _IEFormGetObjByName($oIE, "form1")
$oSelect = _IEFormElementGetObjByName($oForm, "l2b")
_IEFormElementOptionSelect($oSelect, "PBCNHGD", 1, "byText")
_IELinkClickByText($oIE, "Continue")
_IELoadWait($oIE)
$oSubmit = _IEGetObjByName($oIE, "l5b")
_IEAction($oSubmit, "click")
_IELoadWait($oIE)
Send("{ENTER}")



