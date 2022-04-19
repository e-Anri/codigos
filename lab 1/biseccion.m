function [c,convergencia,error] = biseccion(a,b,tol,iteraciones,f)
%Se define la solución aproximada
c=a;
%Se definen el numero de iteraciones actual
iters=0;
%Se definen dos listas para almacenar los valores de cada iteracion
convergencia=[];
error=[];

%Ciclo while, si el calculo del error es mayor a la tolerancia y las
%iteraciones actuales son menores a las maximas se realiza:
while ((b-a)/2>tol && iters<iteraciones )

%Se calcula la solución aproximada
c = a + (b-a)/2;
%Se verifica el valor de f(c), f(a) y  f(b) para continuar
if f(c) == 0
    a=c;
    b=c;
end

if sign(f(a)) == sign(f(c))
    a=c;

end

if sign(f(b)) == sign(f(c))

    b=c;
end
%Se calcula el error
e=(b-a)/2;
%Se modifican las variables de acorde a está iteracion
error=[error,e];    
convergencia=[convergencia,c]; 
iters = iters + 1


end


end
