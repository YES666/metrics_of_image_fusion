addpath(genpath('.\MIToolbox-master'))
loss_type = ["EN","FMI_pixel","FMI_dct","FMI_w","MI","MS_SSIM","Nabf","Qabf","SCD","SSIM","VIFF","Qw","SD","SF","PSNR"];
%a = 2:1:(length(loss_type)+1);

%method = ["LP-SR","PC-LP","NSST-PAPCNN","Densefuse","VIFNet","IFCNN","Nestfuse","U2Fusion"];
%'C'∂‘”¶¬Î÷µ67
% type = 'CM';
type = 'CM';
source1 = ['\\omnisky\postgraduate\Ysz\DATA\' type '\1\test_\'];
source2 = ['\\omnisky\postgraduate\Ysz\DATA\' type '\2\test_\'];
path = 'C:\Users\502\Desktop\';
% path_excel = [path 'CMresult1.xlsx'];
path_excel = [path 'result.xlsx'];
position = 'N';
files = dir('\\omnisky\postgraduate\Ysz\DARTS\augments\train\*.png');
% files = dir('C:\Users\502\Desktop\0.5_0.5_0.01\*.png');
% files = dir('C:\Users\502\Desktop\RESULT\FDAS\MM\train\*.png');
mainf(files,source1,source2,position,path_excel);
