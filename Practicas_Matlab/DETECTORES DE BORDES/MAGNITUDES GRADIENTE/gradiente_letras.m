I = imread('letras.png');
I_gray = rgb2gray(I); % Convierte la imagen en escala de grises
[Gx, Gy] = imgradientxy(I_gray);
[Gmag, Gdir] = imgradient(Gx, Gy);
figure;
imshowpair(Gmag, Gdir, 'montage');
axis off;

title('Magnitud de Gradiente (Gmag) y Direccion de Gradiente (Gdir) usando Sobel')
figure; imshowpair(Gx, Gy, 'montage'); axis off;
title ('Gradientes direccionales, Gx y Gy usando Sobel')