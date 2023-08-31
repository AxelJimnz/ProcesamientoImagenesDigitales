close all
[X,mp] = imread('cameraman.tif');

figure(1)
imshow(X,mp)
axis on
title('imagen original')

[N,M] = size(X);

disp('Presionar Enter...');pause

% Traslacion
Y = zeros(N,M);

i0 = 60;
j0 = 126;

for i=1:N
    for j=1:M
       ip = fix(i+i0);
       jp = fix(j+j0);
       if (jp>=1) & (jp<=M) & (ip>=1) & (ip<=N)
           Y(i,j) = X(ip,jp);
       end
   end
end

figure(2)
imshow(Y,mp)
axis on
title(sprintf('imagen con traslacion en (%d,%d)',i0,j0))
           
disp('Presionar Enter...');pause

% Rotacion

Y = zeros(N,M);
th = 30*pi/180;

for i=1:N
    for j=1:M
       m = [cos(th) sin(th);-sin(th) cos(th)]*[i j]';
       ip = fix(m(1)+0.5);
       jp = fix(m(2)+0.5);
       if (jp>=1) & (jp<=M) & (ip>=1) & (ip<=N)
           Y(i,j) = X(ip,jp);
       end
   end
end

figure(3)
imshow(Y,mp)
axis on
title(sprintf('imagen con rotacion en (%f)',th*180/pi))

disp('Presionar Enter...');pause




% Rotacion y traslacion

Y = zeros(N,M);
th = 30*pi/180;
i0 = 128;
j0 = 128;

for i=1:N
    for j=1:M
       m = [cos(th) sin(th);-sin(th) cos(th)]*[i-i0 j-j0]'+[i0 j0]';
       ip = fix(m(1)+0.5);
       jp = fix(m(2)+0.5);
       if (jp>=1) & (jp<=M) & (ip>=1) & (ip<=N)
           Y(i,j) = X(ip,jp);
           
       end
   end
end

figure(3)
imshow(Y,mp)
axis on
title(sprintf('imagen con rotacion en %f y tras lac (%d,%d)',th*180/pi,i0,j0))

disp('Presionar Enter...');pause


% Escala

Y = zeros(N,M);
ki = 2;
kj = 3;

for i=1:N
    for j=1:M
       m = [ki*i kj*j]';
       ip = fix(m(1)+0.5);
       jp = fix(m(2)+0.5);
       if (jp>=1) & (jp<=M) & (ip>=1) & (ip<=N)
           Y(i,j) = X(ip,jp);
       end
   end
end

figure(4)
imshow(Y,mp)
axis on
title(sprintf('imagen con escalamiento (%d,%d)',ki,kj))

disp('Presionar Enter...');pause

% Escala

Y = zeros(N,M);
ki = 1/2;
kj = 1/3;

for i=1:N
    for j=1:M
       m = [ki*i kj*j]';
       ip = fix(m(1)+0.5);
       jp = fix(m(2)+0.5);
       if (jp>=1) & (jp<=M) & (ip>=1) & (ip<=N)
           Y(i,j) = X(ip,jp);
       end
   end
end

figure(5)
imshow(Y,mp)
axis on
title(sprintf('imagen con escalamiento (%f,%f)',ki,kj))

disp('Presionar Enter...');pause


% Deformacion radial

Y = zeros(N,M);

i0 = 128;
j0 = 128;

for i=1:N
    for j=1:M
       [th,r] = cart2pol(i-i0,j-j0);
       rp  = sqrt(r*r+r^3)/10;
       thp = th ;
       ip = fix(rp*cos(thp)+i0+0.5);
       jp = fix(rp*sin(thp)+j0+0.5);
       if (jp>=1) & (jp<=M) & (ip>=1) & (ip<=N)
           Y(i,j) = X(ip,jp);
       end
   end
end

figure(6)
imshow(Y,mp)
axis on
title(sprintf('imagen con distorsion radial'))

disp('Presionar Enter...');pause


% Deformacion tangencial

Y = zeros(N,M);

i0 = 128;
j0 = 128;

for i=1:N
    for j=1:M
       [th,r] = cart2pol(i-i0,j-j0);
       rp  = r;
       thp = th + sin(th)/8;
       ip = fix(rp*cos(thp)+i0+0.5);
       jp = fix(rp*sin(thp)+j0+0.5);
       if (jp>=1) & (jp<=M) & (ip>=1) & (ip<=N)
           Y(i,j) = X(ip,jp);
       end
   end
end

figure(7)
imshow(Y,mp)
axis on
title(sprintf('imagen con distorsion tangencial'))

