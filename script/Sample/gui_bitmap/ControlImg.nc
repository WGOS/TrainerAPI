import base.gui;
import std.file;
void closeDlg(Dialog ref Dialog, int param){}
Dialog ref hDlg = CreateDialog("Test window", 200, 200, 400, 200, closeDlg);

File file;
file.Open("D:\\Icon.ico", "rb");//откроем файл на чтение (можно другой формат jpg, png и тдж)
if(file.Opened())
{
    int sizeFile = file.Size();//размер файла
    char[] data = new char[sizeFile];//выделим память
    file.Read(data, 0, sizeFile);//зачитаем данные
    file.Close();
    hDlg.AddImage(data, 10, 10);//добавим контр
    //создавать такой контрл лучше в функции, чтоб менеджер памяти смог удалить лишнее
    //(ссылка на data исчезнет когда выйдем из функции)
}
hDlg.Show(true);
hDlg.WaitClose();