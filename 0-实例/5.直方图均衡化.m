%% 2.6 打开一幅图并将其直方图均衡化
close all;
clear;
clc;
file4 = 'zftjh.jpg';
pic4 = imread(file4);
figure;
subplot(2,2,1);
imshow(pic4);
title('41 山 原图');

% 直方图
subplot(2,2,3);
imhist(pic4); 
title('42 山 直方图');

% 均衡化
pic4_eq = histeq(pic4, 256);
subplot(2,2,2);
imshow(pic4_eq);
title('43 山 均衡化的图') 
subplot(2,2,4);
imhist(pic4_eq);
title('44 山 均衡化后的直方图')