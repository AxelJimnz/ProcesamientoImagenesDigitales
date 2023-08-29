A=imread('A.jpg');
A=rgb2gray(A);
A=im2bw(A);

B=imread('B.jpg');
B=rgb2gray(B);
B=im2bw(B);

%Operaciones logicas
C = A & B;        % AND
D = A | B;        % OR    figure,imshow(I);
E = xor(A,B);     % XOR
F = A & ~B;       % A and not(B)

%Operaciones aritmeticas
suma = A + B;
resta =  A - B;
multiplicacion =  A .*B;
division = A ./B;

%Mostrar las imagenes y los resultados
subplot(1,9,1), imshow(A); title('A');
subplot(1,9,2), imshow(B); title('B');
pause;
subplot(1,9,3), imshow(suma); title('SUMA');
pause;
subplot(1,9,4), imshow(resta); title('RESTA');
pause;
subplot(1,9,5), imshow(multiplicacion); title('MULTIPLICACION');
pause;
subplot(1,9,6), imshow(division); title('DIVISION');
pause;
subplot(1,9,7), imshow(C); title('AND');
pause;
subplot(1,9,8), imshow(D); title('OR');
pause;
subplot(1,9,9), imshow(E); title('XOR');