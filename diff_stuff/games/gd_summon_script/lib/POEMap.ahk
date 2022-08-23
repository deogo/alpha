#Include classMemory.ahk

if (_ClassMemory.__Class != "_ClassMemory")
{
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
    ExitApp
}
_ClassMemory.setSeDebugPrivilege()

class CPOEMap
{
    exe_name := "PathOfExile_x64Steam.exe"
    hp_offsets := [0x18,0x90,0x18,0x1D0,0x220]
    
    __New()
    {
        this.ocm := ocm := new _ClassMemory("ahk_exe " this.exe_name, "", hProcess) 
        if !isObject(this.ocm) 
        {
            msg := "ClassMemory: failed to open <" this.exe_name ">"
            if (hProcess = 0)
                msg .= "`nThe program probably isn't running"
            else if (hProcess = "")
                msg .= "OpenProcess failed. Admin rights might be needed."
            crit_fail(msg)
        }
        this.addr1 := this.ocm.BaseAddress+0x0365D638
        ;~ hp_pattern := ocm.hexStringToPattern(this.hp_aob)
        ;~ if !isObject(hp_pattern)
          ;~ crit_fail("failed creating HP AOB pattern, err: " hp_pattern)
        ;~ hp_base_addr := ocm.modulePatternScan("grim dawn.exe", hp_pattern*)
        ;~ if (hp_base_addr <= 0)
          ;~ crit_fail("HP AOB pattern not found, err: " hp_base_addr)


        ;~ en_pattern := ocm.hexStringToPattern(this.en_aob)
        ;~ if !isObject(en_pattern)
          ;~ crit_fail("failed creating EN AOB pattern, err: " en_pattern)
        ;~ en_base_addr := ocm.modulePatternScan("Engine.dll", en_pattern*)
        ;~ if (en_base_addr <= 0)
          ;~ crit_fail("EN AOB pattern not found, err: " en_base_addr)
    }
    
    is_alive() {
        return this.ocm.isHandleValid()
    }
    
    __resolve_path(base_addr,offsets) {
        addr := this.ocm.getAddressFromOffsets(base_addr, offsets*)
        if (!addr || addr < 0)
            return 0
        return addr
    }
    
    get_hp() {
        if !(hp_cur_addr := this.__resolve_path(this.addr1, this.hp_offsets))
            return 0
        hp_cur := this.ocm.read(hp_cur_addr,"UInt")
        if (hp_cur = "") ; reresolve address on next run
            return 0
        hp_max := this.ocm.read(hp_cur_addr+4,"UInt")
        return {"cur" : hp_cur,"max" : hp_max,"perc" : hp_cur/hp_max*100}
    }
    
    __Delete()
    {
    }
}