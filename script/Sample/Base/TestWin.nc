import std.random;
import base.win;
import ide;
ideOut log;

log << Random()<<" "<<Random() << "\r\n";
SetClipboart("Test clipboard\r\n");
char[] v;
GetClipboart(v);
log << v;
MessageBox("hh", "rrr", 0);