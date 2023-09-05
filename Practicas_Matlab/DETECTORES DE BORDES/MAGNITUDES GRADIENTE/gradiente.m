I=imread('coins.png');
[Gx, Gy] = imgradientxy(I);
[Gmag, Gdir] = imgradient(Gx, Gy);
figure; imshowpair(Gmag, Gdir, 'montage'); axis off;
% title('Magnitud de Gradiente (Gmag) y Direccion de Gradiente (Gdir) usando Sobel')
% figure; imshowpair(Gx, Gy, 'montage'); axis off;
% title ('Gradientes direccionales, Gx y Gy usando Sobel')