addpath(genpath('.\MIToolbox-master'))
loss_type = ["EN","FMI_pixel","FMI_dct","FMI_w","MI","MS_SSIM","Nabf","Qabf","SCD","SSIM","VIFF","Qw","SD","SF","PSNR"];
a = 2:1:(length(loss_type)+1);

method = ["augments0.3","augments0.4","augments0.5","augments0.6","augments0.7","augments0.8"];
%'C'∂‘”¶¬Î÷µ67
type = 'SPECT';
source1 = ['Z:\DATA\' type '\1\test_\'];
source2 = ['Z:\DATA\' type '\2\test_\'];
path = 'C:\Users\502\Desktop\RESULT\';
path_excel = [path type 'result.xlsx'];
for i=1:length(method)
    position = char(66+i);
    files = dir([path char(method(i)) '\' type '\*.png']);
    mainf(files,source1,source2,loss_type,a,position,path_excel)
end