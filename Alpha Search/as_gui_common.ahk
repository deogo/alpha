ExpandSrh()
{
	static state
	Gui,1:Default
	state := !state
	height := state ? "60" : "25"
	GuiControlSet( "SchStr", "", "h" . height, 1, 0 )
	return
}