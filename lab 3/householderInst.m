function[Q,R,inst] = householderInst(A)
inst = 0;
[m,n] = size(A);
S = min(n,m-1);
Q = eye(m,m); 
inst = inst + 6;
for k = 1:S
    [x, sigma,inst1] = houseceroInst(A(k:m,k));
    [Q(1:m,k:m),inst2] = housemultInst(Q(1:m,k:m),x);
    inst = inst + inst1 + inst2;
    A(k,k) = sigma;
    s1 = size(x); 
    A(k+1:m,k) = x(2:s1);
    inst = inst + m-(k+1);
    v(k)= x(1);
    inst = inst + 1;
    beta = 2/(x'*x); 
    inst = inst + 2 + k;
    inst = inst + 12;
    for j = k+1:n
        s = 0;
        inst = inst + 1;
        s = s + x(1:m-k+1)' * A(k:m,j);
        inst = inst + 2 + (m-k+1)*(k-m);
        s = beta * s;
        inst = inst + 2;
        A(k:m, j) = A(k:m, j) - s * x(1:m-k+1);
        inst = inst + k-m +m-k+1;
    end
end
R = triu(A);
inst = inst + 2;
end