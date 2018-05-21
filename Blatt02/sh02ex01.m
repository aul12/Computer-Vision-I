I = imread("lena.tif");
sigma = 3;
G = fspecial("gaussian", 2*ceil(2*sigma)+1, sigma);
H = [-1 -2 0; -2 0 2; 0 2 1];

T1 = imfilter(I, G, 'replicate', 'conv');
R1 = imfilter(T1, H, 'replicate', 'conv');

figure();
subplot(1,3,1);
imshow(I);
title("Original image");
subplot(1,3,2);
imshow(T1);
title("Blurred Image");
subplot(1,3,3);
imshow(R1);
title("Diagonal edges of the blurred image");

print("lenaEdge1.eps", "-depsc");

T2 = imfilter(I, H, 'replicate', 'conv');
R2 = imfilter(T2, G, 'replicate', 'conv');

figure();
subplot(2,3,1);
imshow(I);
title("Original image");
subplot(2,3,2);
imshow(T1);
title("Blurred Image");
subplot(2,3,3);
imshow(R1);
title("Diagonal edges of the blurred image");
subplot(2,3,4);
imshow(abs(R2-R1));
title("Difference of both images");
subplot(2,3,5);
imshow(T2);
title("Diagonal edges of the original image");
subplot(2,3,6);
imshow(R2);
title("Blurred image of the diagonal edges");

print("lenaEdge2.eps", "-depsc");
