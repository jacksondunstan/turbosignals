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
	import flash.utils.*;
	import flash.errors.*;
	
	/**
	*   A signal holds a list of slots and calls them all when the signal is
	*   "dispatched". This signal passes eight parameters to its slots.
	*   @author Jackson Dunstan
	*/
	public class Signal8
	{
		/** List of Slot8 to call when we dispatch */
		private var __slots:Array = [];
		
		/** If we are currently dispatching and haven't copied the __slots list,
		*** we need to copy it before changes( either add or remove) are made */
		private var __slotsNeedCopying:Boolean;
		
		/**
		*   Add a slot to be called during dispatch()
		*   @param slot Slot to add. This function has no effect if the slot is
		*               null or the signal already has the slot.
		*/
		public function addSlot(slot:Slot8): void
		{
			// Only add valid slots we don't already have
			if (!slot || __slots.indexOf(slot) >= 0)
			{
				return;
			}
			
			// Copy the list during dispatch
			if (__slotsNeedCopying)
			{
				__slots = __slots.slice();
				__slotsNeedCopying = false;
			}
			
			__slots[__slots.length] = slot;
		}
		
		/**
		*   Remove a slot so that it is not called during dispatch()
		*   @param slot Slot to remove. This function has no effect if the slot
		*               is null or the signal does not have the slot.
		*/
		public function removeSlot(slot:Slot8): void
		{
			// Can't remove a slot we don't have
			var index:int = __slots.indexOf(slot);
			if (index < 0)
			{
				return;
			}
			
			// Copy the list during dispatch
			if (__slotsNeedCopying)
			{
				__slots = __slots.slice();
				__slotsNeedCopying = false;
			}
			
			__slots.splice(index, 1);
		}
		
		/**
		*   Remove all slots so that they are not called during dispatch()
		*/
		public function removeAllSlots(): void
		{
			if (__slotsNeedCopying)
			{
				__slots = [];
				__slotsNeedCopying = false;
			}
			else
			{
				__slots.length = 0;
			}
		}
		
		/**
		*   Check if the signal has a slot
		*   @param slot Slot to check
		*   @return If the signal has the given slot
		*/
		public function hasSlot(slot:Slot8): Boolean
		{
			return __slots.indexOf(slot) >= 0;
		}
		
		/**
		*   Get the number of slots the signal has
		*   @return The number of slots the signal has
		*/
		public function get numSlots(): uint
		{
			return __slots.length;
		}
		
		/**
		*   Get the index of a slot in the list of slots this signal has
		*   @return The index of the given slot in the list of slots this signal
		*           has or -1 if this signal does not have the given slot
		*/
		public function getSlotIndex(slot:Slot8): int
		{
			return __slots.indexOf(slot);
		}
		
		/**
		*   Call all of the slots the signal has. Calls to addSlot() or
		*   removeSlot() by any slot in response to these calls will not change
		*   which slots are called or the order in which they are called during
		*   this particular dispatch.
		*   @param arg1 First argument to pass to the slots
		*   @param arg2 Second argument to pass to the slots
		*   @param arg3 Third argument to pass to the slots
		*   @param arg4 Fourth argument to pass to the slots
		*   @param arg5 Fifth argument to pass to the slots
		*   @param arg6 Sixth argument to pass to the slots
		*   @param arg7 Seventh argument to pass to the slots
		*   @param arg8 Eighth argument to pass to the slots
		*/
		public function dispatch(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*, arg8:*): void
		{
			var slots:Array = __slots;
			__slotsNeedCopying = true;
			for (var i:uint = 0, len:uint = slots.length; i < len; ++i)
			{
				Slot8(slots[i]).onSignal8(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
			}
			__slotsNeedCopying = false;
		}
	}
}
