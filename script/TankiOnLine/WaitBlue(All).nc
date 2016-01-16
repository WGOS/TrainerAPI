import flashex.io;
import std.io;
import base.win;
import std.time;
//Скрип ожидания места и авто заход за синюю (или зеленую) команду.
//Окно клиента должно быть маленьки (как при старте) и не свернуто.
//Во время ожидание главное не сворачивать окно клиента, но можно загораживать другими.
    HWND flashWnd = GetViewHwnd();

void BeepEx()
{
    Beep(500, 100);
    Beep(700, 300);
    Beep(500, 100);
    Beep(700, 300);
}

void ClickRed()
{ 
    flashWnd.MouseKeyUp(93,92);//0...100%
    Sleep(10);
    flashWnd.MouseKeyDown(93,92);
}

int count = 0;
do
{
    int color =  flashWnd.GetColor(93.5,92,10,10);//запрос среднего цвета в регионе 10х10 в кнопке за синих
    int R = (color&0xFF);//разбираем цвет на состовляющие
    int G = ((color>>8)&0xFF);
    int B = ((color>>16)&0xFF);
    count++;
    if(R>80&&R<110&&R==G&&G==B)//кнопка не активна (занято)
    {
        Sleep(100);
        if(count>1000)//раз в 1000 проверок всетаки кликать
        {
            count = 0;
            ClickRed();
        }
        continue;
    }
    if(R>115&&R<130&&R==G&&G==B)//можно нажимать (побелела)
    {
        ClickRed();
        Sleep(10);
        continue;
    }
    BeepEx();//кнопка пропала (можно бибикать)
    Sleep(500);
}while(1);

return 0;