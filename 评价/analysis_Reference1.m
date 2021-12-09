function  output = analysis_Reference1(image_f,image_ir,image_vis)

[s1,s2] = size(image_ir);
imgSeq = zeros(s1, s2, 2);
imgSeq(:, :, 1) = image_ir;
imgSeq(:, :, 2) = image_vis;

img1 = im2double(image_ir);
img2 = im2double(image_vis);
fuse = im2double(image_f);

%EN
EN = entropy(fuse);
%MI
%MI = CalculateMI(image_ir,image_vis,image_f);

MI = CalculateMI(img1,fuse)+CalculateMI(img2,fuse);

%MI = mi(img1,fuse)+mi(img2,fuse);
%Qabf

Qabf = analysis_Qabf(img1,img2,fuse);

%FMI

FMI_pixel = analysis_fmi(img1,img2,fuse);

FMI_dct = analysis_fmi(img1,img2,fuse,'dct');

FMI_w = analysis_fmi(img1,img2,fuse,'wavelet');

%Nabf

Nabf = analysis_nabf(fuse,img1,img2);

%SCD

SCD = analysis_SCD(img1,img2,fuse);

% SSIM_a
SSIM1 = ssim1(image_f,image_ir);
SSIM2 = ssim1(image_f,image_vis);
SSIM = (SSIM1+SSIM2)/2;
%MS_SSIM
%[MS_SSIM,t1,t2]= analysis_ms_ssim(imgSeq, image_f);
MS_SSIM = (msssim(image_f,image_ir)+msssim(image_f,image_vis))/2;
%VIFF

VIFF = VIFF_Public(img1,img2,fuse);

%UIQI
Qw = UIQI(img1,img2,fuse);
%SD
t1=clock;
SD = CalculateSD(fuse);
t2=clock;
etime(t2,t1)
%SF
SF = CalculateSF(fuse);
%PSNR
psnr = PSNR(img1,img2,fuse);
output = [EN;FMI_pixel;FMI_dct;FMI_w;MI;MS_SSIM;Nabf;Qabf;SCD;SSIM;VIFF;Qw;SD;SF;psnr];
end







