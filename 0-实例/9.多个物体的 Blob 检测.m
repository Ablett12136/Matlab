%% 3.4 多个物体的 Blob 检测（任务5）
close all;
clear;
clc;
file3 = 'fankuaituduoge.bmp';
pic3 = imread(file3);
pic3gray=rgb2gray(pic3); 
[width,height,bmgs] = size(pic3gray);
for i=1:width
    for j=1:height
        if pic3gray(i,j)<240
            pic3gray(i,j) = 0; 
        else
            pic3gray(i,j) = 255;
        end
    end
end
biaoqian = 0; 
for i=1:width %行扫描
    for j=1:height %列扫描 
        if pic3gray(i,j) == 0 % if(当前数据 = 黑色) 
            % if( (左边数据没标签)&&（上面数据没标签）&&（右边数据没标签）&&(下面数据没标签) ) 
            if( ((pic3gray(i,j-1)==0)||(pic3gray(i,j-1)==255)) &&((pic3gray(i-1,j)==0)||(pic3gray(i-1,j)==255))&&((pic3gray(i,j+1)==0)||(pic3gray(i,j+1)==255)) &&((pic3gray(i+1,j)==0)||(pic3gray(i+1,j)==255)) ) 
                %贴新标签
                biaoqian = biaoqian +1; 
                pic3gray(i,j) = biaoqian; 
            %左边坐标有标签，则改点赋值为左边标签 
            elseif( (pic3gray(i,j-1)~=0)&&(pic3gray(i,j-1)~=255)) 
                pic3gray(i,j) = pic3gray(i,j-1); 
            elseif( (pic3gray(i-1,j)~=0)&&(pic3gray(i-1,j)~=255)) %上面坐标有标签，则改点赋值为上面标签
                pic3gray(i,j) = pic3gray(i-1,j); 
            elseif( (pic3gray(i,j+1)~=0)&&(pic3gray(i,j+1)~=255)) %右边坐标有标签，则改点赋值为右边标签 
                pic3gray(i,j) = pic3gray(i,j+1); 
            elseif( (pic3gray(i+1,j)~=0)&&(pic3gray(i+1,j)~=255)) %下面坐标有标签，则改点赋值为下面标签 
                pic3gray(i,j) = pic3gray(i+1,j); 
            end 
 
        end 
    end 
end 
%贴完的标签的面积计算
mianjibiaoqian =zeros(254,1); 
quzhi =0; 
for i=1:width %行扫描
    for j=1:height %列扫描 
        if( pic3gray(i,j)~=0 &&(pic3gray(i,j)~=255)) 
            quzhi = pic3gray(i,j); 
            mianjibiaoqian(quzhi,1) = mianjibiaoqian(quzhi,1)+1; 
        end 
    end 
end
fprintf('共有%d个标签',biaoqian);