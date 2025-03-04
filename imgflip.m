%% Image Flip

img=imread("C:\data\laptop.jpg");
[h,w,c]=size(img);
re_img=zeros(h,w,c,'uint8');

for x=1:c
    for y=1:h
        for z=1:w
            re_img(y,w+1-z,x)=img(y,z,x);
        end
    end
end

subplot(1,2,1)
imshow(img)
title('before flip')
subplot(1,2,2)
imshow(re_img)
title('after flip')

%% Edge Detection with Sobel Mask

pad_img=zeros(h+2,w+2,c,'uint8');
for x=1:c
    for y=1:h
        for z=1:w
            pad_img(y+1,z+1,x)=img(y,z,x);
        end
    end
end

sobel_x=[-1,0,1;-2,0,2;-1,0,1];
sobel_y=[-1,-2,-1;0,0,0;1,2,1];
x_img=zeros(h,w,c,'uint8');
y_img=zeros(h,w,c,'uint8');
for x=1:c
    for y=1:h
        for z=1:w
            img1=pad_img(y:y+2,z:z+2,x);
            x_img(y,z,x)=sum(sum(double(img1).*sobel_x))/8;
            y_img(y,z,x)=sum(sum(double(img1).*sobel_y))/8;
            re_img(y,z,x)=x_img(y,z,x)+y_img(y,z,x);
        end
    end
end

imshow(re_img)
title('After Edge Detection')