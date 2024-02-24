package states.stages;

import states.stages.objects.*;

class PLACEHOLDERWeek1Stage extends BaseStage
{
	override function create()
	{
		var sky:BGSprite = new BGSprite("PLACEHOLDERS/week1/polus_custom_sky", -400, -400, 0.5, 0.5);
		sky.setGraphicSize(Std.int(sky.width * 1.4));
		add(sky);

		var rocks:BGSprite = new BGSprite("PLACEHOLDERS/week1/polusrocks", -700, -300, 0.6, 0.6);
		rocks.updateHitbox();
		add(rocks);

		var hills:BGSprite = new BGSprite("PLACEHOLDERS/week1/polusHills", -1050, -180.55, 0.9, 0.9);
		hills.updateHitbox();
		add(hills);

		var warehouse:BGSprite = new BGSprite("PLACEHOLDERS/week1/polus_custom_lab", 50, -400, 1, 1);
		warehouse.updateHitbox();
		add(warehouse);

		var ground:BGSprite = new BGSprite("PLACEHOLDERS/week1/polus_custom_floor", -1350, 80, 1, 1);
		ground.updateHitbox();
		add(ground);
	}
	
	override function createPost()
	{
		var snow = new BGSprite("PLACEHOLDERS/week1/snow", 0, -250, 1, 1, ["cum"], true); // This is just how the animation was named :sob:
		snow.updateHitbox();
		snow.setGraphicSize(Std.int(snow.width * 2));
		add(snow);
	}
}