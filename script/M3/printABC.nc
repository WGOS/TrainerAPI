import flash.swf;

import ide;
ideOut log;

FwsManager ref swf = new FwsManager();
SectionABC2 ref abc = new SectionABC2();
int Tags = swf.Load(".\\Dump\\1059642166_1303610.swf");
if(!Tags)
{
    log <<"no load file\r\n";
    return 0;
}

for(int i = 0; i< Tags; i++)
{
    TAGTYPE tagT = swf.TypeTag(i);
    if(tagT != TAGTYPE.DoABC2 && tagT != TAGTYPE.DoABC)
        continue;
    abc.Load(swf, i);
    log <<abc.GetName()<<"\r\n";
}

return 0;