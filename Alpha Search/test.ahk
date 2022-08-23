q:: ;case-insensitive search for ANSI/UTF-8/UTF-16 string in binary buffer
vNeedle := "Ⱥⱥ Ⱦⱦ Ɐɐ Ɑɑ Ɫɫ Ɱɱ Ɽɽ"
;vNeedle := "abc"
;vNeedle := "résumé"
;vNeedle := Format("{:U}", vNeedle)
;vNeedle := Format("{:T}", vNeedle)
;vNeedle := Format("{:L}", vNeedle)

vNeedleU := Format("{:U}", vNeedle)
vNeedleL := Format("{:L}", vNeedle)

vListEnc := "CP0,UTF-8,UTF-16"
Loop, Parse, vListEnc, % ","
{
	vEnc := A_LoopField
	vSize := 10000, vOffset1 := 1000, vOffset2 := 9000
  vHaystack := ""
  ;~ f := FileOpen("D:\Steam\steamapps\common\Warhammer 40,000 Inquisitor - Martyr\Cfg\Artifact\Files.N2PK","r")
  ;~ vSize := f.RawRead(vHaystack,f.Length)
  ;~ f.close()
  ;~ vNeedle := "rare2"
	;~ VarSetCapacity(vHaystack, vSize, 0)
	StrPut(vNeedle, &vHaystack+vOffset1, vEnc)
	StrPut(vNeedle, &vHaystack+vOffset2, vEnc)

	vSfx := ""
	;vSfx := "Alt"

	vRet := JEE_InBufStr%vSfx%(&vHaystack, vSize, vNeedle, vEnc)
	vRetU := JEE_InBufStr%vSfx%(&vHaystack, vSize, vNeedleU, vEnc)
	vRetL := JEE_InBufStr%vSfx%(&vHaystack, vSize, vNeedleL, vEnc)

	vRetRev := JEE_InBufStr%vSfx%(&vHaystack, vSize, vNeedle, vEnc, -1)
	vRetRevU := JEE_InBufStr%vSfx%(&vHaystack, vSize, vNeedleU, vEnc, -1)
	vRetRevL := JEE_InBufStr%vSfx%(&vHaystack, vSize, vNeedleL, vEnc, -1)

	MsgBox, % vRet "`r`n" vRetU "`r`n" vRetL
	. "`r`n" vRetRev "`r`n" vRetRevU "`r`n" vRetRevL
}
return

;==================================================

;case-insensitive searching in binary buffers - AutoHotkey Community
;https://autohotkey.com/boards/viewtopic.php?f=5&t=58103

;search for ANSI/UTF-8/UTF-16 strings, case insensitive
;vStep: -1 for reverse search

