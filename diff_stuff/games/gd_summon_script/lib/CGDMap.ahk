#Include classMemory.ahk

if (_ClassMemory.__Class != "_ClassMemory")
{
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
    ExitApp
}
;~ _ClassMemory.setSeDebugPrivilege()

class CGDMap
{
    exe_name := "grim dawn.exe"
    hp_offsets := [0x78,0x2F0,0xC78,0xB0]
    en_offsets := [0x3E0, 0x48, 0x2F0, 0x810, 0xB0]
    is_enemy_offsets := [0x78,0xE0,0x2D0,0x8,0x878]
    target_type_offsets := [0x78,0xE0,0x2C8,0x40,0]
    ui_opened_offsets := [0x1E0,0xA0,0,0x40,0x110,0x2E8]
    
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
        this.addr1 := this.ocm.BaseAddress+0x0036FEC8
        this.addr2 := this.ocm.getModuleBaseAddress("engine.dll")+0x418308
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
    
    get_target_type(){
        ret := this.ocm.readString(this.addr1, 8, "UTF-16",this.target_type_offsets*)
        if (this.ReadStringLastError = 1)
            return ""
        return ret
    }
    
    is_enemy_under_cursor(){
        ret := this.ocm.read(this.addr1,"UInt",this.is_enemy_offsets*)
        if (ret = "")
            return 0
        return ret
    }
    
    get_hp() {
        if !(hp_cur_addr := this.__resolve_path(this.addr1, this.hp_offsets))
            return 0
        hp_cur := this.ocm.read(hp_cur_addr,"Float")
        if (hp_cur = "") ; reresolve address on next run
            return 0
        hp_max := this.ocm.read(hp_cur_addr+4,"Float")
        return {"cur" : hp_cur,"max" : hp_max,"perc" : hp_cur/hp_max*100}
    }
    
    get_en() {
        if !(en_cur_addr := this.__resolve_path(this.addr2, this.en_offsets))
            return 0
        en_cur := this.ocm.read(en_cur_addr,"Float")
        if (en_cur = "") ; reresolve address on next run
            return 0
        en_max := this.ocm.read(en_cur_addr+4,"Float")
        return {"cur" : en_cur,"max" : en_max,"perc" : en_cur/en_max*100}
    }
    
    is_ui_opened() {
        ret := this.ocm.read(this.addr2,"Char",this.ui_opened_offsets*)
        if (ret = "")
            return 0
        return ret
    }
    
    __Delete()
    {
    }
}