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
	import asunit.asserts.*;
	import asunit4.async.*;

	import com.jacksondunstan.signals.*;

	import flash.display.*;

	public class Signal7Test
	{
		public var signal:Signal7;
		public var dummySlot1:DummySlot7;
		public var dummySlot2:DummySlot7;
		
		[Before]
		public function setUp(): void
		{
			this.signal = new Signal7();
			this.dummySlot1 = new DummySlot7();
			this.dummySlot2 = new DummySlot7();
		}

		[After]
		public function tearDown(): void
		{
			this.signal.removeAllSlots();
			this.signal = null;
			this.dummySlot1 = null;
			this.dummySlot2 = null;
		}

		[Test]
		public function numSlots_is_0_after_instantiation(): void
		{
			assertEquals(0, this.signal.numSlots);
		}
		
		[Test]
		public function does_not_have_slot_after_instantiation(): void
		{
			assertFalse(this.signal.hasSlot(this.dummySlot1));
		}
		
		[Test]
		public function does_not_have_null_slot(): void
		{
			assertFalse(this.signal.hasSlot(null));
		}
		
		[Test]
		public function getSlotIndex_is_negative_for_null(): void
		{
			assertEquals(-1, this.signal.getSlotIndex(null));
		}
		
		[Test]
		public function getSlotIndex_is_negative_for_unadded_slot(): void
		{
			assertEquals(-1, this.signal.getSlotIndex(this.dummySlot1));
		}
		
		[Test]
		public function getSlotIndex_is_0_for_first_added_slot(): void
		{
			this.signal.addSlot(this.dummySlot1);
			assertEquals(0, this.signal.getSlotIndex(this.dummySlot1));
		}
		
		[Test]
		public function getSlotIndex_is_0_for_first_and_1_for_second(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			assertEquals(0, this.signal.getSlotIndex(this.dummySlot1));
			assertEquals(1, this.signal.getSlotIndex(this.dummySlot2));
		}
		
		[Test]
		public function getSlotIndex_is_0_for_first_after_remove_second(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			this.signal.removeSlot(this.dummySlot2);
			assertEquals(0, this.signal.getSlotIndex(this.dummySlot1));
		}
		
		[Test]
		public function getSlotIndex_is_negative_for_second_after_remove_second(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			this.signal.removeSlot(this.dummySlot2);
			assertEquals(-1, this.signal.getSlotIndex(this.dummySlot2));
		}
		
		[Test]
		public function getSlotIndex_is_0_for_second_after_remove_first(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			this.signal.removeSlot(this.dummySlot1);
			assertEquals(0, this.signal.getSlotIndex(this.dummySlot2));
		}
		
		[Test]
		public function getSlotIndex_is_negative_for_first_after_remove_first(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			this.signal.removeSlot(this.dummySlot1);
			assertEquals(-1, this.signal.getSlotIndex(this.dummySlot1));
		}
		
		[Test]
		public function numSlots_is_1_after_adding(): void
		{
			this.signal.addSlot(this.dummySlot1);
			assertEquals(1, this.signal.numSlots);
		}
		
		[Test]
		public function numSlots_is_1_after_adding_duplicate_slot(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot1);
			assertEquals(1, this.signal.numSlots);
		}
		
		[Test]
		public function numSlots_is_2_after_adding_two_slots(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			assertEquals(2, this.signal.numSlots);
		}
		
		[Test]
		public function numSlots_is_1_after_adding_two_then_removing_first(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			this.signal.removeSlot(this.dummySlot1);
			assertEquals(1, this.signal.numSlots);
		}
		
		[Test]
		public function numSlots_is_1_after_adding_two_then_removing_second(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			this.signal.removeSlot(this.dummySlot2);
			assertEquals(1, this.signal.numSlots);
		}
		
		[Test]
		public function numSlots_is_0_after_adding_two_then_removing_both(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			this.signal.removeSlot(this.dummySlot1);
			this.signal.removeSlot(this.dummySlot2);
			assertEquals(0, this.signal.numSlots);
		}
		
		[Test]
		public function removing_null_does_not_crash(): void
		{
			this.signal.removeSlot(null);
		}
		
		[Test]
		public function removing_unadded_slot_does_not_crash(): void
		{
			this.signal.removeSlot(this.dummySlot1);
		}
		
		[Test]
		public function removing_unadded_slot_does_not_change_numSlots_when_empty(): void
		{
			var oldNumSlots:uint = this.signal.numSlots;
			this.signal.removeSlot(this.dummySlot1);
			assertEquals(oldNumSlots, this.signal.numSlots);
		}
		
		[Test]
		public function removing_unadded_slot_does_not_change_numSlots_when_populated(): void
		{
			this.signal.addSlot(this.dummySlot1);
			var oldNumSlots:uint = this.signal.numSlots;
			this.signal.removeSlot(this.dummySlot2);
			assertEquals(oldNumSlots, this.signal.numSlots);
		}
		
		[Test]
		public function removeAll_when_empty_does_not_crash(): void
		{
			this.signal.removeAllSlots();
		}
		
		[Test]
		public function removeAll_removes_two_slots(): void
		{
			this.signal.addSlot(this.dummySlot1);
			this.signal.addSlot(this.dummySlot2);
			this.signal.removeAllSlots();
			assertEquals(0, this.signal.numSlots);
			assertFalse(this.signal.hasSlot(this.dummySlot1));
			assertFalse(this.signal.hasSlot(this.dummySlot2));
		}
		
		[Test]
		public function numSlots_is_0_after_adding_null(): void
		{
			this.signal.addSlot(null);
			assertEquals(0, this.signal.numSlots);
		}
		
		[Test]
		public function dispatch_should_call_only_slot(): void
		{
			var called:Boolean;
			this.signal.addSlot(
				new FunctionSlot7(
					function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
					{
						called = true;
					}
				)
			);
			this.signal.dispatch(null, null, null, null, null, null, null);;
			assertTrue(called);
		}
		
		[Test]
		public function dispatch_should_pass_correct_parameters(): void
		{
			var myObject1:Object = {};
			var myObject2:Object = {};
			var myObject3:Object = {};
			var myObject4:Object = {};
			var myObject5:Object = {};
			var myObject6:Object = {};
			var myObject7:Object = {};
			var called:Boolean;
			this.signal.addSlot(
				new FunctionSlot7(
					function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
					{
						called = true;
						assertEquals(myObject1, arg1);
						assertEquals(myObject2, arg2);
						assertEquals(myObject3, arg3);
						assertEquals(myObject4, arg4);
						assertEquals(myObject5, arg5);
						assertEquals(myObject6, arg6);
						assertEquals(myObject7, arg7);
					}
				)
			);
			this.signal.dispatch(myObject1, myObject2, myObject3, myObject4, myObject5, myObject6, myObject7);
			assertTrue(called);
		}
		
		[Test]
		public function dispatch_should_not_call_removed_slot(): void
		{
			var slot:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					fail();
				}
			);
			this.signal.addSlot(slot);
			this.signal.removeSlot(slot);
			this.signal.dispatch(null, null, null, null, null, null, null);;
		}
		
		[Test]
		public function dispatch_should_call_two_slots_in_order(): void
		{
			var oneCalled:Boolean;
			var twoCalled:Boolean;
			this.signal.addSlot(
				new FunctionSlot7(
					function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
					{
						assertFalse(oneCalled);
						assertFalse(twoCalled);
						oneCalled = true;
					}
				)
			);
			this.signal.addSlot(
				new FunctionSlot7(
					function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
					{
						assertTrue(oneCalled);
						assertFalse(twoCalled);
						twoCalled = true;
					}
				)
			);
			this.signal.dispatch(null, null, null, null, null, null, null);;
			assertTrue(oneCalled);
			assertTrue(twoCalled);
		}
		
		[Test]
		public function add_two_slots_remove_first_calls_second_only(): void
		{
			var twoCalled:Boolean;
			
			var one:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					fail();
				}
			);
			
			var two:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					twoCalled = true;
				}
			);
			
			this.signal.addSlot(one);
			this.signal.addSlot(two);
			this.signal.removeSlot(one);
			this.signal.dispatch(null, null, null, null, null, null, null);;
			assertTrue(twoCalled);
		}
		
		[Test]
		public function add_two_slots_remove_second_calls_first_only(): void
		{
			var oneCalled:Boolean;
			
			var one:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					oneCalled = true;
				}
			);
			
			var two:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					fail();
				}
			);
			
			this.signal.addSlot(one);
			this.signal.addSlot(two);
			this.signal.removeSlot(two);
			this.signal.dispatch(null, null, null, null, null, null, null);;
			assertTrue(oneCalled);
		}
		
		[Test]
		public function add_two_slots_dispatch_first_removes_first_and_second_still_gets_called(): void
		{
			var oneCalled:Boolean;
			var twoCalled:Boolean;
			
			var one:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					oneCalled = true;
					signal.removeSlot(one);
				}
			);
			
			var two:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					twoCalled = true;
				}
			);
			
			this.signal.addSlot(one);
			this.signal.addSlot(two);
			this.signal.dispatch(null, null, null, null, null, null, null);;
			assertTrue(oneCalled);
			assertTrue(twoCalled);
			assertEquals(1, this.signal.numSlots);
		}
		
		[Test]
		public function add_two_slots_dispatch_first_removes_second_and_second_still_gets_called(): void
		{
			var oneCalled:Boolean;
			var twoCalled:Boolean;
			
			var one:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					oneCalled = true;
					signal.removeSlot(two);
				}
			);
			
			var two:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					twoCalled = true;
				}
			);
			
			this.signal.addSlot(one);
			this.signal.addSlot(two);
			this.signal.dispatch(null, null, null, null, null, null, null);;
			assertTrue(oneCalled);
			assertTrue(twoCalled);
			assertEquals(1, this.signal.numSlots);
		}
		
		[Test]
		public function add_two_slots_dispatch_first_removes_both_and_second_still_gets_called(): void
		{
			var oneCalled:Boolean;
			var twoCalled:Boolean;
			
			var one:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					oneCalled = true;
					signal.removeSlot(one);
					signal.removeSlot(two);
				}
			);
			
			var two:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					twoCalled = true;
				}
			);
			
			this.signal.addSlot(one);
			this.signal.addSlot(two);
			this.signal.dispatch(null, null, null, null, null, null, null);;
			assertTrue(oneCalled);
			assertTrue(twoCalled);
			assertEquals(0, this.signal.numSlots);
		}
		
		[Test]
		public function add_two_slots_dispatch_first_removes_all_and_second_still_gets_called(): void
		{
			var oneCalled:Boolean;
			var twoCalled:Boolean;
			
			var one:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					oneCalled = true;
					signal.removeAllSlots();
				}
			);
			
			var two:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					twoCalled = true;
				}
			);
			
			this.signal.addSlot(one);
			this.signal.addSlot(two);
			this.signal.dispatch(null, null, null, null, null, null, null);;
			assertTrue(oneCalled);
			assertTrue(twoCalled);
			assertEquals(0, this.signal.numSlots);
		}
		
		[Test]
		public function add_two_slots_dispatch_first_adds_third_and_third_not_called(): void
		{
			var oneCalled:Boolean;
			var twoCalled:Boolean;
			var threeCalled:Boolean;
			
			var one:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					oneCalled = true;
					signal.addSlot(three);
				}
			);
			
			var two:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					twoCalled = true;
				}
			);
			
			var three:Slot7 = new FunctionSlot7(
				function(arg1:*, arg2:*, arg3:*, arg4:*, arg5:*, arg6:*, arg7:*): void
				{
					threeCalled = true;
				}
			);
			
			this.signal.addSlot(one);
			this.signal.addSlot(two);
			this.signal.dispatch(null, null, null, null, null, null, null);;
			assertTrue(oneCalled);
			assertTrue(twoCalled);
			assertFalse(threeCalled);
			assertEquals(3, this.signal.numSlots);
		}
	}
}
