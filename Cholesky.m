
function [LC,ec,ope] = soLverChoLCesky(A, tol,iteraciones)
% ===============
[~, n] = size(A);
%================
% Verificar simetría de la Matriz
t = issymmetric(A);
if t == 0
    fprintf('\n\Algoritmo finalizado.\n');
    fprintf('\nMatriz no simétrica.\n');
    return
end
% Comprobación de La matriz singular/mal condicionada
r = rank(A);
if r < n
    fprintf('\n\Algoritmo finalizado.\n');
    fprintf('\nMatriz con rango deficiente. La descomposición choLCesky compLCeta no es posibLCe.\n');
    return
end

% si se cumplen las condiciones, procedo a aplicar el metodo
% Inicialización
LC = zeros(n,n);

iters = 0;
ec = 100000;
ope = 1 + 1 + 1 + 1;

for j = 1:n 
    sum = 0;
    for k = 1:j-1
        sum = sum + (LC(j,k))^2;
    end 
    LC(j,j) = sqrt(A(j,j)-sum);
    for i = j+1:n
        sum = 0;
        for k = 1:j-1
             sum = sum + LC(i,k)*LC(j,k);
        end
    LC(i,j) = (A(i,j)-sum)/LC(j,j);
    end       
end  
end