load('filtered.mat');
load('Hfreq.mat');
load('Hfreq2.mat');
bookstore = imread('bookstore.tif');

filtered_freq = fft2(filtered);
bookstore_freq = fft2(bookstore);

Hspat = ifft2(Hfreq);
Hspat2 = ifft2(Hfreq2);

subplot(5,2,1);
imshow(filtered);
title('Blurred Image');

subplot(5,2,2);
imshow(bookstore);
title('Original Image');

subplot(5,2,3);
imshow(fftshift(filtered_freq));
title('Fourier Transform of the Blurred Image');

subplot(5,2,4);
imshow(fftshift(bookstore_freq));
title('Fourier Transform of the Original Image');

subplot(5,2,5);
imshow(abs(fftshift(Hfreq)));
title('Filter in the frequency domain');

subplot(5,2,6);
imshow(abs(fftshift(Hfreq2)));
title('Filter 2 in the frequency domain');

spatialXRange = 1:30;
spatialYRange = 1:50;

subplot(5,2,7);
imshow(Hspat(spatialXRange, spatialYRange));
title('Filter 1 in the spatial domain');

subplot(5,2,8);
imshow(Hspat2(spatialXRange, spatialYRange));
title('Filter 2 in the spatial domain');

subplot(5,2,9);
imshow(ifft2(filtered_freq./Hfreq));
title('Deconvolved blurred image');