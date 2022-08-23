#NoEnv
#SingleInstance force

#Include PUM.ahk
#Include PUM_API.ahk

CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen

global IconsSize := 32

; Setup the main menu with a single item

PUMParams := {onselect:  "function"
            , onrbutton: "function"
            , onclose:   "function"}
global PM := new PUM(PUMParams)

Menu := PM.CreateMenu({iconssize:IconsSize})
Menu.Add({name:"Item", uid:"Right-click here to start"})

; Setup context menus

global ItemContextMenu := PM.CreateMenu({iconssize:IconsSize})
global MenuContextMenu := PM.CreateMenu({iconssize:IconsSize})

for each, Submenu in ["PasteItemMenu"
                     ,"AddItemMenu"
                     ,"AddSubmenuMenu"
                     ,"AddSeparatorLineMenu"
                     ,"PasteMenuMenu"]
{
   %Submenu% := PM.CreateMenu({iconssize:IconsSize})
   %Submenu%.Add({name:"Above Item", uid:A_Space})
   %Submenu%.Add({name:"Below Item", uid:A_Space})
}

ItemContextMenu.Add({name:"Cut Item"})
ItemContextMenu.Add({name:"Copy Item"})
ItemContextMenu.Add({name:"Paste Item", submenu:PasteItemMenu})
ItemContextMenu.Add({name:"Rename Item"})
ItemContextMenu.Add()
ItemContextMenu.Add({name:"Add New Item", submenu:AddItemMenu})
ItemContextMenu.Add({name:"Add New Submenu", submenu:AddSubmenuMenu})
ItemContextMenu.Add({name:"Add New Separator Line", submenu:AddSeparatorLineMenu})
ItemContextMenu.Add()
ItemContextMenu.Add({name:"Paste Menu", submenu:PasteMenuMenu})
ItemContextMenu.Add({name:"Attach Menu"})

for each, Submenu in ["MenuAddItemMenu"
                     ,"MenuAddSubmenuMenu"
                     ,"MenuAddSeparatorLineMenu"]
{
   %Submenu% := PM.CreateMenu({iconssize:IconsSize})
   %Submenu%.Add({name:"Above Submenu Owner", uid:A_Space})
   %Submenu%.Add({name:"Below Submenu Owner", uid:A_Space})
}

MenuContextMenu.Add({name:"Cut Menu"})
MenuContextMenu.Add({name:"Detach Menu"})
MenuContextMenu.Add({name:"Rename Menu"})
MenuContextMenu.Add()
MenuContextMenu.Add({name:"Add New Item", submenu:MenuAddItemMenu})
MenuContextMenu.Add({name:"Add New Submenu", submenu:MenuAddSubmenuMenu})
MenuContextMenu.Add({name:"Add New Separator Line", submenu:MenuAddSeparatorLineMenu})

; Position the menu in the middle, near the top of the screen

MenuX := A_ScreenWidth//2
MenuY := A_ScreenHeight//4
Gosub F3
Return

; Hotkey to show the main menu

F3::
Loop {
   ShowAgain := false
   if (item := Menu.Show(MenuX, MenuY))
      MsgBox % item.name
} Until not ShowAgain
Return

Esc::ExitApp

; Function to show the uid on select and show context menus on right-click

