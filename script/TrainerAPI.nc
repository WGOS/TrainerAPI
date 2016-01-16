/*
Trainer API 1.0.0
https://github.com/WGOS/TrainerAPI
*/

import base.gui;
import base.win;
import flashex.mem;
import licence;

char[] apiVer = "1.0.0";

char[] toStr(char[] inStr){
    int len = 0;
    for(;len < inStr.size && inStr[len]; len++){}
    if(!len)
        return "";
    char[] ret = new char[len+1];
    for(int i = 0;i<len; i++)
        ret[i] = inStr[i];
    ret[len] = 0; 
    return ret;
}

class Licence {
    char[] name, owner, mail;
    bool valid;
    
    int licCheck(char[] user, char[] email, int sNumber, auto ref intr){
        owner = toStr(user);
        mail = toStr(email);
        valid = true;
        return 666;
    }
    
    void Licence(char[] lname, char[] password){
        name = lname;
        TestLicence(lname, password, licCheck, 0);
    }
    
}

class TrainerAPI {
    Licence ref licence;
    char[] trainerName, trainerVer, author, site, licOwner, licOwnerMail;
    int buildNum, fCounter, maxFxVertical, maxFxHorizontal, maxFxSizeX, newX;
    bool licenceRq, licOk, notSaveMaxAlign;
    Dialog ref mainDlg;
    auto[] ref fxArr;
    
    void TrainerAPI(char[] gtrainerName, char[] gtrainerVer, int gbuildNum, char[] gauthor, char[] gsite){
        trainerName = gtrainerName;
        trainerVer = gtrainerVer;
        buildNum = gbuildNum;
        author = gauthor;
        site = gsite;
    }
    
    void TrainerAPI(Licence ref glicence, char[] gtrainerName, char[] gtrainerVer, int gbuildNum, char[] gauthor, char[] gsite){
        licence = glicence;
        trainerName = gtrainerName;
        trainerVer = gtrainerVer;
        buildNum = gbuildNum;
        author = gauthor;
        site = gsite;
    }

    void AddMainDialog(int x, int y, int width, int height, DialogEventCallBack onClose, bool showAuthor, bool showSite){
        char[] caption = trainerName + " v" + trainerVer;
        char[] copyright = trainerName;
        if(showAuthor) copyright += " by " + author;
        mainDlg = CreateDialog(caption, x, y, width, height, onClose);
        mainDlg.AddHyperLink("TrainerAPI " + apiVer, "https://github.com/WGOS/TrainerAPI", 5, height - 45, 78, 15);
        mainDlg.AddStatic("|", 88, height - 45, 2, 15);
        if(showSite){
            mainDlg.AddHyperLink(copyright, site, 95, height - 45, 1000, 15);
        }else{
            mainDlg.AddStatic(copyright, 95, height - 45, 1000, 15);
        }
        maxFxVertical = (height-45)/20;
        newX = 3;
        
    }
    
    void AddDialog(char[] caption, int x, int y, int width, int height, DialogEventCallBack onClose){
        CreateDialog(caption, x, y, width, height, onClose);
    }
    
    void AddDialog(HWND parent, char[] caption, int x, int y, int width, int height, DialogEventCallBack onClose){
        CreateDialog(parent, caption, x, y, width, height, onClose);
    }
    
    void AddDialog(Dialog ref parent, char[] caption, int x, int y, int width, int height, DialogEventCallBack onClose){
        CreateDialog(parent, caption, x, y, width, height, onClose);
    }
    
    Dialog ref AddDialog(char[] caption, int x, int y, int width, int height, DialogEventCallBack onClose, Dialog ref varDlg){
        varDlg = CreateDialog(caption, x, y, width, height, onClose);
        return varDlg;
    }
    
    void AddDialog(HWND parent, char[] caption, int x, int y, int width, int height, DialogEventCallBack onClose, Dialog ref varDlg){
        varDlg = CreateDialog(parent, caption, x, y, width, height, onClose);
    }
    
    void AddDialog(Dialog ref parent, char[] caption, int x, int y, int width, int height, DialogEventCallBack onClose, Dialog ref varDlg){
        varDlg = CreateDialog(parent, caption, x, y, width, height, onClose);
    }
    
    void ShowMainDialog(){
        mainDlg.Show(true);
        if(licence != nullptr && !licence.valid){
            mainDlg.Msg("To launch " + trainerName + " you need licence " + licence.name + "!", "Error.");
            mainDlg.Close();
        }
        mainDlg.WaitClose();
    }
    
