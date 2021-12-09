function Qw = UIQI(imgA,imgB,imgF)
%references:Image Quality Assessment for Performance Evaluation of Image
%Fusion  &&  A NEW QUALITY METRIC FOR IMAGE FUSION
%imgA=imread('CT.jpg');
%imgB=imread('MRI.jpg');
%imgF=imread('R.bmp');
win = fspecial('gaussian', 8, 1.5);
[tp1, ssim_map1, tq1,tr1 ]=ssim_index_new1(imgA,imgF);
[tp2, ssim_map2, tq2,tr2 ]=ssim_index_new1(imgB,imgF);
muA   = filter2(win, imgA, 'valid');
muB   = filter2(win, imgB, 'valid');
muA_sq = muA.*muA;                       %图像A的平均数
muB_sq = muB.*muB;                       %图像B的平均数

sigmaA_sq = filter2(win, imgA.*imgA, 'valid') - muA_sq;  %图像A的方差
sigmaB_sq = filter2(win, imgB.*imgB, 'valid') - muB_sq;  %图像B的方差
[m,n]=size(sigmaA_sq);
Q=[m,n];
for i=1:m
    for j=1:n
         if (sigmaA_sq(i,j)==sigmaB_sq(i,j))&&(sigmaB_sq(i,j)==0)    %%原论文中此处没有考虑图像A和B的区域方差都为0时的情况
            nu=1/2;
        else
            nu=sigmaA_sq(i,j)./(sigmaA_sq(i,j)+sigmaB_sq(i,j));
        end
        Q(i,j)=nu*ssim_map1(i,j)+(1-nu)*ssim_map2(i,j);
    end
end
Qw=mean2(Q);
%disp('UIQI');
%disp(UIQI);
        