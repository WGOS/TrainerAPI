import base.win;
import base.gui;

EditBox edit;
EditBox editML;
CheckBox checkBtn1, checkBtn2;
ComboBox combo;
ListBox list;

void  close(Dialog ref dlg, int lparam)
{}

int gCountTimr = 0;
int pressCount = 0;
void timeEvent(Dialog ref dlg, int lparam)
{
    if(gCountTimr == 5)
    {
         Beep(1000, 1000);
        dlg.KillTimer(timeEvent);
    }else        Beep(1000, 500);
    gCountTimr++;
}

void pressBtn(Dialog ref dlg, int lparam)
{
    Beep(1000, 400);
    pressCount++;
    edit.SetText("нажали "+pressCount.str()+" раз");
    editML.SetText("check1: "+ int(checkBtn1.IsChecked()).str()+"\r\n"+
"check2: "+ int(checkBtn2.IsChecked()).str()+"\r\n"
);
}

void pressCBtn(Dialog ref dlg, int lparam)
{
    checkBtn2.GetHWND().Enable(checkBtn1.IsChecked());
}

void selCombo(Dialog ref dlg, int lparam)
{
    checkBtn2.GetHWND().Enable(true);
}

void selList(Dialog ref dlg, int lparam)
{
    checkBtn2.GetHWND().Enable(true);
}

Dialog ref dlg= CreateDialog("test Dlg", 100, 100, 300, 200, close);

dlg.Show(true);
dlg.AddTimer(1000, timeEvent, 0);
dlg.AddButton("test", 10,10, 30,15,pressBtn, 0);
dlg.AddStatic("static text", 10,30, 30,35);
dlg.AddStatic("static:", 50,10, 30,35);
edit     = dlg.AddEdit("edit", 80,10, 80, 20);
editML   = dlg.AddEditMultiLine("edit\r\nMulti Line\r\ntt", 80,30, 100, 80);
checkBtn1= dlg.AddCheckBox("Check 1", 12, 75, 60, 15, pressCBtn, 0);
checkBtn2= dlg.AddCheckBox("Check2", 12, 95, 60, 15, pressCBtn, 0);
combo    = dlg.AddComboBox(20,120, 100,247, selCombo);
dlg.AddGroupBox("Group box",5, 58, 73, 60);
checkBtn2.GetHWND().Enable(false);
checkBtn2.Checked(true);

list  =dlg.AddListBox(120,120, 100,37, selList);

dlg.AddRadioButton("radio 1", 180,10, 80,15,pressBtn, 0, true);
dlg.AddRadioButton("radio 2", 180,30, 80,15,pressBtn,0).Checked(true);
dlg.AddRadioButton("radio 3", 180,50, 80,15,pressBtn,0);

dlg.AddRadioButton("radio g1", 180,80, 80,15,pressBtn,0, true);
dlg.AddRadioButton("radio g2", 180,100, 80,15,pressBtn,0).Checked(true);

list.Add("Item 1");
list.Add("Item 2");
list.Add("Item 3");
list.SetCurSel(1);
//list.Select("Item 3");
//list.Delete(1);
combo.Add("Item 1 f  fe");
combo.Add("Item 2");
combo.Add("Item 3");
//dlg.WaitClose();
dlg.Show(true);
combo.Select("Item 3");
combo.Insert("insert", 0);
combo.SetCurSel(1);
combo.Delete(1);

char[]  nameF;
//bool r = dlg.SaveFile(nameF,"*.nc");
//dlg.Config();
int w = list.GetCurSel();
return 1;

