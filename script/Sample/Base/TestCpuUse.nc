import std.io;
import std.time;
StdOut out;
int count = 0;
do
{
    if((count&7) == 0)
    {
        out <<CpuUsage()<<"\n";
    }
    Sleep(150);
    count++;
}while(1);

