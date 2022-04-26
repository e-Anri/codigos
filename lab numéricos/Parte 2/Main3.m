% Gestor opción 3 menu

function [nombre, error, tiempo, operaciones] = Main3(efi, A4225, b4225, tol, n)

% Aquí corresponde hacer el análisis de
% cuál método es más viable para resolver la matriz 
% de entrada

% Gauss Jacobi
    if efi >= 0 && efi <= 14
        % error
        [solucionesGJ_4225, error, operaciones] = GaussJacobi_E(A4225, b4225, n, 2600);
        %tiempo
        [solucionesGJ_4225, tiempo] = GaussJacobi_T(A4225, b4225, n, 2600);
        nombre = categorical({'Gauss Jacobi'});
        return;
        
        % GramSchmidth
    elseif efi > 14 && efi <= 35
        % error
        [solucionGS_4225, error, operaciones] = GramSchmidth_E(A4225,b4225);
        % tiempo
        [solucionGS_4225, tiempo] = GramSchmidth_T(A4225, b4225);
        nombre = categorical({'GramSchmidth'});
        return;

        % Gauss Seidel
    elseif efi > 35 && efi <= 49
        % error
        [solucionesSeidel_4225, error, operaciones] = GaussSeidel_E(A4225, b4225, n, 1360);
        % tiempo
        [solucionesSeidel_4225, tiempo] = GaussSeidel_T(A4225, b4225, n, 1360);
        nombre = categorical({'Gauss Seidel'});
        return;

        % Cholesky
    elseif efi > 49 && efi <= 63
        % error
        [solucionesCL_4225, error, operaciones] = Cholesky_E(A4225, b4225);
        % tiempo
        [solucionesCL_4225, tiempo] = Cholesky_T(A4225, b4225);
        nombre = categorical({'Cholesky'});
        return;
    
        % Doolittle
    elseif efi > 63 && efi <= 77
        % error
        [iteracionesDL_4225, solucionesDL_4225, error, operaciones] = Doolittle_E(A4225, b4225);
        % tiempo
        [solucionesDL_4225, tiempo] = Doolittle_T(A4225, b4225);
        nombre = categorical({'Doolittle'});
        return;
    
        % LSQR
    elseif efi > 77 && efi <= 91
        % error
        [solucionLSQR_4225, error, operaciones] = LSQR_E(A4225, b4225, tol);
        % tiempo
        [solucionLSQR_4225, tiempo] = LSQR_T(A4225, b4225, tol);
        nombre = categorical({'LSQR'});
        return;
    
        % LSQR Disperso
    elseif efi > 91 && efi <= 100
        % error
        [solucionLSQRD_4225, error, operaciones] = LSQR_D_E(A4225, b4225, tol);
        % tiempo
        [solucionLSQRD_4225, tiempo] = LSQR_D_T(A4225, b4225, tol);
        nombre = categorical({'LSQR Disperso'});
        return;
    end





 
%  % Métodos aplicados en matriz 4225 x 4225
%  % ------ [CÁLCULO DE ERROR] ------
%  
%      % Gauss-Jacobi
%      [solucionesGJ_4225, errorGJ_4225, operacionesGJ_4225] = GaussJacobi_E(A4225, b4225, n, 2600);
%      % Doolittle
%      [iteracionesDL_4225, solucionesDL_4225, errorDL_4225, operacionesDL_4225] = Doolittle_E(A4225, b4225);
%      % LSQR
%      [solucionLSQR_4225, errorLSQR_4225, operacionesLSQR_4225] = LSQR_E(A4225, b4225, tol);
%      % Cholesky
%      [solucionesCL_4225, errorCL_4225, operacionesCL_4225] = Cholesky_E(A4225, b4225);
%      % Gauss-Seidel
%      [solucionesSeidel_4225, errorSeidel_4225, operacionesSeidel_4225] = GaussSeidel_E(A4225, b4225, n, 1360);
%      % GramSchmidth
%      [solucionGS_4225, errorGS_4225, operacionesGS_4225] = GramSchmidth_E(A4225,b4225);
%      % LSQR DISPERSO
%      [solucionLSQRD_4225, errorLSQRD_4225, operacionesLSQRD_4225] = LSQR_D_E(A4225, b4225, tol);



%  % Métodos aplicados en matriz 4225 x 4225
%  % ------ [CÁLCULO DE TIEMPO] ------
%  
%      % Gauss-Jacobi
%      [solucionesGJ_4225, tiempoGJ_4225] = GaussJacobi_T(A4225, b4225, n, 2600);
%      % Doolittle
%      [solucionesDL_4225, tiempoDL_4225] = Doolittle_T(A4225, b4225);
%      % LSQR
%      [solucionLSQR_4225, tiempoLSQR_4225] = LSQR_T(A4225, b4225, tol);
%      % Cholesky
%      [solucionesCL_4225, tiempoCL_4225] = Cholesky_T(A4225, b4225);
%      % Gauss-Seidel
%      [solucionesSeidel_4225, tiempoSeidel_4225] = GaussSeidel_T(A4225, b4225, n, 1360);
%      % GramSchmidth
%      [solucionGS_4225, tiempoGS_4225] = GramSchmidth_T(A4225, b4225);
%      % LSQR DISPERSO
%      [solucionLSQRD_4225, tiempoLSQRD_4225] = LSQR_D_T(A4225, b4225, tol);



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
 
 
 
% %Costo Temporal
% tiempos_4225 = [tiempoGJ_4225, tiempoDL_4225, tiempoLSQR_4225, tiempoCL_4225, tiempoSeidel_4225, tiempoLSQRD_4225, tiempoGS_4225];
% figure
% hold on
% bar(vectorNombre,tiempos_4225)
% title('Costo temporal de cada método para matriz 4225 x 4225')
% ylabel('Tiempo')
% xlabel('Nombre del método')
% hold off


%   % Costo espacial matriz 4225 x 4225
%   vectorOperaciones_4225 = [operacionesGJ_4225 operacionesDL_4225 operacionesLSQR_4225 operacionesCL_4225 operacionesSeidel_4225 operacionesGS_4225];
%   
%   
%   %Costo Temporal matriz 1089 x 1089
%   vectorTiempos_4225 = ['Gauss Jacobi - '+string(tiempoGJ_4225)+'[s]' 'Doolittle - '+ string(tiempoDL_4225)+'[s]' 'LSQR - '+string(tiempoLSQR_4225)+'[s]' 'Cholesky - ' + string(tiempoCL_4225) + '[s]' 'Gauss-Seidel - '+ string(tiempoSeidel_4225) + '[s]' 'GramSchmidth - ' + string(tiempoGS_4225)];
%   vectorTiempos_4225 = categorical(vectorTiempos_4225);
%   figure
%   hold on
%   bar(vectorTiempos_4225,vectorOperaciones_4225)
%   title('Costo espacial y temporal de cada método para matriz 4225 x 4225')
%   ylabel('Número de operaciones')
%   xlabel('Nombre del método y su costo temporal')
%   hold off
end