import flash.swf;
import std.file;
import ide;
ideOut log;

FwsCapture ref dump = new FwsCapture();

CreateFolder(".\\Dump\\");




bool fwsCapture(FwsData ref fws, auto ref lParam)
{
    int crc = fws.Crc(0);

    int sig = 0;
    fws.ReadInt(45, sig);
    int size = fws.Size();
    if(sig == -654321153)//0xD8FFD9FF 
    {//jpg
        char[] data;
        size = size - 49 - 17;
        fws.GetData(data, 49, size);
        File file;
        file.Open(".\\Dump\\"+crc.str()+"_"+size.str()+".jpg", "w+b");
        file.Write(data);
        file.Close();
        return true;
    }
    if(sig == 944130375)//GIF8
    {//gif
        char[] data;
        size = size - 45 - 17;
        fws.GetData(data, 45, size);
        File file;
        file.Open(".\\Dump\\"+crc.str()+"_"+size.str()+".gif", "w+b");
        file.Write(data);
        file.Close();
        return true;
    }
    if(sig == 1196314761)//%PNG
    {//png
        char[] data;
        size = size - 45 - 17;
        fws.GetData(data, 45, size);
        File file;
        file.Open(".\\Dump\\"+crc.str()+"_"+size.str()+".png", "w+b");
        file.Write(data);
        file.Close();
       return true;
    }
    fws.Save(".\\Dump\\"+crc.str()+"_"+size.str()+".swf");
    return true;
} 
dump.Start(fwsCapture, 0);
dump.Loop();
return 0;



