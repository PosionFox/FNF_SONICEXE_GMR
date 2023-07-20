local WindowDance = false
local SineElap = 0
local DanceAmt = 0 -- I recommend 3

function onCreate()
    setPropertyFromClass('openfl.Lib', 'application.window.y', 24)
    setPropertyFromClass('openfl.Lib', 'application.window.x', -200)
    windowy = getPropertyFromClass("openfl.Lib", "application.window.y")
    windowx = getPropertyFromClass("openfl.Lib", "application.window.x")
end

function onStepHit()
    if curStep >= 1143 and curStep <= 1143 then
        WindowDance = true
    end
    if curStep == 1446 then
        WindowDance = false
    end
end

function onUpdatePost(elapsed)
    SineElap = SineElap + (elapsed * DanceAmt)

    if WindowDance == true then
        setPropertyFromClass('openfl.Lib', 'application.window.y', 1000*math.sin(SineElap)/10+windowy)
        setPropertyFromClass('openfl.Lib', 'application.window.x', 1000*math.cos(SineElap)/5+windowx)
    end
end    