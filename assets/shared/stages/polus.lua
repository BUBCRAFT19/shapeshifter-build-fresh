function onCreate()
	makeLuaSprite('MOOGU_bg', 'MOOGU_bg', -600, -550);
	setScrollFactor('MOOGU_bg', 0.9, 0.9);
	addLuaSprite('MOOGU_bg', false);
	scaleObject('MOOGU_bg', 1.2, 1.2)

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
