function OnEvent(event, arg)
    if arg then 
      OutputLogMessage(event.." "..arg.."\n")
    else
      OutputLogMessage(event.."\n")
    end
  
    -- if (event == 'PROFILE_ACTIVATED') then        
    --     EnablePrimaryMouseButtonEvents(true)
    -- end
    
    if event == "MOUSE_BUTTON_PRESSED" and arg == 6 then
        OutputLogMessage("pressed\n")
        pressTime = GetRunningTime()  -- Get current time
        OutputLogMessage("%s\n", pressTime)
        
    elseif event == "MOUSE_BUTTON_RELEASED" and arg == 6 then
    
        OutputLogMessage("released\n")
        releaseTime = GetRunningTime()
        OutputLogMessage("%s %s -> ", releaseTime, pressTime)
        if (releaseTime - pressTime) < 250 then  -- Short press (<500ms)
            OutputLogMessage("short press")
            PressKey("lalt")  -- Hold Alt   
            PressAndReleaseKey("left")  -- Press Left Arrow
            ReleaseKey("lalt")  -- Release Alt
            OutputLogMessage('.\n')

        else  -- Long press (>=500ms)
            OutputLogMessage("long press")
            PressKey("lctrl")
            PressAndReleaseKey("w")  -- Example: Close tab (Ctrl + W)
            ReleaseKey("lctrl")
            OutputLogMessage('.\n')
        end
    end
end
