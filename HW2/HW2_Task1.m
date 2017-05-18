%   Meltem YILMAZ
%   Task 1 - Bit plane slicing

clc;
close all;
clear all;
F=imread('kids.tif');   %read image

G1=bitget(F,1); % get bitplane 1
G2=bitget(F,2); % get bitplane 2
G3=bitget(F,3); % get bitplane 3
G4=bitget(F,4); % get bitplane 4
G5=bitget(F,5); % get bitplane 5
G6=bitget(F,6); % get bitplane 6
G7=bitget(F,7); % get bitplane 7
G8=bitget(F,8); % get bitplane 8

figure(1);
subplot(4,4,[1 8]);imshow(F);title('Original 8 bit image');  %subplot original Image
subplot(4,4,9);imshow(logical(G1));title('Bitplane 1');      %Show Bitplane 1 
subplot(4,4,10);imshow(logical(G2));title('Bitplane 2');     %Show Bitplane 2
subplot(4,4,11);imshow(logical(G3));title('Bitplane 3');     %Show Bitplane 3
subplot(4,4,12);imshow(logical(G4));title('Bitplane 4');     %Show Bitplane 4
subplot(4,4,13);imshow(logical(G5));title('Bitplane 5');     %Show Bitplane 5
subplot(4,4,14);imshow(logical(G6));title('Bitplane 6');     %Show Bitplane 6
subplot(4,4,15);imshow(logical(G7));title('Bitplane 7');     %Show Bitplane 7
subplot(4,4,16);imshow(logical(G8));title('Bitplane 8');     %Show Bitplane 8

%Image reconstruction
A=imread('kids.tif');
% by combining 5 AND 7 bit planes
B=zeros(size(A));
B=bitset(B,5,bitget(A,5));
B=bitset(B,7,bitget(A,7));
B=uint8(B);
%figure,imshow(B);
% by combining 5,6 and 7 bit planes
E=zeros(size(A));
E=bitset(E,5,bitget(A,5));
E=bitset(E,6,bitget(A,6));
E=bitset(E,7,bitget(A,7));
E=uint8(E);
%figure,imshow(E);
% by combining 4,5,6 and 7 bit planes
D=zeros(size(A));
D=bitset(D,4,bitget(A,4));
D=bitset(D,5,bitget(A,5));
D=bitset(D,6,bitget(A,6));
D=bitset(D,7,bitget(A,7));
D=uint8(D);
%figure,imshow(D);

figure(2);
subplot(2,2,1);imshow(A);title('Original 8 bit image');
subplot(2,2,2);imshow(B);title('Combining: 5 & 7'); 
subplot(2,2,3);imshow(E);title('Combining: 5,6 & 7');
subplot(2,2,4);imshow(D);title('Combining: 4,5,6 & 7');
