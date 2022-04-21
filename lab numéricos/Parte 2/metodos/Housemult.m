function A = housemult(A,u)
[m1,n] = size(A);
beta = 2/(u'*u);
for i = 1:m1
    s = 0;
    s = s + u(1:n)*A(i,1:n);
    s = beta * s;
    A(i,1:n) = A(i,1:n) - (s*u(1:n))';
end
end
