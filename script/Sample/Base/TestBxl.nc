import base.bxl;
class structTest{int i, r; double dd;}
char c = 1;
short s = 2;
int i = 4;
long l = 8;
float f = 0.4;
double d = 0.8;
char[] str = "string";
structTest tt;
tt.i = 123456;
tt.dd = 1234.4321; 
Bxl ref bxl = new Bxl("test.bxl");
bxl.OpenDir("prime");
 bxl.Write("char", c);
 bxl.Write("int", i);
 bxl.Write("short", s);
 bxl.Write("float", f);
 bxl.Write("double", d);
 bxl.Write("int64", l);
bxl.CloseDir();
bxl.Write("struct", 22, tt);
bxl.OpenDir("v0");
 bxl.OpenDir("v1");
  bxl.OpenDir("v2");
   bxl.Write("txt", "test");
  bxl.CloseDir();
 bxl.CloseDir();
bxl.CloseDir();
//bxl.Close();



