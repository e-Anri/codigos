
% Gestor opción 1 menu

function [nombre, error, tiempo, operaciones] = Main1(efi, A289, b289, tol, n)

% Aquí corresponde hacer el análisis de
% cuál método es más viable para resolver la matriz 
% de entrada

        % Gauss Jacobi
    if efi >= 0 && efi <= 14
        % error
        [solucionesGJ_289, error, operaciones] = GaussJacobi_E(A289, b289, n, 400);
        %tiempo
        [solucionesGJ_289, tiempo] = GaussJacobi_T(A289, b289, n, 400);
        nombre = categorical({'Gauss Jacobi'});
        return;
        
        % GramSchmidth
    elseif efi > 14 && efi <= 35
        % error
        [solucionGS_289, error, operaciones] = GramSchmidth_E(A289,b289);
        % tiempo
        [solucionGS_289, tiempo] = GramSchmidth_T(A289, b289);
        nombre = categorical({'GramSchmidth'});
        return;
    
        % Doolittle
    elseif efi > 35 && efi <= 49
        % error
        [iteracionesDL_289, solucionesDL_289, error, operaciones] = Doolittle_E(A289, b289);
        % tiempo
        [solucionesDL_289, tiempo] = Doolittle_T(A289, b289);
        nombre = categorical({'Doolittle'});
        return;
    
        % Gauss Seidel
    elseif efi > 49 && efi <= 63
        % error
        [solucionesSeidel_289, error, operaciones] = GaussSeidel_E(A289, b289, n, 95);
        % tiempo
        [solucionesSeidel_289, tiempo] = GaussSeidel_T(A289, b289, n, 95);
        nombre = categorical({'Gauss Seidel'});
        return;
    
        % LSQR
    elseif efi > 63 && efi <= 77
        % error
        [solucionLSQR_289, error, operaciones] = LSQR_E(A289, b289, tol);
        % tiempo
        [solucionLSQR_289, tiempo] = LSQR_T(A289, b289, tol);
        nombre = categorical({'LSQR'});
        return;
    
        % Cholesky
    elseif efi > 77 && efi <= 91
        % error
        [solucionesCL_289, error, operaciones] = Cholesky_E(A289, b289);
        % tiempo
        [solucionesCL_289, tiempo] = Cholesky_T(A289, b289);
        nombre = categorical({'Cholesky'});
        return;
    
        % LSQR Disperso
    elseif efi > 91 && efi <= 100
        % error
        [solucionLSQRD_289, error, operaciones] = LSQR_D_E(A289, b289, tol);
        tiempo2 = toc;
        % tiempo
        [solucionLSQRD_289, tiempo] = LSQR_D_T(A289, b289, tol);
        nombre = categorical({'LSQR Disperso'});
        return;
    end




%  % Métodos aplicados en matriz 289 x 289 
%  % ------ [CÁLCULO DE ERROR] ------
%  
%      % Gauss-Jacobi
%      [solucionesGJ_289, errorGJ_289, operacionesGJ_289] = GaussJacobi_E(A289, b289, n, 400);
%      % Doolittle
%      [iteracionesDL_289, solucionesDL_289, errorDL_289, operacionesDL_289] = Doolittle_E(A289, b289);
%      % LSQR
%      [solucionLSQR_289, errorLSQR_289, operacionesLSQR_289] = LSQR_E(A289, b289, tol);
%      % Cholesky
%      [solucionesCL_289, errorCL_289, operacionesCL_289] = Cholesky_E(A289, b289);
%      % Gauss-Seidel
%      [solucionesSeidel_289, errorSeidel_289, operacionesSeidel_289] = GaussSeidel_E(A289, b289, n, 95);
%      % GramSchmidth
%      [solucionGS_289, errorGS_289, operacionesGS_289] = GramSchmidth_E(A289,b289);
%      % LSQR DISPERSO
%      [solucionLSQRD_289, errorLSQRD_289, operacionesLSQRD_289] = LSQR_D_E(A289, b289, tol);
 


%  % Métodos aplicados en matriz 289 x 289 
%  % ------ [CÁLCULO DE TIEMPO] ------
%  
%      % Gauss-Jacobi
%      [solucionesGJ_289, tiempoGJ_289] = GaussJacobi_T(A289, b289, n, 400);
%      % Doolittle
%      [solucionesDL_289, tiempoDL_289] = Doolittle_T(A289, b289);
%      % LSQR
%      [solucionLSQR_289, tiempoLSQR_289] = LSQR_T(A289, b289, tol);
%      % Cholesky
%      [solucionesCL_289, tiempoCL_289] = Cholesky_T(A289, b289);
%      % Gauss-Seidel
%      [solucionesSeidel_289, tiempoSeidel_289] = GaussSeidel_T(A289, b289, n, 95);
%      % GramSchmidth
%      [solucionGS_289, tiempoGS_289] = GramSchmidth_T(A289, b289);
%      % LSQR DISPERSO
%      [solucionLSQRD_289, tiempoLSQRD_289] = LSQR_D_T(A289, b289, tol);



% % Errores matriz 289 x 289
% vectorErrores_289 = [errorGJ_289, errorDL_289, errorLSQR_289, errorCL_289, errorSeidel_289, errorLSQRD_289, errorGS_289];
% vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'LSQR Disperso', 'GramSchmidth'});
% figure
% hold on
% bar(vectorNombre, vectorErrores_289)
% title('Error de cada método para matriz 289 x 289')
% ylabel('Error') 
% xlabel('Nombre del método')
% hold off



%  % Costo Temporal matriz 289 x 289
%  tiempos_289 = [tiempoGJ_289, tiempoDL_289, tiempoLSQR_289, tiempoCL_289, tiempoSeidel_289, tiempoLSQRD_289, tiempoGS_289];
%  figure
%  hold on
%  bar(vectorNombre,tiempos_289)
%  title('Costo temporal de cada método para matriz 289 x 289')
%  ylabel('Tiempo')
%  xlabel('Nombre del método')
%  hold off  


% % Costo espacial matriz 289 x 289
% vectorOperaciones_289 = [operacionesGJ_289 operacionesDL_289 operacionesLSQR_289 operacionesCL_289 operacionesSeidel_289 operacionesGS_289];
% 
% 
% %Costo Temporal matriz 289 x 289
% vectorTiempos_289 = ['Gauss Jacobi - '+string(tiempoGJ_289)+'[s]' 'Doolittle - '+ string(tiempoDL_289)+'[s]' 'LSQR - '+string(tiempoLSQR_289)+'[s]' 'Cholesky - ' + string(tiempoCL_289) + '[s]' 'Gauss-Seidel - '+ string(tiempoSeidel_289) + '[s]' 'GramSchmidth - ' + string(tiempoGS_289)];
% vectorTiempos_289 = categorical(vectorTiempos_289);
% figure
% hold on
% bar(vectorTiempos_289,vectorOperaciones_289)
% title('Costo espacial y temporal de cada método para matriz 289 x 289')
% ylabel('Número de operaciones')
% xlabel('Nombre del método y su costo temporal')
% hold off


end









