#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <IE.au3>

Opt("WinTitleMatchMode", 2)

DIM $ie = _IECreate()
_IENavigate($ie, "http://teamsites.monsanto.com/public/IndiaIT/techps/Testing%20%20Automated/Smoke%20Test/DaliyExecutionStatus.xlsx", 0)
__IENavigate($ie, "http://teamsites.monsanto.com/public/IndiaIT/techps/Testing%20%20Automated/Automation%20Batches/Batches%20for%20Execution%20Approval.xlsx", 0, 0x800)

;~ __IENavigate($ie, "http://na1000wrksd01/MetricsViewer/Nav01.asp#", 0, 0x800)
;~ __IENavigate($ie, "http://w3.sbm.monsanto.com/tmtrack/tmtrack.dll?", 0, 0x800)
;~ __IENavigate($ie, "http://na1000wrksd01/TDRViewer/TDRViewer.asp#", 0, 0x800)


WinWait("File Download")

sleep(5000)
ControlClick("File Download","&Open","[CLASS:Button]")

WinWait("Microsoft Excel")
Sleep(5000)
WinActivate("Microsoft Excel")
Sleep(2000)
WinSetState("Microsoft Excel","",@SW_MAXIMIZE)
Sleep(2000)
WinSetState("Microsoft Excel","",@SW_MINIMIZE)

WinWait("File Download")

sleep(5000)
ControlClick("File Download","&Open","[CLASS:Button]")

WinWait("Microsoft Excel")
Sleep(5000)
WinActivate("Microsoft Excel")
Sleep(2000)
WinSetState("Microsoft Excel","",@SW_MAXIMIZE)
Sleep(2000)
WinSetState("Microsoft Excel","",@SW_MINIMIZE)

$ie.Quit()
Sleep(5000)
DIM $ie = _IECreate()

_IENavigate($ie, "http://teamsites.monsanto.com/public/IndiaIT/techps/Testing%20%20Automated/Forms/AllItems.aspx?RootFolder=%2fpublic%2fIndiaIT%2ftechps%2fTesting%20%20Automated%2fAutomation%20Batches&FolderCTID=&View=%7b15CE6DB7%2dD7F9%2d45A4%2dB4F7%2dBF2780BAF0DD%7d", 0)
__IENavigate($ie, "http://teamsites.monsanto.com/public/IndiaIT/techps/Testing%20%20Automated/Forms/AllItems.aspx?RootFolder=%2fpublic%2fIndiaIT%2ftechps%2fTesting%20%20Automated%2fSmoke%20Test&FolderCTID=&View=%7b15CE6DB7%2dD7F9%2d45A4%2dB4F7%2dBF2780BAF0DD%7d", 0, 0x800)
__IENavigate($ie, "http://na1000wrksd01/MetricsViewer/Nav01.asp#", 0, 0x800)
__IENavigate($ie, "http://w3.sbm.monsanto.com/tmtrack/tmtrack.dll?", 0, 0x800)
__IENavigate($ie, "http://na1000wrksd01/TDRViewer/TDRViewer.asp#", 0, 0x800)

WinWait("Internet Explorer")
Sleep(5000)
WinActivate("Internet Explorer")
Sleep(2000)
WinSetState("Internet Explorer","",@SW_MAXIMIZE)
Sleep(2000)
WinSetState("Internet Explorer","",@SW_MINIMIZE)