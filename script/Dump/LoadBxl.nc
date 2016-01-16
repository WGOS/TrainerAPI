import base.win;
import base.bxl;
import flash.swf;
import flashex.io;
//import ide;
import std.file;
//ideOut log;

HWND mainWnd = GetClientHwnd();
char[] bxlName;
if(!mainWnd.OpenFile(bxlName, "*.bxl"))
    return 0;
BxlR ref bxlr = new BxlR();
if(!bxlr.Open(bxlName))
{
    mainWnd.MessageBox("Error: open bxl", "",0);
    return 0;
}

bool fwsCapture(FwsData ref fws, auto ref lParam)
{
    char[] data;
    int crc = fws.Crc(0);
    int sig = 0;
    fws.ReadInt(45, sig);
    int sizeMax = fws.Size();
    if(sig == -654321153)//0xD8FFD9FF 
    {//jpg
        sizeMax = sizeMax - 49 - 17;
        char[] fName = crc.str()+"_"+sizeMax.str();
        int zSize = bxlr.Size(fName);
        if(zSize == 0)
            return true;
        bxlr.Read(fName, data);
        if(int(data[0]) == -119)
        {
            fws.SetData(data, 45, data.size);
        }else{
            fws.SetData(data, 49, data.size);
        }
        return true;
    }
    if(sig == 944130375/*GIF8*/ || sig == 1196314761/*%PNG*/)
    {//gif  //png
        sizeMax = sizeMax - 45 - 17;
        char[] fName = crc.str()+"_"+sizeMax.str();
        int zSize = bxlr.Size(fName);
        if(zSize == 0)
            return true;
        bxlr.Read(fName, data);
        fws.SetData(data, 45, data.size);
        return true;
    }
    return true;
}
    
FwsCapture ref dump = new FwsCapture();
dump.Start(fwsCapture, 0);
dump.Loop();
return 0;