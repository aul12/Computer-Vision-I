I = double(imread('figures1.png'))/255.0;

M1 = [0 -1 0;
       0 1 0;
       0 0 0];
M2 = [0 0 -1;
      0 1  0;
      0 0  0];
  
M3 = [0 0 0;
      0 1 -1;
      0 0 0];
  
M4 = [0 0 0;
      0 1 0;
      0 0 -1];
  
D1 = imfilter(I, M1,'replicate');
D2 = imfilter(I, M2,'replicate');
D3 = imfilter(I, M3,'replicate');
D4 = imfilter(I, M4,'replicate');

D1 = D1 .* D1;
D2 = D2 .* D2;
D3 = D3 .* D3;
D4 = D4 .* D4;

B = ones(5,5) * 1/25;

A1 = imfilter(D1, B,'replicate');
A2 = imfilter(D2, B,'replicate');
A3 = imfilter(D3, B,'replicate');
A4 = imfilter(D4, B,'replicate');

S = A1 + A2 + A3 + A4;

A1 = A1 ./ S;
A2 = A2 ./ S;
A3 = A3 ./ S;
A4 = A4 ./ S;

threshold = 0.15;
M1 = (A1 + A2 - abs(A1 - A2))/2; % Stolen from: https://stackoverflow.com/questions/26634232/element-wise-matrix-min-in-matlab
M2 = (A3 + A4 - abs(A3 - A4))/2;
M = (M1 + M2 - abs(M1- M2))/2;

underThreshold = find(M < threshold);
overThreshold = find(M >= threshold);
M(underThreshold) = 0;
M(overThreshold) = 1;

figure();

subplot(3,2,1);
imshow(A1);
title("0 degree Channel");
subplot(3,2,2);
imshow(A2);
title("45 degree Channel");
subplot(3,2,3);
imshow(A3);
title("90 degree Channel");
subplot(3,2,4);
imshow(A4);
title("135 degree Channel");
subplot(3,2,5);
imshow(M);
title("Detected Corners");
subplot(3,2,6);
imshow(I);
title("Original Image");

print("sh04ex01.eps", "-depsc");