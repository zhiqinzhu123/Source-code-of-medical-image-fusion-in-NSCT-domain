% By Zhiqin Zhu and Mingyao Zheng Chongqing University of Posts and Telecommunications
clear
clc
close all;
addpath nsct;
t1=clock;

[imagename1 imagepath1]=uigetfile('source images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
Y1=imread(strcat(imagepath1,imagename1)); 
[imagename2 imagepath2]=uigetfile('source images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image'); 
Y2=imread(strcat(imagepath2,imagename2)); 

%Y1=rgb2gray(Y1);
%Y2=rgb2gray(Y2);
f1=im2double(Y1);
f2=im2double(Y2);
s=5;
h=1;
x=5;
tic;
y1=nsctdec(f1,[1,1,1,1],'pkva','9-7');
y2=nsctdec(f2,[1,1,1,1],'pkva','9-7');

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
toc;

YY=nsscrec(y,'pkva','9-7');
imwrite(YY,'D:\MATWORKSHOP\Multimodal-FUSION\results\TEST/fused_nsct_LILOW_N32.tif');
figure
imshow(YY)
     