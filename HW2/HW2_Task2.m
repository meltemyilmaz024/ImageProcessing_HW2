%   Meltem YILMAZ
%   Task 2 – Histogram Processing with Image Processing Toolbox

img = imread('pout.tif');
% It's histogram looks like this: imhist(img);

%Histogram Equalization
img_eq = histeq(img);


%The histogram after the histogram equalization:  imhist(histeq(img)); 

figure();
subplot(2,2,1);imshow(img);title('Real');
subplot(2,2,2);imhist(img);title('Only Histogram'); 
subplot(2,2,3);imshow(img_eq);title('Histogram Equalization');
subplot(2,2,4);imhist(histeq(img));title('Re-Histogram');