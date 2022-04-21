function[x, tiempo] = GaussSeidel_T(A,b,x)
tic;
n = length(x);
w=x;
    for i=i:n
        x(i) = (b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
    end
toc = tiempo;
end