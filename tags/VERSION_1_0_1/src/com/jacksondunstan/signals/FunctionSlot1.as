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
package com.jacksondunstan.signals
{
	/**
	*   A function slot is a slot that, when called by a signal, calls a given
	*   function. While this is much slower than implementing the slot interface
	*   directly, this class provides a convenient way to use signals with
	*   functions other than the slot callback.
	*   @author Jackson Dunstan
	*/
	public class FunctionSlot1 implements Slot1
	{
		/** Function to call when called by the signal */
		private var __func:Function;
		
		/**
		*   Make the slot.
		*   @param func Function to call when called by the signal. This will
		*               not be called if the function is null.
		*/
		public function FunctionSlot1(func:Function)
		{
			__func = func;
		}
		
		/**
		*   Called by the signal when it dispatches. Calls the function given to
		*   the constructor if the constructor was given a non-null function.
		*   @param arg Argument to the signal's dispatch()
		*/
		public function onSignal1(arg:*): void
		{
			if (__func != null)
			{
				__func(arg);
			}
		}
	}
}
