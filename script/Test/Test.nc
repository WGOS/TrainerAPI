import flashex.io;
import flash.vm;
import std.io;
import std.time;
import base.win;
import std.gc;
int i =0;
FlashObject objT;

GC.CollectMemory();
//objT.GetObject("jj", objT);
SetBoxColor(7,435430);
//i = 2/i;

HWND fl = GetViewHwnd();
 fl.SendKeyDown(' ');

return 0;