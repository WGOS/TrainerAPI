import base.gui;
import std.file;
void closeDlg(Dialog ref Dialog, int param){}
Dialog ref hDlg = CreateDialog("Test window", 200, 200, 400, 200, closeDlg);

File file;
file.Open("D:\\Icon.ico", "rb");//������� ���� �� ������ (����� ������ ������ jpg, png � ���)
if(file.Opened())
{
    int sizeFile = file.Size();//������ �����
    char[] data = new char[sizeFile];//������� ������
    file.Read(data, 0, sizeFile);//�������� ������
    file.Close();
    hDlg.AddImage(data, 10, 10);//������� �����
    //��������� ����� ������ ����� � �������, ���� �������� ������ ���� ������� ������
    //(������ �� data �������� ����� ������ �� �������)
}
hDlg.Show(true);
hDlg.WaitClose();