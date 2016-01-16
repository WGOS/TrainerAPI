import flash.swf;
import flash.minimap;
import flashEx.io;

import std.file;
import ide;
ideOut log;

FwsCapture ref dump = new FwsCapture();

int[] imgCrc = {
//лето бумбокс
50760300, -120798558, -336457808, 416464327, 937764687, -1020148492, 1030417559, 1053604595, 1066967925,
-1387045772, 1416927018, -1418461773, 1538162747, -1772277179, 1864573661, 1994258826, -2004680812,
//зима бумбокс
56020153, 166438809, -299052379, 323643666, 401461299, 473412867, -562859448, -917863976, -946268462,
-988056407, 1005883966, -1155360530, 1175685840, 1281560734, 1421350921, 1793617326, -1943196213,
//add лето песочница
-764684330, -1724960281, 2114906552, 2043872187, 1162697616, -699544424, 336970808, 1395304188, 1116815475,
-1694248985, -1494539512, 644144877, -147373919, 135598407, 219031500, 1840407508, 1866019032, 
//add зима песочница
412454449, 1166026395, 1616613360, -594113978, -1032266226, -1201614236, -1364453729, -2020127060, -2040944190,
-2052379515, -2052759550, 265845492, 644838927, 667851346, 1330455583, 1512026532, 1784870060,
//add лето кунгур
-341776164, -419223667, -683198666, -749146788, -1080986732, -1409951700, -1662990345, -1748527549, -1942538846,
137016404, 506911178, 694565084, 1400949320, 1483031919, 1819533819, 2034724481
};

int imgCrc_size = imgCrc.size;
bool imgSearch = false;

bool fwsCapture(FwsData ref fws, auto ref lParam)
{
    int crc = fws.Crc(0);
    int sig = 0;
    fws.ReadInt(45, sig);
    int size = fws.Size();
    if(sig == -654321153)//0xD8FFD9FF 
    {//jpg
        imgSearch = false;
        for(int i = 0; i<imgCrc_size; i++)
        {
            if(crc == imgCrc[i])
            {
                imgSearch = true;
                break;
            }
        }
        if(!imgSearch)
        {
        char[] data;
        size = size - 49 - 17;
        fws.GetData(data, 49, size);
        File file;
        file.Open(".\\Dump\\"+crc.str()+"_"+size.str()+".jpg", "w+b");
        file.Write(data);
        file.Close();
        
            return true;
        }
        char[] data;
        size = size - 49 - 17;
        fws.GetData(data, 49, size);
        if(ImgConvertToPng8(&data, 16, 20))
        {
            fws.SetData(data, 45, data.size);
            if(data.size<100)
log<<"error2: " <<crc<<"\r\n";
        }else{
           log<<"error: " <<crc<<"\r\n";
        }
        
        return true;
    }
    return true;
} 
dump.Start(fwsCapture, 0);
dump.Loop();
return 0;
