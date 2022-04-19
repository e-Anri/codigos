function[x,inst] = normalInst(Q,R,b)
inst = 0;
%Ax = b -> QRx = b -> Rx = Q'b -> Rx =  z
%Q es una matriz ortogonal y R es una triangular superior
z = Q' * b;
inst = inst + 4;
[x,inst1] = sustitucionProgresivaInst(R,z);
inst = inst + inst1;
