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
        pressTime = GetRunningTime()
        OutputLogMessage("%s\n", pressTime)
        
    elseif event == "MOUSE_BUTTON_RELEASED" and arg == 6 then
    
        OutputLogMessage("released\n")
        releaseTime = GetRunningTime()
        OutputLogMessage("%s %s -> ", releaseTime, pressTime)
        if (releaseTime - pressTime) < 250 then
            -- Close tab (Ctrl + W)
            OutputLogMessage("short press") 
            PressKey("lctrl")
            PressAndReleaseKey("w") 
            ReleaseKey("lctrl")
            OutputLogMessage('.\n')
        elseif (releaseTime - pressTime) > 1000 then
            -- Reopen closed tab (Ctrl + Shift + T)
            OutputLogMessage("very long press")
            PressKey("lctrl")
            PressKey("lshift")
            PressAndReleaseKey("t")
            ReleaseKey("lshift")
            ReleaseKey("lctrl")
            OutputLogMessage('.\n')
        else
            -- Browser Back
            OutputLogMessage("long press")
            PressKey("lalt")
            PressAndReleaseKey("left")
            ReleaseKey("lalt")
            OutputLogMessage('.\n')
        end
    end
end
