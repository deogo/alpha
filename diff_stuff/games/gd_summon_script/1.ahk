#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
#Persistent
#Include %A_ScriptDir%\lib
#Include lib.ahk
#Include FileMappingAPI.ahk
#Include CGDMap.ahk

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
global f_check_hp_mp := false

global mapping_name := "GD_Mapping"
global mapping_addr := 0
global offsets := { "hp_cur" : { ofs : 0, type : "Float" }
                    ,"hp_max" : { ofs : 4, type : "Float" }
                    ,"hp_perc" : { ofs : 8, type : "Float" }
                    ,"en_cur" : { ofs : 12, type : "Float" }
                    ,"en_max" : { ofs : 16, type : "Float" }
                    ,"en_perc" : { ofs : 20, type : "Float" }
                    ,"enemy_type" : { ofs : 24, type : "UInt" }
                    ,"auto_allowed" : { ofs : 28, type : "UInt" }
                    ,"enemy_col" : { ofs : 32, type : "Str" }
                    ,"ui_opened" : { ofs : 44, type : "Uint" }
                    ,"game_running" : { ofs : 48, type : "UInt" }
                    ,"size" : 52 }
skip_common_enemies := 0

categories := object()
categories["Deux_d2"] := ["stub"
            ,{ "condition" : [{"no_status":["status_skeletons_d2.png"]}], "skill" : "skill_summon_skeleton_d2.png", "key" : "9"}
            ,{ "condition" : [{"no_status":["status_skel_mage_d2.png"]}], "skill" : "skill_skel_mage_d2.png", "key" : "8"}
            ,{ "condition" : [{"no_status":["status_bone_armor_d2.png"]}], "skill" : "skill_bone_armor_d2.png", "key" : "6"}
            ,{ "condition" : [{"no_status":["status_cyclon_arm_d2.png"]}], "skill" : "skill_cyclon_arm_d2.png", "key" : "7"}
            ,{ "condition" : [{"no_status":["status_wolf_d2.png"]}], "skill" : "skill_wolf_d2.png", "key" : "5"}
            ;~ ,{ "condition" : [{"no_status":["status_raven_d2.png"]}], "skill" : "skill_raven_d2.png", "key" : "5"}
            ,{ "condition" : [{"not_in_party":["party_act4_merc_d2.png"]}],"skill" : "skill_act4_merc.png", "key" : "0"}
            ,{ "condition" : [{"not_in_party":["party_crab_d2.png"]}],"skill" : "skill_crab_d2.png", "key" : "4"}
            ,{ "condition" : [{"not_in_party_twice":["party_rev_mon_d2.png"]}],"skill" : "skill_rev_mon_d2.png", "key" : "3"}
            ,{ "condition" : [{"not_in_party":["party_ognapesh.png","party_ognapesh_red.png"]}],"skill" : "skill_ognapesh.png", "key" : "2"}
             
,"stub"]

categories["AqRaec"] := ["stub"
            ,{ "condition" : [{"not_in_party_twice":["golem.png","golem_red.png"]}], "skill" : "skill_golem.png", "key" : "6"}
            ,{ "condition" : [{"no_status":["status_briar.png"]}], "skill" : "skill_br.png", "key" : "7"}
            ,{ "condition" : [{"not_in_party":["party_eldritch_talon.png"]}],"skill" : "skill_eldritch_talon.png", "key" : "9"}
            ,{ "condition" : [{"not_in_party":["party_skelwar.png","party_skelwar_red.png"]}],"skill" : "skill_skelwar.png", "key" : "0"}
            ,{ "condition" : [{"not_in_party_twice":["party_blighted_rift_scourge.png","party_blighted_rift_scourge_red.png"]}],"skill" : "skill_blighted_rift_scourge.png", "key" : "5"}
            ,{ "condition" : [{"enemy":1}], "skill" : "skill_siphon_souls.png", "key" : "4" }
            ,{ "condition" : [{"enemy":1}], "skill" : "skill_witching_hr.png", "key" : "0" }
            ,{ "condition" : [{"enemy":1}], "skill" : "call_to_the_grave.png", "key" : "8" }
            ,{ "condition" : [{"enemy":1}], "skill" : "skill_rave_earth.png", "key" : "9" }
            ,{ "condition" : [{"enemy":1}], "skill" : "skill_rmb_reap.png", "key" : "2" }
            ,{ "condition" : [{"enemy":1}], "skill" : "skill_wendigo.png", "key" : "1" }
            ,{ "condition" : [{"enemy":1}], "skill" : "skill_panter.png", "key" : "3" } 
,"stub"]
categories["Rich Eye"] := ["stub"
            ,{ "condition" : [{"no_status":["status_briar.png"]}],"skill" : "skill_br.png","key" : "6"}
            ,{ "condition" : [], "skill" : "skill_word_of_renewal.png", "key" : "0" }
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_inqus_seal.png", "key" : "9"}
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_howling_wind.png", "key" : "8" }
            ,{ "condition" : [{"no_status":["status_blood_pact.png"]},{"enemy":1,"timer":12000}],"skill" : "skill_wendigo.png","key" : "7"}
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_horn.png", "key" : "5" }
,"stub"]
categories["Gem"] := ["stub"
            ,{ "condition" : [{"health_lower_than":71},{"no_status" : ["status_pneum_burst.png"]}],"skill" : "skill_pneumatic_burst.png","key" : "0"}
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_amarasta_bb.png","key" : "6"}
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_flash_freeze.png", "key" : "7"}
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_ring_of_steel.png", "key" : "5"}
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_callidor_tempest.png", "key" : "8"}
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_trozan_sky_shard.png", "key" : "9"}
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_olerons_might.png", "key" : "4"}
,"stub"]
categories["Blight"] := ["stub"
            ,{ "condition" : [{"enemy":2},{"enemy":1,"health_lower_than":80}]
                  ,"skill" : "skill_sigil_of_consumption.png","key" : "7"}
            ,{ "condition" : [{"timer":2000,"enemy":1}]
                  ,"skill" : "skill_curse_of_fraility.png","key" : "2"}
            ,{ "condition" : [{"timer":3000,"enemy":1}]
                  ,"skill" : "skill_bloody_pox.png","key" : "0"}
            ,{ "condition" : [{"health_lower_than":70},{"no_status":["status_blood_of_dreeg.png"]}]
                  ,"skill" : "skill_blood_of_dreeg.png","key" : "6"}
            ,{ "condition" : [{"enemy":1}],"skill" : "skill_dreeg_afflicted_spines.png","key" : "8"}
            ,{ "condition" : [{"not_in_party":["pet_raven.png"]}],"skill" : "skill_summon_familiar.png", "key" : "9"}
            ,{ "condition" : [{"health_lower_than":40}],"skill" : "skill_bloodthrist.png","key" : "5"}
,"stub"]
                     
            

