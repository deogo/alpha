count = 0
loop, %a_Scriptdir%\*.ahk, 1, 1
	{
		loop, read, %A_LoopFileFullPath%
			{
				count++
			}
	}
msgbox %count%