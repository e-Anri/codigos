function[L,U, inst] = croutInst(A)
inst = 0;
if nargin<1
    inst = inst + 2;
    error('No ha introducido la matriz de entrada')
else
    [colas,filas] = size(A);
    inst = inst + 1;
    if colas ~= filas
        inst = inst + 2;
        error('La matriz no es cuadrada')
    else
        L = zeros(colas);
        U = zeros(colas);
        U(1,1) = 1;
        L(1,1) = A(1,1);
        inst = inst + 4;
        for i = 2:colas
            U(i,i) = 1;
            L(i,1) = A(i,1);
            U(1,i) = A(1,i)/L(1,1);
            inst = inst + 4;
        end
        for j=2:colas
            for i=j:colas
                sumaL=0;
                sumaU=0;
                inst = inst + 2;
                for k=1:j-1
                    if(L(i,k)~=0)&(U(k,j)~=0)
                        sumaL=sumaL+L(j,k)*U(k,j);
                        inst = inst + 2;
                    end
                    if(L(j,k)~=0)&(U(k,i)~=0)
                        sumaU=sumaU+L(j,k)*U(k,i);
                        inst = inst + 2;
                    end
                end
                L(i,j) = A(i,j)-sumaL;
                inst = inst + 1;
                if(j<colas)&(i>j)
                    U(i,j)=(A(j,i)-sumaU)/L(j,j);
                    inst = inst + 2;
                end
            end
        end
    end
end 
end