function(msg, obj) {
   global ShowAgain
   static SavedItemParams, SavedMenuParams, SavedSubmenu
   static Message := "Right-click here to perform actions on`nthis menu and the item that opens this`nsubmenu.`n`n"
                   . "Right click on the separator line below`nto add the first item to this submenu."
   
   if msg = onselect
   {  if (obj.menu <> ItemContextMenu && obj.menu <> MenuContextMenu && obj.uid <> A_Space) {
         rect := obj.GetRECT()
         ToolTip, % obj.name ? obj.uid : "Separator Line", % rect.right, % rect.top
      }
   }
   else if msg = onrbutton
   {  ToolTip
      Pos := obj.GetPos()
      MouseGetPos, MouseX, MouseY
      if (obj.menu.owner && Pos = 0) {  ; First item in a submenu
         if (contextitem := MenuContextMenu.Show(MouseX, MouseY, "context")) {
            if (contextitem.name = "Cut Menu") {
               SavedMenuParams := obj.menu.owner.GetParams()
               obj.menu.owner.Detach()
               ;
               ; Issue: The menu does not disappear when it gets detached from the menu.
               ;
            } else if (contextitem.name = "Detach Menu") {
               SavedSubmenu := obj.menu.owner.submenu
               obj.menu.Detach()
               ;
               ; Issue: The menu does not disappear when it gets detached from the menu.
               ; The arrow next to the item that opens the menu does disappear but the menu keeps showing.
               ; obj.menu.owner.RemoveSubMenu() ; This doesn't work either.
               ;
            } else if (contextitem.name = "Rename Menu") {
               Gui, +AlwaysOnTop +OwnDialogs
               InputBox, Name, , Enter the menu's new name:, , 250, 120, , , , , % obj.name
               obj.menu.owner.SetParams({name:Name})
               obj.SetParams({name:Name})
               ShowAgain := true
            } else if (contextitem.menu.owner.name = "Add New Item") {
               Gui, +AlwaysOnTop +OwnDialogs
               InputBox, Name, , Enter the name of the new item:, , 250, 120, , , , , New Item
               Pos := contextitem.name = "Above Submenu Owner" ? obj.menu.owner.GetPos() : obj.menu.owner.GetPos()+1
               obj.menu.owner.menu.Add({name:Name, uid:Name}, Pos)
               ShowAgain := true
            } else if (contextitem.menu.owner.name = "Add New Submenu") {
               Gui, +AlwaysOnTop +OwnDialogs
               InputBox, Name, , Enter the name of the new submenu:, , 250, 120, , , , , New Submenu
               submenu := PM.CreateMenu({iconssize:IconsSize})
               submenu.Add({name:Name, uid:Message})
               submenu.Add()
               Pos := contextitem.name = "Above Submenu Owner" ? obj.menu.owner.GetPos() : obj.menu.owner.GetPos()+1
               obj.menu.owner.menu.Add({name:Name, submenu:submenu}, Pos)
               ShowAgain := true
            } else if (contextitem.menu.owner.name = "Add New Separator Line") {
               Pos := contextitem.name = "Above Submenu Owner" ? obj.menu.owner.GetPos() : obj.menu.owner.GetPos()+1
               obj.menu.owner.menu.Add(, Pos)
               ;
               ; Issue: I am not sure why the main menu closes when I select this item.
               ; It doesn't close when I select any of the other items.
               ;
            }
         }
      } else {  ; All other items
         if (contextitem := ItemContextMenu.Show(MouseX, MouseY, "context")) {
            if (contextitem.name = "Cut Item") {
               SavedItemParams := obj.GetParams()
               obj.Destroy()
            } else if (contextitem.name = "Copy Item") {
               SavedItemParams := obj.GetParams()
            } else if (contextitem.menu.owner.name = "Paste Item") {
               if SavedItemParams {
                  Pos += contextitem.name = "Above Item" ? 0 : 1
                  obj.menu.Add(SavedItemParams, Pos)
                  SavedItemParams := ""
               } else {
                  MsgBox, 0x40030, , No item has been cut or copied yet!`nThe menu will show again.
                  ShowAgain := true
               }
            } else if (contextitem.name = "Rename Item") {
               Gui, +AlwaysOnTop +OwnDialogs
               InputBox, Name, , Enter the item's new name:, , 250, 120, , , , , % obj.name
               obj.SetParams({name:Name, uid:Name})
               ShowAgain := true
            } else if (contextitem.menu.owner.name = "Add New Item") {
               Gui, +AlwaysOnTop +OwnDialogs
               InputBox, Name, , Enter the name of the new item:, , 250, 120, , , , , New Item
               Pos += contextitem.name = "Above Item" ? 0 : 1
               obj.menu.Add({name:Name, uid:Name}, Pos)
               ShowAgain := true
            } else if (contextitem.menu.owner.name = "Add New Submenu") {
               Gui, +AlwaysOnTop +OwnDialogs
               InputBox, Name, , Enter the name of the new submenu:, , 250, 120, , , , , New Submenu
               submenu := PM.CreateMenu({iconssize:IconsSize})
               submenu.Add({name:Name, uid:Message})
               submenu.Add()
               Pos += contextitem.name = "Above Item" ? 0 : 1
               obj.menu.Add({name:Name, submenu:submenu}, Pos)
               ShowAgain := true
            } else if (contextitem.menu.owner.name = "Add New Separator Line") {
               Pos += contextitem.name = "Above Item" ? 0 : 1
               obj.menu.Add(, Pos)
            } else if (contextitem.menu.owner.name = "Paste Menu") {
               if SavedMenuParams {
                  Pos += contextitem.name = "Above Item" ? 0 : 1
                  obj.menu.Add(SavedMenuParams, Pos)
                  SavedMenuParams := ""
               } else {
                  MsgBox, 0x40030, , No menu has been cut or copied yet!`nThe menu will show again.
                  ShowAgain := true
               }
            } else if (contextitem.name = "Attach Menu") {
               if SavedSubmenu {
                  obj.SetParams({submenu:SavedSubmenu})
                  SavedSubmenu := ""
               } else {
                  MsgBox, 0x40030, , No menu has been detached yet!`nThe menu will show again.
                  ShowAgain := true
               }
            }
         }
      }
      Sleep 0 ; Required to prevent the menu from closing
      %A_ThisFunc%("onselect", obj)
   }
   else if msg = onclose
      ToolTip
}
