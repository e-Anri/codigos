function [soluciones,error, operaciones] = Cholesky_E(A,b)

[~, n] = size(A);
%Inicializamos la matriz nula
L = zeros(n,n);
operaciones = 2;
for j = 1:n
    sum = 0;
    operaciones = operaciones + 1;
    for k = 1:j-1
        sum = sum + (L(j,k))^2;
        operaciones = operaciones + 1;
    end
    L(j,j) = sqrt(A(j,j)-sum);
    operaciones = operaciones + 1;
    for i = j+1:n
        sum = 0;
        operaciones = operaciones + 1;
        for k = 1:j-1
            sum = sum + L(i,k)*L(j,k);
            operaciones = operaciones + 1;
        end
    L(i,j) = (A(i,j)-sum)/L(j,j);
    operaciones = operaciones + 1;
    end      
end

%Aplicamos progresivo
[Lp, operaciones1] = sustitucionProgresiva(L, b);

%Aplicamos regresivo
[soluciones, operaciones2] = sustitucionRegresiva(L', Lp);

%Sacamos el error
error = norm(A*soluciones - b);
operaciones = operaciones + 1;

%Operaciones totales
operaciones = operaciones + operaciones1 + operaciones2;

end
    
    