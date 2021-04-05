%Main Script to run all of the transforms on all three images
I1 = rgb2gray(imread('Assignment1_Image1.png')); %480x720
I2 = rgb2gray(imread('Assignment1_Image2.png')); %480x720
I3 = rgb2gray(imread('Assignment1_Image3.png')); %1081x1438

%Part 1: Scale an image to 1080x1920
ScalingMatrix = [(8/3), 0, 0; 0, 2.25, 0; 0, 0 ,1];
Ip11 = transformImage(I1, ScalingMatrix, 'scaling');
Ip21 = transformImage(I2, ScalingMatrix, 'scaling');
ScalingMatrix1 = [1.335187761, 0, 0; 0, .9990749306, 0; 0, 0 ,1];
Ip31 = transformImage(I3, ScalingMatrix1, 'scaling');
imwrite(Ip11, 'Output\Assignment1_Image1_Part1.png');
imwrite(Ip21, 'Output\Assignment1_Image2_Part1.png');
imwrite(Ip31, 'Output\Assignment1_Image3_Part1.png');

%Part 2: Reflect in the y direction
ReflectionYMatrix = [1, 0, 0; 0, -1, 0; 0, 0, 1];
Ip12 = transformImage(I1, ReflectionYMatrix, 'reflection');
Ip22 = transformImage(I2, ReflectionYMatrix, 'reflection');
Ip32 = transformImage(I3, ReflectionYMatrix, 'reflection');
imwrite(Ip12, 'Output\Assignment1_Image1_Part2.png');
imwrite(Ip22, 'Output\Assignment1_Image2_Part2.png');
imwrite(Ip32, 'Output\Assignment1_Image3_Part2.png');

%Part 3: Rotate the image clockwise 30 degrees
RotationMatrix = [cosd(30),-sind(30),0;sind(30),cosd(30),0;0,0,1];
Ip13 = transformImage(I1, RotationMatrix, 'rotation');
Ip23 = transformImage(I2, RotationMatrix, 'rotation');
Ip33 = transformImage(I3, RotationMatrix, 'rotation');
imwrite(Ip13, 'Output\Assignment1_Image1_Part3.png');
imwrite(Ip23, 'Output\Assignment1_Image2_Part3.png');
imwrite(Ip33, 'Output\Assignment1_Image3_Part3.png');
    
%Part 4: X-direction shear by .5
ShearMatrix = [1, .5, 0; 0, 1, 0; 0, 0, 1];
Ip14 = transformImage(I1, ShearMatrix, 'shear');
Ip24 = transformImage(I2, ShearMatrix, 'shear');
Ip34 = transformImage(I3, ShearMatrix, 'shear');
imwrite(Ip14, 'Output\Assignment1_Image1_Part4.png');
imwrite(Ip24, 'Output\Assignment1_Image2_Part4.png');
imwrite(Ip34, 'Output\Assignment1_Image3_Part4.png');

%Part 5: Lots of stuff
%                      Scaling by 1/2         Rotation by 20 degrees cc                  Translation 300 x 500 y,  
multiTransform = [1/2,0,0;0,1/2,0;0,0,1]*[cosd(-20),-sind(-20),0;sind(-20),cosd(-20),0;0,0,1]*[1,0,300;0,1,500;0,0,1];
Ip15 = transformImage(I1, multiTransform, 'affine');
Ip25 = transformImage(I2, multiTransform, 'affine');
Ip35 = transformImage(I3, multiTransform, 'affine');
imwrite(Ip15, 'Output\Assignment1_Image1_Part5.png');
imwrite(Ip25, 'Output\Assignment1_Image2_Part5.png');
imwrite(Ip35, 'Output\Assignment1_Image3_Part5.png');

%Part 6: two affine transforms
affine1 = [1,.4,.4;.1,1,.3;0,0,1];
Ip161 = transformImage(I1, affine1, 'affine');
Ip261 = transformImage(I2, affine1, 'affine');
Ip361 = transformImage(I3, affine1, 'affine');
imwrite(Ip161, 'Output\Assignment1_Image1_Part6.1.png');
imwrite(Ip261, 'Output\Assignment1_Image2_Part6.1.png');
imwrite(Ip361, 'Output\Assignment1_Image3_Part6.1.png');

affine2 = [2.1,-.35,-.1;-.3,.7,.3;0,0,1];
Ip162 = transformImage(I1, affine2, 'affine');
Ip262 = transformImage(I2, affine2, 'affine');
Ip362 = transformImage(I3, affine2, 'affine');
imwrite(Ip162, 'Output\Assignment1_Image1_Part6.2.png');
imwrite(Ip262, 'Output\Assignment1_Image2_Part6.2.png');
imwrite(Ip362, 'Output\Assignment1_Image3_Part6.2.png');

%Part 7: two homography transforms
homography1 = [.8,.2,.3;-.1,.9,-.1;.0005,-.0005,1];
Ip171 = transformImage(I1, homography1, 'homography');
Ip271 = transformImage(I2, homography1, 'homography');
Ip371 = transformImage(I3, homography1, 'homography');
imwrite(Ip171, 'Output\Assignment1_Image1_Part7.1.png');
imwrite(Ip271, 'Output\Assignment1_Image2_Part7.1.png');
imwrite(Ip371, 'Output\Assignment1_Image3_Part7.1.png');

homography2 = [29.25, 13.95, 20.25; 4.95, 35.55, 9.45; 0.045, 0.09, 45];
Ip172 = transformImage(I1, homography2, 'homography');
imwrite(Ip172, 'Output\Assignment1_Image1_Part7.2.png');
Ip272 = transformImage(I2, homography2, 'homography');
imwrite(Ip272, 'Output\Assignment1_Image2_Part7.2.png');
Ip372 = transformImage(I3, homography2, 'homography');
imwrite(Ip372, 'Output\Assignment1_Image3_Part7.2.png');