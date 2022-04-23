% Metodo de Givens
% Uso: [Ab] = givens(A)
function [Q, R, tiempo, operaciones] = Givens(A);
operaciones = 0;
tic
[m n] = size(A);
Q = eye(m);
R = A;

operaciones = operaciones + 3;
for i=1:n
    for k=i+1:m
        if(R(k,i) ~= 0)
            raiz = sqrt(R(k,i)^2 + R(i,i)^2);
            s = -R(k,i)/raiz;
            c = R(i,i)/raiz;
            G = eye(m); % Matriz de rotacion
            G(i,i) = c;
            G(k,k) = c;
            G(k,i) = -s;
            G(i,k) = s;
            Q = Q*G; % Matriz ortogonal
            R = G'*R; % Matriz triangular inferior
            operaciones = operaciones + 10;
        end
        operaciones = operaciones + 1;
    end
    operaciones = operaciones + 1;
end
tiempo = toc;
end
