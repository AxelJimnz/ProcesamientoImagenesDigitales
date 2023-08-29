I=imread('letras.jpg');
imshow(I);
pause;
whos I
%imfinfo letras.jpg
K=imfinfo('letras.jpg');
image_bytes = K.Width*K.Height*K.BitDepth/8;
compressed_bytes = K.FileSize;
compression_ratio = image_bytes/compressed_bytes
%imhist(I); % MAL
J=rgb2gray(I); % Convierte de RGB a Escala de Gris
imshow(J);
pause;
imhist(J); %Histograma
pause;
BW=im2bw(J); % Binariza sin especificar umbral; con umbral BW=im2bw(J, 0.5) por ejemplo
imshow(BW);
pause;
BW2=~(BW);  % Negación de la imagen, puede emplearse también BW2=not(BW)
imshow(BW2);
pause;
[L, NUM] = bwlabel(BW,4)% L = numero de etiquetas, NUM = Número de regiones conexas empleando conectividad 4-conexo
 CC = bwconncomp(BW); % Obtiene componentes  con conectividad 8-vecinos;  bwconncomp(BW,4) sería de 4-vecinos
L2 = labelmatrix(CC);  % 
RGB = label2rgb(L2);
pause;
figure, imshow(RGB);