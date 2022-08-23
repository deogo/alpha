#Include .\include\Crypt\Crypt.ahk
#Include .\include\Crypt\CryptConst.ahk
#Include .\include\base64.ahk
#Include .\include\QMsgBox\QMsgBoxAPI.ahk
#Include .\include\QMsgBox\QMsgBox.ahk
#Include .\lib\common\misc_common.ahk
#Include .\include\CColor.ahk

;~ sHash = 11626261375F44302000670061006D0061006E002D0074007300750079006F006900
;~ len := HashToByte(sHash,some)
;~ msgbox % strget(&some,len)

;~ InputBox,name,Hello!,Enter file Name`, yo!,,400,130,,,,,Quick Cliq.exe
;~ if !name
	;~ exitapp
files := [ "QC.exe", "QCx64.exe" ]
hashes := ""
for i,file in files
	hashes .= file " : `n" Crypt.Hash.FileHash( file, 3 ) "`n"
Gui,Add,Edit,w400 h200,% hashes
Gui,Show
return

GuiClose:
	exitapp
	return

;~ msgbox % hash := Crypt.Encrypt.StrEncrypt("MS encryption works in that way","007",5,1) ; encrypts string using AES_128 encryption and MD5 hash
;~ msgbox % decrypted_string := Crypt.Encrypt.StrDecrypt(hash,"007",5,1)				  ; decrypts the string using previously generated hash,AES_128 and MD5

;~ msgbox % "Bytes writen: " Crypt.Encrypt.FileEncrypt("License.txt","License.cr","IwantAcake")	; encrypts file using RC4 encryption and MD5 hash
;~ msgbox % "Bytes writen: " Crypt.Encrypt.FileDecrypt("License.cr","License2.txt","IwantAcake") ; decrypts file encrypted with RC4 and MD5

;~ msgbox % "Bytes writen: " Crypt.Encrypt.FileEncrypt("License.txt","License.cr","IwantAcake",7,6)	; encrypts file using AES_256 encryption and SHA_512 hash
;~ msgbox % "Bytes writen: " Crypt.Encrypt.FileDecrypt("License.cr","License2.txt","IwantAcake",7,6) ; decrypts file encrypted with AES_256 and SHA_512