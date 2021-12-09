addpath(genpath('.\MIToolbox-master'))
loss_type = ["EN","FMI_pixel","FMI_dct","FMI_w","MI","MS_SSIM","Nabf","Qabf","SCD","SSIM","VIFF","Qw","SD","SF","PSNR"];
a = 2:1:(length(losanss_type)+1);

method = ["augments0.3","augments0.4","augments0.5","augments0.6","augments0.7","augments0.8"];
%'C'∂‘”¶¬Î÷µ67
type = 'CM';
source1 = ['Z:\DATA\' type '\1\test_\'];
source2 = ['Z:\DATA\' type '\2\test_\'];
path = 'Z:\FDARTS1\';
path_excel = ['C:\Users\502\Desktop\RESULT\' type 'result.xlsx'];
for i=1:length(method)
    position = char(76+i);
    files = dir([path char(method(i)) '\train\*.png']);
    mainf(files,source1,source2,loss_type,a,position,path_excel)
end