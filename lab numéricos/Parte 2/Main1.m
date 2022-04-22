
% Gestor opción 1 menu

function valor = Main1()
%Se cargan las matrices de 289 x 289
A289 = load('./datos/A289.dat');
b289 = load('./datos/b289.dat');

% se define la tolerancia e-10
tol = 0.0000000001;
n = 289;
x0 = ones(length(b289),1);

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
    [operacionesGJ_289, solucionesGJ_289, errorGJ_289] = GaussJacobi_E(A289, b289, n);
    % Doolittle
    [operacionesDL_289, solucionesDL_289, errorDL_289] = Doolittle_E(A289, b289);
    % LSQR
    [operacionesLSQR_289, solucionLSQR_289, errorLSQR_289] = LSQR_E(A289, b289, tol);
    % Cholesky
    [solucionesCL_289, errorCL_289, operacionesCL_289] = Cholesky_E(A289, b289);
    % Gauss-Seidel
    [solucionesSeidel_289, errorSeidel_289, erroresSeidel_289] = GaussSeidel_E(A289, b289, x0, tol, 71);
    % HouseHolder
    [Q_289, R_289, solucionHH_289, errorHH_289] = HouseHolder_E(A289, b289);
    % LSQR DISPERSO
    [operacionesLSQRD_289, solucionLSQRD_289, errorLSQRD_289] = LSQR_D_E(A289, b289, tol);



% Métodos aplicados en matriz 289 x 289 
% ------ [CÁLCULO DE TIEMPO] ------

    % Gauss-Jacobi
    [solucionesGJ_289, tiempoGJ_289] = GaussJacobi_T(A289, b289, n);
    % Doolittle
    [solucionesDL_289, tiempoDL_289] = Doolittle_T(A289, b289);
    % LSQR
    [solucionLSQR_289, tiempoLSQR_289] = LSQR_T(A289, b289, tol);
    % Cholesky
    [solucionesCL_289, tiempoCL_289] = Cholesky_T(A289, b289);
    % Gauss-Seidel
    [solucionesSeidel_289, operacionesSeidel_289, tiempoSeidel_289] = GaussSeidel_T(A289,b289,x0, tol, 71);
    % HouseHolder
    [Q_289, R_289, solucionHH_289, tiempoHH_289] = HouseHolder_T(A289, b289);
    % LSQR DISPERSO
    [solucionLSQRD_289, tiempoLSQRD_289] = LSQR_D_T(A289, b289, tol);



% Errores matriz 289 x 289
vectorErrores_289 = [errorGJ_289, errorDL_289, errorLSQR_289, errorCL_289, errorSeidel_289, errorLSQRD_289];
vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'LSQR Disperso'});
figure
hold on
bar(vectorNombre, vectorErrores_289)
title('Error de cada método para matriz 289 x 289')
ylabel('Error') 
xlabel('Nombre del método')
hold off



% Costo espacial matriz 289 x 289
[~, ~, operacionesHH_289] = HouseHolderInst(A289);
vectorOperaciones_289 = [operacionesGJ_289, operacionesDL_289, operacionesLSQR_289, operacionesCL_289, operacionesSeidel_289, operacionesHH_289, operacionesLSQRD_289];


%Costo Temporal matriz 289 x 289
vectorTiempos_289 = ['Gauss Jacobi - '+string(tiempoGJ_289)+'[s]' 'LU - '+ string(tiempoDL_289)+'[s]' 'LSQR - '+string(tiempoLSQR_289)+'[s]' 'Cholesky - ' + string(tiempoCL_289) + '[s]' 'Gauss-Seidel - '+ string(tiempoSeidel_289) + '[s]' 'HouseHolder - ' + string(tiempoHH_289) + '[s]' 'LSQR Disperso - ' + string(tiempoLSQRD_289)];
vectorTiempos_289 = categorical(vectorTiempos_289);
figure
hold on
bar(vectorTiempos_289,vectorOperaciones_289)
title('Costo espacial y temporal de cada método para matriz 289 x 289')
ylabel('Número de operaciones')
xlabel('Nombre del método y su costo temporal')
hold off


end









