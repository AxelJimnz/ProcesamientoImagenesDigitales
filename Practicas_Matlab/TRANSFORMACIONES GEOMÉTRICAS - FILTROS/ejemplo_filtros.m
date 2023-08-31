I=imread('cameraman.tif');
I = imnoise(I,'salt & pepper',0.02); figure; imshow(I)
k=ones(3,3)/9;                      % Filtro Pasa Bajas (Media)
g = [1 2 1; 2 4 2; 1 2 1]/16        % Filtro Gaussiano


lp1 = [0 1 0; 1 -4 1; 0 1 0]   %su primer laplaciano
Im_lp1 = imfilter(I,lp1);


g2 = fspecial('gaussian',[5 5],2);  %Filtro gaussiano con desv. est = 2
Im_f = imfilter(I,k);
Im_g = imfilter(I,g);
Im_m = medfilt2(I,[3 3]);            % Filtro Mediana
Im_g2 = imfilter(I,g2);
subplot(1,6,1), imshow(I);
subplot(1,6,2), imshow(Im_f);
subplot(1,6,3), imshow(Im_g);
subplot(1,6,4), imshow(Im_m);
subplot(1,6,5), imshow(Im_g2);   %MAX, MIN, PASA ALTA
subplot(1,6,6), imshow(Im_lp1);   %MUESTRA LAPLACIANO
