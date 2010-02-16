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
	import com.jacksondunstan.signals.*;
	
	import flash.utils.*;
	
	public class Signal3Performance
	{
		public var signal:Signal3 = new Signal3();
		
		public function Signal3Performance(log:Function, FUNC_CALL_REPS:int, NUM_LISTENERS:int): void
		{
			var beforeTime:int;
			var i:int;
			log("Signal3");
			
			this.signal.addSlot(new DummySlot3());
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(null, null, null);
			}
			log("\t1 listener: " + (getTimer()-beforeTime));
			this.signal.removeAllSlots();
			
			this.signal.addSlot(new FunctionSlot3(function(arg1:*, arg2:*, arg3:*):void{}));
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(null, null, null);
			}
			log("\t1 function listener: " + (getTimer()-beforeTime));
			this.signal.removeAllSlots();
			
			for (i = 0; i < NUM_LISTENERS; ++i)
			{
				this.signal.addSlot(new DummySlot3());
			}
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(null, null, null);
			}
			log("\t" + NUM_LISTENERS + " listeners: " + (getTimer()-beforeTime));
			this.signal.removeAllSlots();
			
			for (i = 0; i < NUM_LISTENERS; ++i)
			{
				this.signal.addSlot(new FunctionSlot3(function(arg1:*, arg2:*, arg3:*):void{}));
			}
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(null, null, null);
			}
			log("\t" + NUM_LISTENERS + " function listeners: " + (getTimer()-beforeTime));
			this.signal.removeAllSlots();
		}
	}
}
import com.jacksondunstan.signals.*;
class DummySlot3 implements Slot3
{
	public function onSignal3(arg1:*, arg2:*, arg3:*): void
	{
	}
}
