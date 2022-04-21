clear

%Se cargan las matrices de 289 x 289
A289 = load('./datos/A289.dat');
b289 = load('./datos/b289.dat');
%Se cargan las matrices de 1089 x 1089
A1089 = load('./datos/A1089.dat');
b1089 = load('./datos/b1089.dat');
%Se cargan las matrices de 4225 x 4225
A4225 = load('./datos/A4225.dat');
b4225 = load('./datos/b4225.dat');

% se define la tolerancia e-10
tol = 0.0000000001;
n = 289;
x0 = ones(length(b289),1);


% Métodos aplicados en matriz 289 x 289 
% ------ [CÁLCULO DE ERROR] ------

    % Gauss-Jacobi
    [iteracionesGJ_289, solucionesGJ_289, errorGJ_289] = GaussJacobi_E(A289, b289, n, tol);
    % Doolittle
    [iteracionesDL_289, solucionesDL_289, errorDL_289] = Doolittle_E(A289, b289);
    % LSQR
    [solucionLSQR_289, errorLSQR_289] = LSQR_E(A289, b289, tol);
    % Cholesky
    [solucionesCL_289, errorCL_289, operacionesCL_289] = Cholesky_E(A289, b289);
    % Gauss-Seidel
    [solucionesSeidel_289, errorSeidel_289, erroresSeidel_289, operacionesSeidel_289] = GaussSeidel_E(A289,b289,x0,tol,100);
    % HouseHolder
    [Q_289, R_289, solucionHH_289, solucionesHH_289, errorHH_289, erroresHH_289] = HouseHolder_E(A289, b289);



% Métodos aplicados en matriz 1089 x 1089 
% ------ [CÁLCULO DE ERROR] ------

    % Gauss-Jacobi
    [iteracionesGJ_1089, solucionesGJ_1089, errorGJ_1089] = GaussJacobi_E(A1089, b1089, n, tol);
    % Doolittle
    [iteracionesDL_1089, solucionesDL_1089, errorDL_1089] = Doolittle_E(A1089, b1089);
    % LSQR
    [solucionLSQR_1089, errorLSQR_1089] = LSQR_E(A1089,b1089, tol);
    % Cholesky
    [solucionesCL_1089, errorCL_1089, operacionesCL_11089] = Cholesky_E(A1089, b1089);
    % Gauss-Seidel
    [solucionesSeidel_1089, errorSeidel_1089, erroresSeidel_1089, operacionesSeidel_1089] = GaussSeidel_E(A1089,b1089,x0,tol,100);
    % HouseHolder
    [Q_1089, R_1089, solucionHH_1089, solucionesHH_1089, errorHH_1089, erroresHH_1089] = HouseHolder_E(A1089, b1089);



% Métodos aplicados en matriz 4225 x 4225
% ------ [CÁLCULO DE ERROR] ------

    % Gauss-Jacobi
    [iteracionesGJ_4225, solucionesGJ_4225, errorGJ_4225] = GaussJacobi_E(A4225, b4225, n, tol);
    % Doolittle
    [iteracionesDL_4225, solucionesDL_4225, errorDL_4225] = Doolittle_E(A4225, b4225);
    % LSQR
    [solucionLSQR_4225, errorLSQR_4225] = LSQR_E(A4225, b4225, tol);
    % Cholesky
    [solucionesCL_4225, errorCL_4225, operacionesCL_4225] = Cholesky_E(A4225, b4225);
    % Gauss-Seidel
    [solucionesSeidel_4225, errorSeidel_4225, erroresSeidel_4225, operacionesSeidel_4225] = GaussSeidel_E(A4225, b4225, x0, tol, 100);
    % HouseHolder
    [Q_4225, R_4225, solucionHH_4225, solucionesHH_4225, errorHH_4225, erroresHH_4225] = HouseHolder_E(A4225, b4225);
    




% Métodos aplicados en matriz 289 x 289 
% ------ [CÁLCULO DE TIEMPO] ------

    % Gauss-Jacobi
    [solucionesGJ_289, tiempoGJ_289] = GaussJacobi_T(A289, b289, n, tol);
    % Doolittle
    [solucionesDL_289, tiempoDL_289] = Doolittle_T(A289, b289);
    % LSQR
    [solucionLSQR_289, tiempoLSQR_289] = LSQR_T(A289, b289, tol);
    % Cholesky
    [solucionesCL_289, tiempoCL_289] = Cholesky_T(A289, b289);
    % Gauss-Seidel
    [solucionesSeidel_289, tiempoSeidel_289] = GaussSeidel_T(A289,b289,x0);
    % HouseHolder
    [Q_289, R_289, solucionHH_289, solucionesHH_289, tiempoHH_289] = HouseHolder_T(A289, b289);



% Métodos aplicados en matriz 1089 x 289 
% ------ [CÁLCULO DE TIEMPO] ------

    % Gauss-Jacobi
    [solucionesGJ_1089, tiempoGJ_1089] = GaussJacobi_T(A1089, b1089, n, tol);
    % Doolittle
    [solucionesDL_1089, tiempoDL_1089] = Doolittle_T(A1089, b1089);
    % LSQR
    [solucionLSQR_1089, tiempoLSQR_1089] = LSQR_T(A1089, b1089, tol);
    % Cholesky
    [solucionesCL_1089, tiempoCL_1089] = Cholesky_T(A1089, b1089);
    % Gauss-Seidel
    [solucionesSeidel_1089, tiempoSeidel_1089] = GaussSeidel_T(A1089,b1089,x0);
    % HouseHolder
    [Q_1089, R_1089, solucionHH_1089, solucionesHH_1089, tiempoHH_1089] = HouseHolder_T(A1089, b1089);




