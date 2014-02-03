#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#include <winapi.au3>

Global Const $IMAGE_BITMAP = 0
Global Const $STM_SETIMAGE = 0x172

Global $iWidth = 100
Global $iHeight = 100

; Creating GUI, Save Button and Pic Control...
$hGUI = GUICreate("Graphic")
GUISetBkColor(0xABCDEF)
$iPic = GUICtrlCreatePic("", 0, 0, $iWidth, $iHeight)
$iButton1 = GUICtrlCreateButton("Save To File...", 0, 370, 200, 30)
$iButton2 = GUICtrlCreateButton("Generate Random Image...", 200, 370, 200, 30)

; Creating an empty image and getting the graphic context...
_GDIPlus_Startup()
$hImage = _GDIPlus_BitmapCreateFromScan0($iWidth, $iHeight)
$hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage)

; Drawing random points...
$hPen = _GDIPlus_PenCreate(0xFF000000)
Local $i
For $y = 0 To $iHeight
    For $x = 0 To $iWidth
        $i = Random(0, 1, 1)
        If $i = 1 Then
            _GDIPlus_PenSetColor($hPen, 0xFFFFFFFF) ; If i = 1 then white
        Else
            _GDIPlus_PenSetColor($hPen, 0xFF000000) ; If i = 0 then black
        EndIf
        _GDIPlus_GraphicsDrawRect($hGraphic, $x, $y, 1, 1, $hPen) ; Creating Squares of 1X1(dots)
    Next
Next

; Showing the Image in the Pic Control...
$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
GUICtrlSendMsg($iPic, $STM_SETIMAGE, $IMAGE_BITMAP, $hBitmap)
_WinAPI_DeleteObject($hBitmap)

; Showing the GUI and the starting the main loop...
GUISetState()

While True
    $iMsg = GUIGetMsg()
    Switch $iMsg
        Case -3
            _GDIPlus_PenDispose($hPen)
            _GDIPlus_GraphicsDispose($hGraphic)
            _GDIPlus_ImageDispose($hImage)
            _GDIPlus_Shutdown()
            Exit
        Case $iButton1
            _GDIPlus_ImageSaveToFile($hImage, @DesktopDir & "\temp.png")
        Case $iButton2
            Local $i
            For $y = 0 To $iHeight
                For $x = 0 To $iWidth
                    $i = Random(0, 1, 1)
                    If $i = 1 Then
                        _GDIPlus_PenSetColor($hPen, 0xFFFFFFFF) ; If i = 1 then white
                    Else
                        _GDIPlus_PenSetColor($hPen, 0xFF000000) ; If i = 0 then black
                    EndIf
                    _GDIPlus_GraphicsDrawRect($hGraphic, $x, $y, 1, 1, $hPen) ; Creating Squares of 1X1(dots)
                Next
            Next
            $hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)
            GUICtrlSendMsg($iPic, $STM_SETIMAGE, $IMAGE_BITMAP, $hBitmap)
            _WinAPI_DeleteObject($hBitmap)
    EndSwitch

WEnd

Func _GDIPlus_BitmapCreateFromScan0($iWidth, $iHeight, $iStride = 0, $iPixelFormat = 0x0026200A, $pScan0 = 0)
    Local $aResult = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $iWidth, "int", $iHeight, "int", $iStride, "int", $iPixelFormat, "ptr", $pScan0, "int*", 0)
    If @error Then Return SetError(@error, @extended, 0)
    Return $aResult[6]
EndFunc   ;==>_GDIPlus_BitmapCreateFromScan0