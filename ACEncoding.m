function bit_seq=ACEncoding(x,y) 
Z=x;
v0=y;
R=abs(y);
if R==1;amplen=1;
elseif(R >=   2 & R <=    3);amplen = 2;
elseif(R >=   4 & R <=    7);amplen = 3;
elseif(R >=   8 & R <=   15);amplen = 4;
elseif(R >=  16 & R <=   31);amplen = 5;
elseif(R >=  32 & R <=   63);amplen = 6;
elseif(R >=  64 & R <=  127);amplen = 7;
elseif(R >= 128 & R <=  255);amplen = 8;
elseif(R >= 256 & R <=  511);amplen = 9;
elseif(R >= 512 & R <= 1023);amplen = 10;
end 
if (Z==0 & amplen==1); codelen=2;accode=0;
elseif  (Z==0 & amplen==2);codelen=2;accode=1;
elseif  (Z==0 & amplen==3);codelen=3;accode=4;
elseif  (Z==0 & amplen==4);codelen=4;accode=11;
elseif  (Z==0 & amplen==5);codelen=5;accode=26;
elseif  (Z==0 & amplen==6);codelen=7;accode=120;
elseif  (Z==0 & amplen==7);codelen=8;accode=248;
elseif  (Z==0 & amplen==8);codelen=10;accode=1014;
elseif  (Z==0 & amplen==9);codelen=16;accode=65410;
elseif (Z==0 & amplen==10);codelen=16;accode=65411;
    
elseif  (Z==1 & amplen==1); codelen=4;accode=12; 
elseif  (Z==1 & amplen==2); codelen=5;accode=27;  
elseif  (Z==1 & amplen==3); codelen=7;accode=121; 
elseif  (Z==1 & amplen==4); codelen=9;accode=502;  
elseif  (Z==1 & amplen==5);codelen=11;accode=2038; 
elseif  (Z==1 & amplen==6);codelen=16;accode=65412;
elseif  (Z==1 & amplen==7);codelen=16;accode=65413;
elseif  (Z==1 & amplen==8);codelen=16;accode=65414;
elseif  (Z==1 & amplen==9);codelen=16;accode=65415;
elseif (Z==1 & amplen==10);codelen=16;accode=65416;
    
elseif (Z==2 & amplen==1);codelen=5;accode=28;
elseif (Z==2 & amplen==2);codelen=8;accode=249;
elseif (Z==2 & amplen==3);codelen=10;accode=1015;
elseif (Z==2 & amplen==4);codelen=12;accode=4084;
elseif (Z==2 & amplen==5);codelen=16;accode=65417;
elseif (Z==2 & amplen==6);codelen=16;accode=65418;
elseif (Z==2 & amplen==7);codelen=16;accode=65419;
elseif (Z==2 & amplen==8);codelen=16;accode=65420;
elseif (Z==2 & amplen==9);codelen=16;accode=65421;
elseif (Z==2 & amplen==10);codelen=16;accode=65422;
    
    
elseif (Z==3 & amplen==1);codelen=6;accode=58;
elseif (Z==3 & amplen==2);codelen=9;accode=503;
elseif (Z==3 & amplen==3);codelen=12;accode=4085;
elseif (Z==3 & amplen==4);codelen=16;accode=65423;
elseif (Z==3 & amplen==5);codelen=16;accode=65424;
elseif (Z==3 & amplen==6);codelen=16;accode=65425;
elseif (Z==3 & amplen==7);codelen=16;accode=65426;
elseif (Z==3 & amplen==8);codelen=16;accode=65427;
elseif (Z==3 & amplen==9);codelen=16;accode=65428;
elseif (Z==3 & amplen==10);codelen=16;accode=65429;
    
    
elseif (Z==4 & amplen==1);codelen=6;accode=59;
elseif (Z==4 & amplen==2);codelen=10;accode=1016;
elseif (Z==4 & amplen==3);codelen=16;accode=65430;
elseif (Z==4 & amplen==4);codelen=16;accode=65431;
elseif (Z==4 & amplen==5);codelen=16;accode=65432;
elseif (Z==4 & amplen==6);codelen=16;accode=65433;
elseif (Z==4 & amplen==7);codelen=16;accode=65434;
elseif (Z==4 & amplen==8);codelen=16;accode=65435; 
elseif (Z==4 & amplen==9);codelen=16;accode=65436;
elseif (Z==4 & amplen==10);codelen=16;accode=65437;
    
