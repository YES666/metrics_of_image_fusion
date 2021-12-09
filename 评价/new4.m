addpath(genpath('.\MIToolbox-master'))
loss_type = ["EN","FMI_pixel","FMI_dct","FMI_w","MI","MS_SSIM","Nabf","Qabf","SCD","SSIM","VIFF","Qw","SD","SF","PSNR"];
a = 2:1:(length(loss_type)+1);

method = ["LP-SR","PC-LP","NSST-PAPCNN","Densefuse","VIFNet","IFCNN","Nestfuse","U2Fusion"];
%'C'∂‘”¶¬Î÷µ67
type = 'BW';
source1 = ['Z:\DATA\' type '\1\test_\'];
source2 = ['Z:\DATA\' type '\2\test_\'];
path = 'C:\Users\502\Desktop\RESULT\';
path_excel = [path type 'result.xlsx'];
for i=1:length(method)
    position = char(66+i);
    files = dir([path char(method(i)) '\' type '\*.png']);
    mainf(files,source1,source2,loss_type,a,position,path_excel)
end