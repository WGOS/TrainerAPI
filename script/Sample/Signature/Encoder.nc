import base.gui;
import flashEx.mem;
Dialog  ref hDlg;
EditBox hEditIn;
EditBox hEditOut;

//Скрипт для шифрования сигнатур
//Функции для работы с ними уже встроены ( int[] )

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

void buttonEvent(Dialog ref dlg, int param)
{
    int[] enc = Signature.Encoder(hEditIn.GetText());
    int size = enc.size;
    if(!size)
    {
        hEditOut.SetText("Error");
        return;
    }
    char[] outTxt = "int[] siga = {\r\n    0x";
    for(int i = 0; i < size; i++)
    {
        if(i)
        {
            if(i&7)
                outTxt += ", 0x";
            else
                outTxt += ",\r\n    0x";
        }
        outTxt += ToHex(enc[i]);
    }
    outTxt += "\r\n};\r\n";
    hEditOut.SetText(outTxt);
}

void closeDlg(Dialog ref Dialog, int param){}
hDlg = CreateDialog("encoding signatures", 200, 200, 607, 200, closeDlg);
hDlg.AddStatic("Signatura:", 5,8, 55, 20);
hEditIn = hDlg.AddEdit("", 60,5, 530, 20);
hDlg.AddButton("Encoder", 130, 30, 350, 25, buttonEvent, 0);
hEditOut = hDlg.AddEditMultiLine("", 5, 60, 590, 105);
hEditOut.ReadOnly(true);
hDlg.Show(true);
hDlg.WaitClose();
return 0; 