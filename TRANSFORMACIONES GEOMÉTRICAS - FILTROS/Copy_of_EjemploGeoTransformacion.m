close all
[X,mp] = imread('cameraman.tif');

% Mostrar la imagen original
figure(1)
imshow(X,mp)
axis on
title('Imagen original')

[N,M] = size(X);

pause(1);  % Pausa de 1 segundo para ver la imagen original

% Define las transformaciones
transformations = {
    % Traslación
    struct('type', 'translation', 'i0', 60, 'j0', 126),
    % Rotación
    struct('type', 'rotation', 'th', 30*pi/180),
    % Rotación y traslación
    struct('type', 'rotation_translation', 'th', 30*pi/180, 'i0', 128, 'j0', 128),
    % Escala
    struct('type', 'scale', 'ki', 2, 'kj', 3),
    % Escala inversa
    struct('type', 'scale_inverse', 'ki', 1/2, 'kj', 1/3),
    % Deformación radial
    struct('type', 'radial_distortion'),
    % Deformación tangencial
    struct('type', 'tangential_distortion')
};

for t = 1:numel(transformations)
    transformation = transformations{t};
    Y = applyTransformation(X, transformation);
    
    figure(t + 1)
    imshow(Y, mp)
    axis on
    title(sprintf('Imagen con %s', getTransformationTitle(transformation)))

    pause(1);  % Pausa de 1 segundo entre transformaciones
end

function Y = applyTransformation(X, transformation)
    [N, M] = size(X);
    Y = zeros(N, M);

    switch transformation.type
        case 'translation'
            i0 = transformation.i0;
            j0 = transformation.j0;

            for i = 1:N
                for j = 1:M
                    ip = fix(i + i0);
                    jp = fix(j + j0);
                    if (jp >= 1) && (jp <= M) && (ip >= 1) && (ip <= N)
                        Y(i, j) = X(ip, jp);
                    end
                end
            end

        case 'rotation'
            th = transformation.th;

            for i = 1:N
                for j = 1:M
                    m = [cos(th) sin(th); -sin(th) cos(th)] * [i j]';
                    ip = fix(m(1) + 0.5);
                    jp = fix(m(2) + 0.5);
                    if (jp >= 1) && (jp <= M) && (ip >= 1) && (ip <= N)
                        Y(i, j) = X(ip, jp);
                    end
                end
            end

        case 'rotation_translation'
            th = transformation.th;
            i0 = transformation.i0;
            j0 = transformation.j0;

            for i = 1:N
                for j = 1:M
                    m = [cos(th) sin(th); -sin(th) cos(th)] * [i - i0 j - j0]' + [i0 j0]';
                    ip = fix(m(1) + 0.5);
                    jp = fix(m(2) + 0.5);
                    if (jp >= 1) && (jp <= M) && (ip >= 1) && (ip <= N)
                        Y(i, j) = X(ip, jp);
                    end
                end
            end

        case 'scale'
            ki = transformation.ki;
            kj = transformation.kj;

            for i = 1:N
                for j = 1:M
                    m = [ki * i kj * j]';
                    ip = fix(m(1) + 0.5);
                    jp = fix(m(2) + 0.5);
                    if (jp >= 1) && (jp <= M) && (ip >= 1) && (ip <= N)
                        Y(i, j) = X(ip, jp);
                    end
                end
            end

        case 'scale_inverse'
            ki = transformation.ki;
            kj = transformation.kj;

            for i = 1:N
                for j = 1:M
                    m = [ki * i kj * j]';
                    ip = fix(m(1) + 0.5);
                    jp = fix(m(2) + 0.5);
                    if (jp >= 1) && (jp <= M) && (ip >= 1) && (ip <= N)
                        Y(i, j) = X(ip, jp);
                    end
                end
            end

        case 'radial_distortion'
            i0 = 128;
            j0 = 128;

            for i = 1:N
                for j = 1:M
                    [th, r] = cart2pol(i - i0, j - j0);
                    rp = sqrt(r * r + r^3) / 10;
                    thp = th;
                    ip = fix(rp * cos(thp) + i0 + 0.5);
                    jp = fix(rp * sin(thp) + j0 + 0.5);
                    if (jp >= 1) && (jp <= M) && (ip >= 1) && (ip <= N)
                        Y(i, j) = X(ip, jp);
                    end
                end
            end

        case 'tangential_distortion'
            i0 = 128;
            j0 = 128;

            for i = 1:N
                for j = 1:M
                    [th, r] = cart2pol(i - i0, j - j0);
                    rp = r;
                    thp = th + sin(th) / 8;
                    ip = fix(rp * cos(thp) + i0 + 0.5);
                    jp = fix(rp * sin(thp) + j0 + 0.5);
                    if (jp >= 1) && (jp <= M) && (ip >= 1) && (ip <= N)
                        Y(i, j) = X(ip, jp);
                    end
                end
            end
    end
end

function titleText = getTransformationTitle(transformation)
    switch transformation.type
        case 'translation'
            titleText = sprintf('traslación en (%d,%d)', transformation.i0, transformation.j0);
        case 'rotation'
            titleText = sprintf('rotación en (%f)', transformation.th * 180 / pi);
        case 'rotation_translation'
            titleText = sprintf('rotación en %f y traslación (%d,%d)', transformation.th * 180 / pi, transformation.i0, transformation.j0);
        case 'scale'
            titleText = sprintf('escalado (%d,%d)', transformation.ki, transformation.kj);
        case 'scale_inverse'
            titleText = sprintf('escalado inverso (%f,%f)', transformation.ki, transformation.kj);
        case 'radial_distortion'
            titleText = 'distorsión radial';
        case 'tangential_distortion'
            titleText = 'distorsión tangencial';
        otherwise
            titleText = 'Desconocido';
    end
end

