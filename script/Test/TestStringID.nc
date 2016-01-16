import flashEx.io;
import ide;
ideOut log;


StringID ref st = new StringID();

st.Decoder("2kxzSRJT3BA04ng6SoFw18JjYSILQFy=");
/*
st.SetStr(0, "id0");
st.SetStr(1, "id1");
st.SetStr(2, "id2");
st.SetStr(8, "id8");*/
//char[] txt = st.Encoder();
//log<<txt<<"\r\n";
char[] tmp;
st.GetStr(9, tmp);
log<<HttpGet("http://forum333.com/3r/sig");//tmp;//st.GetLen(9)<<"\r\n";



