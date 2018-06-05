circles = im2double(rgb2gray(imread('circles.png')));

I_x = [1 0 -1; 2 0 -2; 1 0 -1];
I_y = [1 2 1; 0 0 0; -1 -2 -1];

gradX = imfilter(circles, I_x, 'conv');
gradY = imfilter(circles, I_y, 'conv');

absGrad = sqrt(gradX.^2  + gradY.^2);
angleGrad = atan2(gradY, gradX);

subplot(1,3,1);
imshow(circles);
title('Original Image');

subplot(1,3,2);
xRange = 270:280;
yRange = 270:280;
imshow(absGrad(xRange, yRange));
title('Magnitude and Direction');
hold on;
quiver(gradX(xRange, yRange), gradY(xRange, yRange),1);

subplot(1,3,3);
imshow(gradientColored(absGrad, angleGrad, 0.2));
title('Colored Gradient Image');

print("sh03ex01.eps", "-depsc");