% Métodos aplicados en matriz 4225 x 4225
% ------ [CÁLCULO DE TIEMPO] ------

    % Gauss-Jacobi
    [solucionesGJ_4225, tiempoGJ_4225] = GaussJacobi_T(A4225, b4225, n, tol);
    % Doolittle
    [solucionesDL_4225, tiempoDL_4225] = Doolittle_T(A4225, b4225);
    % LSQR
    [solucionLSQR_4225, tiempoLSQR_4225] = LSQR_T(A4225, b4225, tol);
    % Cholesky
    [solucionesCL_4225, tiempoCL_4225] = Cholesky_T(A4225, b4225);
    % Gauss-Seidel
    [solucionesSeidel_4225, tiempoSeidel_4225] = GaussSeidel_T(A4225,b4225,x0);
    % HouseHolder
    [Q_4225, R_4225, solucionHH_4225, solucionesHH_4225, tiempoHH_4225] = HouseHolder_T(A4225, b4225);




% ---------- [GRÁFICOS] ----------

% Errores matriz 289 x 289
vectorErrores_289 = [errorGJ_289 errorDL_289 errorLSQR_289 errorCL_289 errorSeidel_289];
vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'HouseHolder'});
figure
hold on
bar(vectorNombre,vectorErrores_289)
title('Error de cada método para matriz 289 x 289')
ylabel('Error') 
xlabel('Nombre del método')
hold off


% Errores matriz 1089 x 1089
vectorErrores_1089 = [errorGJ_1089 errorDL_1089 errorLSQR_1089 errorCL_1089 errorSeidel_1089];
vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'HouseHolder'});
figure
hold on
bar(vectorNombre,vectorErrores_1089)
title('Error de cada método para matriz 1089 x 1089')
ylabel('Error') 
xlabel('Nombre del método')
hold off


% Errores matriz 4225 x 4225
vectorErrores_4225 = [errorGJ_4225 errorDL_4225 errorLSQR_4225 errorCL_4225 errorSeidel_4225];
vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'HouseHolder'});
figure
hold on
bar(vectorNombre,vectorErrores_4225)
title('Error de cada método para matriz 4225 x 4225')
ylabel('Error') 
xlabel('Nombre del método')
hold off





% Costo espacial matriz 289 x 289
[~, ~, operacionesHH_289] = HouseHolderInst(A289);
vectorOperaciones_289 = [operacionesGJ_289 operacionesDL_289 operacionesLSQR_289 operacionesCL_289 operacionesSeidel_289 operacionesHH_289];


%Costo espacial matriz 1089 x 1089
[~, ~, operacionesHH_1089] = HouseHolderInst(A1089);
vectorOperaciones_1089 = [operacionesGJ_1089 operacionesDL_1089 operacionesLSQR_1089 operacionesCL_1089 operacionesSeidel_1089 operacionesHH_1089];


%Costo espacial matriz 4225 x 4225
[Q, R, operacionesHH_4225] = HouseHolderInst(A4225);
vectorOperaciones_4225 = [operacionesGJ_4225 operacionesDL_4225 operacionesLSQR_4225 operacionesCL_4225 operacionesSeidel_4225 operacionesHH_4225];





%Costo Temporal matriz 289 x 289
vectorTiempos_289 = ['Gauss Jacobi - '+string(tiempoGJ_289)+'[s]' 'LU - '+ string(tiempoDL_289)+'[s]' 'LSQR - '+string(tiempoLSQR_289)+'[s]' 'Cholesky - ' + string(tiempoCL_289) + '[s]' 'Gauss-Seidel - '+ string(tiempoSeidel_289) + '[s]' 'HouseHolder - ' + string(tiempoHH_289)];
vectorTiempos_289 = categorical(vectorTiempos_289);
figure
hold on
bar(vectorTiempos_289,vectorOperaciones_289)
title('Costo espacial y temporal de cada método para matriz 289 x 289')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off


%Costo Temporal matriz 1089 x 1089
vectorTiempos_1089 = ['Gauss Jacobi - '+string(tiempoGJ_1089)+'[s]' 'LU - '+ string(tiempoDL_1089)+'[s]' 'LSQR - '+string(tiempoLSQR_1089)+'[s]' 'Cholesky - ' + string(tiempoCL_1089) + '[s]' 'Gauss-Seidel - '+ string(tiempoSeidel_1089) + '[s]' 'HouseHolder - ' + string(tiempoHH_1089)];
vectorTiempos_1089 = categorical(vectorTiempos_1089);
figure
hold on
bar(vectorTiempos_1089,vectorOperaciones_1089)
title('Costo espacial y temporal de cada método para matriz 1089 x 1089')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off


%Costo Temporal matriz 4225 x 4225
vectorTiempos_4225 = ['Gauss Jacobi - '+string(tiempoGJ_4225)+'[s]' 'LU - '+ string(tiempoDL_4225)+'[s]' 'LSQR - '+string(tiempoLSQR_4225)+'[s]' 'Cholesky - ' + string(tiempoCL_4225) + '[s]' 'Gauss-Seidel - '+ string(tiempoSeidel_4225) + '[s]' 'HouseHolder - ' + string(tiempoHH_4225)];
vectorTiempos_4225 = categorical(vectorTiempos_4225);
figure
hold on
bar(vectorTiempos_4225,vectorOperaciones_4225)
title('Costo espacial y temporal de cada método para matriz 4225 x 4225')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off
