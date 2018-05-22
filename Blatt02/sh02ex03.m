%% Part a
I1 = double(imread("flower01.png"))/255;
I2 = double(imread("flower02.png"))/255;

F1 = fftshift(fft2(I1));
F2 = fftshift(fft2(I2));

F1 = abs(F1);
F2 = abs(F2);

%% Part b
sigma = size(I1,1);
G = fspecial('gaussian', sigma, sigma/2);
G = padarray(G,(size(F1)-size(G))/2,0, 'replicate');
G /= max(max(G));
H = ones(size(G)) - G;

H1 = F1 .* H;
H2 = F2 .* H;

%% Part c
H1 .*= H1;
H2 .*= H2;

E1 = sum(sum(H1));
E2 = sum(sum(H2));

%% Part d
figure();
subplot(3,3,1);
imshow(I1);
title("flower01.png");
subplot(3,3,2);
imshow(F1);
title("Fourier transform of flower01.png");
subplot(3,3,3);
imshow(H1);
title("Filtered fourier transform of flower01.png");


subplot(3,3,4);
imshow(I2);
title("flower02.png");
subplot(3,3,5);
imshow(F2);
title("Fourier transform of flower02.png");
subplot(3,3,6);
imshow(H2);
title("Filtered fourier transform of flower02.png");

subplot(3,3,7);
imshow(G);
title("G");
subplot(3,3,8);
imshow(H);
title("H");
subplot(3,3,9);
bar([E1 E2]);
title("Energy of both images");

print("Quality.eps","-depsc");
