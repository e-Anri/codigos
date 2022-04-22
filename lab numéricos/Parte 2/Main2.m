
% Gestor opción 2 menu

function valor = Main2()
%Se cargan las matrices de 1089 x 1089
A1089 = load('./datos/A1089.dat');
b1089 = load('./datos/b1089.dat');

% se define la tolerancia e-10
tol = 0.0000000001;
n = 1089;
x0 = ones(length(b1089),1);

% Aquí corresponde hacer el análisis de
% cuál método es más viable para resolver la matriz 
% de entrada

% grado de dispersión
%disp = Dispersion(A289,n);


% es simétrica?
%simetria = Simetria(A289);


valor = 1;

% si la matriz es simétrica se puede usar cholesky
%if simetria == 1 

    % sino se usará HouseHolder (QR)
%else 




% Métodos aplicados en matriz 289 x 289 
% ------ [CÁLCULO DE ERROR] ------

    % Gauss-Jacobi
    [operacionesGJ_1089, solucionesGJ_1089, errorGJ_1089] = GaussJacobi_E(A1089, b1089, n, 750);

end
