function onCreate()
    makeLuaSprite('bg', 'bananun', -500, -500)
    scaleObject('bg', 0.7, 0.7)
    addLuaSprite('bg')

    makeLuaSprite('gato', 'tanga')
    scaleObject('gato', 0.7, 0.7)
    addLuaSprite('gato')

    --makeLuaSprite('bg', nil)
    -- makeGraphic('bg', 1280*1.2, 720*1.2, 'FFFFFF')
    --[[runHaxeCode([[
        game.modchartSprites.get('bg').shader = new FlxRuntimeShader(File.getContent('assets/shared/shaders/bg.frag'));
    ]]
       --)
    --[[setSpriteShader('bg', 'bg')
    setShaderSampler2D('bg', 'bg', 'earth_2')
    setScrollFactor('bg')
    screenCenter('bg')
    addLuaSprite('bg')

    makeLuaSprite('suelo', '')
    makeGraphic('suelo', 600, 150, 'FFFFFF')]]
    --[[runHaxeCode([[
        game.modchartSprites.get('suelo').shader = new FlxRuntimeShader(File.getContent('assets/shared/shaders/suelo.frag'));
    ]]
       --)
    --[[setSpriteShader('suelo', 'suelo')
    scaleObject('suelo', 4, 1)
    addLuaSprite('suelo')
    setProperty('suelo.x', -550)
    setProperty('suelo.y', 780)

    makeLuaSprite('blum')
    --[[runHaxeCode([[
        game.modchartSprites.get('blum').shader = new FlxRuntimeShader(File.getContent('assets/shared/shaders/bloom.frag'));
        game.camGame.setFilters([/*new ShaderFilter(new FlxRuntimeShader(File.getContent('assets/shared/shaders/blum.frag'))), */new ShaderFilter(game.modchartSprites.get('blum').shader)]);
    ]]
       --)

    runHaxeCode([[
        game.camGame.setFilters([new ShaderFilter(new FlxRuntimeShader(File.getContent('assets/shared/shaders/hack.frag'))), new ShaderFilter(new FlxRuntimeShader(File.getContent('assets/shared/shaders/grayscaleBars.frag')))]);
    ]])
end

local iTime = -10
function onUpdate(elapsed)
    setProperty('gato.x', (math.sin((iTime * math.pi) / 15) * 1500) + 500)
    setProperty('gato.y', -math.abs(math.sin(getProperty('gato.x') / 128) * 200) + 200)
    setProperty('gato.angle', getProperty('gato.x') / 2)

    iTime = iTime + elapsed
end
