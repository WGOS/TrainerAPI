import flash.vm;
import flash.vmex;
import std.string;


FlashObject OSGi = FlashObjectFind("OSGi");
FlashObject obj;
OSGi.GetObject("services",obj);
obj.GetObject("_nullParamsServiceDictionary",obj);

FlashArray arr = obj.ToArray();
int i, size = arr.GetSize();
for(i = 0 ;i <size; i++)
{
    if(!arr.GetObject(i, obj))
        continue;
    if(!strcmp("ModelsRegistryImpl", obj.GetBaseType()))
        break;
}
if(i == size)//еще не создана
    return 0;
//obj.GetObject("modelInstances",obj);
obj.ViewTree();
//obj.DumpTxt("dump.txt", 5);