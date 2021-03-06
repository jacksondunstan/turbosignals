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
	*   A slot provides a named method for a signal to call. This slot receieves
	*   nine parameters.
	*   @author Jackson Dunstan
	*/
	public interface Slot9
	{
		/**
		*   Called by the signal when it dispatches
		*   @param arg1 First argument to the signal's dispatch()
		*   @param arg2 Second argument to the signal's dispatch()
		*   @param arg3 Third argument to the signal's dispatch()
		*   @param arg4 Fourth argument to the signal's dispatch()
		*   @param arg5 Fifth argument to the signal's dispatch()
		*   @param arg6 Sixth argument to the signal's dispatch()
		*   @param arg7 Seventh argument to the signal's dispatch()
		*   @param arg8 Eighth argument to the signal's dispatch()
		*   @param arg9 Ninth argument to the signal's dispatch()
		*/
		function onSignal9(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*, arg8:*, arg9:*): void;
	}
}
