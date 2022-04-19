function[x,inst] = directoInst(L,U,b)
%Ax = b -> LUx = b
%Se utiliza L y U obtenidas con el metodo de factorización crout
%L es triangular inferior por eso se utiliza sustitucion regresiva
[z,inst1] = sustitucionRegresivaInst(L,b);
%U es triangular superior por eso se utiliza sustitucion progresiva
[x,inst2] = sustitucionProgresivaInst(U,z);
inst = inst1 +inst2;
end