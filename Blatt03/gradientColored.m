function Rrgb = gradientColored(B, R, SCHWELLE)
% Farbenfrohe Darstellung eines Bildgradienten
%
% INPUT
%   B          zu Grunde liegendes Bild (1-kanal)
%   R          Gradientenrichtung
%   SCHWELLE   Schwellwert zur Gradientenanzeige
%
% OUTPUT
%   Rrgb       Farbiges Bild Gradientenrichtung

R = R - min(R(:)); % R ist Gradientenrichtung, [-pi;pi] -> [0;pi]
R = uint8(round(R ./ max(R(:)) .* 255)); % [0;pi] -> [0;255]
Rrgb = ind2rgb(R, hsv(255));    % Maps the index range [0;255] (each value in R is treated as an index) to hsv color values
mask = repmat(B > SCHWELLE, [1 1 3]);   % Set pixels with a small gradient magnitude to 0
Rrgb = Rrgb .* mask;

end
