% Gestor opción 3 menu

function valor = Main3()
%Se cargan las matrices de 4225 x 4225
A4225 = load('./datos/A4225.dat');
b4225 = load('./datos/b4225.dat');

% se define la tolerancia e-10
tol = 0.0000000001;
n = 4225;

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



% 
% % Métodos aplicados en matriz 4225 x 4225
% % ------ [CÁLCULO DE ERROR] ------
% 
%     % Gauss-Jacobi
%     [solucionesGJ_4225, errorGJ_4225] = GaussJacobi_E(A4225, b4225, n, 2600);
%     % Doolittle
%     [iteracionesDL_4225, solucionesDL_4225, errorDL_4225] = Doolittle_E(A4225, b4225);
%     % LSQR
%     [solucionLSQR_4225, errorLSQR_4225] = LSQR_E(A4225, b4225, tol);
%     % Cholesky
%     [solucionesCL_4225, errorCL_4225, operacionesCL_4225] = Cholesky_E(A4225, b4225);
%     % Gauss-Seidel
%     [solucionesSeidel_4225, errorSeidel_4225] = GaussSeidel_E(A4225, b4225, n, 1360);
%     % GramSchmidth
%     [solucionGS_4225, errorGS_4225] = GramSchmidth_E(A4225,b4225);
%     % LSQR DISPERSO
%     [solucionLSQRD_4225, errorLSQRD_4225] = LSQR_D_E(A4225, b4225, tol);



% % Métodos aplicados en matriz 1089 x 1089 
% % ------ [CÁLCULO DE TIEMPO] ------
% 
%     % Gauss-Jacobi
%     [solucionesGJ_4225, tiempoGJ_4225] = GaussJacobi_T(A4225, b4225, n, 2600);
%     % Doolittle
%     [solucionesDL_4225, tiempoDL_4225] = Doolittle_T(A4225, b4225);
%     % LSQR
%     [solucionLSQR_4225, tiempoLSQR_4225] = LSQR_T(A4225, b4225, tol);
%     % Cholesky
%     [solucionesCL_4225, tiempoCL_4225] = Cholesky_T(A4225, b4225);
%     % Gauss-Seidel
%     [solucionesSeidel_4225, tiempoSeidel_4225] = GaussSeidel_T(A4225, b4225, n, 1360);
%     % GramSchmidth
%     [solucionGS_4225, tiempoGS_4225] = GramSchmidth_T(A4225, b4225);
%     % LSQR DISPERSO
%     [solucionLSQRD_4225, tiempoLSQRD_4225] = LSQR_D_T(A4225, b4225, tol);



% % Errores matriz 4225 x 4225
% vectorErrores_4225 = [errorGJ_4225, errorDL_4225, errorLSQR_4225, errorCL_4225, errorSeidel_4225, errorLSQRD_4225, errorGS_4225];
% vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'LSQR Disperso', 'GramSchmidth'});
% figure
% hold on
% bar(vectorNombre, vectorErrores_4225)
% title('Error de cada método para matriz 4225 x 4225')
% ylabel('Error') 
% xlabel('Nombre del método')
% hold off
% 
% 
% 
% %Costo Temporal
% tiempos_4225 = [tiempoGJ_4225, tiempoDL_4225, tiempoLSQR_4225, tiempoCL_4225, tiempoSeidel_4225, tiempoLSQRD_4225, tiempoGS_4225];
% figure
% hold on
% bar(vectorNombre,tiempos_4225)
% title('Costo temporal de cada método para matriz 4225 x 4225')
% ylabel('Tiempo')
% xlabel('Nombre del método')
% hold off
end