elseif (Z==5 & amplen==1);codelen=7;accode=122;
elseif (Z==5 & amplen==2);codelen=11;accode=2039;
elseif (Z==5 & amplen==3);codelen=16;accode=65438;
elseif (Z==5 & amplen==4);codelen=16;accode=65439;
elseif (Z==5 & amplen==5);codelen=16;accode=65440;
elseif (Z==5 & amplen==6);codelen=16;accode=65441;
elseif (Z==5 & amplen==7);codelen=16;accode=65442;
elseif (Z==5 & amplen==8);codelen=16;accode=65443;
elseif (Z==5 & amplen==9);codelen=16;accode=65444;
elseif (Z==5 & amplen==10);codelen=16;accode=65445;
 
elseif (Z==6 & amplen==1);codelen=7;accode=123;
elseif (Z==6 & amplen==2);codelen=12;accode=4086;
elseif (Z==6 & amplen==3);codelen=16;accode=65446;
elseif (Z==6 & amplen==4);codelen=16;accode=65447;
elseif (Z==6 & amplen==5);codelen=16;accode=65448;
elseif (Z==6 & amplen==6);codelen=16;accode=65449;
elseif (Z==6 & amplen==7);codelen=16;accode=65450;
elseif (Z==6 & amplen==8);codelen=16;accode=65451;  
elseif (Z==6 & amplen==9);codelen=16;accode=65452;
elseif (Z==6 & amplen==10);codelen=16;accode=65453;
    
    
elseif (Z==7 & amplen==1);codelen=8;accode=250;
elseif (Z==7 & amplen==2);codelen=12;accode=4087;
elseif (Z==7 & amplen==3);codelen=16;accode=65454;
elseif (Z==7 & amplen==4);codelen=16;accode=65455;
elseif (Z==7 & amplen==5);codelen=16;accode=65456;
elseif (Z==7 & amplen==6);codelen=16;accode=65457;
elseif (Z==7 & amplen==7);codelen=16;accode=65458;
elseif (Z==7 & amplen==8);codelen=16;accode=65459;
elseif (Z==7 & amplen==9);codelen=16;accode=65460;
elseif (Z==7 & amplen==10);codelen=16;accode=65461;
    
elseif (Z==8 & amplen==1);codelen=9;accode=504;
elseif (Z==8 & amplen==2);codelen=15;accode=32704;
elseif (Z==8 & amplen==3);codelen=16;accode=65462;
elseif (Z==8 & amplen==4);codelen=16;accode=65463;
elseif (Z==8 & amplen==5);codelen=16;accode=65464;
elseif (Z==8 & amplen==6);codelen=16;accode=65465;
elseif (Z==8 & amplen==7);codelen=16;accode=65466;
elseif (Z==8 & amplen==8);codelen=16;accode=65467;
elseif (Z==8 & amplen==9);codelen=16;accode=65468;
elseif (Z==8 & amplen==10);codelen=16;accode=65469;
    
elseif (Z==9 & amplen==1);codelen=9;accode=505;
elseif (Z==9 & amplen==2);codelen=16;accode=65470;
elseif (Z==9 & amplen==3);codelen=16;accode=65471;
elseif (Z==9 & amplen==4);codelen=16;accode=65472;
elseif (Z==9 & amplen==5);codelen=16;accode=65473;
elseif (Z==9 & amplen==6);codelen=16;accode=65474;
elseif (Z==9 & amplen==7);codelen=16;accode=65475;
elseif (Z==9 & amplen==8);codelen=16;accode=65476;
elseif (Z==9 & amplen==9);codelen=16;accode=65477;
elseif (Z==9 & amplen==10);codelen=16;accode=65478;
 
elseif (Z==10 & amplen==1);codelen=9;accode=506;
elseif (Z==10 & amplen==2);codelen=16;accode=65479;
elseif (Z==10 & amplen==3);codelen=16;accode=65480;
elseif (Z==10 & amplen==4);codelen=16;accode=65481;
elseif (Z==10 & amplen==5);codelen=16;accode=65482;
elseif (Z==10 & amplen==6);codelen=16;accode=65483;
elseif (Z==10 & amplen==7);codelen=16;accode=65484;
elseif (Z==10 & amplen==8);codelen=16;accode=65485; 
elseif (Z==10 & amplen==9);codelen=16;accode=65486;
elseif (Z==10 & amplen==10);codelen=16;accode=65487;
 
