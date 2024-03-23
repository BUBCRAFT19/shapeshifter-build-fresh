function onCreate()
    makeAnimatedLuaSprite('wallBP', 'wallBP', -450, -600)
    addAnimationByPrefix('wallBP', 'wallBP', 'Back wall and lava', 17, true)
    objectPlayAnimation('wallBP', 'wallBP', false)
    addLuaSprite('wallBP', false)

    makeAnimatedLuaSprite('bubbles', 'firebubbles', 800, 400)
    addAnimationByPrefix('bubbles', 'woah', 'Fire Overlay', 24, true)
    objectPlayAnimation('bubbles', 'woah', false)
    addLuaSprite('bubbles', true)

    makeAnimatedLuaSprite('bubbles2', 'bubbles', 800, 920)
    addAnimationByPrefix('bubbles2', 'woah2', 'Lava Bubbles', 24, true)
    objectPlayAnimation('bubbles2', 'woah2', false)
    addLuaSprite('bubbles2', false)

    makeLuaSprite('platform2', 'LAVA OVERLAY IN GAME', 300, 0);
    addLuaSprite('platform2', true)
    scaleObject('platform2', 1.5, 1.5)

    makeLuaSprite('platform', 'platform', 950, 650);
    setScrollFactor('platform', 0.9, 0.9);
    addLuaSprite('platform', false)
    setBlendMode('platform2', 'add')
end

function onStepHit()
    if curStep == 1568 then
        makeLuaSprite('grid', 'grid', -100, 0);
        addLuaSprite('grid', true)
        setObjectCamera('grid', 'hud')
        scaleObject('grid', 0.6, 0.6)
        doTweenAlpha('woah2', 'grid', 0.5, 0.5, 'linear')
        setBlendMode('grid', 'add')
    end
end

function onUpdate()
    setProperty("gf.alpha", 0)

    if del > 0 then
        del = del - 1
    end
    if del2 > 0 then
        del2 = del2 - 1
    end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom', 0.6)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos', xx - ofs, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos', xx + ofs, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos', xx, yy - ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos', xx, yy + ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos', xx - ofs, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos', xx + ofs, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos', xx, yy - ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos', xx, yy + ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos', xx, yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos', xx, yy)
            end
        else
            setProperty('defaultCamZoom', 0.7)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos', xx2 - ofs, yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos', xx2 + ofs, yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos', xx2, yy2 - ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos', xx2, yy2 + ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos', xx2, yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos', xx2, yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos', '', '')
    end
end
