import licence;
import ide;
ideOut log;
bool licOk = false;

int licTest(char[] user, char[] email, int sNumber, auto ref  lParam)
{//���������� ���� �������� �������. ����� ��������� ��������� � ���������� ������ �����
    log << "user = "<<user<<"  email = "<<email<<"\r\n";
    log << "sNumber = "<<sNumber<<"\r\n";
    licOk = true;
    return 88;
}

//���� �������� ������� �� ������ 0 � ��������� ������� �� ����� �������
log << "ret = " << TestLicence("nameLic1", "passLic1", licTest, 67);
log << "  licOk = " << licOk << "\r\n";
return 0;

/*
������ ����� ��� ����������� (����� �������� � ��������� ��������)
��� ��������� ������ ��������� LicenseMngr.bnc. ������ lic.ini ����� ������������ ����� � *.exe ���������

----start key----
<nameLic1>
83884318IIP4wXFMxllruiN4/xZIJcof
6gPz+Tr9X1U8/j26FCA1DOh37oHvyfSO
jTnhMkKPdDtC
----stop key----

*/