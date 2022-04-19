function [xn,convergencia,error] = regulaFalsi(x0,x1,tol,iteraciones,f)

e = abs(f(x0));
iters = 0;
convergencia = [];
error = [];
%Se define la solución aproximada
xn = x0;

while(e>tol && iters<iteraciones)
    %Se calcula la solución aproximada
    xn = x1 - f(x1)*((x1-x0)/(f(x1)-f(x0)))
    %Se calcula el error
    e = abs(f(xn))
    %Se modifican las variables de acorde a está iteracion
    error = [error,e];
    convergencia = [convergencia,xn];
    iters = iters + 1;
    %Se verifica el valor de f(xn), f(x0) para continuar
    if (f(xn)==0)
        x0 = xn;
        x1 = xn;
    end
    if (sign(f(x0))==sign(f(xn)))
        x0 = xn;
    else
        x1 = xn;
    end
end

end