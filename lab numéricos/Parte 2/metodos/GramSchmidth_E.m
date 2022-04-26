function [solucion,error,operaciones] = GramSchmidth_E(A,b)

[~,n] = size(A);

Q = A;
R = zeros(n);
operaciones = 3;
for (k=1:n)
    for (i=1:k-1)
        R(i,k) = Q(:,i)' * Q(:,k);
        Q(:,k) = Q(:,k) - Q(:,i) * R(i,k);
        operaciones = operaciones + 2;
    end
    R(k,k) = norm(Q(:,k));
    Q(:,k) = Q(:,k)/R(k,k);
    operaciones = operaciones + 2;
end

y = Q'*b;
operaciones = operaciones + 1;
[solucion, operaciones2] = sustitucionRegresiva(R,y);
operaciones = operaciones + 1;
%Sacamos el error
error = norm(A*solucion - b);
operaciones = operaciones + 1;
operaciones = operaciones + operaciones2;

end

