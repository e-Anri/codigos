function [iteraciones, soluciones, error, operaciones] = Doolittle_E(A,b)
    iteraciones = 0;
    tam = length(A);
    columnas = size(A,1);
    L = zeros(columnas);
    U = zeros(columnas);
    L(1, 1) = 1;
    U(1, 1) = A(1, 1);
    operaciones = 7;
    for i = 2:columnas
        iteraciones = iteraciones + 1;
        L(i, i) = 1;
        U(1, i) = A(1, i);
        L(i, 1) = A(i, 1)/U(1, 1);
        operaciones = operaciones + 4;
    end
    for j = 2:columnas
        iteraciones = iteraciones + 1;
        operaciones = operaciones + 1;
        for i = j:columnas
            iteraciones = iteraciones + 1;
            sumaL = 0;
            sumaU = 0;
            operaciones = operaciones + 3;
            for k = 1:j-1
                iteraciones = iteraciones + 1;
                operaciones = operaciones + 1;
                if (U(k, i) ~= 0) && (L(j, k) ~= 0)
                    sumaL = sumaL + U(k, i)*L(j, k);
                    operaciones = operaciones + 1;
                    %Operaciones: una multiplicación y una suma
                end
                if(U(k, j) ~= 0) && (L(i, k) ~= 0) && (i ~= j)
                    sumaU = sumaU + U(k, j)*L(i, k);
                    operaciones = operaciones + 1;
                    %Operaciones: una multi y una suma
                end
            end
            U(j, i) = A(j, i) - sumaL;
            operaciones = operaciones + 1;
            if (j < columnas) && (i > j)
                L(i, j) = (A(i, j) - sumaU)/U(j, j);
                operaciones = operaciones + 1;
            end
        end
    end
    %Los sistemas a resolver serán:
    %L*y = b
    %U*x = y
    %Se procede a realizar una sistución progresiva
    % para obtener y
    y = zeros(tam,1);
    y(1) = b(1)/L(1,1);
    operaciones = operaciones + 2;
    for k=2:1:tam
        suma = y(1:k-1)'*L(k,1:k-1)';
        y(k) = (b(k) - suma)/L(k,k);
        operaciones = operaciones + 2;
    end
    
    %Se hace una sustitución regresiva para obtener x 
    x = zeros(tam,1);
    x(tam) = y(tam)/U(tam,tam);
    operaciones = operaciones + 2;
    for k=tam-1:-1:1
        suma = x(k+1:tam)'*U(k,k+1:tam)';
        x(k) = (y(k) - suma)/U(k,k);
        operaciones = operaciones + 2;
    end
    soluciones = x;
    %Se obtiene el error 
    error = abs(A*x - b);
    error = norm(error);

    operaciones = operaciones + 3;
end