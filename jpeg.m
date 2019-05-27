I = imread('cameraman.tif'); 
info=imfinfo('cameraman.tif');
%原始图像为RGB图像，转为灰度图
A=double(I);
%做dct变换需要把图像转为双精度，并把电平平移128个单位
I=double(I)-128;
%I=im2double(I);
[H,L]=size(I);
%8X8dct变换;DCTI为图像做完DCT变换后矩阵
T=dctmtx(8);%生成一个8*8 DCT变换矩阵

%DCTI=blkproc(I,[8 8],'dct2');
DCTI=blkproc(I,[8,8],'P1*x*P2',T,T');% x就是每一个分成的8*8大小的块，P1*x*P2相当于像素块的处理函数，p1=T p2=T',也就是fun=p1*x*p2'=T*x*T'的功能是进行离散余弦变换 B=T*I*T’

%亮度量化矩阵,ro为亮度量化矩阵
ro=[16 11 10 16 24 40 51 61
    12 12 14 19 26 58 60 55
    14 13 16 24 40 57 69 56
    14 17 22 29 51 87 80 62
    18 22 37 56 68 109 103 77
    24 35 55 64 81 104 113 92
    49 64 78 87 103 121 120 101
    72 92 95 98 112 100 103 99];
 
%8X8量化；DCTI1为DCTI的量化矩阵
DCTI1=blkproc(DCTI,[8 8],'round(x./P1)',ro);

DCTI2=[];
DCTI2=DCTI1;
 
%分成8*8的块，以便提取DC系数
i=0;
for h=1:H/8
    for l=1:L/8
        i=i+1;
        block88(:,:,i)=DCTI1(((h-1)*8+1):((h-1)*8+8),((l-1)*8+1):((l-1)*8+8));
    end
end
 
%提取直流系数到DC矩阵
for i=1:H*L/64
    DC(:,:,i)=block88(1,1,i);
end
 
%DC矩阵中用当前DC-前一个DC系数，如当前系数为15前一个DC系数为12，则把得数保存至DC1中
  DC1(:,:,1)=DC(:,:,1);
for i=2:H*L/64
    DC1(:,:,i)=DC(:,:,i)-DC(:,:,i-1);
end
 
%把DC1添入量化后矩阵,DCTI1此时是DC系数替换后的矩阵
h=H/8;
l=L/8;
k=0;
for i=1:h
    for j=1:l
        k=k+1;
        DCTI1(1+(i-1)*8,1+(j-1)*8)=DC1(:,:,k);
    end
end
k;    
 
%编码
       ImageSeq=[];
       ImageLen=[]; 
       FFFF=[];
for r=1:H/8
    for c=1:L/8
        
        %把块矩阵进行zigzag编码
        m(1:8,1:8)=DCTI1((r-1)*8+1:(r-1)*8+8,(c-1)*8+1:(c-1)*8+8);
        k1=zigzag(m);
        
        %找出最后一位不为0的zigzag矩阵的下标
        w=0;
        u=64;
        while u ~= 0
             if k1(u) ~= 0
                w=u;
                break;
             end
             u=u-1;
       end
       w;
       
       %63个系数全为0的情况，对w=0无法编码，所以把矩阵下标赋值为1
       if w==0 
          w=1;
       end
       
       %w为最后一个不为0的系数的下标，e为zigzag扫描结果t去掉末尾的0后得到的一维行向量
       e(w)=0;
       for i=1:w
           e(i)=k1(i);
       end
 
       %对DC系数进行Huffman编码
       [DC_seq,DC_len]=DCEncoding(e(1));
       DC_seq;
       DC_len;
    %   FFFF(r+c,1)=DC_seq;
      FFFF(r+c,2)=DC_len;
       
 
       %zerolen为连0串中0的个数，amplitude为连0串后非0值的幅度，end=1010(块结束符EOB
       end_seq=dec2bin(10,4);
       AC_seq=[];
       blockbit_seq=[];
       zrl_seq=[];
       trt_seq=[];
       zerolen=0;
       zeronumber=0;
              
        %分块中只有第一个DC系数为0或不为0，AC系数全为0的情况
       if numel(e)==1
          AC_seq=[];
          blockbit_seq=[DC_seq,end_seq];
          blockbit_len=length(blockbit_seq);
       else 
          for i=2:w
              if ( e(i)==0 & zeronumber<16)
                  zeronumber=zeronumber+1;
                  %16连续0的表示
              elseif (e(i)==0 & zeronumber==16); 
                  bit_seq=dec2bin(2041,11);
                  zeronumber=1;
                  AC_seq=[AC_seq,bit_seq];
              elseif (e(i)~=0 & zeronumber==16)
                  zrl_seq=dec2bin(2041,11);
                  amplitude=e(i);
                  trt_seq=ACEncoding(0,amplitude);
                  bit_seq=[zrl_seq,trt_seq];
                  AC_seq=[AC_seq,bit_seq];
                  zeronumber=0;
              elseif(e(i))
                  zerolen=zeronumber;          
                  amplitude=e(i); 
                  zeronumber=0;
                  bit_seq=ACEncoding(zerolen,amplitude);
                  AC_seq=[AC_seq,bit_seq];
              end
          end
       end                 
       blockbit_seq=[DC_seq,AC_seq,end_seq];
       blockbit_len=length(blockbit_seq);
 
       %blockbit_seq为整个块的编码序列，blockbit_len为整个块的编码长度
       blockbit_seq;
       blockbit_len;
       ImageSeq=[ImageSeq,blockbit_seq];
       ImageLen=numel(ImageSeq);       
    end
end
    
 
%恢复图像
Q=blkproc(DCTI2,[8,8],'x.*P1',ro);
 
Recover=blkproc(Q,[8,8],'idct2(x)');
RecoverImage=round(Recover)+128;
 
RecoverImage=uint8(RecoverImage);
imwrite(RecoverImage,'new.jpeg');

imshow(RecoverImage); 