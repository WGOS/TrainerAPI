import std.time;
import ide;

ideOut log;

Time t;
GetGMTTime(t);

log <<t.day<<"."<<t.month+1<<"."<<t.year<<"\n";
int hour = t.sec/(60*60);
int min = (t.sec%(60*60))/60;
int sec = t.sec%60;

log<<hour<<":"<<min<<":"<<sec<<"\n";

GetSysTime(t);
hour = t.sec/(60*60);
min = (t.sec%(60*60))/60;
sec = t.sec%60;
log<<hour<<":"<<min<<":"<<sec<<"\n";

timePDiff();//первый мусор
int start = timePDiff();
Sleep(300);
int stop = timePDiff();
log << "perf = "<<stop-start<<"msec\n";

return 0;
















