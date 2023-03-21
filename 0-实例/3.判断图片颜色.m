
%% 分别打开三幅图，判断它们的颜色(自定义函数color)

% 思路：（纯色图适用）
% 通过行列扫描，把每个像素点的rgb值进行判断，满足某个颜色要求，对应颜色计数+1
% 比较哪个计数值最大，就是哪种颜色

function y=color(x)
red = 0;green = 0;yellow = 0;
for i=1:size(x,1)
    for j=1:size(x,2)
        if x(i,j,1)>200 && x(i,j,2)<50 && x(i,j,3)<50
            red = red+1;
        elseif x(i,j,1)<50 && x(i,j,2)>200 && x(i,j,3)<50
            green = green+1;
        elseif x(i,j,1)>200 && x(i,j,2)>200 && x(i,j,3)<50
            yellow = yellow+1;
        end
    end
end
if max(max(red,green),yellow) == red
    y = 'red';
elseif max(max(red,yellow),green) == green
    y = 'green';
elseif max(max(red,yellow),green) == yellow
    y = 'yellow';
end
end


pic1 = imread('red.jpg');
pic2 = imread('green.jpg');
pic3 = imread('yellow.jpg');
figure;
subplot(1,3,1);imshow(pic1);title('pic1');
subplot(1,3,2);imshow(pic2);title('pic2');
subplot(1,3,3);imshow(pic3);title('pic3');

figure;
subplot(1,3,1);imshow(pic1);y=color(pic1);title(y);
subplot(1,3,2);imshow(pic2);y=color(pic2);title(y);
subplot(1,3,3);imshow(pic3);y=color(pic3);title(y);