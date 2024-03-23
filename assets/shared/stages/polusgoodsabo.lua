local xx = 470;
local yy = 100;
local xx2 = 820;
local yy2 = 100;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
    makeLuaSprite('MOOGU_bg3', 'red/polus_custom_sky', -1000, -800);
    addLuaSprite('MOOGU_bg3', false);
    scaleObject('MOOGU_bg3', 1.5, 1.5)

    makeLuaSprite('MOOGU_bg6', 'red/polusrocks', -500, -800);
    addLuaSprite('MOOGU_bg6', false);

    makeLuaSprite('MOOGU_bg4', 'red/polusGround', -1600, -50);
    addLuaSprite('MOOGU_bg4', false);

    makeLuaSprite('MOOGU_bg5', 'red/polusHills', -1000, -350);
    addLuaSprite('MOOGU_bg5', false);


    makeLuaSprite('MOOGU_bg2', 'red/polus_custom_lab', 80, -630);
    addLuaSprite('MOOGU_bg2', false);
    scaleObject('MOOGU_bg2', 1., 1)

    makeLuaSprite('MOOGU_bg', 'red/polus_custom_floor', -1500, -150);
    addLuaSprite('MOOGU_bg', false);

    makeAnimatedLuaSprite('snowback', 'snowback', -600, -550)
    addAnimationByPrefix('snowback', 'snowback', 'Snow group instance', 33, true)
    objectPlayAnimation('snowback', 'snowback', false)
    addLuaSprite('snowback', false)
    scaleObject('snowback', 2, 2)

    makeAnimatedLuaSprite('snowfront', 'snowfront', -600, -550)
    addAnimationByPrefix('snowfront', 'snowfront', 'snow fall front instanc', 33, true)
    objectPlayAnimation('snowfront', 'snowfront', false)
    addLuaSprite('snowfront', true)
    scaleObject('snowfront', 2, 2)

    doTweenAlpha('woah', 'snowfront', 0.6, 0.5, 'linear')
    doTweenAlpha('woah2', 'snowback', 0.6, 0.5, 'linear')
end

function onUpdate()
    if del > 0 then
        del = del - 1
    end
    if del2 > 0 then
        del2 = del2 - 1
    end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom', 0.75)
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
            setProperty('defaultCamZoom', 0.75)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos', xx2, yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos', xx2, yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos', '', '')
    end
end
