function [G] = getGabor(f0, sigma, theta)
%GETGABOR returns a DC-compensated Gabor filter. 
% Inputs:
% f0: Preferred frequency
% sigma: Gaussian weighting
% theta: Orientation selectivity in DEGREE
% Output:
% filter G with filter size according to 4 sigma rule
    fx0 = sind(theta)*f0;
    fy0 = cosd(theta)*f0;
    fSH = 3*ceil(sigma/2/pi); % 6*sigma rule
    [X, Y] = meshgrid(-fSH:fSH, -fSH:fSH); % intrinsically odd size
    G = pureGabor(fx0, fy0, sigma, X, Y);
    G = G - sum(real(G(:)))/numel(G); % DC compensation
end

function g = pureGabor(fx0, fy0, sigma, x, y)
    g = 2*pi/sigma^2*exp(2*pi*1i*(fx0*x+fy0*y)).*exp(-2*pi^2*(x.^2+y.^2)/sigma^2);
end
