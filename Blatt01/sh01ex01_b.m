% Read the images
fruitsA = imread('images/fruitsA.png');
fruitsB = imread('images/fruitsB.png');

% Plot the rows
figure();

subplot(2,3,1);
imshow(fruitsA);
title('fruitsA.png');

subplot(2,3,2);
plot(fruitsA(50,:));
title('Row 50 in fruitsA.png');
xlabel('x');
ylabel('intensity');

subplot(2,3,3);
plot(fruitsA(200,:));
title('Row 200 in fruitsA.png');
xlabel('x');
ylabel('intensity');

subplot(2,3,4);
imshow(fruitsB);
title('fruitsB.png');

subplot(2,3,5);
plot(fruitsB(50,:));
title('Row 50 in fruitsB.png');
xlabel('x');
ylabel('intensity');

subplot(2,3,6);
plot(fruitsB(200,:));
title("Row 200 in fruitsB.png");
xlabel("x");
ylabel("intensity");

print('Rows','-depsc')

