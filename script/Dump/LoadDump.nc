import flash.swf;
import base.win;
import std.file;
import ide;
ideOut log;

FwsCapture ref dump = new FwsCapture();

CreateFolder(".\\DumpL\\");

bool fwsCapture(FwsData ref fws, auto ref lParam)
{
    int crc = fws.Crc(0);
    int sig = 0;
    fws.ReadInt(45, sig);
    int sizeMax = fws.Size();
    if(sig == -654321153)//0xD8FFD9FF 
    {//load png
        sizeMax = sizeMax - 49 - 17;
        {//load png
            char[] data;
            char[] fName = ".\\DumpL\\"+crc.str()+"_"+sizeMax.str()+".png";
            if(IsFileExisting(fName))
            { 
                File file;
                file.Open(fName, "r+b");
                int sizeF = file.Size();
                if(sizeF>sizeMax)
                {
                    MessageBox(fName, "Big File",0);
                    file.Close();
                    return true;
                }
                data = new char[sizeF];
                file.Read(data);
                fws.SetData(data, 45, sizeF);
                file.Close();
                return true;
            }
        }
        {//load jpg
            char[] data;
            char[] fName = ".\\DumpL\\"+crc.str()+"_"+sizeMax.str()+".jpg";
            if(!IsFileExisting(fName))
                return true;
            File file;
            file.Open(fName, "r+b");
            int sizeF = file.Size();
            if(sizeF>sizeMax)
            {
                MessageBox(fName, "Big File",0);
                file.Close();
                return true;
            }
            data = new char[sizeF];
            file.Read(data);
            fws.SetData(data, 49, sizeF);
            file.Close();
            return true;
        }
    }
    if(sig == 944130375)//GIF8
    {//gif
        char[] data;
        sizeMax = sizeMax - 45 - 17;
        char[] fName = ".\\DumpL\\"+crc.str()+"_"+sizeMax.str()+".gif";
        if(!IsFileExisting(fName))
            return true;
        File file;
        file.Open(fName, "r+b");
        int sizeF = file.Size();
        if(sizeF>sizeMax)
        {
            MessageBox(fName, "Big File",0);
            file.Close();
            return true;
        }
        data = new char[sizeF];
        file.Read(data);
        fws.SetData(data, 45, sizeF);
        file.Close();
        return true;
    }
    if(sig == 1196314761)//%PNG
    {//png
        char[] data;
        sizeMax = sizeMax - 45 - 17;
        char[] fName = ".\\DumpL\\"+crc.str()+"_"+sizeMax.str()+".png";
        if(!IsFileExisting(fName))
            return true;
        File file;
        file.Open(fName, "r+b");
        int sizeF = file.Size();
        if(sizeF>sizeMax)
        {
            MessageBox(fName, "Big File",0);
            file.Close();
            return true;
        }
        data = new char[sizeF];
        file.Read(data);
        fws.SetData(data, 45, sizeF);
        file.Close();
        return true;
    }
  //  fws.Save(".\\DumpImg\\"+crc.str()+"_"+size.str()+".swf");
    return true;
} 
dump.Start(fwsCapture, 0);
dump.Loop();
return 0;



