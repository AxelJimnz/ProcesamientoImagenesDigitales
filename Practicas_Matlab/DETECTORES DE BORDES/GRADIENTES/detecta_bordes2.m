I = imread('circuit.tif');
figure, imshow(I);
rotI = imrotate(I,33,'crop');
figure, imshow(rotI);
BW=edge(rotI,'canny');
figure, imshow(BW);