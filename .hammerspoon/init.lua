--[ modifier keys ]
hyper = {'cmd'}
hyperStr = 'cmd'
shyper = {'cmd', 'shift'}
shyperModStr = 'shift'
ahyper = {'cmd', 'alt'}
ahyperModStr = 'alt'
chyper = {'cmd', 'ctrl'}
chyperModStr = 'ctrl'

local fastKeyStroke = function(modifiers, character)
  local event = require('hs.eventtap').event
  event.newKeyEvent(modifiers, string.lower(character), true):post()
  event.newKeyEvent(modifiers, string.lower(character), false):post()
end

--[ arrow keys ]
hs.fnutils.each({
  { key='h', mod={}, direction='left'},
  { key='j', mod={}, direction='down'},
  { key='k', mod={}, direction='up'},
  { key='l', mod={}, direction='right'},
}, function(hotkey)
  hs.hotkey.bind(
    chyper,
    hotkey.key,
    function() fastKeyStroke(hotkey.mod, hotkey.direction) end,
    nil,
    function() fastKeyStroke(hotkey.mod, hotkey.direction) end
  )
  end
)

--[ window snapping ]
windowSnap = {
  -- full
  full = {
    key = 'u',
    fn = function()
      moveWindow(0.0,0.0,1.0,1.0)
    end
  },
  -- halves
  left = {
    key = 'h',
    fn = function()
      moveWindow(0.0,0.0,0.5,1.0)
    end
  },
  right = {
    key = 'l',
    fn = function()
      moveWindow(0.5,0.0,0.5,1.0)
    end
  },
  down = {
    key = 'j',
    fn = function()
      moveWindow(0.0,0.5,1.0,0.5)
    end
  },
  up = {
    key = 'k',
    fn = function()
      moveWindow(0.0,0.0,1.0,0.5)
    end
  },
  -- quarters
  topLeft = {
    key = 'y',
    fn = function()
      moveWindow(0.0,0.0,0.5,0.5)
    end
  },
  topRight = {
    key = 'i',
    fn = function()
      moveWindow(0.5,0.0,0.5,0.5)
    end
  },
  bottomLeft = {
    key = 'n',
    fn = function()
      moveWindow(0.0,0.5,0.5,0.5)
    end
  },
  bottomRight = {
    key = 'm',
    fn = function()
      moveWindow(0.5,0.5,0.5,0.5)
    end
  },
}

hs.grid.setGrid('2x2')
hs.grid.setMargins('0x0')

function moveWindow(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w*x)
  f.y = max.y + (max.h*y)
  f.w = max.w*w
  f.h = max.h*h
  win:setFrame(f)
end

-- bind window snapping shortcuts
for panel, keyInfo in pairs(windowSnap) do
  hs.hotkey.bind(ahyper, keyInfo.key, function()
    keyInfo.fn()
  end)
end

-- [mouse movement]
mouseMvmnt = {
  left = {
    key = 'h',
    coords = { x=-1, y=0, },
  },
  down = {
    key = 'j',
    coords = { x=0, y=1, },
  },
  up = {
    key = 'k',
    coords = { x=0, y=-1, },
  },
  right = {
    key = 'l',
    coords = { x=1, y=0, },
  },
}
mvmntShort = 20
leftClick = 'y'
rightClick = 'u'
scrollUp = 'o'
scrollDown = 'i'

function moveMouse(coords) 
  local currentPos = hs.mouse.getAbsolutePosition()
  hs.mouse.setRelativePosition({
    x = currentPos.x + (coords.x * mvmntShort),
    y = currentPos.y + (coords.y * mvmntShort),
  })
end

function getFlags(e, keyStr)
  return e:getFlags()[keyStr]
end

-- allows holding key
local function catcher(event)
  -- listen for mouse movement
  if event:getFlags()[hyperStr]
    and getFlags(event, shyperModStr)
    and event:getCharacters() == mouseMvmnt.left.key
  then return true, {moveMouse(mouseMvmnt.left.coords)}
  elseif event:getFlags()[hyperStr]
    and getFlags(event, shyperModStr)
    and event:getCharacters() == mouseMvmnt.right.key
  then return true, {moveMouse(mouseMvmnt.right.coords)}
  elseif event:getFlags()[hyperStr]
    and getFlags(event, shyperModStr)
    and event:getCharacters() == mouseMvmnt.up.key
  then return true, {moveMouse(mouseMvmnt.up.coords)}
  elseif event:getFlags()[hyperStr]
    and getFlags(event, shyperModStr)
    and event:getCharacters() == mouseMvmnt.down.key
  then return true, {moveMouse(mouseMvmnt.down.coords)}

  -- mouse scroll
  elseif event:getFlags()[hyperStr]
    and getFlags(event, shyperModStr)
    and event:getCharacters() == scrollDown
  then return true, {hs.eventtap.event.newScrollEvent({0, -3}, {}, 'line')}
  elseif event:getFlags()[hyperStr]
    and getFlags(event, shyperModStr)
    and event:getCharacters() == scrollUp
  then return true, {hs.eventtap.event.newScrollEvent({0, 3}, {}, 'line')}

  -- mouse clicks
  elseif event:getFlags()[hyperStr]
    and getFlags(event, shyperModStr)
    and event:getCharacters() == leftClick
  then local currentpos = hs.mouse.getAbsolutePosition()
    return true, {hs.eventtap.leftClick(currentpos)}
  elseif event:getFlags()[hyperStr]
    and getFlags(event, shyperModStr)
    and event:getCharacters() == rightClick
  then local currentpos = hs.mouse.getAbsolutePosition()
    return true, {hs.eventtap.rightClick(currentpos)}
  end
end
fn_tapper = hs.eventtap.new({hs.eventtap.event.types.keyDown}, catcher):start()

--[ launch apps ]
function findOrLaunch(a)
  local app = hs.application.find(a)
  if not app then
    hs.application.launchOrFocus(a)
  end
  return hs.application.find(a)
end

hs.fnutils.each({
 {
    key = 'return',
    fn = function() 
      myTerm = findOrLaunch('iterm')
    end
  },
  -- {
  --   key = 'f',
  --   fn = function()
  --     ffox = findOrLaunch('firefox')
  --   end
  -- },
  {
    key = 'delete',
    fn = function()
      os.execute('pmset displaysleepnow')
    end 
  }
}, function(object) hs.hotkey.bind(shyper, object.key, object.fn) end)
