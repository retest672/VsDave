package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * shut up idiot im not bbpanzu hes a gay
 */
class EndingState extends FlxState
{

	var _ending:String;
	var _song:String;
	
	public function new(ending:String,song:String) 
	{
		super();
		_ending = ending;
		_song = song;
	}
	
	override public function create():Void 
	{
		super.create();
		var end:FlxSprite = new FlxSprite(0, 0);
		end.loadGraphic(Paths.image("dave/" + _ending));
		FlxG.sound.playMusic(Paths.music(_song),1,false);
		add(end);
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		
		
		new FlxTimer().start(8, endIt);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ENTER){
			endIt();
		}
		
	}
	
	
	public function endIt(e:FlxTimer=null){
		trace("ENDING");
		FlxG.switchState(new MainMenuState());
		FlxG.sound.playMusic(Paths.music('freakyMenu'));
	}
	
}