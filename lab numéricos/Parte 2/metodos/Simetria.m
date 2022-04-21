function [ans] = Simetria(A)
% verifica si la matriz es apta para usar Cholesky o no
    [~, n] = size(A);
    s = issymmetric(A);
    ans = 1;
    if s == 0
        fprintf('\n\Algoritmo finalizado.\n');
        fprintf('\nMatriz no simétrica.\n');
        and = 0;
    end
    % Comprobación de La matriz singular/mal condicionada
    r = rank(A);
    if r < n
        fprintf('\n\Algoritmo finalizado.\n');
        fprintf('\nMatriz con rango deficiente. La descomposición cholesky completa no es posible.\n');
        ans = 0;
    end
    
end