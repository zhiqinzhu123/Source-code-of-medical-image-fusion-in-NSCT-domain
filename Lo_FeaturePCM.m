function FPCM = Lo_FeaturePCM(imageDis)%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the phase congruency maps
%%%%%%%%%%%%%%%%%%%%%%%%%
[rows, cols] = size(imageDis);
I1 = ones(rows, cols);
I2 = ones(rows, cols);
Q1 = ones(rows, cols);
Q2 = ones(rows, cols);

if ndims(imageDis)== 3 %images are colorful
    Y1 = 0.299 * double(imageDis(:,:,1)) + 0.587 * double(imageDis(:,:,2)) + 0.114 * double(imageDis(:,:,3));
    I1 = 0.596 * double(imageDis(:,:,1)) - 0.274 * double(imageDis(:,:,2)) - 0.322 * double(imageDis(:,:,3));
    Q1 = 0.211 * double(imageDis(:,:,1)) - 0.523 * double(imageDis(:,:,2)) + 0.312 * double(imageDis(:,:,3));
else %images are grayscale
   Y1 = imageDis;
end

Y1 = double(Y1);
%%%%%%%%%%%%%%%%%%%%%%%%%
% Downsample the image
%%%%%%%%%%%%%%%%%%%%%%%%%
minDimension = min(rows,cols);
F = max(1,round(minDimension / 256));
aveKernel = fspecial('average',F);

aveI1 = conv2(I1, aveKernel,'same');

I1 = aveI1(1:F:rows,1:F:cols);


aveQ1 = conv2(Q1, aveKernel,'same');

Q1 = aveQ1(1:F:rows,1:F:cols);


aveY1 = conv2(Y1, aveKernel,'same');

Y1 = aveY1(1:1:rows,1:1:cols);


%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the phase congruency maps
%%%%%%%%%%%%%%%%%%%%%%%%%
FPCM = phasecong2(Y1);
 
%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the gradient map
%%%%%%%%%%%%%%%%%%%%%%%%%



