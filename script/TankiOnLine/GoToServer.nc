import flashex.io;
import std.time;

import ide;
ideOut log;

char[] gURL;
void gotoServer(int numServer)
{
    gURL = "http://tankionline.com/AlternativaLoader.swf?config=c"+numServer.str()+".tankionline.com/config.xml&resources=s.tankionline.com&lang=ru&locale=ru#/server=RU"+numServer.str();
    log << gURL;
    ViewOpenURL(gURL);
    int i = 1000;
    while(i--)Sleep(10);
}


gotoServer(1);