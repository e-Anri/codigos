function [A,inst] = housemultInst(A,u)
inst = 0;
[m1,n] = size(A);
beta = 2/(u'*u);
inst = inst + 6;
for i = 1:m1
    s = 0;
    inst = inst + 1;
    s = s + u(1:n)*A(i,1:n);
    inst = inst + 2 + n*n;
    s = beta * s;
    inst = inst + 2;
    A(i,1:n) = A(i,1:n) - (s*u(1:n))';
    inst = inst + n + n;
end
end