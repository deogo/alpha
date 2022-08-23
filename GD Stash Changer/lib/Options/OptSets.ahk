;options manipulation
OptSet( name, val )
{
  qcconf.SetOpt( name, val )
  return val
}

OptGet( name )
{
  return qcconf.GetOpt( name )
}

OptDel( name )
{
  return qcconf.DelOpt( name )
}

SaveUseTime()
{
  Curtime := A_Now
  EnvSub, Curtime,% glb[ "startTime" ], Seconds
  if ( usetime := qcOpt[ "Settings_CT" ] )
    if usetime is digit
      Curtime += usetime
  qcOpt[ "Settings_CT" ] := Curtime
  return
}

GetUseTime()
{
  Curtime := A_Now
  EnvSub, Curtime,% glb[ "startTime" ], Seconds
  if usetime := qcOpt[ "Settings_CT" ]
    if usetime is digit
      Curtime += usetime
  Curtime := Floor(Curtime/86400) . " Days " . Floor(Mod(Curtime,86400)/3600) . " Hours " . Floor(Mod(Mod(Curtime,86400),3600)/60) . " Minutes "
  Return Curtime
}

QCGetDaysUsing()
{
  Curtime := A_Now
  EnvSub, Curtime,% glb[ "startTime" ], Seconds
  if usetime := qcOpt[ "Settings_CT" ]
    if usetime is digit
      Curtime += usetime
  return Floor(Curtime/86400)
}

class QC_Options
{
  __Get( option )
  {
    global OptDefaults
    nm := "qc386@_" option
    if ObjHasKey( this, nm )
      return this[ nm ]
    else
    {
      oRetOpt := OptGet( option )
      if !oRetOpt.attrExist
        value := OptDefaults[ option ]
      else
        value := oRetOpt.val
      ObjInsert( this, nm, value )
      return value
    }
  }
  __Set( option, value )
  {
    nm := "qc386@_" option
    ObjInsert( this, nm, value )
    OptSet( option, value )
    return value
  }
}

class OptDefaults
{
  static hkey_glbOn := 1
  ,gen_showChangeWarning := 1
  ,gen_showChangeWarning_on_hotkey:=1
  ,gen_delConfirm := 1
  ,aprns_iconsSize := "16"
  ,main_props_hidden := 1
  ,main_cur_core := "sc"
  ,gen_new_stash_type := 2
}