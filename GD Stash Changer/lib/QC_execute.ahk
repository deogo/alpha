qcCmdThread( item, customHKrun = 0 )
{
  if ( qcExec.curThreads >= qcExec.maxThreads )
  {
    MsgBox,64,Please Wait,% "Reached maximum number of simulteniously running targets.`nPlease wait until some of them finished."
    return
  }
  qcExec.curitem := item
  qcExec.CHKrun := customHKrun
  nextThread := qcExec.curThreads + 1
  SetTimer,% "RunThread" nextThread, -1
  return
  
  RunThread1:
  RunThread2:
  RunThread3:
  RunThread4:
  RunThread5:
  RunThread6:
  RunThread7:
  RunThread8:
  qcExec.run()
  sleep -1
  return
}

class ExecCommand
{
  __New( maxThreads )
  {
    this.maxThreads := maxThreads
    this.curThreads := 0
  }
  
  run()
  {
    item := this.curitem
    this.curitem := ""
    if ( !IsObject( item ) || !item.alive )
      return 0
    this.curThreads++
    if IsInteger( item.uid )    ; any clicked item/or custom hotkey shortcut
    {
      if ( cmd := qcconf.GetItemCmdByID( item.uid ) )
        RunCommand( { cmd : cmd
                   , name : item.name
                   , icon : item.icon
                   , noctrl : this.CHKrun ? 1 : 0
                   , noshift : this.CHKrun ? 1 : 0 } )
      else
        DTP( "Target empty!", 2000 )
    }
    this.curThreads--
    return
  }
}

RunCommand( objParams )
{
  if !IsObject( objParams )
    target := objParams
  else
  {
    target := objParams.cmd
    reqVerb := objParams.verb
    is_smenu := objParams.smenu
    rc_name := objParams.name
    rc_icon := objParams.icon
    DontLog := objParams.nolog
    DontCTRL := objParams.noctrl
    NoShift := objParams.noshift
  }
  fCTRLPressed := False ; if True = copying shortcut targets and exiting
  fSHIFTPressed := False ; if True = running each target in RUNAS mode
  if ( GetKeyState("SHIFT","P") && !NoShift )
    fSHIFTPressed := True
  if ( GetKeyState("CTRL","P") && !DontCTRL )
    fCTRLPressed := True
  errors_log := ""
  
  target := RegExReplace( target, "\{!.*?!\}" ) ; removing comments
  ;adding command to recent list
  ;/////////////////
  arrCmds := StrSplit( target, glb[ "optMTDivider" ],A_TAB A_SPACE )
  if !arrCmds.MaxIndex()
    return
  mdelay := qcOpt[ "gen_cmdDelay" ]
  hModule := DllCall( "LoadLibraryW", "str", "Shlwapi.dll", "UPtr" ) 
  for tg_index,target in arrCmds
  {
    fRUNAS := False ; if flag True = run current target with RUNAS verb
    fRUN_MIN := False
    fRUN_MAX := False
    if ( tg_index != 1 )
      sleep,% mdelay
    if ( target = "" )
      continue
    args := workDir := ""
    verb := fRUNAS ? "RUNAS" 
            : reqVerb ? reqVerb : ""
    nShowCmd := fRUN_MIN ? 6 : fRUN_MAX ? 3 : 1
    ident := "  "
    err_msg := ""
    
    loop,%rep_num%
    {
      if (tg_index != 1)
        sleep,% mdelay
      loop,2
      {
        if isUrl := PathIsURL( target )
          exec_path := target
        else
        {
          exec_path := PathSplit( target, args, workDir )
          exec_path := ParseEnvVars( exec_path )
        }
        retval := API_ShellExecute( exec_path, args, workDir, verb, nShowCmd )	
        if (retval < 32)	;trying second chance by enclosing entire target in quotes
        {
          err_msg .= "Try " A_index ":`n" 
                   . ident "Exec:`n"
                   . ident ident exec_path "`n"
                   . ( args ? ( ident "Arguments:`n" ident ident args "`n" ) : "" )
                   . ident "Error:`n" ident ident . GetShellExecuteError(retval) . "`n`n"
          if isUrl
            break
          quotedPath := PathQuoteSpaces( target )
          if( quotedPath != target )
            target := quotedPath
          else
            break
        }
        else
        {
          err_msg := ""
          break
        }
      }
      if ( err_msg )
      {
        err_msg := "Command " . tg_index " =====================`n" err_msg
        errors_log .= err_msg
        break
      }
    }
  }
  if errors_log
    QMsgBoxP( { title : "Error launching command(s)"
                , msg : "One or more targets for this shortcut has not been launched or had errors.`n`n" errors_log
                , pic : "x", rsz : 1, editbox : 1, editbox_h : 200 } )
  DllCall("FreeLibrary", "Ptr", hModule)
  return
}

GetShellExecuteError(err_code)
{
  if (err_code = 0)
    err_descr = The operating system is out of memory or resources.
  else if (err_code = 2)
    err_descr = The specified file was not found.
  else if (err_code = 3)
    err_descr = The specified path was not found.
  else if (err_code = 11)
    err_descr = The .exe file is invalid (non-Win32 .exe or error in .exe image).
  else if (err_code = 5)
    err_descr = The operating system denied access to the specified file.
  else if (err_code = 27)
    err_descr = The file name association is incomplete or invalid.
  else if (err_code = 30)
    err_descr = The DDE transaction could not be completed because other DDE transactions were being processed.
  else if (err_code = 29)
    err_descr = The DDE transaction failed.
  else if (err_code = 28)
    err_descr = The DDE transaction could not be completed because the request timed out.
  else if (err_code = 32)
    err_descr = The specified DLL was not found.
  else if (err_code = 31)
    err_descr = There is no application associated with the given file name extension. This error will also be returned if you attempt to print a file that is not printable.
  else if (err_code = 8)
    err_descr = There was not enough memory to complete the operation.
  else if (err_code = 26)
    err_descr = A sharing violation occurred.
  else
    err_descr = error code %err_code%
  return err_descr
}