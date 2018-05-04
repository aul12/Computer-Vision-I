function H = myHistogram(im)
    H = zeros(1,256);
    [width, height] = size(im);
    for x = 1:width
        for y = 1:height
            intensity = im(x,y);
            assert(intensity >= 0 & intensity <= 255, "Not all matrix elements are between 0 and 255");
            H(intensity+1) = H(intensity+1) + 1;
        end
    end
    H .*= 1/(width*height);
end
