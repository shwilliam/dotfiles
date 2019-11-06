--[ modifier keys ]
shyper = {'cmd', 'shift'}
ahyper = {'cmd', 'alt'}

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
      myTerm = findOrLaunch('terminal')
    end
  },
  {
    key = 'delete',
    fn = function()
      os.execute('pmset displaysleepnow')
    end 
  }
}, function(object) hs.hotkey.bind(shyper, object.key, object.fn) end)
