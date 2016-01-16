import img.canvas;
import win.window;
import base.win;
import std.time;
import flashex.io;

    HWND ie = GetViewHwnd();

    auto width = 280, height = 50;
    Window main = Window("0,0", 400, 300, width + 5, height + 25);
    Canvas img = Canvas(width, height);
    char[256] keys;
    int color;
    double fx, fy;
    do
    {
        ie.GetMousePos(fx, fy);
        color = ie.GetColor(fx, fy, 20, 20);
        Sleep(50);
        if(color)
        {
            main.SetTitle("x = " + fx.str()+", y = " + fy.str()+
                          " R="+(color&0xFF).str()+
                          " G="+((color>>8)&0xFF).str()+
                          " B="+((color>>16)&0xFF).str());
            img.SetColor(color&0xFF, (color>>8)&0xFF, (color>>16)&0xFF);
            img.DrawRect(0, 0, width, height);
            main.DrawCanvas(&img, 0, 0);
        }
        main.Update();
        GetKeyboardState(keys);
    }while(!(keys[0x1B] & 0x80000000));
/*
char[] r = ("x = " + fx.str()+", y = " + fy.str()+
        " R="+(color&0xFF).str()+
        " G="+((color>>8)&0xFF).str()+
        " B="+((color>>16)&0xFF).str());*/
return 0;