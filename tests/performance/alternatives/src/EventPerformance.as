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
	import flash.utils.*;
	import flash.events.*;
	
	public class EventPerformance extends EventDispatcher
	{
		public function EventPerformance(log:Function, FUNC_CALL_REPS:int, NUM_LISTENERS:int): void
		{
			const EVENT_TYPE:String = "test";
			var beforeTime:int;
			var i:int;
			log("EventDispatcher/Event");
			
			addEventListener(EVENT_TYPE, onEvent0);
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				dispatchEvent(new Event(EVENT_TYPE));
			}
			log("\t1 listener: " + (getTimer()-beforeTime));
			removeEventListener(EVENT_TYPE, onEvent0);
			
			for (i = 0; i < NUM_LISTENERS; ++i)
			{
				addEventListener(EVENT_TYPE, this["onEvent"+i]);
			}
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				dispatchEvent(new Event(EVENT_TYPE));
			}
			log("\t" + NUM_LISTENERS + " listeners: " + (getTimer()-beforeTime));
			for (i = 0; i < NUM_LISTENERS; ++i)
			{
				removeEventListener(EVENT_TYPE, this["onEvent"+i]);
			}
		}
		
		private function onEvent0(ev:Event): void {}
		private function onEvent1(ev:Event): void {}
		private function onEvent2(ev:Event): void {}
		private function onEvent3(ev:Event): void {}
		private function onEvent4(ev:Event): void {}
		private function onEvent5(ev:Event): void {}
		private function onEvent6(ev:Event): void {}
		private function onEvent7(ev:Event): void {}
		private function onEvent8(ev:Event): void {}
		private function onEvent9(ev:Event): void {}
	}
}