JEE_InBufStr(vAddr, vSize, vNeedle, vEnc:="CP0", vStep:=1)
{
	local
	static vIsReady := 0, vFunc
	if !vIsReady
	{
		vHex32 := "5557565383EC188B44243C8B5C24388B7C242C8B6C244C8D48018B44244083C00139C189C20F46D10F42C88B4424302B7C24440FB6008844240E8B4424340FB6008844240F8B44242C01D8837C24440089C6894424140F4EF88D430129D089442410746E037C2444397C242C776439FE76608D4101C744240801000000C644240D0031F689442404908DB426000000000FB61F385C240E0F8483010000385C240F743D0FB644240D89F283F00138D0763431F683442408018B4424083B4424107710037C2444397C242C7706397C241477BE83C418B8FFFFFFFF5B5E5F5DC390C644240D018B44240485C074C631C9B80100000031D2890C2489"
		. "6C244C8D760089F184C974108B4C24308B2C243A1C290F848A000000807C240D000F84230100008B7424343A1C160F854301000031F683C201395424400F84260100008B5C244CC644240D01803C1300743E830424018B7424488B1C24803C1E000F85F80000008B6C244C89D989F38DB4260000000083C101803C0B0074F7890C24896C244CBE01000000C644240D0183C00139442404725D0FB65C07FFE963FFFFFF8D7600830424018B2C24396C243C0F84B20000008B4C2448803C290074458B5C244C83C201803C13000F858300000089E989DD83C201807C15000074F683C00139442404890C24896C244CC644240D0173A4908B6C244C"
		. "E9BAFEFFFF8DB42600000000807C240D0074838B4C24343A1C110F841CFFFFFFC644240D00E96CFFFFFF66900FB654240EB801000000BE010000003854240F0FB654240D0F44D08854240DE9A1FEFFFF8B6C244C31F6E964FEFFFFC644240D01E931FFFFFFBE01000000E927FFFFFF89F82B44242C83C4185B5E5F5DC38B6C244CC644240D00E932FEFFFF"
		vHex64 := "4157415641554154555756534883EC28448BBC24900000008B84249800000048894C24708B8C24A00000004C8BAC24A80000004C8BA424B0000000418D7F0183C0014189C239C7440F46D70F42F80FB60288442412410FB600884424134489C8480344247085C948894424084889C37E0B488B5C24704863C14829C3418D41014429D08944241474664863C14801C348395C24704889442418775448395C2408764D41BE0100000031F631C083C70190440FB61B44385C24120F843601000044385C2413743F89F183F10138C1763B31C04183C6014439742414721348035C241848395C2470770748395C240877C1B8FFFFFFFF4883C4285B5E"
		. "5F5D415C415D415E415FC3BE0100000085FF74C331C94531C94531D2662E0F1F84000000000084C0740D4489D544381C2A0F84830000004084F674994489C845381C000F85E400000031C04183C10144398C24980000000F84C50000004589CBBE0100000043803C1C007433418D420141807C0500004989C20F85990000000F1F8000000000418D420141807C0500004989C274F1BE01000000B8010000004883C101448D59014439DF0F8227FFFFFF440FB61C0BE96CFFFFFF4183C2014539D7745F4489D541807C2D000075184084F674CC4489CE453A1C300F846BFFFFFF31F6EBBB6690458D590143803C1C004D89D974F2BE01000000EB"
		. "A4440FB6542412B901000000B80100000044385424130F44F1E9F8FEFFFFB801000000E97DFFFFFF89D82B442470E9CDFEFFFF31F631C0E9A1FEFFFF"
		vHex := A_PtrSize=8 ? vHex64 : vHex32
		VarSetCapacity(vFunc, StrLen(vHex)//2)
		Loop, % StrLen(vHex)//2
			NumPut("0x" SubStr(vHex, 2*A_Index-1, 2), vFunc, A_Index-1, "UChar")
		vHex64 := vHex32 := ""
		vIsReady := 1
	}

	vNeedleU := Format("{:U}", vNeedle)
	vNeedleL := Format("{:L}", vNeedle)
	vBinU := vBinL := ""
	Loop, Parse, vNeedle
	{
		vChar := A_LoopField
		vCharU := Format("{:U}", vChar)
		vCharL := Format("{:L}", vChar)
		if !(vEnc = "UTF-16")
			vSizeU := StrPut(vCharU, vEnc) - 1
			, vSizeL := StrPut(vCharL, vEnc) - 1
		else
			vSizeU := StrLen(vCharU)*2
			, vSizeL := StrLen(vCharL)*2
		vBinU .= "1" JEE_StrRept("0", vSizeU - 1)
		vBinL .= "1" JEE_StrRept("0", vSizeL - 1)
	}
	vBinU .= "1", vBinL .= "1" ;trailing 1s to aid parsing
	vBinLenU := StrLen(vBinU)
	vBinLenL := StrLen(vBinL)
	if !(vEnc = "UTF-16")
		vSizeNeedleU := StrPut(vNeedleU, vEnc)
		, vSizeNeedleL := StrPut(vNeedleL, vEnc)
	else
		vSizeNeedleU := StrLen(vNeedleU)*2
		, vSizeNeedleL := StrLen(vNeedleL)*2
	vNeedle8U := ""
	VarSetCapacity(vNeedle8U, vSizeNeedleU+1)
	vNeedle8L := ""
	VarSetCapacity(vNeedle8L, vSizeNeedleL+1)
	StrPut(vNeedleU, &vNeedle8U, vEnc)
	StrPut(vNeedleL, &vNeedle8L, vEnc)

	;==============================

	VarSetCapacity(vBinU2, vBinLenU)
	VarSetCapacity(vBinL2, vBinLenL)
	Loop, % vBinLenU
		NumPut(SubStr(vBinU, A_Index, 1), &vBinU2, A_Index-1, "UChar")
	Loop, % vBinLenL
		NumPut(SubStr(vBinL, A_Index, 1), &vBinL2, A_Index-1, "UChar")
	;pHaystack, pNeedleU, pNeedleL
	;vSize, vSizeNeedleU, vSizeNeedleL
	;vStep, pBinU, pBinL ;note: pBinU/pBinL are 1s and 0s indicating the start/end of characters
	return DllCall(&vFunc, Ptr,vAddr, Ptr,&vNeedle8U, Ptr,&vNeedle8L, UInt,vSize, UInt,vSizeNeedleU, UInt,vSizeNeedleL, Int,vStep, Ptr,&vBinU2, Ptr,&vBinL2, Int)
}

;==================================================

JEE_InBufStrAlt(vAddr, vSize, vNeedle, vEnc:="CP0", vStep:=1)
{
	local
	vNeedleU := Format("{:U}", vNeedle)
	vNeedleL := Format("{:L}", vNeedle)
	vBinU := vBinL := ""
	Loop, Parse, vNeedle
	{
		vChar := A_LoopField
		vCharU := Format("{:U}", vChar)
		vCharL := Format("{:L}", vChar)
		if !(vEnc = "UTF-16")
			vSizeU := StrPut(vCharU, vEnc) - 1
			, vSizeL := StrPut(vCharL, vEnc) - 1
		else
			vSizeU := StrLen(vCharU)*2
			, vSizeL := StrLen(vCharL)*2
		vBinU .= "1" JEE_StrRept("0", vSizeU - 1)
		vBinL .= "1" JEE_StrRept("0", vSizeL - 1)
	}
	vBinU .= "1", vBinL .= "1" ;trailing 1s to aid parsing
	vBinLenU := StrLen(vBinU)
	vBinLenL := StrLen(vBinL)
	if !(vEnc = "UTF-16")
		vSizeNeedleU := StrPut(vNeedleU, vEnc)
		, vSizeNeedleL := StrPut(vNeedleL, vEnc)
	else
		vSizeNeedleU := StrLen(vNeedleU)*2
		, vSizeNeedleL := StrLen(vNeedleL)*2
	vNeedle8U := ""
	VarSetCapacity(vNeedle8U, vSizeNeedleU+1)
	vNeedle8L := ""
	VarSetCapacity(vNeedle8L, vSizeNeedleL+1)
	StrPut(vNeedleU, &vNeedle8U, vEnc)
	StrPut(vNeedleL, &vNeedle8L, vEnc)

	vByte1U := NumGet(&vNeedle8U, 0, "UChar")
	vByte1L := NumGet(&vNeedle8L, 0, "UChar")
	vEnd := vAddr + vSize
	if (vStep > 0)
		vAddrTemp1 := vAddr - vStep
	else
		vAddrTemp1 := vEnd
	vDoCheckU := vDoCheckL := 0
	vPosU := vPosL := 0
	vIsMatch := 0

	;==============================

	Loop, % vSize - Min(vBinLenU, vBinLenL) + 1
	{
		vAddrTemp1 += vStep
		if (vAddrTemp1 < vAddr) || (vAddrTemp1 >= vEnd)
			return -1
		vByte := NumGet(vAddrTemp1+0, "UChar")
		if (vByte = vByte1U)
			vDoCheckU := 1
		if (vByte = vByte1L)
			vDoCheckL := 1
		if !vDoCheckU && !vDoCheckL
			continue
		vPosU := vPosL := 1
		vAddrTemp := vAddrTemp1-1
		Loop, % Max(vBinLenU, vBinLenL) + 1
		{
			vAddrTemp++
			vByte := NumGet(vAddrTemp+0, "UChar")

			;diagnostic:
			;MsgBox, % vByte " " (NumGet(&vNeedle8U, vPosU-1, "UChar")) " " vPosU
			;. "`r`n`r`n" vByte " " (NumGet(&vNeedle8L, vPosL-1, "UChar")) " " vPosL

			if vDoCheckU
				if (vByte = NumGet(&vNeedle8U, vPosU-1, "UChar"))
				{
					vPosU++
					if (vPosU > vBinLenU)
					{
						vIsMatch := 1
						break 2
					}
					if SubStr(vBinU, vPosU, 1)
					{
						vDoCheckL := 1
						vPosL := InStr(vBinL, "1", 0, vPosL+1)
						continue
					}
				}
				else
					vDoCheckU := 0
			if vDoCheckL
				if (vByte = NumGet(&vNeedle8L, vPosL-1, "UChar"))
				{
					vPosL++
					if (vPosL > vBinLenL)
					{
						vIsMatch := 1
						break 2
					}
					if SubStr(vBinL, vPosL, 1)
					{
						vDoCheckU := 1
						vPosU := InStr(vBinU, "1", 0, vPosU+1)
						continue
					}
				}
				else
					vDoCheckL := 0
			if !vDoCheckU && !vDoCheckL
				break
		}
	}
	return vIsMatch ? (vAddrTemp1-vAddr) : -1
}

JEE_StrRept(vText, vNum)
{
	local
	if (vNum <= 0)
		return
	return StrReplace(Format("{:" vNum "}", ""), " ", vText)
	;return StrReplace(Format("{:0" vNum "}", 0), 0, vText)
}
;==================================================
