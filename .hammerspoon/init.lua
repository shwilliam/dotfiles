--[ modifier keys ]
hyper = {'cmd'}
hyperStr = 'cmd'
shyper = {'cmd', 'shift'}
shyperModStr = 'shift'

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
mvmntShort = 30
leftClick = 'y'
rightClick = 'u'

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
  -- listen for window snapping shortcuts
  if getFlags(event, hyperStr)
    and getFlags(event, shyperModStr)
    and event:getCharacters() == windowSnap.full.key
  then return windowSnap.full.fn()
  elseif getFlags(event, hyperStr)
    and getFlags(event, shyperModStr)
    and event:getCharacters() == windowSnap.left.key
  then return windowSnap.left.fn()
  elseif getFlags(event, hyperStr)
    and getFlags(event, shyperModStr)
    and event:getCharacters() == windowSnap.right.key
  then return windowSnap.right.fn()
  elseif getFlags(event, hyperStr)
    and getFlags(event, shyperModStr)
    and event:getCharacters() == windowSnap.down.key
  then return windowSnap.down.fn()
  elseif getFlags(event, hyperStr)
    and getFlags(event, shyperModStr)
    and event:getCharacters() == windowSnap.up.key
  then return windowSnap.up.fn()
  elseif getFlags(event, hyperStr)
    and getFlags(event, shyperModStr)
    and event:getCharacters() == windowSnap.topLeft.key
  then return windowSnap.topLeft.fn()
  elseif getFlags(event, hyperStr)
    and getFlags(event, shyperModStr)
    and event:getCharacters() == windowSnap.topRight.key
  then return windowSnap.topRight.fn()
  elseif getFlags(event, hyperStr)
    and getFlags(event, shyperModStr)
    and event:getCharacters() == windowSnap.bottomLeft.key
  then return windowSnap.bottomLeft.fn()
  elseif getFlags(event, hyperStr)
    and getFlags(event, shyperModStr)
    and event:getCharacters() == windowSnap.bottomRight.key
  then return windowSnap.bottomRight.fn()

  -- listen for mouse movement
  elseif event:getFlags()[hyperStr] and event:getCharacters() == mouseMvmnt.left.key then
    return true, {moveMouse(mouseMvmnt.left.coords)}
  elseif event:getFlags()[hyperStr] and event:getCharacters() == mouseMvmnt.right.key then
    return true, {moveMouse(mouseMvmnt.right.coords)}
  elseif event:getFlags()[hyperStr] and event:getCharacters() == mouseMvmnt.up.key then
    return true, {moveMouse(mouseMvmnt.up.coords)}
  elseif event:getFlags()[hyperStr] and event:getCharacters() == mouseMvmnt.down.key then
    return true, {moveMouse(mouseMvmnt.down.coords)}
    
  -- mouse scroll
  elseif event:getFlags()[hyperStr] and event:getCharacters() == 'i' then
    return true, {hs.eventtap.event.newScrollEvent({0, -3}, {}, 'line')}
  elseif event:getFlags()[hyperStr] and event:getCharacters() == 'o' then
    return true, {hs.eventtap.event.newScrollEvent({0, 3}, {}, 'line')}

  -- mouse clicks
  elseif event:getFlags()[hyperStr] and event:getCharacters() == leftClick then
    local currentpos = hs.mouse.getAbsolutePosition()
    return true, {hs.eventtap.leftClick(currentpos)}
  elseif event:getFlags()[hyperStr] and event:getCharacters() == rightClick then
    local currentpos = hs.mouse.getAbsolutePosition()
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
