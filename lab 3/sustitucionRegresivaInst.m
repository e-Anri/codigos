function[x,inst] = sustitucionRegresivaInst(A,b)
inst = 0;
%Se comprueban las dimenciones, debe ser cuadrado A
[m,n] = size(A);
largo = length(b);
inst = inst + 5;
if(n ~= m)|(largo ~= m)
    error('Las dimensiones no son válidas')
    inst = inst + 3;
    %Posiblemente haya que añadir un else
end
x = zeros(largo,1);
x(largo) = b(largo)/A(largo,largo);
inst = inst + 6;
for i = largo-1:-1:1
    suma = x(i+1:largo)'*A(i,i+1:largo)';
    inst = inst + 1 + (largo-i-1)^2;
    x(i) = (b(i)-suma)/A(i,i);
    inst = inst + 3;
end
end