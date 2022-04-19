function[xn,convergencia,error] = newtonRaphson(x0,tol,iteraciones,f,df)
%Se define la solución aproximada
xn = x0;
e = abs(f(xn));
iters = 0;
convergencia = [];
error = [];
while(e>tol && iters<iteraciones)
    %Se calcula la solución aproximada
    xn = xn - (f(xn)/df(xn));
    %Se calcula el error
    e = abs(f(xn))
    %Se modifican las variables de acorde a está iteracion
    error = [error,e];
    convergencia = [convergencia,xn];
    iters = iters + 1;
end

end