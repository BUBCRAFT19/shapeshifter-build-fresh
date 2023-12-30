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
        {color: FlxColor.RED, label: "a"},
        {color: FlxColor.BLUE, label: "b"},
        {color: FlxColor.YELLOW, label: "c"},
        {color: FlxColor.PINK, label: "d"}
    ];

    var leftWires:Array<Dynamic>; // Store the left wires for reference
    var draggedWire:FlxSprite; // Store the currently dragged wire
    var isMouseDown:Bool = false;
    var mouseButton:Int = -1;

    override public function create()
    {
        super.create();

        var backdrop:FlxSprite = new FlxSprite().makeGraphic(504, 504, FlxColor.GRAY);
        backdrop.screenCenter();
        add(backdrop);

        leftWires = wireProperties.copy(); // Create a copy for left side wires
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

            filledBarsPos[i][1] = leftWireY + 16; // Update filledBarsPos for the next iteration
        }

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

            filledBarsPos[i + 4][1] = rightWireY + 16; // Update filledBarsPos for the next iteration
        }

        // Make the HaxeFlixel mouse cursor visible
        FlxG.mouse.visible = true;

    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        // Check if the mouse button is pressed
        if (FlxG.mouse.pressed){
            if(!isMouseDown){
                onMouseDown(mouseButton, FlxG.mouse.x, FlxG.mouse.y);
                isMouseDown = true;
            }
        }else{
            //Mouse button released
            if(isMouseDown){
                isMouseDown = false;
                handleReleasedWire();
            }
        }

        // Check if the mouse button is released
        if(draggedWire != null){
            if(draggedWire.scale.x <= 5){
                draggedWire.scale.x = 5;
            }
            if(FlxG.mouse.justReleased){
                handleReleasedWire();
                    }        }


        if (FlxG.keys.justPressed.ESCAPE)
            MusicBeatState.switchState(new TitleState());
    }

    public function onMouseDown(button:Int, x:Int, y:Int):Void{
        //Check if the clicked wire is on the left side
        if(x>=filledBarsPos[0][0] && x <= filledBarsPos[3][0] + 48 && y >= filledBarsPos[0][1] && y <= filledBarsPos[3][1] + 16){
            var clickedWireIndex:Int = Math.floor((y-filledBarsPos[0][1])/16);
            var clickedWire:FlxSprite = getObjectByID(clickedWireIndex);

            draggedWire = new FlxSprite(clickedWire.x + 48, clickedWire.y).makeGraphic(5, 16, clickedWire.color);
            add(draggedWire);
        }
    }

    function getObjectByID(id:Int):FlxSprite
        {
            // Helper function to get the wire object by its ID
            for (obj in members)
            {
                if (Std.is(obj, FlxSprite))
                {
                    var sprite:FlxSprite = cast(obj, FlxSprite);
                    if (sprite.ID == id)
                        return sprite;
                }
            }
            return null;
        }
        
        

    function handleReleasedWire():Void{
        var rightWiresStartIndex:Int = 4;
        var rightWiresEndIndex:Int = 7;

        var connectToRight:Bool = FlxG.mouse.x >= filledBarsPos[rightWiresStartIndex][0] && FlxG.mouse.x <= filledBarsPos[rightWiresEndIndex][0] + 48 && FlxG.mouse.y >= filledBarsPos[rightWiresStartIndex][1] && FlxG.mouse.y <= filledBarsPos[rightWiresEndIndex][1] + 16;

        if (connectToRight)
            {
                var clickedWireIndex:Int = Math.floor((FlxG.mouse.y - filledBarsPos[rightWiresStartIndex][1]) / 16) + rightWiresStartIndex;
                var clickedWire:FlxSprite = getObjectByID(clickedWireIndex);
    
                if (draggedWire.color == clickedWire.color)
                {
                    trace("Light on for color: " + clickedWire.color);
                }
                else
                {
                    draggedWire.scale.x = 1;
                }
            }
            else
            {
                draggedWire.kill();
            }
            draggedWire = null;
    }

    // Custom shuffle function
    function shuffleArray<T>(arr:Array<T>):Array<T>
    {
        for (i in 0...arr.length)
        {
            var randomIndex = FlxG.random.int(i, arr.length - 1);
            var temp = arr[i];
            arr[i] = arr[randomIndex];
            arr[randomIndex] = temp;
        }
        return arr;
    }
}
