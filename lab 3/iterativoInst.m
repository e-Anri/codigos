function[x,errores,inst] = iterativoInst(A,b,x,tol,iters)
inst = 0;
n = length(x);
errores = [];
inst = inst + 2;
for i=1:iters
    w=x;
    inst = inst + 1;
    for i=i:n
        x(i) = (b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
        inst = inst + 2 + (i-1)*(i-1) + 1 + (n-i+1)*(n-i+1);
    end
    error = norm(x-w,2);
    inst = inst + 2;
    errores = [errores,error];
    inst = inst + 1;
    if error<tol
        inst = inst + 1;
        return
    end
end