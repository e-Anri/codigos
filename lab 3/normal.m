function[x] = normal(Q,R,b)
%Ax = b -> QRx = b -> Rx = Q'b -> Rx =  z
%Q es una matriz ortogonal y R es una triangular superior
z = Q' * b;
x = sustitucionProgresiva(R,z);

