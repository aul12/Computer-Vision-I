I = double(imread('figures1.png'))/255.0;

Sx = [-1 0 1;
      -2 0 2;
      -1 0 1];
Sy = [-1 -2 -1;
      0 0 0;
      1 2 1];

Ix = imfilter(I, Sx, 'replicate');
Iy = imfilter(I, Sy, 'replicate');

M = sqrt(Ix .* Ix + Iy .* Iy);

G = fspecial('gaussian',13,3);
S11 = imfilter(Ix .* Ix, G, 'conv');
S21 = imfilter(Iy .* Ix, G, 'conv');
S12 = imfilter(Ix .* Iy, G, 'conv');
S22 = imfilter(Iy .* Iy, G, 'conv');

x = zeros(size(Ix,1) * size(Ix,2), 1);
y = zeros(size(Ix,1) * size(Ix,2), 1);
u = zeros(size(Ix,1) * size(Ix,2), 1);
v = zeros(size(Ix,1) * size(Ix,2), 1);
eig1 = zeros(size(Ix,1) * size(Ix,2), 1);
eig2 = zeros(size(Ix,1) * size(Ix,2), 1);

H = zeros(size(I));
E = zeros(size(I));
C = zeros(size(I));

for yPos = 1:size(Ix,1)
   for xPos = 1:size(Ix,2)
       [V,D] = eig([S11(yPos,xPos) S12(yPos,xPos); S21(yPos,xPos) S22(yPos,xPos)]);
       x((yPos-1)*size(Ix,2) + xPos) = xPos;
       y((yPos-1)*size(Ix,2) + xPos) = yPos;
       
       e1 = max(D(1,1),D(2,2));
       e2 = min(D(1,1),D(2,2));
       
       eig1((yPos-1)*size(Ix,2) + xPos) = e1;
       eig2((yPos-1)*size(Ix,2) + xPos) = e2;
       
       if e1 > 0.03
           u((yPos-1)*size(Ix,2) + xPos) = V(1,1);
           v((yPos-1)*size(Ix,2) + xPos) = V(2,1);
       else
           u((yPos-1)*size(Ix,1) + xPos) = 0;
           v((yPos-1)*size(Ix,1) + xPos) = 0;
       end
       
       if e1 <= 0.03 && e2 <= 0.03
            H(yPos, xPos) = 1;
       end
       
       if e1 > 0.05 && e2 <= 0.03
            E(yPos,xPos) = 1;
       end
       
       if e1 > 0.05 && e2 > 0.05
            C(yPos, xPos) = 1;
       end
   end
end

figure();

subplot(1,3,1);
imshow(M);
title("|\nabla I|")

subplot(1,3,2);
imshow(I);
hold on;
quiver(x,y,u,v);
title("Quiver plot and the original image");

subplot(1,3,3);
imshow(cat(3,H,E,C));
title("Homogeneous in red, edges in green, corners in blue");

print("sh04ex02.eps", "-depsc");