function[x] = directo(L,U,b)
%Ax = b -> LUx = b
%Se utiliza L y U obtenidas con el metodo de factorización crout
%L es triangular inferior por eso se utiliza sustitucion regresiva
z = sustitucionRegresiva(L,b);
%U es triangular superior por eso se utiliza sustitucion progresiva
x = sustitucionProgresiva(U,z);
end