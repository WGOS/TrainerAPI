import base.win;
import base.gui;
import flashex.io;

HWND fl = GetViewHwnd();
HWND btn;
bool isStart = false; 
int statTime;

void closeDlg(Dialog ref Dialog,  int param)
{//���������� ��� ��������
}

void timeEvent(Dialog ref dlg, int lparam)
{//���������� �� �������
    if(statTime == 0)//�������� ����� �� ����
        fl.SendKeyDown('A');
    if(statTime == 3)//������ ���������
        fl.SendKeyDown(' ');
    if(statTime == 10)//�������� ��������
        fl.SendKeyUp(' ');
    if(statTime == 9)
        fl.SendKeyUp('A');
    if(statTime == 15)
        fl.SendKeyDown('D');
    if(statTime == 19)
        fl.SendKeyUp('D');
    statTime ++;
    if(statTime>20)//������ ���� ������
        statTime = 0;
}

void pressBtn(Dialog ref dlg, int lparam)
{//���������� ��� ������� ������
    if(isStart)
    {//���������
        btn.SetText("Start");
        dlg.KillTimer(timeEvent);
    }else{//����� ������
        statTime = 0;
        dlg.AddTimer(100, timeEvent, 0);
        btn.SetText("Stop");
    }
    isStart = !isStart;//������� ������
}

Dialog ref dlg = CreateDialog("NoKick", 200, 200, 180, 80, closeDlg);
btn = dlg.AddButton("Start", 5,5, 150,40,pressBtn, 0);//������� ������
dlg.Show(true);//�������� ������
dlg.WaitClose();//���� �������� �������
return 0;

















