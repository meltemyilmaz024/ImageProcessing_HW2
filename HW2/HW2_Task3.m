%   Meltem YILMAZ
%   Task 3 - Implementing Histogram Equalization

A=imread('shadow.tif');
Img=A;     
  
%WINDOW SIZE
M=10;
N=20;


mid_val=round((M*N)/2);

%FIND THE NUMBER OF ROWS AND COLUMNS TO BE PADDED WITH ZERO
in=0;
for i=1:M
    for j=1:N
        in=in+1;
        if(in==mid_val)
            PadM=i-1;
            PadN=j-1;
            break;
        end
    end
end
%PADDING THE IMAGE WITH ZERO ON ALL SIDES
B=padarray(A,[PadM,PadN]);

for i= 1:size(B,1)-((PadM*2)+1)
    
    for j=1:size(B,2)-((PadN*2)+1)
        cdf=zeros(256,1);
        inc=1;
        for x=1:M
            for y=1:N
  %FIND THE MIDDLE ELEMENT IN THE WINDOW          
                if(inc==mid_val)
                    ele=B(i+x-1,j+y-1)+1;
                end
                    pos=B(i+x-1,j+y-1)+1;
                    cdf(pos)=cdf(pos)+1;
                   inc=inc+1;
            end
        end
                      
        %COMPUTE THE CDF FOR THE VALUES IN THE WINDOW
        for l=2:256
            cdf(l)=cdf(l)+cdf(l-1);
        end
            Img(i,j)=round(cdf(ele)/(M*N)*255);
     end
end
figure(1),
subplot(2,2,1);imshow(A);title('Before Histogram Equalization'); 
subplot(2,2,2);imhist(A);
subplot(2,2,3);imshow(Img);title('After Histogram Equalization'); 
subplot(2,2,4);imhist(Img);


%Checking
% It's histogram looks like this:
img = imread('shadow.tif');
imhist(img);

%Histogram Equalization
%img = imread('pout.tif');
img_eq = histeq(img);
%imshow(img_eq);

%The histogram after the histogram equalization:
%img = imread('pout.tif');
imhist(histeq(img)); 

figure(2);
subplot(2,2,1);imshow(img);title('Real');
subplot(2,2,2);imhist(img);title('Only Histogram'); 
subplot(2,2,3);imshow(img_eq);title('Histogram Equalization');
subplot(2,2,4);imhist(histeq(img));title('Re-Histogram');