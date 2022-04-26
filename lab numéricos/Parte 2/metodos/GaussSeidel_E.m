function[x, error, operaciones] = GaussSeidel_E(A,b,n,iters)
    error = 1;
    k = 0;
    x = zeros(n, 1);
    operaciones = 3;
    while k<iters && error ~= 0
        x_old=x;
        operaciones = operaciones + 1;
        for i=1:n
            sigma=0;
            operaciones = operaciones + 1;
            for j=1:i-1
                    sigma=sigma+A(i,j)*x(j);
                    operaciones = operaciones + 1;
            end
            for j=i+1:n
                    sigma=sigma+A(i,j)*x_old(j);
                    operaciones = operaciones + 1;
            end
            x(i)=(1/A(i,i))*(b(i)-sigma);
            operaciones = operaciones + 1;
        end
        k=k+1;
        error=norm(x_old-x);
        operaciones = operaciones + 2;
    end

end