import base.ini;
import ide;
ideOut log;

char[] v;
IniWriteString("test.ini", "SEC", "keyS","qwerty");
IniWriteString("test.ini", "SEC", "keyI", (123).str() );
int i;
if(IniReadInt("test.ini", "SEC", "keyI", i))
    log << i<< "\r\n";
if(IniReadString("test.ini", "SEC", "keyI", v))
    log << v<< "\r\n";
if(IniReadString("test.ini", "SEC", "keyS", v))
    log << v<< "\r\n";
return 0;