function[soluciones, tiempo] = GaussJacobi_T(A, b, n, iters)
    iteraciones = 0;
    %Se inicializa la matriz de soluciones como una matriz de ceros
    x = zeros(1, n);
    %Se obtiene la matriz traspuesta
    x = x';
    %Se define una matriz auxiliar para ir almacenando las soluciones
    aux = x; 
    %Se construye una matriz aumentada.
    aumMat = [ A b ];
    [ filas, columnas ] = size(aumMat);
    %Se itera de acuerdo al maximo de iteraciones
    tic
    while iteraciones < iters
        %Se itera de acuerdo al tamaño de las filas de la matriz aumentada.
        for i = 1:filas
            %Se usa la fórmula del método de Jacobi.
            aux(i, 1) = (1/aumMat(i, i))*(aumMat(i, columnas) - sum(A(i, :)*x(:, 1)) + A(i, i)*x(i, 1));
        end 
        %Se guardan las soluciones de la matriz auxiliar en la matriz x.
        x(:, 1) = aux(:, 1);
        iteraciones = iteraciones + 1;
    end
    tiempo = toc;
    soluciones = x;
end