function[x] = sustitucionProgresiva(A,b)
%Se comprueban las dimenciones, debe ser cuadrado A
[m,n] = size(A);
largo = length(b);
if(n ~= m)|(largo ~= m)
    error('Las dimensiones no son válidas')
    %Posiblemente haya que añadir un else
end
x = zeros(largo,1);
x( 1) = b( 1)/A( 1, 1);
for i = 2:1:largo
    suma = x(1:i-1)'*A(i,1:i-1)';
    x(i) = (b(i)-suma)/A(i,i);
end
end