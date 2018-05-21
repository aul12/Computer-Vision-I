%% Part a
I1 = imread("flower01.png");
I2 = imread("flower02.png");

F1 = fftshift(fft2(I1));
F2 = fftshift(fft2(I2));

F1 = abs(F1);
F2 = abs(F2);

%% Part b
sigma = size(I1,1);
G = fspecial('gaussian', sigma, sigma/2);
G /= max(max(G));
H = ones(size(G)) - G;

%F1 *= G;
%F2 *= G;
H1 = F1;
H2 = F2;

%% Part c
H1 .*= H1;
H2 .*= H2;

E1 = sum(sum(F1));
E2 = sum(sum(F2));

%% Part d
figure();
subplot(2,3,1);
imshow(I1);
subplot(2,3,2);
imshow(F1);
subplot(2,3,3);
imshow(H1);

subplot(2,3,4);
imshow(I2);
subplot(2,3,5);
imshow(F2);
subplot(2,3,6);
imshow(H2);
