%DCÂë±í
function [seq,len]=DCEncoding(x) 
v0=x;
val=abs(x);
if (val==0);amplen=1;codelen=2;dccode=0;
elseif(val==1);amplen=1;codelen=3;dccode=2;
elseif(val >=    2 & val <=    3);amplen= 2;codelen = 3;dccode=  3;  
elseif(val >=    4 & val <=    7);amplen= 3;codelen = 3;dccode=  4;  
elseif(val >=    8 & val <=   15);amplen= 4;codelen = 3;dccode=  5;   
elseif(val >=   16 & val <=   31);amplen= 5;codelen = 3;dccode=  6;  
elseif(val >=   32 & val <=   63);amplen= 6;codelen = 4;dccode= 14; 
elseif(val >=   64 & val <=  127);amplen= 7;codelen = 5;dccode= 30;  
elseif(val >=  128 & val <=  255);amplen= 8;codelen = 6;dccode= 62;  
elseif(val >=  256 & val <=  511);amplen= 9;codelen = 7;dccode=126;  
elseif(val >=  512 & val <= 1023);amplen=10;codelen = 8;dccode=254;  
elseif(val >= 1024 & val <= 2047);amplen=11;codelen = 9;dccode=510;  
end
if v0>0 ;seq=[dec2bin(dccode,codelen),dec2bin(val,amplen)];
else  seq=[dec2bin(dccode,codelen),dec2bin(bitcmp(val),amplen)];
end
len = numel(seq);
