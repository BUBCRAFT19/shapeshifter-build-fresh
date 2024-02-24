package states.stages;

import states.stages.objects.*;

class DuStage extends BaseStage
{
	override function create()
	{
		var duBG:FlxSprite = new FlxSprite(-500, -500);
		if (PlayState.SONG.song.toLowerCase() == "mondaysong") // This is still tbd, so I'll just change this later ;)
			duBG.makeGraphic(4000, 4000, FlxColor.GRAY);
		else
			duBG.makeGraphic(4000, 4000, FlxColor.WHITE);

		duBG.scrollFactor.set(0, 0);
		add(duBG);
	}
}