glb[ "ver" ] := "1.1"
glb[ "startTime" ] := A_NOW
glb[ "MAX_PATH" ] := (260+1)*2
glb[ "appName" ] := "GD Stash Changer"
glb[ "appNameShort" ] := "GD Stash"
glb[ "dis_prefix" ] := "(N/A)"
glb[ "BlankIcoNum" ] := 20000
glb[ "separator" ] := "-------------<"
glb[ "qcArch" ] := A_PtrSize = 8 ? "x64" : "x32"
glb[ "QC_PID" ] := GetCurrentProcessID()
glb[ "maxBackups" ] := 5
glb[ "QC_GUI_FONT" ] := "Times New Roman"
glb[ "l_hkeys_on" ] := "Hotkeys: Turn ON"
glb[ "l_hkeys_off" ] := "Hotkeys: Turn OFF"
glb[ "pumParams" ] := { onrun : "MenuRunCommand"
                      , onselect : "MenuOnSelect"
                      , onuninit : "MenuOnUninit"
                      , oninit : "MenuOnInit"
                      , onmbutton : "MenuOnMButton"
                      , onrbutton : "MenuOnRButton"
                      , onshow : "MenuOnSwitch"
                      , onclose : "MenuOnSwitch" }
glb[ "propsTitle" ] := "Item Properties"

;config
glb[ "qcDataPath" ] := A_ScriptDir . "\Data"
glb[ "gdsStashPath" ] := glb[ "qcDataPath" ] "\Stashes"
glb[ "qcUserIconsPath" ] := "Data\user_icons"
glb[ "xmlConfPath" ] := glb[ "qcDataPath" ] "\gd_conf.xml"
glb[ "stash_unlocked_5" ] := "oMKiXPeX9wloFu9lz1yKWENcili4+OpsuPjqbLYXTq7zL79V1kS6SEFCukhBkjxxQKVcEHAUHFtvFBxbb1yKhiFaioYhkfxnZdKu7RVKHRN8Sh0TfC5V9+soVffreq5utCoV440QfRLUEH0S1I9ahe+JWoXvx3MbBe89vdBIQp/sSEKf7Cfltvch5bb3wCrBlR7kfn46EFe2OhBXtg=="
glb[ "stash_unlocked_6" ] := "v4AyQejVZxTW/fZTc9rOzNfazszpDXH26Q1x9o4bGe+6qfqdLCGybSwnsm0sodXIkHDoLupd9G4ZXfRuGRkGNPIfBjTy6w33iQHPO73TUhrG01IaxhWJP90TiT/dFA3fUUbNxp93hGazd4RmsxK3NMgUtzTIxi9uIw31GJCg8673oPOu9/GW+dT3lvnU16XVxw2War2XpeVYl6XlWPQi78XyIu/FRgez3hGDdScsEHHhLBBx4Q=="
glb[ "stash_locked" ] := "nUbpCMoTvF0l0awFaXv4E0V7+BPv7ziq7+84qrmH2bvtcQfLP5Re+DuUXvg+NqEpQattf5OvMFyTrzBc"
glb[ "urlDonate" ] := "http://apathysoftworks.com/donate"

;Icons
glb[ "iconListPath" ] := "Data\qc_icons.icl:"
icl := glb[ "iconListPath" ]
glb[ "icoQC" ] := icl . "0"
glb[ "icoSuspOn" ] := icl . "10"
glb[ "icoSuspOff" ] := icl . "9"
glb[ "icoMainEditor" ] := icl . "6"
glb[ "icoClips" ] := icl . "1"
glb[ "icoWins" ] := icl . "8"
glb[ "icoMemos" ] := icl . "7"
glb[ "icoFolMenu" ] := icl . "4"
glb[ "icoNone" ] := icl . "16"
glb[ "icoRecent" ] := icl . "11"
glb[ "icoHelpMe" ] := icl . "5"
glb[ "icoSuspend" ] := icl . "13"
glb[ "icoRemoteFol" ] := icl . "12"
glb[ "icoSysItem" ] := icl . "14"
glb[ "icoFolder" ] := icl . "3"
glb[ "icoEmail" ] := icl . "2"
glb[ "icoURL" ] := icl . "15"
glb[ "icoPropsInd" ] := 16
glb[ "icoPropsCnt" ] := 8
glb[ "icoIEInd" ] := glb[ "icoPropsInd" ] + glb[ "icoPropsCnt" ]
glb[ "icoIECnt" ] := 8
glb[ "icoPropsHotkey" ] := icl . ( glb[ "icoPropsInd" ] + 2 )
glb[ "icoMainInd" ] := glb[ "icoIEInd" ] + glb[ "icoIECnt" ]
glb[ "icoMainCnt" ] := 10
glb[ "icoCMDOut" ] := icl . ( glb[ "icoMainInd" ] + glb[ "icoMainCnt" ] )
glb[ "icoCMDIn" ] := icl . ( glb[ "icoMainInd" ] + glb[ "icoMainCnt" ] + 1 )
glb[ "icoGWESrch" ] := icl . ( glb[ "icoMainInd" ] + glb[ "icoMainCnt" ] + 2 )
free( icl )
;some extras

glb[ "hIcoPropsHotkey16" ] := IconExtract( glb[ "icoPropsHotkey" ], 16 )
glb[ "icoStash" ] := (A_OSVersion ~= "10\.0.*") ? "imageres.dll:204" : "imageres.dll:203"
glb[ "hIcoCurStash" ] := IconExtract( glb[ "icoStash" ], 16 )
; URLs
glb[ "urlApathyHome" ] := "http://apathysoftworks.com"

;def
glb[ "defTColor" ] := 0x000000
glb[ "defBgColor" ] := 0xf1f1f1
glb[ "defButW" ] := 70
glb[ "defButH" ] := 25
glb[ "defOptBoxW" ] := 400
glb[ "defOptBoxH" ] := 255
glb[ "defOptLVW" ] := 150
glb[ "defOptBoxPos" ] := "x0 y0"