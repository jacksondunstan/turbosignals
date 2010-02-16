package
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.*;
	
	import org.osflash.signals.*;
	
	[SWF(backgroundColor=0xEEEADB, frameRate=30)]
	public class TestAlternativesPerformance extends Sprite
	{
		private var __testIndex:int;
		private var __testClasses:Array = [
			AS3Signals0Performance,
			AS3Signals1Performance,
			AS3Signals2Performance,
			AS3Signals3Performance,
			AS3Signals4Performance,
			AS3Signals5Performance,
			AS3Signals6Performance,
			AS3Signals7Performance,
			AS3Signals8Performance,
			AS3Signals9Performance,
			AS3Signals10Performance,
			EventPerformance
		];
		
		private static const FUNC_CALL_REPS:int = 1000000;
		private static const NUM_LISTENERS:int = 10;
		private var __logger:TextField = new TextField();
		
		public function TestAlternativesPerformance()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			__logger.autoSize = TextFieldAutoSize.LEFT;
			addChild(__logger);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function log(msg:*): void
		{
			__logger.appendText(msg + "\n");
		}
		
		private function onEnterFrame(ev:Event): void
		{
			new __testClasses[__testIndex](log, FUNC_CALL_REPS, NUM_LISTENERS);
			__testIndex++;
			if (__testIndex >= __testClasses.length)
			{
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
	}
}
