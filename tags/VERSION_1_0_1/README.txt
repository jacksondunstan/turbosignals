================================================================================
TurboSignals
1.0.1
By Jackson Dunstan <jackson@jacksondunstan.com> http://www.jacksondunstan.com
================================================================================

===========
What is it?
===========

TurboSignals is an ActionScript 3 (AS3) library implementing the signals and
slots design pattern: http://en.wikipedia.org/wiki/Signals_and_slots

It is used as a fast alternative to AS3's native EventDispatcher/Event system
as well as some third-party libraries such as Robert Penner's as3signals:
http://github.com/robertpenner/as3-signals

===========================
What Features Does It Have?
===========================

- Optimized signal classes for 0-10 parameters as well as var args
- Slot interfaces for all signals
- Function slots for all signals so you can use any function as a callback
- Full unit test suite to ensure correctness using AsUnit: http://www.asunit.org
- Full performance testing suite to measure implementation speed of
  TurboSignals as well as alternatives (EventDispatcher/Event, as3signals)
- Open source under the MIT license (see License section below)

=======================
Why would I need speed?
=======================

- Hundreds or thousands of game entities (eg. enemies, players) dispatching
  every frame (eg. position change)
- Timers dispatching to hundreds or thousands of listeners every frame
- Tickers telling hundreds or thousands of objects to update every frame

==================
How Do I Build It?
==================

The bin folder should already have TurboSignals.swc in it, but here's how to
build it yourself:

- Get the Flex SDK from Adobe:
  http://opensource.adobe.com/wiki/display/flexsdk/Flex+SDK
- Set the FLEX_HOME variable in build.properties to where you installed the
  Flex SDK
- Install the Java JDK (development kit) from Sun:
  http://java.sun.com
- Install Ant from Apache:
  http://ant.apache.org/bindownload.cgi

================
How Do I Use It?
================

Command-line:
- Specify "-library-path+=/path/to/TurboSignals.swc" in your MXMLC or COMPC
  builds

====================
What Is Its License?
====================

MIT License (see LICENSE.txt) so you can use Turbo Signals in any project, open
or closed source, including commercial products.