if (A_Args.length() = 0)
{
  tlp("Loaded",1000)
  myPID := DllCall("GetCurrentProcessId")

  Hotkey,Numpad1,automate
  Hotkey,Numpad3,send_100_clicks
  Hotkey,Numpad4,dismantle_helper
  Hotkey,Numpad5,test_thread
  Hotkey,Numpad6,sell_all_greens
  Hotkey,Numpad7,reload_script
  Hotkey,Numpad8,exit_script
  
  hFileMap := CreateFileMapping( mapping_name, offsets.size )
  mapping_addr := MapViewOfFile( hFileMap )
  ;~ msgbox % "addr=" toHex(mapping_addr)
  if (f_check_hp_mp)
    SetTimer,auto_heal_and_energy,200
  
  Run,"%A_AhkPath%" /f "%A_ScriptFullPath%" %myPID% EventAllowAutomation
  ;~ Run,"%A_AhkPath%" /f "%A_ScriptFullPath%" %myPID% EventEnemyOn
  Run,"%A_AhkPath%" /f "%A_ScriptFullPath%" %myPID% Mem_Scan
}
else
{
  hFileMap := OpenFileMapping( mapping_name )
  mapping_addr := MapViewOfFile( hFileMap )
  ;~ msgbox % "args " A_Args.length() "`n" A_Args[1] "`n" A_Args[2] "`n" A_Args[3]
  if (A_Args[2] = "EventAllowAutomation")
    gosub,event_allow_automation
  else if (A_Args[2] = "Mem_Scan")
    gosub,Mem_Scan
  else
    gosub,DoThreadJob
}
return

test_thread:
loop
{
    MouseGetPos,mx,my
    msg := mx . " : " . my
    for k,v in offsets
    {
        if (k = "size")
            continue
        if (v.type = "Str")
            msg .= "`n" k "(" v.ofs ") = " StrGet(mapping_addr+v.ofs,12,"UTF-8")
        else
            msg .= "`n" k "(" v.ofs ") = " NumGet(mapping_addr+0,v.ofs,v.type)
    }
    tooltip % msg
    sleep 20
}
return

automate:
for name,_ in categories
  Menu,autom,Add,% name,automate_sub
Menu,autom,Show
return

automate_sub:
name := A_ThisMenuItem
if (f_check_hp_mp)
  SetTimer,auto_heal_and_energy,200
tlp(name,1000)
if !categories[name]
  throw % "No automation for " name
for i,_ in categories[name]
{
  if (_=="stub")
    continue
  Run,"%A_AhkPath%" /f "%A_ScriptFullPath%" %myPID% "%name%" %i%
}
return

send_100_clicks:
SetTimer,clicks_100,-1
return

reload_script:
Critical
Reload
exit_script:
ExitApp
return

DoThreadJob:
Critical
arg_num := A_Args[3]
job := categories[A_Args[2]][A_Args[3]]
job_condition := job["condition"]
job_skill := job["skill"]
job_key := job["key"]
if !((job_condition != "") && job_skill && (job_key != ""))
{
  msgbox % "Something missing:`ncondition: " job_condition "`nskill: " job_skill "`nkey: " job_key
  ExitApp
}

