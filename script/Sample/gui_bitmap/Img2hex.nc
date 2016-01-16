import base.win;
import base.gui;
import std.file;
import "./FlashEx_img.nc";
Dialog  ref hDlg;
EditBox hEditIn;
EditBox hEditOut;

//Скрипт переводит картинку в текст для вставки на форму
//фильт файлов настроен на jpg но можно png, icon (с альфа каналом)


char[] ToHex(int n)
{
    char[8] r;
    for(int i = 0; i < 8; i++)
    {
        int c = n&0xF;
        n >>= 4;
        if(c < 10)
            r[7-i] = c+'0';
        else
            r[7-i] = c + 'A'-10; 
    }
    return r;
}

void btnConvert(Dialog ref dlg, int param)
{
    File fileIn, fileOut;
    fileIn.Open(hEditIn.GetText(), "rb");
    if(!fileIn.Opened())
    {
        dlg.Msg("Open image file", "Error");
        return;
    }
    fileOut.Open(hEditOut.GetText(), "w+");
    if(!fileOut.Opened())
    {
        fileIn.Close();
        dlg.GetHWND().MessageBox("create out file", "Error", 0x10/*MB_ICONERROR*/);
        return;
    }
    long size = fileIn.Size();
    fileOut.Print("int[] imgData = {\n    0x");
    int d4, endFor = size>>2;
    for(int i = 0; i < endFor; i++)
    {
        if(i)
        {
            if(i&7)
                fileOut.Print(", 0x");
            else
                fileOut.Print(",\n    0x");
        }
        fileIn.Read(d4);
        fileOut.Print(ToHex(d4));
    }
    d4 = 0;
    if(size%4)
    {
        fileIn.Read(d4);
        fileOut.Print(", 0x");
        fileOut.Print(ToHex(d4));
    }
    fileOut.Print("\n};\n");
    fileOut.Close();
    fileIn.Close();
}



void btnSelectImage(Dialog ref dlg, int param)
{
    char[] nameFile;
    HWND wnd = dlg.GetHWND();
    if(wnd.OpenFile(nameFile, "*.jpg"))
    {
        hEditIn.SetText(nameFile);
    }
}

void btnSaveImage(Dialog ref dlg, int param)
{
    char[] nameFile;
    if(dlg.GetHWND().SaveFile(nameFile, "*.nc"))
        hEditOut.SetText(nameFile);
}

void closeDlg(Dialog ref Dialog, int param){}
hDlg = CreateDialog("image to hex", 200, 200, 450, 115, closeDlg);
hDlg.AddStatic("image file:", 5,8, 55, 20);
hDlg.AddStatic("out file:", 15,35, 55, 20);
hEditIn  = hDlg.AddEdit("", 60,5, 300, 20);
hEditOut = hDlg.AddEdit("", 60,30, 300, 20);
hDlg.AddButton("...", 365,  5, 30, 20, btnSelectImage, 0);
hDlg.AddButton("...", 365, 30, 30, 20, btnSaveImage, 0);
hDlg.AddButton("Converting", 10, 55, 425, 25, btnConvert, 0);
hDlg.AddImage(imgData, 395, 5);
hEditIn.ReadOnly(true);
hEditOut.ReadOnly(true);
hDlg.Show(true);
hDlg.WaitClose();
return 0; 
