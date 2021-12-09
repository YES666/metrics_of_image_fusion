function sd = CalculateSD(a)
%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
参数：
    a           ——输入图像a
    
    sd          ——图像a的标准偏差

功能：
     计算一幅图像的标准偏差。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}

a = double(a);
[M,N] = size(a);
sd=std2(a);








