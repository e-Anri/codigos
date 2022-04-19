function [x,e,op] = GaussSeidel(A,b,tol,iteraciones,xs)
% Método GAUSS - SEIDEL
% x = gaussseidel(A,b,maxiter,tol, XS) intenta resolver el sistema A*x = B 
% con el método GAUSS - SEIDEL.
% XS es la estimación inicial, iteraciones es el
% número máximo de iteraciones, y tol es la tolerancia especificada en el
% de error

% variables locales
x = xs;
iters = 0;
e = 100000;
op = 1 + 1 + 1;

while all(e>tol) && iters < iteraciones

    xAnterior = x;
    op = op + 4;
    for i=1:size(A,1)
        sum = 0;
        for j=1:i-1
            sum = sum + A(i,j)*x(j);
            op = op + 5;
        end
        for j=i+1:size(A,1)
            sum = sum + A(i,j)*xAnterior(j);
            op = op + 5;
        end
        x(i) = (1/A(i,i))*(b(i)-sum);
        op = op + 8;
    end
    iters = iters + 1;
    y(iters,:) = x;
    e = norm(A*x - b);
    op = op + 10;
end
fprintf('\n Algoritmo detenido: número máximo de iteraciones alcanzado\n')
end

