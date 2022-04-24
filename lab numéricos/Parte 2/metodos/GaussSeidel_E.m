function[x, error, errores] = GaussSeidel_E(A,b,x,tol,iters)
n = length(x);
errores = [];
for i=1:iters
    w=x;
    for i=i:n
        x(i) = (b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
    end
    error = norm(x-w,2);
    errores = [errores,error];
    if error<tol
        return
    end
end

error = min(errores);

end