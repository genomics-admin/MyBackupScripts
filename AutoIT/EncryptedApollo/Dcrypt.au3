

#include <String.au3>
#include <Array.au3>
#include <Crypt.au3>

$Edata=""
$Key=""

;start crypt library
_Crypt_Startup()


MsgBox(0,"",BinaryToString(_Crypt_DecryptData($Edata,$Key,$CALG_RC4)))



_Crypt_Shutdown()
