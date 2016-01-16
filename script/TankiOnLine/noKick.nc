import base.win;
import base.gui;
import flashex.io;

HWND fl = GetViewHwnd();
HWND btn;
bool isStart = false; 
int statTime;

void closeDlg(Dialog ref Dialog,  int param)
{//вызывается при закрытии
}

void timeEvent(Dialog ref dlg, int lparam)
{//вызывается по таймеру
    if(statTime == 0)//имитация клика по окну
        fl.SendKeyDown('A');
    if(statTime == 3)//начнем сстрелять
        fl.SendKeyDown(' ');
    if(statTime == 10)//закончим стрелять
        fl.SendKeyUp(' ');
    if(statTime == 9)
        fl.SendKeyUp('A');
    if(statTime == 15)
        fl.SendKeyDown('D');
    if(statTime == 19)
        fl.SendKeyUp('D');
    statTime ++;
    if(statTime>20)//начнем цикл заного
        statTime = 0;
}

void pressBtn(Dialog ref dlg, int lparam)
{//вызывается при нажатии кнопки
    if(isStart)
    {//остановка
        btn.SetText("Start");
        dlg.KillTimer(timeEvent);
    }else{//старт работы
        statTime = 0;
        dlg.AddTimer(100, timeEvent, 0);
        btn.SetText("Stop");
    }
    isStart = !isStart;//изменим статус
}

Dialog ref dlg = CreateDialog("NoKick", 200, 200, 180, 80, closeDlg);
btn = dlg.AddButton("Start", 5,5, 150,40,pressBtn, 0);//добавим кнопку
dlg.Show(true);//Показать диалог
dlg.WaitClose();//ждем закрытия диалога
return 0;

















