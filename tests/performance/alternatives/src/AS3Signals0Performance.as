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
	
	import org.osflash.signals.*;
	
	public class AS3Signals0Performance
	{
		public var signal:Signal = new Signal();
		
		public function AS3Signals0Performance(log:Function, FUNC_CALL_REPS:int, NUM_LISTENERS:int): void
		{
			var beforeTime:int;
			var i:int;
			log("as3ignals (0 parameters)");
			
			this.signal.add(onSignal0);
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch();
			}
			log("\t1 listener: " + (getTimer()-beforeTime));
			this.signal.remove(onSignal0);
			
			for (i = 0; i < NUM_LISTENERS; ++i)
			{
				this.signal.add(this["onSignal"+i]);
			}
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch();
			}
			log("\t" + NUM_LISTENERS + " listeners: " + (getTimer()-beforeTime));
			this.signal.removeAll();
		}
		
		private function onSignal0(): void {}
		private function onSignal1(): void {}
		private function onSignal2(): void {}
		private function onSignal3(): void {}
		private function onSignal4(): void {}
		private function onSignal5(): void {}
		private function onSignal6(): void {}
		private function onSignal7(): void {}
		private function onSignal8(): void {}
		private function onSignal9(): void {}
	}
}