    void ShowDialog(char[] caption, bool view){
        HWND dialog = FindWindow(nullptr, caption);
        dialog.Show(view);
    }
    
    void ShowDialog(Dialog ref dlg, bool view){
        dlg.Show(view);
    }
    
    void ShowDialog(HWND dlg, bool view){
        dlg.Show(view);
    }
    
    void WaitClose(Dialog ref dlg){
        dlg.WaitClose();
    }
    
    HWND GetDialogHWND(char[] caption){
        HWND dialog = FindWindow(nullptr, caption);
        return dialog;
    }
    
    HWND GetDialogHWND(Dialog ref dlg){
        HWND dialog = dlg.GetHWND();
        return dialog;
    }    
}

class Function {
    Licence ref licence;
    TrainerAPI ref api;
    CheckBox cb;
    char[] name, find, replace;
    int[] s;
    
    void executor(Dialog ref dlg, int parm){
        if(licence != nullptr && !licence.valid){
            cb.Checked(false);
            dlg.Msg("To use this function you must have licence: " + licence.name, "Error.");
        }
        switch(cb.IsChecked()){
            case true:
                s = Signature.Find(find, true, true);
                if(s.size){
                Signature.Replace(s, replace);
                }else{
                    cb.Checked(false);
                    dlg.Msg("Error while activating " + name, "Error.");
                }
                break;
            case false:
                Signature.Replace(s, find);
                break;
        }
    }
    
    void Function(TrainerAPI ref fapi, char[] fname, char[] ffind, char[] freplace){
        api = fapi;
        name = fname;
        find = ffind;
        replace = freplace;
        int newFxW = fname.size * 7;
        if(api.maxFxSizeX < newFxW) api.maxFxSizeX = newFxW;
        if(api.fCounter >= api.maxFxVertical){
            api.newX = api.newX + api.maxFxSizeX;
            api.fCounter = 0;
            if(api.notSaveMaxAlign){
                api.maxFxSizeX = newFxW;
            }
        }
        cb = api.mainDlg.AddCheckBox(fname, api.newX, api.fCounter*20, newFxW, 20, executor, 0);
        api.fCounter++;
    }  
    
    void Function(TrainerAPI ref fapi, Dialog ref dlg, char[] fname, char[] ffind, char[] freplace){
        api = fapi;
        name = fname;
        find = ffind;
        replace = freplace;
        int newFxW = fname.size * 7;
        if(api.maxFxSizeX < newFxW) api.maxFxSizeX = newFxW;
        if(api.fCounter >= api.maxFxVertical){
            api.newX = api.newX + api.maxFxSizeX;
            api.fCounter = 0;
            if(api.notSaveMaxAlign){
                api.maxFxSizeX = newFxW;
            }
        }
        cb = dlg.AddCheckBox(fname, api.newX, api.fCounter*20, newFxW, 20, executor, 0);
        api.fCounter++;
    }
    
    void Function(Licence ref flicence, TrainerAPI ref fapi, char[] fname, char[] ffind, char[] freplace){
        api = fapi;
        name = fname;
        find = ffind;
        replace = freplace;
        licence = flicence;
        int newFxW = fname.size * 7;
        if(api.maxFxSizeX < newFxW) api.maxFxSizeX = newFxW;
        if(api.fCounter >= api.maxFxVertical){
            api.newX = api.newX + api.maxFxSizeX;
            api.fCounter = 0;
            if(api.notSaveMaxAlign){
                api.maxFxSizeX = newFxW;
            }
        }
        cb = api.mainDlg.AddCheckBox(fname, api.newX, api.fCounter*20, newFxW, 20, executor, 0);
        api.fCounter++;
    }  
    
    void Function(Licence ref flicence, TrainerAPI ref fapi, Dialog ref dlg, char[] fname, char[] ffind, char[] freplace){
        api = fapi;
        name = fname;
        find = ffind;
        replace = freplace;
        licence = flicence;
        int newFxW = fname.size * 7;
        if(api.maxFxSizeX < newFxW) api.maxFxSizeX = newFxW;
        if(api.fCounter >= api.maxFxVertical){
            api.newX = api.newX + api.maxFxSizeX;
            api.fCounter = 0;
            if(api.notSaveMaxAlign){
                api.maxFxSizeX = newFxW;
            }
        }
        cb = dlg.AddCheckBox(fname, api.newX, api.fCounter*20, newFxW, 20, executor, 0);
        api.fCounter++;
    }  
}
