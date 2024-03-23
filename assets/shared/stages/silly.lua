function onCreate()
    makeLuaSprite('bg', nil)
    makeGraphic('bg', 1280 * 1.2, 720 * 1.2, 'FFFFFF')
    runHaxeCode([[
        game.modchartSprites.get('bg').shader = new FlxRuntimeShader(File.getContent('assets/shared/shaders/bg.frag'));
    ]])
    setSpriteShader('bg', 'bg')
    setShaderSampler2D('bg', 'bg', 'earth_2')
    setScrollFactor('bg')
    screenCenter('bg')
    addLuaSprite('bg')

    makeLuaSprite('suelo', 'floor')
    --makeGraphic('suelo', 600, 150, 'FFFFFF')
    runHaxeCode([[
        game.modchartSprites.get('suelo').shader = new FlxRuntimeShader(File.getContent('assets/shared/shaders/suelo.frag'));
    ]])
    setSpriteShader('suelo', 'suelo')
    scaleObject('suelo', 4, 1)
    addLuaSprite('suelo')
    setProperty('suelo.x', -550)
    setProperty('suelo.y', 780)

    makeLuaSprite('blum')
    runHaxeCode([[
        game.modchartSprites.get('blum').shader = new FlxRuntimeShader(File.getContent('assets/shared/shaders/hack.frag'));
        game.camGame.setFilters([/*new ShaderFilter(new FlxRuntimeShader(File.getContent('assets/shared/shaders/blum.frag'))), */new ShaderFilter(game.modchartSprites.get('blum').shader)]);
    ]])
    setShaderFloat('blum', 'amount', 0.2)
end

function onCreatePost()
    setProperty('boyfriend.scrollFactor.x', 1.05)
end

local iTime = 0
function onUpdate(elapsed)
    setShaderFloat('bg', 'iTime', iTime)
    setShaderFloat('suelo', 'shit', (getProperty('camGame.scroll.x') / 1280) / 2)
    iTime = iTime + elapsed
end
