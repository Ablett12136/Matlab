%% 图像综合预处理后检测面积（任务9）

% 灰度+滤波+阈值分割+膨胀+腐蚀
% 注意注意注意！！！！！！
% 噪声黑的背景白的，膨胀+腐蚀（先用腐蚀噪声会变大，腐蚀和膨胀好像是相对白物体而言）；
% 噪声白的背景黑的，腐蚀+膨胀。

close all;
clear;
clc;
file4 = 'fankuaituzaosheng.bmp';
pic4 = imread(file4);
%灰度化
pic4gray=rgb2gray(pic4); 
%滤波
pic4medfilt = medfilt2(pic4gray, [3, 1]); % 这写的[3,3]的话，物体的四个角的一个像素点会变到图片的四个角上；[5,5]物体的四个角都有三个像素点会变到图片的四个角上
%阈值分割                                    ⬆为啥？？？？？？
[width,height,bm] = size(pic4gray);
area = 0;
for i=1:width 
    for j=1:height 
        if pic4medfilt(i,j)>128 
            pic4medfilt(i,j) =255; 
        else
            pic4medfilt(i,j) =0;
            area = area+1;
        end
    end
end 
fprintf('目标物体面积为%d',area);
figure; %新开窗口
imshow(pic4medfilt); 
title('img');

% ⬆到这步pic4已经处理好了，要是换了图片到这还没好，再膨胀+腐蚀/腐蚀+膨胀

% 定义腐蚀结构元素，这里使用3x3的矩形
SE = strel('rectangle',[3 3]);
% 对二值图像进行膨胀操作
dilated_img = imdilate(pic4medfilt, SE);
% 对二值图像进行腐蚀操作
eroded_img = imerode(dilated_img, SE);
figure; %新开窗口
imshow(eroded_img); 
title('膨胀+腐蚀');