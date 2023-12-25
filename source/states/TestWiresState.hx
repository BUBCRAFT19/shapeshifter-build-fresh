package states;

class TestWiresState extends MusicBeatState
{
    var filledBarsPos:Array<Array<Float>> = [
        [4, 80],
        [4, 184],
        [4, 288],
        [4, 390],
        [470, 80],
        [470, 184],
        [470, 288],
        [470, 390]
    ];
    var wireProperties:Array<Dynamic> = [
        {color: FlxColor.RED, label: "△"},
        {color: FlxColor.BLUE, label: "✕"},
        {color: FlxColor.YELLOW, label: "〇"},
        {color: FlxColor.PINK, label: "☆"}
    ];

    // Custom shuffle function
    function shuffleArray<T>(arr:Array<T>):Array<T> {
        for (i in 0...arr.length) {
            var randomIndex = FlxG.random.int(i, arr.length - 1);
            var temp = arr[i];
            arr[i] = arr[randomIndex];
            arr[randomIndex] = temp;
        }
        return arr;
    }

    override public function create()
    {
        super.create();

        var backdrop:FlxSprite = new FlxSprite().makeGraphic(504, 504, FlxColor.GRAY);
        backdrop.screenCenter();
        add(backdrop);

        var leftWires:Array<Dynamic> = wireProperties.copy(); // Create a copy for left side wires
		
        // Shuffle wire colors for the left side to avoid repeating colors
        shuffleArray(leftWires);

        for (i in 0...8)
        {
            var yellowBar:FlxSprite = new FlxSprite(backdrop.x + filledBarsPos[i][0], backdrop.y + filledBarsPos[i][1]).makeGraphic(30, 12, FlxColor.YELLOW);
            yellowBar.ID = i;
            add(yellowBar);
        }

        var wiresLeft = 4;

        for (i in 0...4)
        {
            var randomWireIndex = FlxG.random.int(0, wiresLeft);
            var randomWire = leftWires.pop(); // Take the last element to avoid repetition
            wiresLeft--;

            var leftWireX = backdrop.x + filledBarsPos[i][0];
            var leftWireY = backdrop.y + filledBarsPos[i][1] + 15;

            var leftWire:FlxSprite = new FlxSprite(leftWireX, leftWireY).makeGraphic(48, 16, randomWire.color);
            leftWire.ID = i;
            add(leftWire);

            var leftWireText:FlxText = new FlxText(leftWireX, leftWireY, 48, randomWire.label, 14);
            leftWireText.setFormat(null, 14, FlxColor.WHITE, FlxTextAlign.CENTER);
            leftWireText.ID = i;
            add(leftWireText);

            // Update filledBarsPos for the next iteration
            filledBarsPos[i][1] = leftWireY + 16;
        }

        // Right side wires in a fixed order (Red, Blue, Yellow, Pink)
        for (i in 0...4)
        {
            var rightWireX = backdrop.x + filledBarsPos[i + 4][0] - 18; // Adjust x-position for the right side (mirrored from the left side)
            var rightWireY = backdrop.y + filledBarsPos[i + 4][1] + 15;

            var rightWire:FlxSprite = new FlxSprite(rightWireX, rightWireY).makeGraphic(48, 16, wireProperties[i].color);
            rightWire.ID = i + 4; // Start ID from 4 to avoid conflicts with left wires
            add(rightWire);

            var rightWireText:FlxText = new FlxText(rightWireX, rightWireY, 48, wireProperties[i].label, 14);
            rightWireText.setFormat(null, 14, FlxColor.WHITE, FlxTextAlign.CENTER);
            rightWireText.ID = i + 4; // Start ID from 4 to avoid conflicts with left wires
            add(rightWireText);

            // Update filledBarsPos for the next iteration
            filledBarsPos[i + 4][1] = rightWireY + 16;
        }
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
            MusicBeatState.switchState(new TitleState());
    }
}
