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
	
	public class AS3Signals8Performance
	{
		public var signal:Signal = new Signal(int, int, int, int, int, int, int, int);
		
		public function AS3Signals8Performance(log:Function, FUNC_CALL_REPS:int, NUM_LISTENERS:int): void
		{
			var beforeTime:int;
			var i:int;
			log("as3ignals (8 parameters)");
			
			this.signal.add(function(arg1:int, arg2:int, arg3:int, arg4:int, arg5:int, arg6:int, arg7:int, arg8:int):void{});
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(1, 2, 3, 4, 5, 6, 7, 8);
			}
			log("\t1 listener: " + (getTimer()-beforeTime));
			this.signal.removeAll();
			
			for (i = 0; i < NUM_LISTENERS; ++i)
			{
				this.signal.add(function(arg1:int, arg2:int, arg3:int, arg4:int, arg5:int, arg6:int, arg7:int, arg8:int):void{});
			}
			beforeTime = getTimer();
			for (i = 0; i < FUNC_CALL_REPS; ++i)
			{
				this.signal.dispatch(1, 2, 3, 4, 5, 6, 7, 8);
			}
			log("\t" + NUM_LISTENERS + " listeners: " + (getTimer()-beforeTime));
			this.signal.removeAll();
		}
	}
}