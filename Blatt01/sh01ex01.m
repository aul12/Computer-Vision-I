% Read the images
fruitsA = imread('images/fruitsA.png');
fruitsB = imread('images/fruitsB.png');

% Calculate the histograms
histA = myHistogram(fruitsA);
histB = myHistogram(fruitsB);

% Plot the histograms
figure();

subplot(2,2,1);
imshow(fruitsA);
title('fruitsA.png');

subplot(2,2,2);
plot(0:255, histA);
axis([0 255 0 0.04]);
title('Histogramm for fruitsA.png');
xlabel('Intensity');
ylabel('Probability');

subplot(2,2,3);
imshow(fruitsB);
title('fruitsB.png');

subplot(2,2,4);
plot(0:255, histB);
axis([0 255 0 0.05]);
title('Histogramm for fruitsB.png');
xlabel('Intensity');
ylabel('Probability');

print('Histograms','-depsc')
