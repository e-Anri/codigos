% Gestor opción 3 menu

function valor = Main3()
%Se cargan las matrices de 4225 x 4225
A4225 = load('./datos/A4225.dat');
b4225 = load('./datos/b4225.dat');

% se define la tolerancia e-10
tol = 0.0000000001;
n = 4225;
x0 = ones(length(b4225),1);

% Aquí corresponde hacer el análisis de
% cuál método es más viable para resolver la matriz 
% de entrada

% grado de dispersión
%disp = Dispersion(A4225,n);


% es simétrica?
%simetria = Simetria(A4225);


valor = 1;

% si la matriz es simétrica se puede usar cholesky
%if simetria == 1 

    % sino se usará HouseHolder (QR)
%else 




% Métodos aplicados en matriz 4225 x 4225
% ------ [CÁLCULO DE ERROR] ------

    % Gauss-Jacobi
    [operacionesGJ_4225, solucionesGJ_4225, errorGJ_4225] = GaussJacobi_E(A4225, b4225, n, 2600);
    % Doolittle
    [operacionesDL_4225, solucionesDL_4225, errorDL_4225] = Doolittle_E(A4225, b4225);
    % LSQR
    [operacionesLSQR_4225, solucionLSQR_4225, errorLSQR_4225] = LSQR_E(A4225, b4225, tol);
    % Cholesky
    [solucionesCL_4225, errorCL_4225, operacionesCL_4225] = Cholesky_E(A4225, b4225);
    % Gauss-Seidel
    [solucionesSeidel_4225, errorSeidel_4225, erroresSeidel_4225] = GaussSeidel_E(A4225, b4225, x0, tol, 550);

    %QR 
    [Q, R, tiempoQR_4225, operacionesQR1_4225] = Givens(A4225);

    tic
    z = Q'*b4225;
    [X_QR, operacionesQR2_4225] = sustitucionRegresiva(R, z);
    errorQR_4225 = norm(Q*R - A4225);
    errorQR_4225 = errorQR_4225 + norm(A4225*X_QR-b4225);
    operacionesQR_4225 = operacionesQR1_4225 + operacionesQR2_4225;

    % LSQR DISPERSO
    [operacionesLSQRD_4225, solucionLSQRD_4225, errorLSQRD_4225] = LSQR_D_E(A4225, b4225, tol);



% Métodos aplicados en matriz 4225 x 4225
% ------ [CÁLCULO DE TIEMPO] ------

    % Gauss-Jacobi
    [solucionesGJ_4225, tiempoGJ_4225] = GaussJacobi_T(A4225, b4225, n, 2600);
    % Doolittle
    [solucionesDL_4225, tiempoDL_4225] = Doolittle_T(A4225, b4225);
    % LSQR
    [solucionLSQR_4225, tiempoLSQR_4225] = LSQR_T(A4225, b4225, tol);
    % Cholesky
    [solucionesCL_4225, tiempoCL_4225] = Cholesky_T(A4225, b4225);
    % Gauss-Seidel
    [solucionesSeidel_4225, operacionesSeidel_4225, tiempoSeidel_4225] = GaussSeidel_T(A4225,b4225,x0,550);
    % LSQR DISPERSO
    [solucionLSQRD_4225, tiempoLSQRD_4225] = LSQR_D_T(A4225, b4225, tol);



% Errores matriz 4225 x 4225
vectorErrores_4225 = [errorGJ_4225, errorDL_4225, errorLSQR_4225, errorCL_4225, errorSeidel_4225, errorLSQRD_4225, errorQR_4225];
vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'LSQR Disperso', 'Givens'});
figure
hold on
bar(vectorNombre, vectorErrores_4225)
title('Error de cada método para matriz 4225 x 4225')
ylabel('Error') 
xlabel('Nombre del método')
hold off



% Costo espacial matriz 4225 x 4225
vectorOperaciones_4225 = [operacionesGJ_4225, operacionesDL_4225, operacionesLSQR_4225, operacionesCL_4225, operacionesSeidel_4225, operacionesQR_4225, operacionesLSQRD_4225];


%Costo Temporal matriz 4225 x 4225
vectorTiempos_4225 = ['Gauss Jacobi - '+string(tiempoGJ_4225)+'[s]' 'Doolittle - '+ string(tiempoDL_4225)+'[s]' 'LSQR - '+string(tiempoLSQR_4225)+'[s]' 'Cholesky - ' + string(tiempoCL_4225) + '[s]' 'Gauss-Seidel - '+ string(tiempoSeidel_4225) + '[s]' 'Givens - ' + string(tiempoQR_4225) + '[s]' 'LSQR Disperso - ' + string(tiempoLSQRD_4225)];
vectorTiempos_4225 = categorical(vectorTiempos_4225);
figure
hold on
bar(vectorTiempos_4225,vectorOperaciones_4225)
title('Costo espacial y temporal de cada método para matriz 4225 x 4225')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off
end