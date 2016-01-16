import base.other;
import base.bxl;
import std.file;
import ide;
ideOut log;

FileFind ref find = new FileFind();
Bxl ref bxl = new Bxl();

if(!find.Start(".\\DumpL\\*"))
    return 0;
bxl.Create(".\\DumpL.bxl");
char[] fileName;
char[] data;
while(find.Find(fileName))
{
    File file;
    log<<fileName<<"\r\n";
    file.Open(".\\DumpL\\"+fileName, "r+b");
    int sizeF = file.Size();
    if(sizeF)
    {
        data = new char[sizeF];
        file.Read(data);
        fileName[fileName.size-4] = 0;

        if(!bxl.Write(fileName, data))
            log<<fileName<<" - error bxl\r\n";
    }else{
        log<<fileName<<" - null\r\n";
    }
    file.Close();
}
find.Close();
bxl.Close();
return 0;
