function[x] = sustitucionRegresiva(A,b)
%Se comprueban las dimenciones, debe ser cuadrado A
[m,n] = size(A);
largo = length(b);
if(n ~= m)|(largo ~= m)
    error('Las dimensiones no son válidas')
    %Posiblemente haya que añadir un else
end
x = zeros(largo,1);
x(largo) = b(largo)/A(largo,largo);
for i = largo-1:-1:1
    suma = x(i+1:largo)'*A(i,i+1:largo)';
    x(i) = (b(i)-suma)/A(i,i);
end
end