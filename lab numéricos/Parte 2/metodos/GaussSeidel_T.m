function[x, inst, tiempo] = GaussSeidel_T(A,b,x,tol,iters)
    tic
    inst = 0;
    n = length(x);
    for i=1:iters
        w=x;
        for i=i:n
            x(i) = (b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
            inst = inst + 2 + (i-1)*(i-1) + 1 + (n-i+1)*(n-i+1);
        end
        error = norm(x-w,2);
        inst = inst + 2;
        inst = inst + 1;
        if error<tol
            inst = inst + 1;
            tiempo = toc;
            return
        end
    end

    tiempo = toc;
end