function[Q, R, solucionHH, solucionesHH, errorHH, erroresHH] = HouseHolder_E(A, b)

[m,n] = size(A);
S = min(n,m-1);
Q = eye(m,m);
for k = 1:S
    [x, sigma] = housecero(A(k:m,k));
    Q(1:m,k:m) = housemult(Q(1:m,k:m),x);
    A(k,k) = sigma;
    s1 = size(x); 
    A(k+1:m,k) = x(2:s1);
    v(k)= x(1);
    beta = 2/(x'*x); 
    for j = k+1:n
        s = 0;
        s = s + x(1:m-k+1)' * A(k:m,j);
        s = beta * s;
        A(k:m, j) = A(k:m, j) - s * x(1:m-k+1);

    end

end

R = triu(A);


% Ax = b -> QRx = b -> Rx = Q'b -> Rx =  z
% Q es una matriz ortogonal y R es una triangular superior
z = Q' * b;
solucionHH = sustitucionProgresiva(R,z);

solucionesHH = [solucionHH,solucionHH];
errorHH = norm(A*solucionHH-b,2);
erroresHH = [erroresHH,errorHH];
errorHH = min(erroresHH);

end