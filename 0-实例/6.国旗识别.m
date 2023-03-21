close all; %关闭所有窗口
clear ; %清楚变量的状态数据
clc; %清除命令行
img0 = imread('1.png'); 
img1 = imread('2.png'); 
img2 = imread('3.png'); 
% 灰度化
gray0=rgb2gray(img0); 
gray1=rgb2gray(img1); 
gray2=rgb2gray(img2);
figure;imshow(gray0);
figure;imshow(gray1);
figure;imshow(gray2);

[width,height,bmgs]=size(gray0); %获得图像的尺寸：宽度，高度
for i=1:width 
    for j=1:height 
        if gray0(i,j)>185
            gray0(i,j) =255; 
        else 
           gray0(i,j) =0; 
        end
    end    
end
figure; %新开窗口
imshow(gray0); 
title('中国国旗阈值分割图')  

[width,height,bmgs]=size(gray1); %获得图像的尺寸：宽度，高度
for i=1:width 
    for j=1:height 
        if gray1(i,j)>185
            gray1(i,j) =255;
        else 
           gray1(i,j) =0;
        end
    end    
end

figure; %新开窗口
imshow(gray1); 
title('日本国旗阈值分割图');

[width,height,bmgs]=size(gray2); %获得图像的尺寸：宽度，高度
for i=1:width 
    for j=1:height 
        if gray2(i,j)>185
            gray2(i,j) =255; 
else 
           gray2(i,j) =0; 
        end
    end    
end
figure; %新开窗口
imshow(gray2); 
title('越南国旗阈值分割图')  

ar0 = 0;ar1 = 0;ar2 = 0;
C0 = bwlabel(gray0,8); % 连通区域是指由具有相同像素值或灰度级的像素组成的区域。
% bwlabel一般用在图像区域的分割，比如人脸区域与其他肤色区域分割开
Ar0 = regionprops(C0,'Area');%regionprops用来度量图像区域属性的函数
for k = 1:length(Ar0)
    fprintf('连通区域 %d 的面积是 %d 像素\n',k,Ar0(k).Area);
    ar0 = ar0+Ar0(k).Area;
end

C1 = bwlabel(gray1,8);
Ar1 = regionprops(C1,'Area');
x1 = struct2array(Ar1);
for k = 1:length(Ar1)
    fprintf('连通区域 %d 的面积是 %d 像素\n',k,Ar1(k).Area);
    ar1 = ar1+Ar1(k).Area;
end

C2 = bwlabel(gray2,8);
Ar2 = regionprops(C2,'Area');
for k = 1:length(Ar2)
    fprintf('连通区域 %d 的面积是 %d 像素\n',k,Ar2(k).Area);
    ar2 = ar2+Ar2(k).Area;
end

if ar0 > ar1 && ar0 > ar2
    figure;imshow(img0);title('日本地图');
    if  ar1 > ar2
        figure;imshow(img1);title('越南地图');
        figure;imshow(img2);title('中国地图');
    else
        figure;imshow(img1);title('中国地图');
        figure;imshow(img2);title('越南地图');
    end
elseif ar1 > ar0 && ar1 > ar2
    figure;imshow(img1);title('日本地图');
    if  ar0 > ar2
        figure;imshow(img2);title('中国地图');
        figure;imshow(img0);title('越南地图');
    else
        figure;imshow(img0);title('中国地图');
        figure;imshow(img2);title('越南地图');
    end
else
    figure;imshow(img2);title('日本地图');
    if  ar0 > ar1
        figure;imshow(img0);title('越南地图');
        figure;imshow(img1);title('中国地图');
    else
        figure;imshow(img0);title('中国地图');
        figure;imshow(img1);title('日本地图');
    end
end