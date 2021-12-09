function SF = CalculateSF(imgA)
%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
参数：
   A           ——输入图像A
   
功能：
   计算图像的空间频率。

描述： 
    空间频率反映了一幅图像空间域的总体活跃度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}
%clc;
%clear all;
%close all;
% [filename,pathname]=uigetfile('*.*','输入图像');
% A = imread([pathname,filename]);
%s = size(size(A));
%if s(2)==3
%    A=rgb2gray(A);
%end
tic;
A=double(imgA);
[M,N]=size(A);
sum1=0;
sum2=0;

%计算行频率
for i=1:M
    for j=2:N
        w=A(i,j)-A(i,j-1);
        sum1=sum1+w^2;
    end
end
RF=sqrt(sum1/(M*N));

%计算列频率
for j=1:N
    for i=2:M
        w=A(i,j)-A(i-1,j);
        sum2=sum2+w^2;
    end
end
CF=sqrt(sum2/(M*N));

SF = sqrt(RF^2+CF^2);
%disp(['输入图像的空间频率为：',num2str(SF)]);
%toc;