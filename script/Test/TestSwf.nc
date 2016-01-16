import flash.swf;

FwsManager ref swf = new FwsManager();

swf.Load("d:\\test.swf");
swf.Save("d:\\test_.swf");
swf.SaveTag("d:\\tag0.swf",80);