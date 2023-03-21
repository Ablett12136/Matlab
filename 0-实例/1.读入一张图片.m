%1.1使用matlab读取一幅图像
file1 = 'guazi.bmp';
file2 = 'lenargb.bmp';
%显示彩色图像
img1 = imread(file1);
figure;
imshow(img1)

img2 = imread(file2);
figure;
imshow(img2)
%转灰度图像
imfinfo(file1)% 查看图像文件信息
imshow(img1); % 显示彩色图像
img1Gray = rgb2gray(img1); % 转为灰度图像
figure % 打开一个新的窗口显示灰度图像
imshow(img1Gray); % 显示转化后的灰度图像
imwrite(img1Gray, 'guazi_gray.jpg'); % 将灰度图像保存到图像文件

imfinfo(file2)% 查看图像文件信息
imshow(img2); % 显示彩色图像
img2Gray = rgb2gray(img2); % 转为灰度图像
figure % 打开一个新的窗口显示灰度图像
imshow(img2Gray); % 显示转化后的灰度图像
imwrite(img2Gray, 'lenargb_gray.jpg'); % 将灰度图像保存到图像文件