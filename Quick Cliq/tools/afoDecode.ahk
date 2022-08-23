#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

InputBox, encodedAfo
b64Decode( encodedAfo, outBuf )
InputBox,out,,,,,,,,,,% outBuf
return

b64Decode( b64str, ByRef outBuf )
{
	DllCall( "crypt32\CryptStringToBinaryW", "ptr", &b64str, "UInt", 0, "Uint", 1, "Ptr", 0, "UInt*", outLen, "ptr", 0, "ptr", 0 )
	VarSetCapacity( outBuf, outLen, 0 )
	DllCall( "crypt32\CryptStringToBinaryW", "ptr", &b64str, "UInt", 0, "Uint", 1, "Ptr", &outBuf, "UInt*", outLen, "ptr", 0, "ptr", 0 )
	return outLen
}
