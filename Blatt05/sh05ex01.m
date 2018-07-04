boats = im2double(imread('boats.tif'));

G = cell(1,6);
S = cell(1,6);
G{1} = boats;
S{1} = boats;

figure;

subplot(2,6,1);
imshow(G{1});
title({"Subsampled by 1","with Gaussian Blur"});
subplot(2,6,7);
imshow(S{1});
title({"Subsampled by 1","without Gaussian Blur"});


for c=2:6
   blurred = imgaussfilt(G{c-1});
   G{c} = blurred(1:2:end, 1:2:end);
   S{c} = S{c-1}(1:2:end, 1:2:end);
   subplot(2,6,c);
   imshow(G{c});
   title({"Subsampled by " + 2^(c-1),"with Gaussian Blur"});
   subplot(2,6,c+6);
   imshow(S{c});
   title({"Subsampled by " + 2^(c-1),"without Gaussian Blur"});
end

print("sh05ex01.eps", "-depsc");