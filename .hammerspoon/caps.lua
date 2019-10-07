-- @kbussell/ctrTap.lua
-- https://gist.github.com/kbussell/9d9f9f10032c5bbdec9dc2d2ce5259c2

local alert    = require("hs.alert")
local timer    = require("hs.timer")
local eventtap = require("hs.eventtap")

local events   = eventtap.event.types

local module   = {}

-- timeout for ctrol key
module.timeFrame = .25

-- what to do when the ctrl key has been tapped
module.action = function()
    eventtap.keyStroke({}, 'escape')
--    alert("esc")
end

local ctrlPressed = false

-- Synopsis:

-- what we're looking for is the ctrl key down event followed by
-- the key up within a short time frame with no other key or flag
-- change event before the specified time has passed

-- verify that *only* the ctrl key flag is being pressed
local onlyCtrl = function(ev)
    local result = ev:getFlags().ctrl
    for k,v in pairs(ev:getFlags()) do
        if k ~= "ctrl" and v then
            result = false
            break
        end
    end
    return result
end

-- verify that no modifier keys are being pressed
local noModifiers = function(ev)
    result = true
    for k,v in pairs(ev:getFlags()) do
        if v == true then
            result = false
            break
        end
    end
    return result
end

module.eventwatcher = eventtap.new({events.flagsChanged, events.keyDown}, function(ev)
    ev_type = ev:getType()

    if ev_type == events.flagsChanged then
        if onlyCtrl(ev) then
            module.countDownTimer = timer.doAfter(module.timeFrame, function()
                module.countDownTimer = nil
                ctrlPressed = false
            end)
            ctrlPressed = true
        elseif noModifiers(ev) then
            if ctrlPressed and module.action then
                module.action()
            end
        else
            ctrlPressed = false
        end
    elseif ev_type == events.keyDown then
        ctrlPressed = false
    end

    return false ;
end):start()


return module