elseif (Z==11 & amplen==1);codelen=10;accode=1017;
elseif (Z==11 & amplen==2);codelen=16;accode=65488;
elseif (Z==11 & amplen==3);codelen=16;accode=65489;
elseif (Z==11 & amplen==4);codelen=16;accode=65490;
elseif (Z==11 & amplen==5);codelen=16;accode=65491;
elseif (Z==11 & amplen==6);codelen=16;accode=65492;
elseif (Z==11 & amplen==7);codelen=16;accode=65493;
elseif (Z==11 & amplen==8);codelen=16;accode=65494;
elseif (Z==11 & amplen==9);codelen=16;accode=65495;
elseif (Z==11 & amplen==10);codelen=16;accode=65496;
 
elseif  (Z==12 & amplen==1);codelen=10;accode=1018; 
elseif  (Z==12 & amplen==2);codelen=16;accode=65497;
elseif  (Z==12 & amplen==3);codelen=16;accode=65498;
elseif  (Z==12 & amplen==4);codelen=16;accode=65499;
elseif  (Z==12 & amplen==5);codelen=16;accode=65500;
elseif  (Z==12 & amplen==6);codelen=16;accode=65501;
elseif  (Z==12 & amplen==7);codelen=16;accode=65502;
elseif  (Z==12 & amplen==8);codelen=16;accode=65503;
elseif  (Z==12 & amplen==9);codelen=16;accode=65504;
elseif (Z==12 & amplen==10);codelen=16;accode=65505;
    
elseif  (Z==13 & amplen==1);codelen=11;accode=2040; 
elseif  (Z==13 & amplen==2);codelen=16;accode=65506;
elseif  (Z==13 & amplen==3);codelen=16;accode=65507;
elseif  (Z==13 & amplen==4);codelen=16;accode=65508;
elseif  (Z==13 & amplen==5);codelen=16;accode=65509;
elseif  (Z==13 & amplen==6);codelen=16;accode=65510;
elseif  (Z==13 & amplen==7);codelen=16;accode=65511;
elseif  (Z==13 & amplen==8);codelen=16;accode=65512; 
elseif  (Z==13 & amplen==9);codelen=16;accode=65513;
elseif (Z==13 & amplen==10);codelen=16;accode=65514;  
    
elseif  (Z==14 & amplen==1);codelen=16;accode=65515;
elseif  (Z==14 & amplen==2);codelen=16;accode=65516;
elseif  (Z==14 & amplen==3);codelen=16;accode=65517;
elseif  (Z==14 & amplen==4);codelen=16;accode=65518;
elseif  (Z==14 & amplen==5);codelen=16;accode=65519;
elseif  (Z==14 & amplen==6);codelen=16;accode=65520;
elseif  (Z==14 & amplen==7);codelen=16;accode=65521;
elseif  (Z==14 & amplen==8);codelen=16;accode=65522;
elseif  (Z==14 & amplen==9);codelen=16;accode=65523;
elseif (Z==14 & amplen==10);codelen=16;accode=65524; 
    
 
elseif  (Z==15 & amplen==1);codelen=16;accode=65525;
elseif  (Z==15 & amplen==2);codelen=16;accode=65526;
elseif  (Z==15 & amplen==3);codelen=16;accode=65527;
elseif  (Z==15 & amplen==4);codelen=16;accode=65528;
elseif  (Z==15 & amplen==5);codelen=16;accode=65529;
elseif  (Z==15 & amplen==6);codelen=16;accode=65530;
elseif  (Z==15 & amplen==7);codelen=16;accode=65531;
elseif  (Z==15 & amplen==8);codelen=16;accode=65532;
elseif  (Z==15 & amplen==9);codelen=16;accode=65533;
elseif (Z==15 & amplen==10);codelen=16;accode=65534;
end
if v0>0;
     bit_seq=[dec2bin(accode,codelen),dec2bin(R,amplen)];
else bit_seq=[dec2bin(accode,codelen),dec2bin(bitcmp(R),amplen)];
end
