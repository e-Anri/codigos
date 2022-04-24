
% Gestor opción 2 menu

function valor = Main2()
%Se cargan las matrices de 289 x 289
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




% Métodos aplicados en matriz 1089 x 1089 
% ------ [CÁLCULO DE ERROR] ------

    % Gauss-Jacobi
    [operacionesGJ_1089, solucionesGJ_1089, errorGJ_1089] = GaussJacobi_E(A1089, b1089, n, 750);
    % Doolittle
    [operacionesDL_1089, solucionesDL_1089, errorDL_1089] = Doolittle_E(A1089, b1089);
    % LSQR
    [operacionesLSQR_1089, solucionLSQR_1089, errorLSQR_1089] = LSQR_E(A1089, b1089, tol);
    % Cholesky
    [solucionesCL_1089, errorCL_1089, operacionesCL_1089] = Cholesky_E(A1089, b1089);
    % Gauss-Seidel
    [solucionesSeidel_1089, errorSeidel_1089, erroresSeidel_1089] = GaussSeidel_E(A1089, b1089, x0, tol, 200);

    %QR 
    [Q, R, tiempoQR_1089, operacionesQR1_1089] = Givens(A1089);

    tic
    z = Q'*b1089;
    [X_QR, operacionesQR2_1089] = sustitucionRegresiva(R, z);
    errorQR_1089 = norm(Q*R - A1089);
    errorQR_1089 = errorQR_1089 + norm(A1089*X_QR-b1089);
    operacionesQR_1089 = operacionesQR1_1089 + operacionesQR2_1089;

    % LSQR DISPERSO
    [operacionesLSQRD_1089, solucionLSQRD_1089, errorLSQRD_1089] = LSQR_D_E(A1089, b1089, tol);



% Métodos aplicados en matriz 1089 x 1089 
% ------ [CÁLCULO DE TIEMPO] ------

    % Gauss-Jacobi
    [solucionesGJ_1089, tiempoGJ_1089] = GaussJacobi_T(A1089, b1089, n, 750);
    % Doolittle
    [solucionesDL_1089, tiempoDL_1089] = Doolittle_T(A1089, b1089);
    % LSQR
    [solucionLSQR_1089, tiempoLSQR_1089] = LSQR_T(A1089, b1089, tol);
    % Cholesky
    [solucionesCL_1089, tiempoCL_1089] = Cholesky_T(A1089, b1089);
    % Gauss-Seidel
    [solucionesSeidel_1089, operacionesSeidel_1089, tiempoSeidel_1089] = GaussSeidel_T(A1089,b1089,x0,200);
    % LSQR DISPERSO
    [solucionLSQRD_1089, tiempoLSQRD_1089] = LSQR_D_T(A1089, b1089, tol);



% Errores matriz 1089 x 1089
vectorErrores_1089 = [errorGJ_1089, errorDL_1089, errorLSQR_1089, errorCL_1089, errorSeidel_1089, errorLSQRD_1089, errorQR_1089];
vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'LSQR Disperso', 'Givens'});
figure
hold on
bar(vectorNombre, vectorErrores_1089)
title('Error de cada método para matriz 1089 x 1089')
ylabel('Error') 
xlabel('Nombre del método')
hold off



% Costo espacial matriz 1089 x 1089
vectorOperaciones_1089 = [operacionesGJ_1089, operacionesDL_1089, operacionesLSQR_1089, operacionesCL_1089, operacionesSeidel_1089, operacionesQR_1089, operacionesLSQRD_1089];


%Costo Temporal matriz 1089 x 1089
vectorTiempos_1089 = ['Gauss Jacobi - '+string(tiempoGJ_1089)+'[s]' 'Doolittle - '+ string(tiempoDL_1089)+'[s]' 'LSQR - '+string(tiempoLSQR_1089)+'[s]' 'Cholesky - ' + string(tiempoCL_1089) + '[s]' 'Gauss-Seidel - '+ string(tiempoSeidel_1089) + '[s]' 'Givens - ' + string(tiempoQR_1089) + '[s]' 'LSQR Disperso - ' + string(tiempoLSQRD_1089)];
vectorTiempos_1089 = categorical(vectorTiempos_1089);
figure
hold on
bar(vectorTiempos_1089,vectorOperaciones_1089)
title('Costo espacial y temporal de cada método para matriz 1089 x 1089')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off
end
