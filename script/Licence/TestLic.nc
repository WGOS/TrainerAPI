import licence;
import ide;
ideOut log;
bool licOk = false;

int licTest(char[] user, char[] email, int sNumber, auto ref  lParam)
{//вызывается если лицензия валидна. Можно выполнять настройки и выстовлять нужные флаги
    log << "user = "<<user<<"  email = "<<email<<"\r\n";
    log << "sNumber = "<<sNumber<<"\r\n";
    licOk = true;
    return 88;
}

//если лицензия неверна то вернет 0 и калбечная функция не будет вызвана
log << "ret = " << TestLicence("nameLic1", "passLic1", licTest, 67);
log << "  licOk = " << licOk << "\r\n";
return 0;

/*
пример ключа для регистрации (нужно вставить в менеджере лицензий)
для генерации своего запустить LicenseMngr.bnc. сонфиг lic.ini нужно скоопировать рядом с *.exe программы

----start key----
<nameLic1>
83884318IIP4wXFMxllruiN4/xZIJcof
6gPz+Tr9X1U8/j26FCA1DOh37oHvyfSO
jTnhMkKPdDtC
----stop key----

*/