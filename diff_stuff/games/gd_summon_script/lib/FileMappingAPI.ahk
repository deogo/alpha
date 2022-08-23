CreateFileForMapping() {
  h := DllCall("CreateFileA"
          ,"AStr","mapping.bin"
          ,"Uint", 0x80000000 | 0x40000000 ; GENERIC_READ | GENERIC_WRITE
          ,"Uint", 0 ;dwShareMode
          ,"UPtr", 0 ;lpSecurityAttributes
          ,"Uint", CREATE_ALWAYS := 2 ;dwCreationDisposition
          ,"Uint", FILE_ATTRIBUTE_NORMAL := 0x80 ;dwFlagsAndAttributes
          ,"UPtr", 0 ) ;hTemplateFile
  if (h && A_LastError ~= "0|183")
    return h
  crit_fail("CreateFileForMapping failed")
  return 0
}

CreateFileMapping( name, size, hFile := -1 ) {
  h := DllCall("CreateFileMappingA"
    ,"UPtr", hFile  ;hFile
    ,"UPtr", 0      ;lpFileMappingAttributes
    ,"Uint", PAGE_READWRITE:= 0x04 ;flProtect
    ,"Uint", 0      ;dwMaximumSizeHigh
    ,"Uint", size   ;dwMaximumSizeLow
    ,"AStr", name ) ;lpName
  if (h && A_LastError ~= "0|183")
    return h
  crit_fail("CreateFileMapping failed")
  return 0
}

MapViewOfFile( hFile ) {
  addr := DllCall("MapViewOfFile"
    ,"UPtr", hFile    ;hFileMappingObject
    ,"UInt", FILE_MAP_WRITE := 0x0002 ;dwDesiredAccess
    ,"Uint", 0      ;dwFileOffsetHigh
    ,"Uint", 0      ;dwFileOffsetLow
    ,"Uint", 0  )   ;dwNumberOfBytesToMap
  if !addr
    crit_fail("MapViewOfFile failed")
  return addr
}

OpenFileMapping( name ) {
  h := DllCall("OpenFileMappingA"
    ,"UInt",FILE_MAP_WRITE := 0x0002 ;dwDesiredAccess
    ,"Int",0    ;bInheritHandle
    ,"AStr",name )
  if !h
    crit_fail("OpenFileMappingA failed for " name)
  return h
}