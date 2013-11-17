% This is an example on how to perform histogram matching/specification
% using Matlab.
%
% Author: Wilson
% Reference Work: Ahmad Zikri Rozlan
% Date 3 Nov 2013
%
%

% Clear all previous data
clc, clear all, close all;

% Load input & reference image
inputPath='Your_Path_1';
refPath='Your_Path_2';
refPath2='Your_Path_3';
refPath3='Your_Path_4';

inputImg=imread(inputPath);
refImg=imread(refPath);
refImg2=imread(refPath2);
refImg3=imread(refPath3);

% Convert images to YUV
inYUV   = rgb2ycbcr(inputImg);
refYUV  = rgb2ycbcr(refImg);
refYUV2  = rgb2ycbcr(refImg2);
refYUV3  = rgb2ycbcr(refImg3);

% Separate input image's color channel using YUV
inY = inYUV(:,:,1);
inU = inYUV(:,:,2);
inV = inYUV(:,:,3);

% Separate reference image's color channel
refY = refYUV(:,:,1);
refU = refYUV(:,:,2);
refV = refYUV(:,:,3);

refY2 = refYUV2(:,:,1);
refU2 = refYUV2(:,:,2);
refV2 = refYUV2(:,:,3);

refY3 = refYUV3(:,:,1);
refU3 = refYUV3(:,:,2);
refV3 = refYUV3(:,:,3);

%% PreProcessing

% Compute input's histogram
HinY = imhist(inY)./numel(inY);

% Compute reference's histogram
HrefY = imhist(refY)./numel(refY);
HrefY2 = imhist(refY2)./numel(refY2);
HrefY3 = imhist(refY3)./numel(refY3);

% Histogram specification, using image reference
outY1 = histeq(inY,HrefY);
outY2 = histeq(inY,HrefY);
outY3 = histeq(inY,HrefY);

histsp = ycbcr2rgb(inYUV);

%% Plot histogram & Display Image
%Show Image
figure;
subplot(221);imshow(refImg);title('Reference Image');
subplot(222);imshow(inputImg);title('Input Image');
subplot(224);imshow(histsp);title('YUV Result Image');

% Plot for histogram specification
figure;

%Plot histogram & Display Image in YUV
figure;
subplot(331);plot(HinY);title('YUV Input');
subplot(334);plot(HrefY);title('YUV Ref');
subplot(337);imshow(inYUV);title('YUV Result');
subplot(332);imshow(refYUV);title('REF YUV ');
