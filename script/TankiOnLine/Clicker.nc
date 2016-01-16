import base.win;
import base.gui;
import FlashEx.io;

//import ide;
//ideOut log;

HWND flashWnd, clickerBtn, noKickBtn;

bool checkRed  = true;
bool checkBlue = true;
int pointRedX, pointBlueX, pointY;
double pointRedXp, pointBlueXp, pointYp;
void CalckClickPoint()
{
    RECT r;
    flashWnd.GetRect(r);
    double x = (r.right - r.left)/100.0;
    double y = (r.bottom - r.top)/100.0;
    pointRedXp  = (74 - (x/1000));
    pointBlueXp = 94;
    pointYp     = 96;
    pointY     = (y * pointYp);
    pointRedX  = (x * pointRedXp);
    pointBlueX = (x * pointBlueXp);
}
void BeepEx(){ Beep(500, 100); Beep(700, 300); Beep(500, 100); Beep(700, 300); }//бибикаем
int testColor;
int timeClicker = 0, timeClickerTestColor;
void timeClickerEvent(Dialog ref dlg, int lparam)
{//кликаем за синих
    if(timeClicker == 0 && checkRed)
        flashWnd.MouseKeyDown(pointRedXp,pointYp);
    if(timeClicker == 1 && checkRed)
        flashWnd.MouseKeyUp(pointRedXp,pointYp);
    if(timeClicker == 2 && checkBlue)
        flashWnd.MouseKeyDown(pointBlueXp,pointYp);
    if(timeClicker == 3 && checkBlue)
        flashWnd.MouseKeyUp(pointBlueXp,pointYp);
    timeClicker ++;
    if(timeClicker > 3)
    {
        timeClickerTestColor ++;
        timeClicker = 0;
        if(timeClickerTestColor > 40)
        {
            timeClickerTestColor = 0;
            if(testColor != flashWnd.GetColor(84.0, 99, 5, 5))
                BeepEx();
        }
    }
}

bool isClickerStart = false; 
void pressClickerBtn(Dialog ref dlg, int lparam)
{//вызывается при нажатии кнопки
    if(isClickerStart)
    {//остановка
        noKickBtn.Enable(true);
        clickerBtn.SetText("Start");
        dlg.KillTimer(timeClickerEvent);
    }else{//старт работы
        noKickBtn.Enable(false);
        flashWnd = GetViewHwnd();
        timeClicker = 0;
        timeClickerTestColor = 0;
        CalckClickPoint();
        testColor =  flashWnd.GetColor(84.0, 99, 5, 5);
        dlg.AddTimer(1, timeClickerEvent, 0);
        clickerBtn.SetText("Stop");
    }
    isClickerStart = !isClickerStart;
}

CheckBox btnR, btnB;
HWND testBtn;
void pressCheckClickerBtn(Dialog ref dlg, int lparam)
{//считаем состояние чекбоксов
    checkRed  = btnR.IsChecked();
    checkBlue = btnB.IsChecked();
}
hwndDraw gDc;
int timeDraw = 0;
void timeDrawEvent(Dialog ref dlg, int lparam)
{
    if(checkRed)
    {
        gDc.SetBrush(0x0000FF);
        gDc.DrawEllipse(pointRedX-5, pointY-5, 10, 10);
    }
    if(checkBlue)
    {
        gDc.SetBrush(0xFF0000);
        gDc.DrawEllipse(pointBlueX-5, pointY-5, 10, 10);
    }
    timeDraw++;
    if(timeDraw > 100)
    {
        dlg.KillTimer(timeDrawEvent);
        testBtn.Enable(true);
        gDc.StopDraw();
    }
}

void pressTestBtn(Dialog ref dlg, int lparam)
{
    flashWnd = GetViewHwnd();
    gDc.StartDraw(flashWnd);
    testBtn.Enable(false);
    timeDraw = 0;
    CalckClickPoint();
    dlg.AddTimer(5, timeDrawEvent, 0);
}

