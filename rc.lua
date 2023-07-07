

-- $HOME/.config/termit/rc.lua

colormaps = require("termit.colormaps")
utils = require("termit.utils")

defaults = {}
defaults.windowTitle = 'Termit'
defaults.startMaximized = false
defaults.hideTitlebarWhenMaximized = true
defaults.tabName = 'Terminal'
defaults.encoding = 'UTF-8'
defaults.wordCharExceptions = '- .,_/'
defaults.font = 'Liberation Mono Regular 16'
defaults.foregroundColor = 'black'
defaults.backgroundColor = 'white'
defaults.showScrollbar = true
defaults.hideSingleTab = true
defaults.hideTabbar = false
defaults.showBorder = true
defaults.hideMenubar = true
defaults.fillTabbar = true
defaults.scrollbackLines = 4096
defaults.geometry = '125x29'
defaults.allowChangingTitle = true
defaults.backspaceBinding = 'AsciiBksp'
defaults.deleteBinding = 'EraseDel'
defaults.cursorBlinkMode = 'BlinkOff'
defaults.cursorShape = 'Block'
defaults.tabPos = 'Right'
defaults.setStatusbar = function (tabInd)
    tab = tabs[tabInd]
    if tab then
        return tab.encoding..'  Bksp: '..tab.backspaceBinding..'  Del: '..tab.deleteBinding
    end
    return ''
end
defaults.colormap = {
  [1] = "#AA0000",
  [2] = "#00AA00",
  [3] = "#AA5500",
  [4] = "#0000AA",
  [5] = "#AA00AA",
  [6] = "#00AAAA",
  [7] = "#AAAAAA",
  [8] = "#555555",
  [9] = "#FF5555",
  [10] = "#55FF55",
  [11] = "#FFFF55",
  [12] = "#5555FF",
  [13] = "#FF55FF",
  [14] = "#55FFFF",
  [15] = "#FFFFFF",
  [16] = "#000000"
}

defaults.matches = {}
defaults.tabs = {}
setOptions(defaults)

bindKey('Ctrl-Page_Up', prevTab)
bindKey('Ctrl-Page_Down', nextTab)
bindKey('Ctrl-F', findDlg)
bindKey('Ctrl-w', closeTab)
bindKey('CtrlShift-c', copy)
bindKey('CtrlShift-v', paste)

setKbPolicy('keycode')

userMenu = {}

mi = {}
mi.name = 'Bash /tmp'
mi.action = function ()
    tabInfo = {}
    tabInfo.title = 'Bash /tmp'
    tabInfo.command = 'bash'
    tabInfo.encoding = 'UTF-8'
    tabInfo.workingDir = '/tmp'
    tabInfo.backspaceBinding = 'AsciiBksp'
    tabInfo.deleteBinding = 'EraseDel'
    openTab(tabInfo)
end

table.insert(userMenu, {name='Toggle Menubar', action=function () toggleMenubar() end})
table.insert(userMenu, {name='Toggle Tabbar', action=function () toggleTabbar()  end})
table.insert(userMenu, mi)
table.insert(userMenu, {name='Reconfigure', action=reconfigure, accel='Ctrl-r'})
table.insert(userMenu, {name='Find Next', action=findNext, accel='Alt-n'})
table.insert(userMenu, {name='Find Prev', action=findPrev, accel='Alt-p'})

function changeTabFontSize(delta)
    tab = tabs[currentTabIndex()]
    fontSize = math.abs(math.floor(tonumber(string.sub(tab.font, string.find(tab.font, '%d+$'))) + 0.5))
    if fontSize < 5 then
      fontSize = 5
    elseif fontSize > 72 then
      fontSize = 72
    end
    setTabFont(string.sub(tab.font, 1, string.find(tab.font, '%d+$') - 1)..(fontSize + delta))
end

-- bindKey('CtrlShift-plus', function () changeTabFontSize(1) end)
-- bindKey('CtrlShift-minus', function () changeTabFontSize(-1) end)
-- bindKey('CtrlShift-0', function () setTabFont('Liberation Mono Regular 16') end)
-- bindKey('CtrlShift-KP_Add', function () changeTabFontSize(1) end)
-- bindKey('CtrlShift-KP_Subtract', function () changeTabFontSize(-1) end)
-- bindKey('CtrlShift-KP_Insert', function () setTabFont('Liberation Mono Regular 16') end)
bindKey('Ctrl-KP_Add', function () changeTabFontSize(1) end)
bindKey('Ctrl-KP_Subtract', function () changeTabFontSize(-1) end)
bindKey('Ctrl-KP_Multiply', function () setTabFont('Liberation Mono Regular 16') end)

table.insert(userMenu, {name='Increase Font Size', action=function () changeTabFontSize(1) end})
table.insert(userMenu, {name='Decrease Font Size', action=function () changeTabFontSize(-1) end})
table.insert(userMenu, {name='Move Tab Left', action=function () setTabPos(currentTabIndex() - 1) end})
table.insert(userMenu, {name='Move Tab Right', action=function () setTabPos(currentTabIndex() + 1) end})
table.insert(userMenu, {name='Close Tab', action=closeTab})
table.insert(userMenu, {name='User Quit', action=quit})

addMenu(userMenu, "User Menu")
addPopupMenu(userMenu, "User Menu")

addMenu(utils.encMenu(), "Encodings")
addPopupMenu(utils.encMenu(), "Encodings")

