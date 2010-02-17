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
	
	public class Signal5Performance
	{
		public var signal:Signal5 = new Signal5();
		
		public function Signal5Performance(log:Function, FUNC_CALL_REPS:int, NUM_LISTENERS:int): void
		{
			var beforeTime:int;
			var i:int;
			log("Signal5");
			
			this.signal.addSlot(new DummySlot5());
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(null, null, null, null, null);
			}
			log("\t1 listener: " + (getTimer()-beforeTime));
			this.signal.removeAllSlots();
			
			this.signal.addSlot(new FunctionSlot5(function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*):void{}));
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(null, null, null, null, null);
			}
			log("\t1 function listener: " + (getTimer()-beforeTime));
			this.signal.removeAllSlots();
			
			for (i = 0; i < NUM_LISTENERS; ++i)
			{
				this.signal.addSlot(new DummySlot5());
			}
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(null, null, null, null, null);
			}
			log("\t" + NUM_LISTENERS + " listeners: " + (getTimer()-beforeTime));
			this.signal.removeAllSlots();
			
			for (i = 0; i < NUM_LISTENERS; ++i)
			{
				this.signal.addSlot(new FunctionSlot5(function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*):void{}));
			}
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(null, null, null, null, null);
			}
			log("\t" + NUM_LISTENERS + " function listeners: " + (getTimer()-beforeTime));
			this.signal.removeAllSlots();
		}
	}
}
import com.jacksondunstan.signals.*;
class DummySlot5 implements Slot5
{
	public function onSignal5(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*): void
	{
	}
}
