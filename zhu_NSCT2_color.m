% image fusion with NSCT-zhu 
% PLS input color image first
% By Zhiqin Zhu and Mingyao Zheng Chongqing University of Posts and Telecommunications
clear;
clc;
close all;
addpath nsct;
t1=clock;

[imagename1 imagepath1]=uigetfile('source images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
Y1=imread(strcat(imagepath1,imagename1)); 
[imagename2 imagepath2]=uigetfile('source images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image'); 
Y2=imread(strcat(imagepath2,imagename2)); 
tic;
%Y1=rgb2gray(Y1);
%Y2=rgb2gray(Y2);


f1 = double(Y1)/255;
img2 = double(Y2)/255;
img2_YUV=ConvertRGBtoYUV(img2);
f2=img2_YUV(:,:,1);
[hei, wid] = size(f1);

s=5;
h=1;
x=5;
y1=nsctdec(f1,[1,2,1,1],'pkva','9-7');
y2=nsctdec(f2,[1,2,1,1],'pkva','9-7');
n=length(y1);
y{1}=Low_fusion(y1{1},y2{1});
for l=2:n
    if l<5
        for d=1:length(y1{l})
    %         y{l}{d}=high_fusion(y1{l}{d},y2{l}{d},s,h);
            y{l}{d}=high_fusion(y1{l}{d},y2{l}{d});
        end
    end
    if l>=5
        for d=1:length(y1{l})
    %         y{l}{d}=high_fusion(y1{l}{d},y2{l}{d},s,h);
            y{l}{d}=highpass_fuse(y1{l}{d},y2{l}{d});
        end
    end
end


YY=nsscrec(y,'pkva','9-7');

imgf_YUV=zeros(hei,wid,3);
imgf_YUV(:,:,1)=YY;
imgf_YUV(:,:,2)=img2_YUV(:,:,2);
imgf_YUV(:,:,3)=img2_YUV(:,:,3);
YY_f=ConvertYUVtoRGB(imgf_YUV);
toc;    
imwrite(YY_f,'D:\MATWORKSHOP\Multimodal-FUSION\results\TEST/fused_nsct_zhu099C32.tif');
figure
imshow(YY_f)
       