%% 两个物体的 Blob 检测 + 计算质心（任务4+任务8）
close all;
clear;
clc;
file2 = 'fankuaitu2ge.bmp';
pic2 = imread(file2);
figure;
imshow(pic2);
title('1 方块图 的原图');
pic2gray=rgb2gray(pic2); 
figure; %打开一个新窗口
imshow(pic2gray); 
title('2 方块图 的灰度图');
figure; %新开窗口
imhist(pic2gray); 
title('3 方块图 的直方图');
[width,height,bmgs]=size(pic2gray);
for i=1:width 
    for j=1:height 
        if pic2gray(i,j)<240
            pic2gray(i,j) = 0; 
        else
            pic2gray(i,j) = 255;
        end
    end
end 
figure; %新开窗口
imshow(pic2gray); 
title('4 方块图 的阈值分割图');
%面积计算
biaoqian = 0; 
for i=2:width %行扫描
    for j=2:height %列扫描 
        if pic2gray(i,j) == 0 % if(当前数据 = 黑色) 
            % if( (左边数据没标签)&&（上面数据没标签）&&（右边数据没标签）&&(下面数据没标签) ) 
            if( ((pic2gray(i,j-1)==0)||(pic2gray(i,j-1)==255)) &&((pic2gray(i-1,j)==0)||(pic2gray(i-1,j)==255))&&((pic2gray(i,j+1)==0)||(pic2gray(i,j+1)==255)) &&((pic2gray(i+1,j)==0)||(pic2gray(i+1,j)==255)) ) 
                %贴新标签
                biaoqian = biaoqian +1; 
                pic2gray(i,j) = biaoqian; 
            %左边坐标有标签，则改点赋值为左边标签 
            elseif( (pic2gray(i,j-1)~=0)&&(pic2gray(i,j-1)~=255)) 
                pic2gray(i,j) = pic2gray(i,j-1); 
            elseif( (pic2gray(i-1,j)~=0)&&(pic2gray(i-1,j)~=255)) %上面坐标有标签，则改点赋值为上面标签
                pic2gray(i,j) = pic2gray(i-1,j); 
            elseif( (pic2gray(i,j+1)~=0)&&(pic2gray(i,j+1)~=255)) %右边坐标有标签，则改点赋值为右边标签 
                pic2gray(i,j) = pic2gray(i,j+1); 
            elseif( (pic2gray(i+1,j)~=0)&&(pic2gray(i+1,j)~=255)) %下面坐标有标签，则改点赋值为下面标签 
                pic2gray(i,j) = pic2gray(i+1,j); 
            end 
 
        end 
    end 
end 
%贴完的标签的面积计算
mianjibiaoqian =zeros(254,1); 
quzhi =0; 
for i=1:width %行扫描
    for j=1:height %列扫描 
        if(pic2gray(i,j)~=0 &&(pic2gray(i,j)~=255)) 
            quzhi = pic2gray(i,j); 
            mianjibiaoqian(quzhi,1) = mianjibiaoqian(quzhi,1)+1; 
        end 
    end 
end
fprintf('共有%d个物体\n',biaoqian);
for i=1:biaoqian
    fprintf('第%d个物体的面积为%d\n',i,mianjibiaoqian(i,1));
end    
%计算质心
imshow(pic2);
title('所有物体的质心为：');
hold on;
for k =1:biaoqian
    sumX_label = 0; sumY_label = 0; area = mianjibiaoqian(k,1);
    for i=1:width
        for j=1:height
            if pic2gray(i,j)==k
                sumX_label = sumX_label+j;
                sumY_label = sumY_label+i;
            end
        end
    end
    centroidX = sumX_label / area;
    centroidY = sumY_label / area;
    fprintf('第%d个物体的质心坐标为(%.2f,%.2f)\n',k,centroidX,centroidY)
    plot(centroidX, centroidY, 'r+', 'MarkerSize', 3, 'LineWidth', 1);
end