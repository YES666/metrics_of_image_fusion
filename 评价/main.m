%% Li H, Wu X J. DenseFuse: A Fusion Approach to Infrared and Visible Images[J]. arXiv preprint arXiv:1804.08361, 2018. 
%% https://arxiv.org/abs/1804.08361
%传统方法   19  13  7  17  12  15  14  18  20  1  2  3  4  6  8  5  9  10 11 14
%深度学习   12  15   10 14 6  5  11  1  4 19   13  2  9  7  20  18  16  3  17 8

deep = [12 15 10 14 6 5 11 1 4 19 13 2 9 7 20 18 16 3 17 8];
addpath(genpath('.\MIToolbox-master'))

fileName_source_ir  = ['Z:\DATA\CM\1\valid\014.png'];
fileName_source_vis = ['Z:\DATA\CM\2\valid\014.png'];
i=2;
%fileName_fused      = [ 'C:\Users\Administrator\Desktop\RIRE RESULT\NSCT-SR\',num2str(i),'.png'];
%fileName_fused      = [ 'C:\Users\Administrator\Desktop\RIRE RESULT\DTCWT-SR\',num2str(i),'.png'];
%fileName_fused      = [ 'C:\Users\Administrator\Dsktop\RIRE RESULT\NSST-PAPCNN\',num2str(i),'.png'];

%fileName_fused =['C:\Users\Administrator\Desktop\RIRE RESULT\densefuse\',num2str(i),'.png'];
%fileName_fused = [ 'C:\Users\Administrator\Desktop\RIRE RESULT\VIFNet\',num2str(i),'.png'];
%fileName_fused = [ 'C:\Users\Administrator\Desktop\RIRE RESULT\Nestfuse\',num2str(i),'.png'];
fileName_fused = ['Z:\DATA\CM\2\valid\014.png'];
%fileName_fused = ['C:\Users\502\Desktop\augments1\train\15.png'];
%fileName_fused = ['C:\Users\502\Desktop\1.png'];
t1 = clock;
source_image1 = imread(fileName_source_ir);
source_image2 = imread(fileName_source_vis);
fused_image   = imread(fileName_fused);

disp("Start");
disp('---------------------------Analysis---------------------------');
%[EN,MI,Qabf,FMI_pixel,FMI_dct,FMI_w,Nabf,SCD,SSIM, MS_SSIM,VIFF,Qw,SD,SF] = analysis_Reference1(fused_image,source_image1(:,:,1),source_image2(:,:,1));
N = zeros(15);
N = analysis_Reference1(fused_image,source_image1(:,:,1),source_image2(:,:,1));

disp('Done');
t2 = clock;
t = etime(t2,t1);
t


%1  