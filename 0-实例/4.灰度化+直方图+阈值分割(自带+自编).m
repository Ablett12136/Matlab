% 图像的灰度化+直方图+阈值分割
close all;
clear;
clc;
file1 = 'lenargb.bmp';
file2 = 'guazi.bmp';
pic1 = imread(file1);
figure;
imshow(pic1);
title('11 lena 的原图');

% 自带函数 灰度化
pic1gray=rgb2gray(pic1); 
figure; %打开一个新窗口
imshow(pic1gray); 
title('12 lena 的matlab灰度图');

% 自带函数 直方图
figure; %新开窗口
imhist(pic1gray); 
title('13 lena 的matlab直方图');

% 自己编写 灰度化：Gray = R*0.299 + G*0.587 + B*0.114
[width,height,bmsize] = size(pic1);
pic1_gray = uint8(zeros(width,height));
%uint8是把大于255的数全部强制置为255，而小于255的部分则保持原样不变。
for i=1:width
    for j=1:height
        pic1_gray(i,j)=pic1(i,j,1)*0.299+pic1(i,j,2)*0.587+pic1(i,j,3)*0.114;
    end
end
figure;
imshow(pic1_gray);
title('14 lena 自己计算得到的灰度化图');

% 自己编写 直方图
[width,height,bmgs]=size(pic1_gray); %获得图像的尺寸：宽度，高度
pic1_hist = zeros(256,1); %自己定义一个直方图，范围1-256
myquzhi = 0; %该点图像灰度值，值域范围是 0-255，因此灰度值要加入pic1_hist的话，要加1（(myquzhi+1,1)这里的+1是因为这样加的）
for i=1:width 
    for j=1:height 
        myquzhi = pic1_gray(i,j); 
        pic1_hist(myquzhi+1,1) = pic1_hist(myquzhi+1,1)+1; %该灰度的直方图取值+1 
    end 
end 
figure; %新开窗口
plot(pic1_hist); 
title('15 lena 自己计算的直方图');

% 自己编写 阈值分割
for i=1:width 
    for j=1:height 
        if pic1_gray(i,j)>128 
            pic1_gray(i,j) =255; 
        else
            pic1_gray(i,j) =0;
        end
    end
end 
figure; %新开窗口
imshow(pic1_gray); 
title('16 lena 阈值分割图');