CheckBox btnFire, btnMove;
bool isFire = true;
bool isMove = true;
bool isNoKickStart = false; 
int  statNoKickTime = 0;
void timeNoKickEvent(Dialog ref dlg, int lparam)
{//вызывается по таймеру
    if(statNoKickTime == 0)//имитация клика по окну
        flashWnd.SendKeyDown(isMove?('A'):('Z'));
    if(statNoKickTime == 3 && isFire)//начнем сстрелять
        flashWnd.SendKeyDown(' ');
    if(statNoKickTime == 10 && isFire)//закончим стрелять
        flashWnd.SendKeyUp(' ');
    if(statNoKickTime == 9)
        flashWnd.SendKeyUp(isMove?('A'):('Z'));
    if(statNoKickTime == 15)
        flashWnd.SendKeyDown(isMove?('D'):('X'));
    if(statNoKickTime == 19)
        flashWnd.SendKeyUp(isMove?('D'):('X'));
    statNoKickTime ++;
    if(statNoKickTime>20)//начнем цикл заного
        statNoKickTime = 0;
}

void pressNoKickBtn(Dialog ref dlg, int lparam)
{//вызывается при нажатии кнопки
    if(isNoKickStart)
    {//остановка
        clickerBtn.Enable(true);
        noKickBtn.SetText("Start");
        flashWnd.SendKeyUp('D');
        flashWnd.SendKeyUp('A');
        flashWnd.SendKeyUp('Z');
        flashWnd.SendKeyUp('X');
        flashWnd.SendKeyUp(' ');
        dlg.KillTimer(timeNoKickEvent);
    }else{//старт работы
        flashWnd = GetViewHwnd();
        statNoKickTime = 0;
        clickerBtn.Enable(false);
        dlg.AddTimer(100, timeNoKickEvent, 0);
        noKickBtn.SetText("Stop");
    }
    isNoKickStart = !isNoKickStart;//изменим статус
}

void pressCheckNoKickBtn(Dialog ref dlg, int lparam)
{//считаем состояние чекбоксов
    isFire = btnFire.IsChecked();
    isMove = btnMove.IsChecked();
    if(!isFire)
        flashWnd.SendKeyUp(' ');
    if(!isMove)
    {
        flashWnd.SendKeyUp('D');
        flashWnd.SendKeyUp('A');
    }else{
        flashWnd.SendKeyUp('Z');
        flashWnd.SendKeyUp('X');
    }
    statNoKickTime = 0;
}

void closeDlg(Dialog ref Dialog,  int param){}
Dialog ref dlg = CreateDialog("Clicker", 200, 200, 220, 135, closeDlg);

dlg.AddGroupBox("Clicker to start game", 5, 5, 203, 45);
btnR  = dlg.AddCheckBox("Red", 73,  25, 40,15,pressCheckClickerBtn, 0);//добавим чекбокс за красных
btnB = dlg.AddCheckBox("Blue", 118, 25, 40,15,pressCheckClickerBtn, 0);//добавим чекбокс за синих
btnR.Checked(checkRed);
btnB.Checked(checkBlue);
testBtn    = dlg.AddButton("Test",  162, 22, 38, 20, pressTestBtn,    0);
clickerBtn = dlg.AddButton("Start",  13, 22, 50, 20, pressClickerBtn, 0);

dlg.AddGroupBox("No Kick Clicker", 5, 55, 203, 45);
noKickBtn = dlg.AddButton("Start", 13,72, 50, 20, pressNoKickBtn, 0);
btnFire = dlg.AddCheckBox("Fire", 75,  75, 45,15,pressCheckNoKickBtn, 0);
btnMove = dlg.AddCheckBox("Move", 130, 75, 45,15,pressCheckNoKickBtn, 0);
btnFire.Checked(isFire);
btnMove.Checked(isMove);

dlg.Show(true);//Показать диалог
dlg.WaitClose();//ждем закрытия диалога
return 0;


