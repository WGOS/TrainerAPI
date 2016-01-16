int[] imgData = {//тестовая картинка
    0x474E5089, 0x0A1A0A0D, 0x0D000000, 0x52444849, 0x30000000, 0x30000000, 0x00000608, 0xF9025700,
    0x13000087, 0x41444993, 0xB5DE6854, 0x67B07B7A, 0xB7E67555, 0xDFAF3EF6, 0xF71EFEEB, 0xF4D17EDE,
    0x43634783, 0x01DA2813, 0x45324291, 0x489A82A6, 0x61931C61, 0xBC9AD462, 0x71394C46, 0x928CC9C6,
    0x54D68319, 0x10262431, 0x09346635, 0x10944215, 0x16A21505, 0x00E84111, 0x60223483, 0x9BBA2FD3,
    0xEDEF7DBE, 0x79EFEF7B, 0xE6B9FB9E, 0x9A997B8F, 0xDBAC49AA, 0xAAD54E40, 0x539F673A, 0x3D6FBFB5,
    0xAD6BDEF6, 0xD79D7843, 0xCD1847A3, 0xB39EC108, 0x30F3BF19, 0x63174DEC, 0x66E8E573, 0x4092F829,
    0x12088350, 0x6280CF04, 0xFE12E38F, 0x1E2B338F, 0x32D364BF, 0x26CD5C7E, 0x56FC1FFB, 0xB89F87F5,
    0x1E0FFB09, 0x8BF34D7B, 0x8BFE03D7, 0x433058CF, 0x83FB0108, 0xD9AFE413, 0x9654F782, 0xBE081B3E,
    0x8BD4922A, 0x01C5AE02, 0x5AE489C7, 0x052DB824, 0x9F40E45F, 0xC3FE058C, 0xB4CE97C5, 0x20C54223,
    0x00032DA9, 0x7FA17E1E, 0xB5E818C6, 0x51982F00, 0xC2F893A7, 0x1D88B60F, 0x16BDF235, 0x7FC4016F,
    0x2D74866F, 0x8038FB04, 0x5082248B, 0x111240FA, 0xCE18E011, 0x88E33838, 0x695443B4, 0x7C4711FE,
    0x9FF7DD4B, 0x17F1E27E, 0xE17FFBE4, 0x0BF0F75A, 0x8A69E47D, 0xC772BF9F, 0xBE059F3F, 0x211F42FB,
    0x66D1A580, 0xDF7B1B39, 0xF65EFC4C, 0x7020777C, 0x424F05AD, 0x1F222AC1, 0x58A392C4, 0x290E388A,
    0xC7110289, 0x72489292, 0x02EF0914, 0x7E14A1E2, 0x9FCCCE97, 0xEF1B8E2D, 0xBAECF8B9, 0x7FEDD4FB,
    0xE6794811, 0xE4CF210E, 0xF40EC7E3, 0x329041E1, 0x513C7790, 0xF11D9DBA, 0x3EE45696, 0x4CC1051F,
    0x850B2928, 0x0658A28B, 0x51045D61, 0x44006140, 0x88287C92, 0x71052103, 0xE10B1C28, 0x2AA2F19D,
    0x9596552B, 0x9B3F1E74, 0xFBF9D307, 0x33F979DF, 0x7F677C0F, 0x73BCE3B8, 0x3F001C7D, 0x75B1F278,
    0x0BD60A61, 0x17E791FE, 0x14A400C1, 0x076B9FA2, 0xD6370BE2, 0x1051EDCC, 0x8C016A76, 0x3D402809,
    0x238FEE60, 0x8A62743A, 0x468869BC, 0x425A8812, 0x94AB8660, 0x686AE327, 0x6ECC5276, 0x13768B1D,
    0xA4071383, 0x710740A7, 0x7CF7E3FD, 0x5BFE44F7, 0x9EFABBEF, 0x777EDD4F, 0xA3C1E2F8, 0xFBBFAEE6,
    0x8EF7DE01, 0x3171BF37, 0x2B4BC4F0, 0xDEC09E30, 0xDEE292D3, 0xAEF0E9EE, 0xA60B8392, 0x28F2111B,
    0x2C7978AA, 0x31BE87A3, 0xDCBFCC9D, 0x1EDCEC69, 0x137C2ED4, 0x401B8DC2, 0xC3300271, 0xC9CC1967,
    0x74BC5057, 0x8B694508, 0x2F37E2FC, 0xCF773E9D, 0xFE67C5E4, 0x7A767377, 0x64519593, 0x6FD2E1AA,
    0xF3AAF3BC, 0x89F4DDF7, 0xDFCB82DB, 0x776D9572, 0xDEEFF067, 0x77EBCD7D, 0x9FF687A1, 0x4751AB40,
    0xC0F1612D, 0x6B2F934A, 0xAC2A9F56, 0x9D8DE9F8, 0x663D7D84, 0x9ABEC8FD, 0xDBADECF8, 0x5A8763C2,
    0x5297BDCD, 0x20F6A7ED, 0xE22174E8, 0x88052408, 0x44052408, 0x228A01BD, 0x1C7E97D8, 0xD03D6FA9,
    0xE5C713E1, 0xD5B9DB70, 0xA085C5C9, 0x2C47AF55, 0x8F873D83, 0xB7FBF89F, 0x5E45735F, 0x8CCC18F8,
    0xE773DC6F, 0x4BC4131B, 0x399E94C3, 0x1BABFA90, 0xCF6A7783, 0x03374C37, 0xB8E3351D, 0xB6AF9BF8,
    0x383FF9F0, 0xD851E31B, 0x1CADEAB8, 0xCE04DE6D, 0x026CE252, 0x555073CE, 0x9092AA12, 0x84E9F0E7,
    0xFD511C64, 0xDC38CBB2, 0xC3D3C1B0, 0xEB399EDF, 0xA4DD9F4B, 0xE7D44FE6, 0x5B1CE717, 0xA2E5517B,
    0xFCBCAE9B, 0xDEEFBE32, 0x99E983BB, 0x9EF4FE1E, 0x047D7FBF, 0x20F27C1E, 0x2A5140C0, 0x577D0D2C,
    0x495BFB3A, 0xCD7BB400, 0x6FF5FE7A, 0x5FBDEC36, 0x41B560D9, 0x2CDDC2FD, 0xFD7235EB, 0x19CB383E,
    0x33C84659, 0x94439142, 0x08CF3839, 0x1A370145, 0x8D433B31, 0x60A26FDD, 0x4747C666, 0xDF36360E,
    0xA9DEE5FB, 0xE39A07C3, 0x120A5C6C, 0xA7E8FDEF, 0xF7ADE4FF, 0xFB79F5DF, 0x263E8F0F, 0x437E28C2,
    0xE600202C, 0xFF162FAB, 0xF777E086, 0x07C0A7A6, 0xDF654C0F, 0x94EDA07C, 0x829ED966, 0xF4C8B4EC,
    0x82F2EC87, 0x1D929A5C, 0x2347E08F, 0x6E10D1F8, 0x8F1F8434, 0xF823C6E1, 0x1C3B233C, 0xDA890281,
    0x4504B3D6, 0x5C599F91, 0xAFFEE90C, 0xE7E6E776, 0x9A28AAA2, 0xD760BA6F, 0x517916AF, 0x4450CD8B,
    0xEFDB8041, 0x11B5FFBC, 0x3F7BEFB8, 0x55A03304, 0x9A355BEE, 0x17FAA71D, 0xB4D8B5EB, 0x47D3B4D8,
    0xB29BAD1F, 0x08965B60, 0x93B21D3A, 0x91965D94, 0xA3B0A49D, 0x0470DC11, 0x2F43E833, 0x579661F7,
    0xD8030760, 0x347608D1, 0x98734B86, 0x4EA290C1, 0xA628C387, 0xF4FD8C24, 0xF2D1C391, 0xC6F60F43,
    0xD2B4AE65, 0xB6FC7CD7, 0xCB7D5D2F, 0x7B57FDEF, 0xC101C8F4, 0x65C6BFDE, 0x16040994, 0x1B7DE563,
    0x0C815DFA, 0x895A7476, 0x4E0E4777, 0x84E727E5, 0x3D2F0BC9, 0xCD9E760B, 0x48DC4C60, 0x63016700,
    0xE6414AC0, 0x01284431, 0x383AD810, 0x0D4B60AD, 0x59309453, 0x052DA701, 0xE4E826CD, 0xC2717A02,
    0xD7D89E87, 0xA5F17D38, 0xC5E17C69, 0xE779DE74, 0xFF3BC7BC, 0x2CE64D08, 0x36BD3775, 0x50C7580B,
    0x2D0BE965, 0x77DACE6A, 0xAF916AD5, 0x3CAA7CEB, 0xD2AC3C7E, 0x93965594, 0x49330CF5, 0x30C78CC9,
    0x70CC09A3, 0x411C3D0C, 0x2B5087F5, 0xFEA5A803, 0xA1F4ACAA, 0x83D04657, 0x0C70CC21, 0x47A14E33,
    0xCC909013, 0x882D51CE, 0xB4A596B8, 0xA787FDFC, 0x4650B2B2, 0xED7EABAB, 0xD172DE3F, 0xC27F37CD,
    0xDFA1A185, 0x673DE2FF, 0x7CAF8166, 0x90C21F7B, 0x9BCD6949, 0x8F66F712, 0x16AB7770, 0x9A97F532,
    0x95007F45, 0x428BAC66, 0x347A0810, 0xB0030F86, 0xF0D68036, 0x21C6414A, 0x2EAE1844, 0xCCF0CCA3,
    0x4B61E760, 0xB8295F05, 0x1A55C152, 0x24126954, 0xA9A5B010, 0x0385E138, 0xC706D7CF, 0x79C9068F,
    0xED17BABB, 0x4233F3D9, 0xAF7BFDCA, 0xFC6E91B9, 0x8CF9EBE5, 0x5479685D, 0x74406941, 0x5366DAE9,
    0xA1B67526, 0x62C24C9B, 0xCB2AE63C, 0x83259549, 0xA1004904, 0x09457090, 0xB5044A13, 0x208E3218,
    0x0F7560C3, 0xA5780308, 0x101926E1, 0x47BCA884, 0x8B286596, 0x6251650A, 0x779516C2, 0x73019354,
    0x3F2B123A, 0xDBD1B67A, 0x40A0B3B6, 0x0F91FD5E, 0x7EBFF4DF, 0x39BFDDE1, 0xCFF69A3E, 0x040885CC,
    0x891B86C9, 0x9777B06C, 0x42E851C7, 0x91743795, 0xB98D18A3, 0x65940B2A, 0xA0514549, 0xA39473C8,
    0x839A4C11, 0x0CAB0865, 0xA5425674, 0x50A17405, 0xEC869FCE, 0x81F530F4, 0x774AC65F, 0x1E8F870A,
    0xD3C5C9C5, 0x63E95C58, 0xC5609D39, 0x8B7B2C5B, 0xC4403D9C, 0x6A0743A3, 0x9CE864D9, 0xDBDABBB3,
    0xD1705F76, 0xA7C3DCBF, 0x333B1F8E, 0x52DEB217, 0x124E7A18, 0xDA3BCBBD, 0x53258F5E, 0x51552799,
    0xA0993152, 0x46520A2C, 0x580B1BC3, 0xA2926A8B, 0x70EBCEFD, 0x033E17C9, 0x11444330, 0x45190CC0,
    0x3F07D1F8, 0xC4AAC584, 0x177A5F8E, 0xA2CFB3EC, 0x98825F9A, 0x0B39C16A, 0x33043CE7, 0x66780CC0,
    0xA7C68296, 0xE2C9C3E7, 0x1A356CBC, 0xDF5C6153, 0xD4FF385B, 0xA4AFCBEE, 0xE7DB76FF, 0x7D8F96F9,
    0xC42E9D68, 0x3155554C, 0x5A92F0BB, 0x0848D6AD, 0xAA0E8D92, 0xCB22E73C, 0xD20B2CB8, 0x036AC0D6,
    0x14541ECF, 0xB08471B0, 0x47E5853D, 0xB1F0C71E, 0xDA771027, 0xB438C0A8, 0x670459FF, 0x5939C16F,
    0xE848408E, 0x624882AA, 0xD9616B28, 0x08C5AEC3, 0x12122981, 0xE18B9165, 0xECDAC9DC, 0x0E3A1DF6,
    0xA55B25E4, 0x37B5CF10, 0xCFAD1079, 0xEBF85F02, 0x734A3107, 0x9C330E1E, 0x5BB3B1B5, 0xBB21120A,
    0x654B39C8, 0x28AAF996, 0x584AA8A8, 0x0778116B, 0x16760978, 0xCCC08E2E, 0x01FFBB98, 0xADFB78BC,
    0xEE45D160, 0xE6C0082D, 0x4510DB9D, 0x09AB6411, 0x1EC10CC3, 0x678C3D96, 0x00586658, 0x2202999E,
    0x2D9C70F6, 0x595437CF, 0xCE4920DA, 0x1FFED001, 0xF0C578BF, 0x23E57E67, 0xC2018DEB, 0xFDC070DC,
    0x6E77A58C, 0x36471C5B, 0xE73A1412, 0x2A73CCB8, 0xD2A54555, 0xE9459D28, 0x28F62A1D, 0x035681E1,
    0x0A4C8444, 0xB21EE30C, 0xC6C42ED9, 0x8430D859, 0x0CA11A52, 0xD09B3411, 0x619ED0CC, 0xC1D86198,
    0xEC7191AC, 0x00333059, 0x6038C9A8, 0xECE3126F, 0xBD6F27EC, 0xBFEDF67D, 0x21203BFA, 0xBC41DD69,
    0x67C5D5B5, 0x5B7BD3FE, 0x2AB9BCCC, 0xBFA8DAD2, 0xA1CE775C, 0x5A547228, 0xAA0C6973, 0x8B7BC157,
    0x14550E0C, 0x6C4BA260, 0x7107D0FF, 0x80FFF3C3, 0x6DFE3D77, 0xDF7BFDBC, 0x8B30D884, 0xC9102F2A,
    0x09AB4110, 0x0ECD0F05, 0xF6683BDA, 0x018097FF, 0x92498313, 0x57C9FCC4, 0x317A7CB0, 0x174C4292,
    0xAD2ACCDA, 0x75A7BCE0, 0x295190B9, 0xDD770240, 0x98B750F7, 0x763C2F0C, 0xC93387F0, 0xB2685DEE,
    0xC070F2C7, 0x6310B2C3, 0x85ADE0A3, 0x11C28F64, 0x294A2C0C, 0xE2C48520, 0x7260CF53, 0x46E238EC,
    0xCA1D6C03, 0x0EC444AA, 0x56A20401, 0xC2089A0B, 0x8679AABD, 0x0F0D0F65, 0x2663860B, 0xCF32F902,
    0x8FFBEFB1, 0x4CDEBD86, 0x4EEED5B7, 0xDACE0883, 0x9100C5F5, 0xB98924A7, 0x0EF469D3, 0xB76CF8BC,
    0x333F0ACC, 0xC2C54B3B, 0x286D693C, 0x35A91AD3, 0x3010EF60, 0x0E0EF623, 0x81AB511E, 0xC5E1107A,
    0x178BDF2F, 0x1A1AF81E, 0x200209A2, 0x085344A4, 0xA9E23048, 0x8400B416, 0x5F5AAB77, 0x330C3CD5,
    0xCCB0F7B4, 0x16A9ECCC, 0x4C983C27, 0x23D1D8F8, 0x7AAE2BF5, 0xCA00175B, 0x059F5F22, 0x84249084,
    0xDD7D6764, 0x496B2B18, 0x67A6A7EC, 0xB02C2E50, 0x08421224, 0x70B66638, 0x302019E4, 0xA341181C,
    0x442D6F01, 0x3EA886BD, 0x1A76788D, 0x334E8002, 0xF7900158, 0xB875EB08, 0xC0218430, 0x0CF1867A,
    0x0CCD0F03, 0x02266605, 0x1AB519E0, 0xB4670841, 0x129E6012, 0xFAF00082, 0x660CC02C, 0x2ACB28CF,
    0xA47BB568, 0x8A2321B3, 0xEDECFA69, 0x1B314AC4, 0x2C82120D, 0x604C1EC0, 0x9D440ECF, 0x0642B6B3,
    0x80107C01, 0xB34409EB, 0x64052109, 0x0D9A8214, 0xDED12948, 0x59BE19B2, 0x182AAA87, 0xD2661B06,
    0x7008ECCC, 0x9AF792D6, 0x74967765, 0x326E066F, 0x05DDAB41, 0x6EADAF91, 0x91B067AD, 0x6F787B31,
    0xB8D4924C, 0xA0D1A8D5, 0xCDD982BF, 0x1DEBB19B, 0x9395873F, 0xC7FA7473, 0x02ABD807, 0x20DB1110,
    0xF16B5124, 0x06FF5FD3, 0x344B4BC6, 0xBEB80C1C, 0xDDC52B6D, 0x4228820E, 0x127C1D64, 0xDE5FDF63,
    0x2713FDCD, 0x1926ADC0, 0xAA0D6B30, 0x4BAB61AC, 0x8D447862, 0xBE17070E, 0x3C024E85, 0xBD1C753E,
    0x6F515B0D, 0xB1DE014D, 0x7AD04208, 0x016201F7, 0x0881196F, 0x4C0820B3, 0xA3614714, 0x9595E3DD,
    0x36CDC63E, 0x0F8DFAEF, 0x07B5DC23, 0x847F1EA7, 0xC08F87C6, 0x38C21996, 0xBDEF27A6, 0xFB7DCF17,
    0xBCF1BC3B, 0x6739D073, 0xA6A7D707, 0x20EAD510, 0x8145D041, 0x0AFE5F7D, 0x6110E1F2, 0xCCA2CEAB,
    0xE39A15C9, 0x73DD46A4, 0xFCF8E3CE, 0x7670D137, 0xBD3A1F03, 0x0743FDC8, 0x44DD9DD0, 0x9259E9ED,
    0x9F7BC042, 0xB6B1EF0B, 0x85C3AEC2, 0xC1D96188, 0x41849DB1, 0xBAE75B90, 0x4F6E4A42, 0xFCF0E2CF,
    0x27F7CD32, 0x35795D1C, 0xD775C5FE, 0x6531D373, 0x95E51F2F, 0x3E179E97, 0x892D711F, 0xA3A8DEA8,
    0xD1A0EDD9, 0x124A20ED, 0xD2B41110, 0x81DCECE8, 0xFA0AD2E1, 0x77882BCB, 0x61BADE0B, 0xDBAD9223,
    0x3E1B4979, 0x5FB8E270, 0x54465A59, 0x3B2D896F, 0x4E9947CF, 0x85144440, 0x97635921, 0x5FBC07BD,
    0x30D5812F, 0x6FD78DC0, 0xCEEE7C19, 0xDB18DF49, 0xADC52AA9, 0x54E68066, 0x53D2A287, 0xEA73927F,
    0x6DB6D886, 0xEEB96F07, 0xFCB8DC1D, 0x2CAD9772, 0x601C54D2, 0xDB9774D3, 0x92D51ACD, 0x89DAE118,
    0x4A8F58D4, 0xC68FEE5B, 0x698D1E58, 0xD20F0CA2, 0x0796178C, 0x66965418, 0xCDA2EC77, 0xA311EFE7,
    0x3F1E05A5, 0x333314FB, 0xA22C71C5, 0xDB5E3030, 0xEC182779, 0x063BAF1D, 0xF47C0848, 0x9D199F77,
    0x84E36E7B, 0xBCDCEEB3, 0x6A9ED128, 0xC0881242, 0xD2886190, 0xBF3CBD13, 0x98D19588, 0x5A1A8D7B,
    0xCD5A1E9D, 0x16BD1A1A, 0x1A06AD5A, 0x90288C49, 0x06380900, 0xDA08F5B4, 0x149D925D, 0x8A909834,
    0xF7AE9A73, 0xB214A6A8, 0xFD2788D1, 0x94F32E65, 0x1100B5BC, 0x1175EA37, 0x6FF960CA, 0xE4F7BBEF,
    0x07BFD70D, 0x04FFFDCE, 0xED553FC4, 0xDE894AB2, 0x1F8C012C, 0x270C6679, 0x850667A9, 0x30248481,
    0x8E7223BC, 0x44441805, 0xD9A80C22, 0xD7A7536E, 0x25A366A3, 0x30A62892, 0x41081490, 0x38093101,
    0x79046762, 0x64888247, 0x41484928, 0x22E859DE, 0xE4155367, 0x2B2E858C, 0x48586B38, 0x8346ADC9,
    0x0BF0E889, 0xF8BE3F4F, 0x6DFDDFE9, 0x8FAC5528, 0xFFEF4DC0, 0x21C6B0D7, 0xDE600909, 0xF7EA0027,
    0x8B5AC247, 0x092C9438, 0x3BD99824, 0x7668CE43, 0x358AAECE, 0x6661ACEC, 0x92CC44C7, 0x96208588,
    0xC10A5882, 0x133EAE52, 0xECF7BD98, 0x0CEF659C, 0x69C8633B, 0x5454CEC3, 0xE77B1915, 0x3F628A28,
    0xF7906CD5, 0xECEF89EE, 0xF9BEB1FB, 0x08412FB6, 0xC684FEB9, 0x65BDEB19, 0x484F3678, 0x9A4985A2,
    0xB82B348A, 0x892C451E, 0x9D89E120, 0xAC863383, 0x218C6456, 0x67192D6D, 0xCE473AC9, 0x93DE727B,
    0x998E4F67, 0x9DE4F7BC, 0x691CEB27, 0x4B58C8E7, 0x5AB26B56, 0xD61A3393, 0x8555D228, 0x20194F2A,
    0xB25AB54C, 0x2A8C4B56, 0x2AE787B3, 0xFE7F4985, 0xC5465D1F, 0x129AAA4F, 0xD2F73D31, 0x7E667991,
    0x4B452B44, 0x471F7D2B, 0x8081C521, 0x859C8300, 0x29461A35, 0x54A14AA8, 0x28D2A50A, 0x0DA941B5,
    0xC650B194, 0xCA871941, 0xAEC69438, 0xAA14ABBE, 0x0A5282AA, 0xAA982946, 0x550A5182, 0x39E54191,
    0xD7BE9484, 0xE21492E9, 0x7F1FBBB9, 0xEBF3E9F9, 0x3126110D, 0x1FD3FF7E, 0xD294B33F, 0x5B9D873A,
    0xE48A2336, 0x2770015F, 0x9DE117E7, 0x588E3D43, 0x0EF0B3C2, 0xB2A82B56, 0xC8145544, 0x2C931CB2,
    0x302B38C7, 0xCB8C2BCE, 0x52ABE90A, 0x69E3AB94, 0x91CF2C86, 0x22CA0565, 0xD0145547, 0x555D0955,
    0xACC78C5C, 0xA6A62555, 0xD533B8A6, 0x57CCE722, 0x6FEB773E, 0xC7F3FE8F, 0xE8D64A3E, 0x3F89CB33,
    0xC00FE1F6, 0x8FC7CD5A, 0xA1D0E02D, 0xD10587F9, 0x38D1E393, 0xF15A5C58, 0xC41D569D, 0xB33D824C,
    0x02CAA8D6, 0x6904C993, 0x169C6056, 0x0619A618, 0x4FE95593, 0x02D20C72, 0x30C73483, 0x4ACA312B,
    0xD229C60C, 0xCB228A49, 0x54251551, 0x732EB059, 0x160346CA, 0xD986FC24, 0xC38E220D, 0x3FED2FA3,
    0xCE1D37F1, 0xF7AB8AE9, 0x0A27FA3A, 0x2AB13FE9, 0x76604241, 0xAE6943B6, 0xB7E55D2A, 0x5F2BC931,
    0xDF8AFE3E, 0x2205E173, 0xBC4F2409, 0xAD86B623, 0x11CB24D5, 0xAA1F69FA, 0x6EDE41DD, 0xA16AD263,
    0xC288C49E, 0x52860C00, 0x6196690A, 0x19401C3C, 0xE403928F, 0xCF2A8669, 0x95251558, 0x3A79CA69,
    0xB4F4DEA1, 0xD15BB5E9, 0x3BE9E2C2, 0x5FD7723E, 0x7BC4FC9E, 0xEEF60DAF, 0xF17EC4BD, 0x733C3F8E,
    0xB6048202, 0xB9E59B6D, 0xF078BEB9, 0xE37DF7EB, 0xDAFFF7C6, 0xE0E183FD, 0x16A773DD, 0x29BB74EC,
    0x58569617, 0xA5454778, 0xB50187D8, 0xE4530142, 0xC512AB18, 0x18611960, 0xD5814A40, 0x4ED79D9C,
    0x6A5A409F, 0xA50A65E4, 0x94F32E2A, 0x78F15574, 0x10610965, 0x369B2DD8, 0xE478CC45, 0xF5B8EF4F,
    0xF27DBFCE, 0xBB15C16B, 0x9B08B5CF, 0xF1C1BDAF, 0x33F93F99, 0x2D19278C, 0xB1F0AD2C, 0x7CEDCF03,
    0xFDAEDBEB, 0x96E190BE, 0xE2CEDBED, 0xC4172763, 0x650278F2, 0xB157091C, 0xD6B0A265, 0x4756AD40,
    0xC288C49C, 0x60948110, 0x50B5AC30, 0xCF2A8555, 0x72A33DE0, 0xC92CAAE0, 0x93E71554, 0x4E179611,
    0xB75BEDF9, 0x0E6EDDA2, 0xDD72491A, 0x0DEDFE07, 0xEBA5FC3F, 0xDEC7046F, 0xF0743E1F, 0xB298B7B5,
    0xF11102AC, 0xF16999A6, 0x363F3F54, 0xDFF1BB33, 0xFA9C2E2F, 0x4E5789DA, 0xBC88288A, 0x5A5094AD,
    0xD5242071, 0x56D2C962, 0xAAA299F0, 0x20212820, 0xD7998049, 0xC10CF24E, 0x9CD4A284, 0x359C9A97,
    0xD90AAA6C, 0xDACFE868, 0x4EED19BC, 0xC3E813DB, 0xCB76DC77, 0xF03CEFFE, 0xA555E460, 0xF6389C8F,
    0xDF343AFA, 0x70EFE87B, 0xC1D7B5CD, 0x5E97C738, 0xE3BC9976, 0xE0E8FF8F, 0x3DEE9725, 0xCFE59555,
    0x93496597, 0x294AE534, 0xB4852AAA, 0x4F1A54D4, 0x03B583CA, 0x0B69038C, 0xD4A3C694, 0x60D2D396,
    0x5654969C, 0x586B7925, 0x99541557, 0x5B4E99BB, 0xEF5DBAF4, 0x9FCDFDAC, 0xFF9BF5FE, 0x6785F16A,
    0xEEBD9FE2, 0xDF9BFA7D, 0x698DEBBA, 0x7FDEFEB3, 0x088808F9, 0xE09CAF73, 0xC12E656A, 0xB9FF778E,
    0xCBD7F6B5, 0x412528B2, 0xAA70ACAA, 0x2555D9C8, 0x7CE722AB, 0x3464C63C, 0xC07F61A2, 0x479F7E83,
    0x464F0183, 0x09D32A23, 0x29B3994C, 0x14D32E0A, 0xDB3B2B5E, 0x66AD076D, 0xF54CA27D, 0xDCF83FC1,
    0x57F3BCFF, 0xDAD5AA7E, 0x9DDA65BA, 0x75DEC17F, 0xDBD6EFF5, 0xA9AD13E4, 0xC64E9C76, 0x27A920B5,
    0x1E9A2ABE, 0xF1B86FC8, 0x356B6F83, 0xA2649FBB, 0xE334935D, 0x120F694A, 0x9100A424, 0xD3716D58,
    0x9AB82A6A, 0xCEF67AEA, 0x4B5CC083, 0xD7A8D962, 0x7FDA9560, 0xA7F8EE6A, 0x83EEFB1E, 0x66F56BFB,
    0x8BC88483, 0x2801526C, 0xCC005401, 0x06A0411B, 0xD9085A60, 0x48D5DEF3, 0x329030C8, 0xB3174631,
    0x5CCCB71B, 0x3755F972, 0xFF33BA76, 0x633D100A, 0xF0B58C2D, 0xBF51579E, 0x4911093A, 0x01061441,
    0xB38030C2, 0xBCBFB166, 0x8F53E0F0, 0xAAD5FC3F, 0x832933C8, 0x02B6739A, 0x00280160, 0x007D0063,
    0xF5EE0013, 0x0D002010, 0xCC001B00, 0x000991AC, 0xCD642108, 0x1004D77B, 0xB767A775, 0xD175DCEF,
    0x1BB3D3A5, 0x7D492577, 0x49A0C923, 0x9ABD2144, 0x9DAF785F, 0xCB329333, 0x16979616, 0xF07CBE0E,
    0x2CF2E7F9, 0x09C00D3D, 0xFBDEC621, 0x035F8002, 0x2F80D7AB, 0x91AE1802, 0x08165D7A, 0x68014C01,
    0x8803A801, 0x1022C6D6, 0xACE80975, 0x68D6BB29, 0x6ECD36B6, 0xD3BDBADE, 0xC7159DED, 0x0A209EF5,
    0xACAA739C, 0x7F61958A, 0xE1696E69, 0xAAAD49D4, 0x88860065, 0x6B479988, 0xBED55F20, 0xD6CFBB59,
    0x68FF1448, 0xFC35E239, 0x49AC11EC, 0x820E2008, 0xA1441420, 0x6CCE4636, 0xCE7D3CD8, 0x5ADFBBF9,
    0x042FD7AB, 0x8ACB2ED0, 0x5A30B2CB, 0x83BDEB29, 0xE24A0208, 0x5A924824, 0xD8312714, 0x1D2C95BB,
    0xC5F8773F, 0xF2CE9E17, 0x75A6BA49, 0x5E88FFF3, 0xC093FB13, 0x01FFC003, 0xB74A78E2, 0x55C7F475,
    0x00000000, 0x444E4549, 0x826042AE
};
