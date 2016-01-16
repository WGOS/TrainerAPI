import flash.swf;
import ide;
ideOut log;

FwsManager ref fws = new FwsManager();
SectionABC2    ref abc = new SectionABC2();

int tags = fws.Load(".\\tst.swf");
log << tags<< "\r\n";
//fws.HexView(0, 0, 0);
for(int i = 0; i < tags;i++)
{
   // int[] offs = fws.Find(i, "66 14 D1 46 4B");
   // if(offs.size == 0)
   //     continue;
    if(fws.TypeTag(i) != TAGTYPE.DoABC2 && fws.TypeTag(i) != TAGTYPE.DoABC)
        continue;

        
    abc.Load(fws, i);
    log << abc.GetName()+"\r\n";
    break;
 //   fws.SaveTag("J:\\!!!!!!!!\\abc2_"+i.str()+".abc", i);
}

int count = abc.CountMultiName();
log << "countMN " << abc.CountMultiName()<<"\r\n";
//abc.GetMultiName(

ABC2_MultiName mn;
for(int i = 0; i<count; i++)
{
if(abc.GetMultiName(i, mn))
{

log << i<<") type:" << int(mn.type) <<"  index:"<<mn.index<<"  set_index:"<<mn.set_index<<"   "<<abc.GetString(mn.index)<<"   "<<abc.GetNameSpace(mn.set_index)<<"\r\n";

}
}
return 0;
















