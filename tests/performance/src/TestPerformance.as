/*
The MIT License

Copyright (c) 2010 Jackson Dunstan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
package
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	[SWF(backgroundColor=0xEEEADB, frameRate=30)]
	public class TestPerformance extends Sprite
	{
		private var __testIndex:int;
		private var __testClasses:Array = [
			Signal0Performance,
			Signal1Performance,
			Signal2Performance,
			Signal3Performance,
			Signal4Performance,
			Signal5Performance,
			Signal6Performance,
			Signal7Performance,
			Signal8Performance,
			Signal9Performance,
			Signal10Performance,
			SignalNPerformance
		];
		
		private static const FUNC_CALL_REPS:int = 1000000;
		private static const NUM_LISTENERS:int = 10;
		private var __logger:TextField = new TextField();
		
		public function TestPerformance()
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
