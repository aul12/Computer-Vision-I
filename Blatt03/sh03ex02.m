% Part 1
load('Hfreq.mat');
load('Hfreq2.mat');

Hspat = ifft2(Hfreq);
Hspat2 = ifft2(Hfreq2);

Hfreq_display = log(abs(fftshift(Hfreq))*12+1);
Hfreq2_display = log(abs(fftshift(Hfreq2))*12+1);


figure();
subplot(2,2,1);
imshow(Hfreq_display);
title('Filter 1 in the frequency domain');

subplot(2,2,2);
imshow(Hfreq2_display);
title('Filter 2 in the frequency domain');

spatialXRange = 1:30;
spatialYRange = 1:50;

subplot(2,2,3);
imshow(Hspat(spatialXRange, spatialYRange));
title('Filter 1 in the spatial domain');

subplot(2,2,4);
imshow(Hspat2(spatialXRange, spatialYRange));
title('Filter 2 in the spatial domain');

print('sh03ex02_1.eps', '-depsc');

% Part 2
bookstore = imread('bookstore.tif');
load('filtered.mat');

filtered_freq = fft2(filtered);
bookstore_freq = fft2(bookstore);

figure();
subplot(2,2,1);
imshow(filtered);
title('Blurred Image');

subplot(2,2,2);
imshow(bookstore);
title('Original Image');

subplot(2,2,3);
imshow(ifft2(filtered_freq./Hfreq));

title('Blurred Image Deconvolved with Filter 1');

subplot(2,2,4);
imshow(ifft2(filtered_freq./Hfreq2));
title('Blurred Image Deconvolved with Filter 2');

print('sh03ex02_2.eps', '-depsc');