function[L,U] = crout(A)
if nargin<1
    error('No ha introducido la matriz de entrada')
else
    [colas,filas] = size(A);
    if colas ~= filas
        error('La matriz no es cuadrada')
    else
        L = zeros(colas);
        U = zeros(colas);
        U(1,1) = 1;
        L(1,1) = A(1,1);
        for i = 2:colas
            U(i,i) = 1;
            L(i,1) = A(i,1);
            U(1,i) = A(1,i)/L(1,1);
        end
        for j=2:colas
            for i=j:colas
                sumaL=0;
                sumaU=0;
                for k=1:j-1
                    if(L(i,k)~=0)&(U(k,j)~=0)
                        sumaL=sumaL+L(j,k)*U(k,j);
                    end
                    if(L(j,k)~=0)&(U(k,i)~=0)
                        sumaU=sumaU+L(j,k)*U(k,i);
                    end
                end
                L(i,j) = A(i,j)-sumaL;
                if(j<colas)&(i>j)
                    U(i,j)=(A(j,i)-sumaU)/L(j,j);
                end
            end
        end
    end
end 
end