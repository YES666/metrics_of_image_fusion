function LSSIM(imgA,imgB,imgF)
%references:A novel similarity based quality metric for image fusion
%imgA=imread('CT.jpg');
%imgB=imread('MRI.jpg');
%imgF=imread('R.bmp');
win = fspecial('gaussian', 7, 1.5);
[tp1,ssim_map1,tq1,to1]=ssim_index_new(imgA,imgF);
[tp2,ssim_map2,tq2,to2]=ssim_index_new(imgB,imgF);
[tp3,ssim_map3,tq3,to3]=ssim_index_new(imgA,imgB);
muA   = filter2(win, imgA, 'valid');
muB   = filter2(win, imgB, 'valid');
muA_sq = muA.*muA;                       %ͼ��A��ƽ����
muB_sq = muB.*muB;                       %ͼ��B��ƽ����

sigmaA_sq = filter2(win, imgA.*imgA, 'valid') - muA_sq;  %ͼ��A�ķ���
sigmaB_sq = filter2(win, imgB.*imgB, 'valid') - muB_sq;  %ͼ��B�ķ���
[m,n]=size(sigmaA_sq);
Q=[m,n];
for i=1:m
    for j=1:n
         if (sigmaA_sq(i,j)==sigmaB_sq(i,j))&&(sigmaB_sq(i,j)==0)   %%ԭ�����д˴�û�п���ͼ��A��B�����򷽲Ϊ0ʱ�����
            nu=1/2;
        else
            nu=sigmaA_sq(i,j)./(sigmaA_sq(i,j)+sigmaB_sq(i,j));
        end
        if ssim_map3(i,j)>=0.75
            Q(i,j)=nu*ssim_map1(i,j)+(1-nu)*ssim_map2(i,j);
        end
        if ssim_map3(i,j)<0.75
            Q(i,j)=max(ssim_map1(i,j),ssim_map2(i,j));
        end
    end
end
LSSIM=mean2(Q);
disp('LSSIM');
disp(LSSIM);
        