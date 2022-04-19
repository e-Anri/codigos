function [xn,convergencia,error] = secante(x0,x1,tol,iteraciones,f)


e = abs(f(x0));
iters=0;
convergencia=[];
error=[];

while (e>tol && iters<iteraciones)  
 %Se calcula la solución aproximada
 xn = x1 - (f(x1)*(x1 - x0))/(f(x1) - f(x0));
 x1 = x0;
 x0 = xn; 
 %Se calcula el error
 e = abs(x1 - x0);
 %Se modifican las variables de acorde a está iteracion
 error=[error,e];    
 convergencia=[convergencia,xn]; 
 iters = iters + 1   
end

end
