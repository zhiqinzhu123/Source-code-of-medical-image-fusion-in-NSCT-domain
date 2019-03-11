function imgOut = ConvertRGBtoYUV(img)

img=double(img);
mtxRGBtoYUV = [  0.299,    0.587,    0.114;
                -0.147, -0.289,  0.436;
                 0.615,   -0.515, -0.100];

[r, c]=size(mtxRGBtoYUV);
if(r ~= 3 || c ~= 3)
    error('The matrix for color transformation is not 3x3.');
end

imgOut = zeros(size(img));
for i=1:3
    imgOut(:,:,i) = img(:,:,1) * mtxRGBtoYUV(i,1) + img(:,:,2) * mtxRGBtoYUV(i,2) + img(:,:,3) * mtxRGBtoYUV(i,3);
end