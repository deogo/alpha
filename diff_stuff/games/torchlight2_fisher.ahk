#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode,Mouse,Client
CoordMode,Pixel,Client
global ttl
return

;<td>190.00</td>

srch()
{
  PixelSearch,px,py,628,478,654,490,0x8F8BA3,10,Fast RGB
  return !ErrorLevel
}

imsrch()
{
  imageSearch,ix,iy,625,488,654,534,*20 1.png
  return !errorlevel
}

chkttl()
{
  WinGetTitle,t,A
  if( t != ttl )
    Reload
  return
}

!f::
WinGetTitle,ttl,A
MouseGetPos,x,y
Loop
{
  chkttl()
  i := 0
  While True
  {
    chkttl()
    if imsrch()
      break
    MouseClick,Left,% x,% y,1, 10
    sleep 500
    MouseMove,% 640,% 400
    sleep 1500
    i++
    if( i == 2 )
      reload
  }
  Loop
  {
    chkttl()
    if srch()
    {
      MouseMove,640,511,4
      MouseMove,2,0,1,R
      MouseMove,-2,0,1,R
      sleep 50
      MouseClick,Left
      sleep 20
      while srch()
      {
        MouseClick,Left
        sleep 20
      }
      MouseMove,% 640,% 400
      if !imsrch()
      {
        sleep 2000
        break
      }
    }
    sleep 20
  }
}
return


!x::
Reload
exitapp