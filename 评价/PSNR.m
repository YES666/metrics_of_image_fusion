function output = PSNR(img1,img2,fuse)
mse1 = sum(sum(img1-fuse).^2)/(256*256);
mse2 = sum(sum(img2-fuse).^2)/(256*256);
psnr1 = 20*log10((2.^8-1)/sqrt(mse1));
psnr2 = 20*log10((2.^8-1)/sqrt(mse2));
output = psnr1+psnr2;
%output = 20*log10((2.^8-1)/sqrt(mse1+mse2));