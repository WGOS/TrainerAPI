import flash.vm;
import std.string;
import std.file;

File file;
file.Open("obj.txt", "wb");


bool enumObject(FlashObject Obj, auto ref lParam)
{
    char[] tp = Obj.GetBaseType();
    if(!strcmp(tp, "Object") || !strcmp(tp, "Function") || !strcmp(tp, "Array")|| !strcmp(tp, "MethodClosure") || 
       !strcmp(tp, "XML") || !strcmp(tp, "Bitmap") || !strcmp(tp, "Sprite")||!strcmp(tp, "BitmapData")||
        !strcmp(tp, "Shape") || !strcmp(tp, "XMLNode") || !strcmp(tp, "MovieClip")||!strcmp(tp, "TextField"))
        return true;
    char[] nm = Obj.GetNameSpace();
    if(nm.size == 0)
        return true;
    file.Write(tp);
    file.Write("  ", 0, 2);
    file.Write(nm);
    file.Write("\r\n", 0, 2);
    return true;
}


int printAll(auto ref lParam)
{
    FlashObjectFind(enumObject, 0);
    return 0;
}



FlashCallContext(printAll, 0);
file.Close();
return 0;