last_used := 0
notify := job["notify"]
loop
{
    check_exit_condition(A_Args[1])
    if !is_automation_allowed()
    {
        sleep 200
        continue
    }

    ;condition check
    if !check_job_condition(job_condition,last_used)
    {
      sleep 100
      continue
    }    
  
    if is_skill_available( job_skill )
    {
        send_key_now(job_key,200)
        last_used := A_TickCount
    }
    sleep 100
    continue
}
return


sell_all_greens:
if !is_inventor_open()
{
  tooltip inventory should be opened
  sleep 1000
  tooltip
  return
}
; main inv
while ( r := find_greens(805,625,1195,886) )
{
  MouseClick,Right,% r.x+20,% r.y+5
  sleep 50
}
for i,crd in [{x:1352,y:611},{x:1375,y:611},{x:1398,y:611},{x:1423,y:611},{x:1448,y:611}]  ;bags
{
  MouseClick,Left,% crd.x,% crd.y
  sleep 200
  while ( r := find_greens(1200,630,1457,886) )
    MouseClick,Right,% r.x+20,% r.y+5
}
return

clicks_100:
Critical
loop,100
{
  MouseClick
  sleep,10
}
return

dismantle_helper:
Critical
While is_inventor_open()
{
  ImageSearch,xi,yi,540,809,705,867,*10 button.png
  if (ErrorLevel == 0)
  {
    MouseGetPos,xc,yc
    MouseClick,Left,626,839
    sleep 200
    ImageSearch,xi,yi,809,562,964,617,*10 but_yes.png
    if (ErrorLevel == 0)
    {
      MouseClick,Left,883,587
      sleep 20
    }
    sleep 100
    MouseClick,Left,626,450
    sleep 10
    MouseClick,Left,626,560
    sleep 10
    MouseMove,% xc,% yc
  }
  sleep 50
}
return


event_allow_automation:
last_state := 0
last_running_state := 0
loop
{
  check_exit_condition(A_Args[1])
  is_running := WinActive("ahk_exe Grim Dawn.exe")
  if (is_running != last_running_state)
  {
    NumPut(is_running,mapping_addr+0,offsets.game_running.ofs,offsets.game_running.type)
    last_running_state := is_running
  }
  if is_running
    state := is_allowed_proc() || 0
  else
    state := 0
  if (state != last_state)
  {
    NumPut(state,mapping_addr+0,offsets.auto_allowed.ofs,offsets.auto_allowed.type)
    last_state := state
  }
  sleep 100
}
return

mem_reload:
gdmap := new CGDMap()
tlp("CGDMap ReLoaded",1000)
return

Mem_Scan:
gdmap := ""
Hotkey,Numpad9,mem_reload
Loop
{
    check_exit_condition(A_Args[1])
    if !is_game_running()
    {
      sleep 200
      continue
    }
    if (!IsObject(gdmap) || !gdmap.is_alive())
      gdmap := new CGDMap()
    is_inv := gdmap.is_ui_opened()
    NumPut(is_inv,mapping_addr+0, offsets.ui_opened.ofs, offsets.ui_opened.type)
    
    if !is_automation_allowed()
    {
        sleep 200
        continue
    }
    
    hp := gdmap.get_hp()
    NumPut(hp.cur,mapping_addr+0, offsets.hp_cur.ofs, offsets.hp_cur.type)
    NumPut(hp.max,mapping_addr+0, offsets.hp_max.ofs, offsets.hp_max.type)
    NumPut(hp.perc,mapping_addr+0,offsets.hp_perc.ofs,offsets.hp_perc.type)

    en := gdmap.get_en()
    NumPut(en.cur,mapping_addr+0, offsets.en_cur.ofs, offsets.en_cur.type)
    NumPut(en.max,mapping_addr+0, offsets.en_max.ofs, offsets.en_max.type)
    NumPut(en.perc,mapping_addr+0,offsets.en_perc.ofs,offsets.en_perc.type)

    is_enemy := gdmap.is_enemy_under_cursor()
    if !is_enemy
        NumPut(0,mapping_addr+0,offsets.enemy_type.ofs,offsets.enemy_type.type)
    else
    {
        enemy_type := gdmap.get_target_type()
        enemy_grade := !InStr(enemy_type,"^") ? 0
                    : enemy_type = "{^w}" ? 1 
                    : enemy_type = "{^y}" ? 2
                    : enemy_type = "{^o}" ? 3
                    : enemy_type = "{^p}" ? 4
                    : enemy_type = "{^r}" ? 5 : 6
        NumPut(enemy_grade,mapping_addr+0,offsets.enemy_type.ofs,offsets.enemy_type.type)
        StrPut(enemy_type, mapping_addr+offsets.enemy_col.ofs, 12, Encoding := "UTF-8")
    }
    sleep 50
}
return

auto_heal_and_energy:
Critical
if !is_automation_allowed()
  return
if (get_health_perc() <= 50)
  send_key_now("e",300)
if (get_energy_perc() <= 40)
  send_key_now("r",300)
return