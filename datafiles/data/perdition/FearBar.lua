local currentBarPorcent = 0
local heightBar = 0
function onCreatePost()
    makeLuaSprite('FearBarImage','fearbarSatan',screenWidth - 100,100)
    scaleObject('FearBarImage',1.2,1.1)
    setObjectCamera('FearBarImage','hud')
    addLuaSprite('FearBarImage',true)


    makeLuaSprite('FearBarBg','fearbarBGSatan',getProperty('FearBarImage.x') + 16.80,getProperty('FearBarImage.y'))
    setObjectCamera('FearBarBg','hud')
    scaleObject('FearBarBg',0.89,1.1)
    addLuaSprite('FearBarBg',false)
    
    makeLuaSprite('FearBarBar','',getProperty('FearBarImage.x') + 20,getProperty('FearBarImage.y'))
    setObjectCamera('FearBarBar','hud')
    makeGraphic('FearBarBar',getProperty('FearBarBg.width')/2,getProperty('FearBarBg.height'),'FF0000')

    addLuaSprite('FearBarBar',false)
end
function onUpdate()
    if keyPressed('space') then
        currentBarPorcent = currentBarPorcent + 0.1
    end
    if currentBarPorcent == 0 then
        setGraphicSize('FearBarBar',getProperty('FearBarBg.width')/1.8 * getProperty('FearBarBg.scale.x'),0)
    else
        setGraphicSize('FearBarBar',getProperty('FearBarBg.width')/1.8 * getProperty('FearBarBg.scale.x'),getProperty('FearBarBg.height')/1.132* currentBarPorcent)
    end
    setProperty('FearBarBar.x',getProperty('FearBarBg.x') + 20)
    setProperty('FearBarBar.x',getProperty('FearBarBg.x') + 20)
    setProperty('FearBarBar.y',getProperty('FearBarImage.y') + 305 - getProperty('FearBarBar.height'))

    if currentBarPorcent > 1 then
        currentBarPorcent  = 1
    end
    if currentBarPorcent <= 0 then
        currentBarPorcent  = 0
        setGraphicSize('FearBarBar',getProperty('FearBarBg.width')/1.8 * getProperty('FearBarBg.scale.x'),0)
        setProperty('FearBarBar.visible',false)
    else
        setProperty('FearBarBar.visible',true)
    end
end
function opponentNoteHit()

    if currentBarPorcent < 1 then
        currentBarPorcent = currentBarPorcent + 0.0010
    end
end
function goodNoteHit()
    if currentBarPorcent > 0 then
        currentBarPorcent = currentBarPorcent - 0.001
    end
end
function noteMiss(id,dir,type,sustain)
    if type == '' then
        if currentBarPorcent < 1 then
            currentBarPorcent = currentBarPorcent + 0.0010
        end
    end
end
function onBeatHit()
    if curStep >= 1384 and curStep < 2143 then
        if getProperty('health') > 0.08 and currentBarPorcent < 1 or currentBarPorcent == 1 then
            setProperty('health',getProperty('health') - 0.046)
        end
    end
end