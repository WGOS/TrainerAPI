import flashex.io;
import flash.vm;
import base.win;
import base.gui;
import std.time;

FlashObject gDulo;
HWND        gStaticInit;
char[] paramDulo = "<u";

void pressInit(Dialog ref dlg, int lparam)
{
    gDulo = FlashObjectFind("%!l", ";d");
    if(gDulo.IsNull())
        return;
    gStaticInit.SetText("on");
}

void press0(Dialog ref dlg, int lparam)
{
    if(gDulo.IsNull())
    {
        gStaticInit.SetText("off");
        return;
    }
    gDulo.SetDouble(paramDulo, 0);
}

void press90(Dialog ref dlg, int lparam)
{
    if(gDulo.IsNull())
    {
        gStaticInit.SetText("off");
        return;
    }
    gDulo.SetDouble(paramDulo, 1.5);
}

void press180(Dialog ref dlg, int lparam)
{
    if(gDulo.IsNull())
    {
        gStaticInit.SetText("off");
        return;
    }
    gDulo.SetDouble(paramDulo, 3.19);
}

void press270(Dialog ref dlg, int lparam)
{
    if(gDulo.IsNull())
    {
        gStaticInit.SetText("off");
        return;
    }
    gDulo.SetDouble(paramDulo, -1.5);
}


void closeDlg(Dialog ref Dialog,  int param){}//вызывается при закрытии
Dialog ref dlg = CreateDialog("Test flash research", 200, 200, 90, 135, closeDlg);
dlg.AddButton("Init", 10,10, 50,24,pressInit, 0);//добавим кнопку
gStaticInit = dlg.AddStatic("off", 70, 15, 40, 24);

dlg.AddButton("0",   30, 40, 30,20,press0,  0);
dlg.AddButton("90",  10, 60, 30,20,press90, 0);
dlg.AddButton("180", 30, 80, 30,20,press180,0);
dlg.AddButton("270", 50, 60, 30,20,press270,0);


dlg.Show(true);//Показать диалог
dlg.WaitClose();//ждем закрытия диалога

return 0;