function onCreate()
	makeLuaSprite('newsky', 'maroon/newsky', 200, 300);
	addLuaSprite('newsky', false)
	scaleObject('newsky', 0.8, 0.8)

	makeLuaSprite('newsky2', 'maroon/newcloud', 100, 170);
	addLuaSprite('newsky2', false)
	scaleObject('newsky2', 0.8, 0.8)

	makeLuaSprite('newstage', 'maroon/newstage', -200, -200);
	addLuaSprite('newstage', false)

	makeAnimatedLuaSprite('snowback', 'maroon/snowback', 500, 400)
	addAnimationByPrefix('snowback', 'snowback', 'Snow group instance', 41, true)
	objectPlayAnimation('snowback', 'snowback', false)
	addLuaSprite('snowback', false)
	scaleObject('snowback', 2, 2)

	makeAnimatedLuaSprite('snowfront', 'maroon/snowfront', 400, 400)
	addAnimationByPrefix('snowfront', 'snowfront', 'snow fall front instanc', 41, true)
	objectPlayAnimation('snowfront', 'snowfront', false)
	addLuaSprite('snowfront', true)
	scaleObject('snowfront', 2, 2)

	makeLuaSprite('newoverlay', 'maroon/newoverlay', -200, -200);
	addLuaSprite('newoverlay', true)

	doTweenAlpha('woah', 'snowfront', 0.7, 0.5, 'linear')
	doTweenAlpha('woah2', 'snowback', 0.7, 0.5, 'linear')
end
