function onCreate()
    makeLuaSprite('bg', nil)
    makeGraphic('bg', 1280 * 2, 720 * 2, '333333')
    setScrollFactor('bg')
    screenCenter('bg')
    addLuaSprite('bg')
end

function onCreatePost()
    setScrollFactor('gf', 0.8, 0.95)
end
