lena = imread('images/lena.tif');
lenaNoise = imread('images/lenaNoise.tif');

B = ones(3,3) / 9;

subplot(2,2,1);
imshow(lena);
title('lena.tif');

subplot(2,2,2);
imshow(imfilter(lena,B));
title('Filtered lena.tif');

subplot(2,2,3);
imshow(lenaNoise);
title('lenaNoise.tif');

subplot(2,2,4);
imshow(imfilter(lenaNoise,B));
title('Filtered lenaNoise.tif');

print('BoxFilter', '-depsc');