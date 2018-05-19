H = [-1 -2 0;
     -2 0 2;
     0  2 1];
    
I_max = [255 255 0
         255 0  0
         0  0  0];
         
I_min = [0 0 0;
         0 0 255;
         0 255 255];
         
imfilter(I_max, H, 'replicate', 'conv')
imfilter(I_min, H, 'replicate', 'conv')