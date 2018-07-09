% Part 1
basket = im2double(imread('basket.jpg'));
thetas = [0 pi/4 pi/2] * 180/pi;
fs = [0.64 0.32 0.08];

filters = cell(1,9);
b = 2.32;
x = zeros(1,9);
y = zeros(1,9);

for theta = 1:length(thetas)
   for f = 1:length(fs)
       sigma = b / fs(f);
       filters{(theta-1)*3 + f} = getGabor(fs(f), sigma, thetas(theta));
       x((theta-1)*3 + f) = thetas(theta);
       y((theta-1)*3 + f) = fs(f);
   end
end

% Part 2
energy = zeros(1,9);
filtered = cell(1,9);

for c = 1:9
   filtered{c} = imfilter(basket, filters{c}, 'conv');
   figure;
   imshow(abs(filtered{c}));
   energy(c) = sqrt(sum(sum(abs(filtered{c}).^2)));
end

% Part 3
figure;
stem3(x, y, energy);
xlabel("\theta");
ylabel("f");
print("sh05ex03.eps", "-depsc");