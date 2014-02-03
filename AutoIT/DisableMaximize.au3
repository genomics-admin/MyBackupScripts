#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <Misc.au3>

_Singleton(@ScriptName)

$title="ExecutionWaitDlg"

$i=1
while $i<>0

WinWaitActive ($title)

WinSetState($title, "", @SW_MINIMIZE)

WEnd