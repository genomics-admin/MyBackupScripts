#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
;Common data
$User="Admin"
$pwd="scooby"
$OPLocation1='SmokeTest\Screens-PMT'
$OPLocation2='SmokeTest\Screens-AIP'
$OPLocation3='SmokeTest\Screens-Biotechnology'
$OPLocation4='SmokeTest\Screens-Breeding'
$OPLocation5='SmokeTest\Screens-iTools'
$OPLocation6='SmokeTest\Screens-MBS'
$OPLocation7='SmokeTest\Screens-SPI'
$OPLocation8='SmokeTest\Screens-Regulatory'

; Create batches
;Smoke batches

writer("TraitStackingManagerSmoke","ScreenTest-TraitStackingManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\AIP",$OPLocation2,$User,$pwd)
writer("CloningManagerSmoke","ScreenTest-CloningManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\SPIScreens",$OPLocation7,$User,$pwd)
writer("ComplianceDescriptionManagerSmoke","ScreenTest-ComplianceDescriptionManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\SPIScreens",$OPLocation7,$User,$pwd)
writer("SecurityManager","ScreenTest-SecurityManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\iToolsScreens",$OPLocation5,$User,$pwd)
writer("DataEditorSmoke","ScreenTest-DataEditor","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\iToolsScreens",$OPLocation5,$User,$pwd)
writer("EKGViewerSmoke","ScreenTest-EKGViewer","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\iToolsScreens",$OPLocation5,$User,$pwd)
writer("AnalysisSetupManagerSmoke","ScreenTest-Analysis Setup Manager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\PMTScreens",$OPLocation1,$User,$pwd)
writer("RegistrationManagerSmoke","ScreenTest-Registration Manager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\PMTScreens",$OPLocation1,$User,$pwd)
writer("FingerPrintingWorkflowSmoke","ScreenTest-Fingerprinting Workflow","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\MBS",$OPLocation6,$User,$pwd)
writer("FingerPrintingPlugInTest","ScreenTest-FingerprintingPlug-in","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\MBS",$OPLocation6,$User,$pwd)
writer("MarkerLibraryManagerSmoke","ScreenTest-Marker Library Manager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\MBS",$OPLocation6,$User,$pwd)
writer("InverntoryImportSmoke","ScreenTest-InventoryImport","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("GreenHouseManagerSmoke","ScreenTest-GreenHouseManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("IntegratedReportingSmoke","ScreenTest-IntegratedReporting","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("ProtocolManagerSmoke","ScreenTest-ProtocolManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("ShipCenterSmoke","ScreenTest-ShipCenter","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("ExperimentManagerSmoke","ScreenTest-ExperimentManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("TechnologyWarehouseSmoke","ScreenTest-TechnologyWarehouse","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("CapacityManagerSmoke","ScreenTest-CapacityManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("CentralLabBookSmoke","ScreenTest-CentralLabBook","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("FieldClassificationManagerSmoke","ScreenTest-FieldClassificationManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
writer("FieldManagerSmoke","ScreenTest-FieldManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation4,$User,$pwd)
;writer("InventoryManagerSmoke","ScreenTest-FieldManager","Apollo\1-Drivers\1-Smoke\2-VerifyScreens\FieldTestingScreens",$OPLocation,$User,$pwd)

;Plugin Batches

;~ writer("LaunchApolloPlugInTest","LaunchApollo","Apollo\1-Drivers\1-Smoke\1-VerifyPlugins\ApolloPluginTests",$OPLocation,$User,$pwd)
;~ writer("RegulatoryPlugInTest","Regulatory","Apollo\1-Drivers\1-Smoke\1-VerifyPlugins\ApolloPluginTests",$OPLocation,$User,$pwd)
;~ writer("SPIPlugInTest","SPI","Apollo\1-Drivers\1-Smoke\1-VerifyPlugins\ApolloPluginTests",$OPLocation,$User,$pwd)
;~ writer("AIPPlugInTest","AIP","Apollo\1-Drivers\1-Smoke\1-VerifyPlugins\ApolloPluginTests",$OPLocation,$User,$pwd)
;~ writer("MBSPlugInTest","MBS","Apollo\1-Drivers\1-Smoke\1-VerifyPlugins\ApolloPluginTests",$OPLocation,$User,$pwd)
;~ writer("BreedingPlugInTest","Breeding","Apollo\1-Drivers\1-Smoke\1-VerifyPlugins\ApolloPluginTests",$OPLocation,$User,$pwd)
;~ writer("Breeding_EM_PlugInTest","Breeding_EM","Apollo\1-Drivers\1-Smoke\1-VerifyPlugins\ApolloPluginTests",$OPLocation,$User,$pwd)

;master batch writer

MasterClener()

;~ MasterWriter("LaunchApolloPlugInTest")
;~ MasterWriter("RegulatoryPlugInTest")
;~ MasterWriter("SPIPlugInTest")
;~ MasterWriter("AIPPlugInTest")
;~ MasterWriter("MBSPlugInTest")
;~ MasterWriter("BreedingPlugInTest")
;~ MasterWriter("Breeding_EM_PlugInTest")


MasterWriter("TraitStackingManagerSmoke")
MasterWriter("CloningManagerSmoke")
MasterWriter("ComplianceDescriptionManagerSmoke")
MasterWriter("SecurityManager")
MasterWriter("DataEditorSmoke")
MasterWriter("EKGViewerSmoke")
MasterWriter("AnalysisSetupManagerSmoke")
MasterWriter("RegistrationManagerSmoke")
MasterWriter("FingerPrintingWorkflowSmoke")
MasterWriter("FingerPrintingPlugInTest")
MasterWriter("MarkerLibraryManagerSmoke")
MasterWriter("InverntoryImportSmoke")
MasterWriter("GreenHouseManagerSmoke")
MasterWriter("IntegratedReportingSmoke")
MasterWriter("ProtocolManagerSmoke")
MasterWriter("ShipCenterSmoke")
MasterWriter("ExperimentManagerSmoke")
MasterWriter("TechnologyWarehouseSmoke")
MasterWriter("CapacityManagerSmoke")
MasterWriter("CentralLabBookSmoke")
MasterWriter("FieldClassificationManagerSmoke")
MasterWriter("FieldManagerSmoke")
MasterWriter("InventoryManagerSmoke")

;-----------------Writer logic----------------------------------------------------------

func writer($batch_name,$recset,$layout,$OPLocation,$User,$pwd)
   
Local $file = FileOpen(@ScriptDir&"\ExecutionBatch\BatchPack\"&$batch_name&".bat", 10)
If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

FileWriteLine($file, 'Certify.exe  /usecertifyconfig+ /stepdelay=0  /Process="DriverProcesses\MainDriver"   /Project="CertifyTest"  /Recordset="'&$recset&'" /RecordsetsMode="Read Only" /Layout="'&$layout&'"  /OutputLocation="'&$OPLocation&'" /VerifyObjects=Disabled  /user="'&$User&'" /password="'&$pwd&'"')

FileClose($file)
EndFunc
;------------------------------------------------------------------
Func MasterWriter($batch_name)
   Local $file = FileOpen(@ScriptDir&"\ExecutionBatch\AutomatedExecutionMaster.bat", 9)
If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

FileWriteLine($file, 'Call "'&@ScriptDir&'\ExecutionBatch\BatchPack\'&$batch_name&'.bat"'&@CRLF)

FileClose($file)
EndFunc   
;---------------------------------------------------------------------------
Func MasterClener()
   Local $file = FileOpen(@ScriptDir&"\ExecutionBatch\AutomatedExecutionMaster.bat", 10)
If $file = -1 Then
    MsgBox(0, "Error", "Unable to open file.")
    Exit
EndIf

FileWriteLine($file, '')

FileClose($file)
EndFunc  