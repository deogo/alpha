#SingleInstance Force
#NoEnv
#NoTrayIcon
#Persistent

#Include ..\include\Crypt\Crypt.ahk
#Include ..\include\Crypt\CryptConst.ahk
#Include ..\include\base64.ahk
#Include ..\include\CColor.ahk
#Include ..\lib\common\API_http.ahk
#Include ..\lib\common\API_path.ahk
#Include ..\lib\common\misc_common.ahk
#Include ..\include\QMsgBox\QMsgBoxAPI.ahk
#Include ..\include\QMsgBox\QMsgBox.ahk

SetBatchLines, -1
Process, priority,,H

params = %0%
if !params ;close updater if started without parameters (launched manually)
  {
    SplashWait( 1, "WTF...`nHow did you find me??" )
    sleep 1000
    ExitApp
  }
APP_PID = %1%
APP_PATH = %2%
APP_VER = %3%
APP_VER_NEW = %4%
APP_ARCH = %5%
QC_DATA_PATH := PathGetDir( APP_PATH ) . "\Data"
if ( APP_ARCH = "x64" )
{
  APP_URL := "http://apathysoftworks.com/QC/qc_update/" APP_VER_NEW "/QCx64.exe"
  HASH_URL := "http://apathysoftworks.com/QC/qc_update/qc_sha_hash64"
}
else
{
  APP_URL := "http://apathysoftworks.com/QC/qc_update/" APP_VER_NEW "/QC.exe"
  HASH_URL := "http://apathysoftworks.com/QC/qc_update/qc_sha_hash"
}
HASH_PATH = %A_Temp%\qc_sha_hash
APP_TEMP_PATH = %A_Temp%\QC_last_ver.exe

SplashWait( 1,"Program will be updated`nand restarted shortly..." )
sleep 100
qBox := new QMsgBox( { title : "Update failed"
          , msg : "Error downloading file:`n"
            . "<ERR>`n`nPlease check your internet connection and try again later.`nOr visit our site:`n"
            . "<a href=""www.apathysoftworks.com"" >www.apathysoftworks.com</a>", ontop : 1 } )

if ( ret := DwnFile( APP_URL, APP_TEMP_PATH ) ).rcode
{
  SplashWait( -1 )
  qBox.msg := RegExReplace( qBox.msg, "<ERR>", ret.err )
  qBox.Show()
  ExitApp
}

if ( ret := DwnFile( HASH_URL, HASH_PATH ) ).rcode
{
  SplashWait( -1 )
  qBox.msg := RegExReplace( qBox.msg, "<ERR>", ret.err )
  qBox.Show()
  ExitApp
}

qc_hash := FileOpen( HASH_PATH, "r", "CP0" ).Read()
qc_hash := RegExReplace( qc_hash, "`a)(\s|`n)" )
sha_hash := Crypt.Hash.FileHash( APP_TEMP_PATH, 3 )
if ( qc_hash != sha_hash )
{
  SplashWait(0)
  QMsgBoxP( { title : "Invalid HASH value"
            , msg : "The HASH of the downloaded file is not valid.`nHASH:`n"  sha_hash "`nValid HASH:`n" qc_hash
            , ontop : 1 } )
  ExitApp
}

Process, Close, %APP_PID%
if (ErrorLevel=0)
{
  DetectHiddenWindows,On
  SendMessage, 0x7779,0,0,,ahk_pid %APP_PID%
  if ErrorLevel
  {
    SplashWait(0)
    QMsgBoxP( { title : "Updater error"
            , msg : "Could not close " glb[ "appName" ] " process"
            , ontop : 1 } )
    ExitApp
  }
  DetectHiddenWindows,OFF
}
Remove_Include_Files( QC_DATA_PATH )

sleep 1000
FileCopy, %APP_TEMP_PATH%, %APP_PATH%, 1
if ErrorLevel
{
  SplashWait(0)
  QMsgBoxP( { title : "Updater error"
      , msg : "Could not copy file."
      , ontop : 1 } )
  ExitApp
}
SplashWait( 1, "Done" )
Run, %APP_PATH%,,UseErrorLevel
if ( ErrorLevel == "ERROR" )
{
  SplashWait(0)
  QMsgBoxP( { title : "Error running " glb[ "appName" ]
      , msg : glb[ "appName" ] " has been successfully updated, but could not be started."
      , ontop : 1 } )
  ExitApp
}
Sleep 1000
SplashWait( 0 )
QMsgBoxP( { title : glb[ "appName" ] " successfully updated"
      , msg : "Successfully updated to version " APP_VER_NEW "."
        . "`nIf you like " glb[ "appName" ] " - support us by <a href=""http://apathysoftworks.com/donate"">donating</a>"
      , ontop : 1 } )
FileDelete, %APP_TEMP_PATH%
ExitApp

Remove_Include_Files( qc_data_path ) {		;Function to delete all include files!
  FileDelete, %qc_data_path%\qc_icons.icl
}