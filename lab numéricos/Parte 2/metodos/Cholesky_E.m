function [soluciones,error, operaciones] = Cholesky_E(A,b)

[~, n] = size(A);
%Inicializamos la matriz nula
L = zeros(n,n);
for j = 1:n
    sum = 0;
    for k = 1:j-1
        sum = sum + (L(j,k))^2;
    end
    L(j,j) = sqrt(A(j,j)-sum);
    for i = j+1:n
        sum = 0;
        for k = 1:j-1
            sum = sum + L(i,k)*L(j,k);
        end
    L(i,j) = (A(i,j)-sum)/L(j,j);
    end      
end

%Aplicamos progresivo
[Lp, operaciones1] = sustitucionProgresiva(L, b);

%Aplicamos regresivo
[soluciones, operaciones2] = sustitucionRegresiva(L', Lp);

%Operaciones totales
operaciones = operaciones1 + operaciones2;

%Sacamos el error
error = norm(A*soluciones - b);

end
    
    