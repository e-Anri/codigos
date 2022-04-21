function[x,inst] = sustitucionProgresivaInst(A,b)
inst = 0;
%Se comprueban las dimenciones, debe ser cuadrado A
[m,n] = size(A);
largo = length(b);
inst = inst + 5;
if(n ~= m)|(largo ~= m)
    error('Las dimensiones no son válidas')
    inst = inst + 2;
    %Posiblemente haya que añadir un else
end
x = zeros(largo,1);
inst = inst + 2;
x(1) = b(1)/A(1,1);
inst = inst + 4;
for i = 2:1:largo
    suma = x(1:i-1)'*A(i,1:i-1)';
    inst = inst + 1 + (i-1)*(i-1);
    x(i) = (b(i)-suma)/A(i,i);
    inst = inst + 3;
end
end