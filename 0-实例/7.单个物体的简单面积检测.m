%% 单个物体的简单面积检测（任务3）
close all;
clear;
clc;
file1 = 'fankuaitu.bmp';
pic1 = imread(file1);
figure;
imshow(pic1);
title('1 方块图 的原图');
pic1gray=rgb2gray(pic1); 
figure; %打开一个新窗口
imshow(pic1gray); 
title('2 方块图 的灰度图');
figure; %新开窗口
imhist(pic1gray); 
title('3 方块图 的直方图');
[width,height,bmgs]=size(pic1gray);
black_num = 0;
for i=1:width 
    for j=1:height 
        if pic1gray(i,j)<240
            pic1gray(i,j) = 0; 
            black_num = black_num+1;
        else
            pic1gray(i,j) = 255;
        end
    end
end 
figure; %新开窗口
imshow(pic1gray); 
title('4 方块图 的阈值分割图');
black_num % 输出黑色像素点个数



