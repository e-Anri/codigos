
% Gestor opción 2 menu

function valor = Main2()
%Se cargan las matrices de 1089 x 1089
A1089 = load('./datos/A1089.dat');
b1089 = load('./datos/b1089.dat');

% se define la tolerancia e-10
tol = 0.0000000001;
n = 1089;

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




% % Métodos aplicados en matriz 1089 x 1089 
% % ------ [CÁLCULO DE ERROR] ------
% 
%     % Gauss-Jacobi
%     [solucionesGJ_1089, errorGJ_1089] = GaussJacobi_E(A1089, b1089, n, 750);
%     % Doolittle
%     [iteracionesDL_1089, solucionesDL_1089, errorDL_1089] = Doolittle_E(A1089, b1089);
%     % LSQR
%     [solucionLSQR_1089, errorLSQR_1089] = LSQR_E(A1089, b1089, tol);
%     % Cholesky
%     [solucionesCL_1089, errorCL_1089, operacionesCL_1089] = Cholesky_E(A1089, b1089);
%     % Gauss-Seidel
%     [solucionesSeidel_1089, errorSeidel_1089] = GaussSeidel_E(A1089, b1089, n, 352);
%     % GramSchmidth
%     [solucionGS_1089, errorGS_1089] = GramSchmidth_E(A1089,b1089);
%     % LSQR DISPERSO
%     [solucionLSQRD_1089, errorLSQRD_1089] = LSQR_D_E(A1089, b1089, tol);



% % Métodos aplicados en matriz 1089 x 1089 
% % ------ [CÁLCULO DE TIEMPO] ------
% 
%     % Gauss-Jacobi
%     [solucionesGJ_1089, tiempoGJ_1089] = GaussJacobi_T(A1089, b1089, n, 750);
%     % Doolittle
%     [solucionesDL_1089, tiempoDL_1089] = Doolittle_T(A1089, b1089);
%     % LSQR
%     [solucionLSQR_1089, tiempoLSQR_1089] = LSQR_T(A1089, b1089, tol);
%     % Cholesky
%     [solucionesCL_1089, tiempoCL_1089] = Cholesky_T(A1089, b1089);
%     % Gauss-Seidel
%     [solucionesSeidel_1089, tiempoSeidel_1089] = GaussSeidel_T(A1089, b1089, n, 352);
%     % GramSchmidth
%     [solucionGS_1089, tiempoGS_1089] = GramSchmidth_T(A1089, b1089);
%     % LSQR DISPERSO
%     [solucionLSQRD_1089, tiempoLSQRD_1089] = LSQR_D_T(A1089, b1089, tol);



% % Errores matriz 1089 x 1089
% vectorErrores_1089 = [errorGJ_1089, errorDL_1089, errorLSQR_1089, errorCL_1089, errorSeidel_1089, errorLSQRD_1089, errorGS_1089];
% vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'LSQR Disperso', 'GramSchmidth'});
% figure
% hold on
% bar(vectorNombre, vectorErrores_1089)
% title('Error de cada método para matriz 1089 x 1089')
% ylabel('Error') 
% xlabel('Nombre del método')
% hold off
% 
% 
% %Costo Temporal
% tiempos_1089 = [tiempoGJ_1089, tiempoDL_1089, tiempoLSQR_1089, tiempoCL_1089, tiempoSeidel_1089, tiempoLSQRD_1089, tiempoGS_1089];
% figure
% hold on
% bar(vectorNombre,tiempos_1089)
% title('Costo temporal de cada método para matriz 1089 x 1089')
% ylabel('Tiempo')
% xlabel('Nombre del método')
% hold off


end
