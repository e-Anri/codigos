
% Gestor opción 1 menu

function [nombre, error, tiempo, tiempo2] = Main1(efi, A289, b289, tol, n)

% Aquí corresponde hacer el análisis de
% cuál método es más viable para resolver la matriz 
% de entrada

        % Gauss Jacobi
    if efi >= 0 && efi <= 14
        tic
        % error
        [solucionesGJ_289, error] = GaussJacobi_E(A289, b289, n, 400);
        tiempo2 = toc;
        %tiempo
        [solucionesGJ_289, tiempo] = GaussJacobi_T(A289, b289, n, 400);
        nombre = categorical({'Gauss Jacobi'});
        return;
        
        % GramSchmidth
    elseif efi > 14 && efi <= 35
        tic
        % error
        [solucionGS_289, error] = GramSchmidth_E(A289,b289);
        tiempo2 = toc;
        % tiempo
        [solucionGS_289, tiempo] = GramSchmidth_T(A289, b289);
        nombre = categorical({'GramSchmidth'});
        return;
    
        % Doolittle
    elseif efi > 35 && efi <= 49
        tic
        % error
        [iteracionesDL_289, solucionesDL_289, error] = Doolittle_E(A289, b289);
        tiempo2 = toc;
        % tiempo
        [solucionesDL_289, tiempo] = Doolittle_T(A289, b289);
        nombre = categorical({'Doolittle'});
        return;
    
        % Gauss Seidel
    elseif efi > 49 && efi <= 63
        tic
        % error
        [solucionesSeidel_289, error] = GaussSeidel_E(A289, b289, n, 95);
        tiempo2 = toc;
        % tiempo
        [solucionesSeidel_289, tiempo] = GaussSeidel_T(A289, b289, n, 95);
        nombre = categorical({'Gauss Seidel'});
        return;
    
        % LSQR
    elseif efi > 63 && efi <= 77
        tic
        % error
        [solucionLSQR_289, error] = LSQR_E(A289, b289, tol);
        tiempo2 = toc;
        % tiempo
        [solucionLSQR_289, tiempo] = LSQR_T(A289, b289, tol);
        nombre = categorical({'LSQR'});
        return;
    
        % Cholesky
    elseif efi > 77 && efi <= 91
        tic
        % error
        [solucionesCL_289, error, operacionesCL_289] = Cholesky_E(A289, b289);
        tiempo2 = toc;
        % tiempo
        [solucionesCL_289, tiempo] = Cholesky_T(A289, b289);
        nombre = categorical({'Cholesky'});
        return;
    
        % LSQR Disperso
    elseif efi > 91 && efi <= 100
        tic
        % error
        [solucionLSQRD_289, error] = LSQR_D_E(A289, b289, tol);
        tiempo2 = toc;
        % tiempo
        [solucionLSQRD_289, tiempo] = LSQR_D_T(A289, b289, tol);
        nombre = categorical({'LSQR Disperso'});
        return;
    end




% % Métodos aplicados en matriz 289 x 289 
% % ------ [CÁLCULO DE ERROR] ------
% 
%     % Gauss-Jacobi
%     [solucionesGJ_289, errorGJ_289] = GaussJacobi_E(A289, b289, n, 400);
%     % Doolittle
%     [iteracionesDL_289, solucionesDL_289, errorDL_289] = Doolittle_E(A289, b289);
%     % LSQR
%     [solucionLSQR_289, errorLSQR_289] = LSQR_E(A289, b289, tol);
%     % Cholesky
%     [solucionesCL_289, errorCL_289, operacionesCL_289] = Cholesky_E(A289, b289);
%     % Gauss-Seidel
%     [solucionesSeidel_289, errorSeidel_289] = GaussSeidel_E(A289, b289, n, 95);
%     % GramSchmidth
%     [solucionGS_289, errorGS_289] = GramSchmidth_E(A289,b289);
%     % LSQR DISPERSO
%     [solucionLSQRD_289, errorLSQRD_289] = LSQR_D_E(A289, b289, tol);
% 


% % Métodos aplicados en matriz 289 x 289 
% % ------ [CÁLCULO DE TIEMPO] ------
% 
%     % Gauss-Jacobi
%     [solucionesGJ_289, tiempoGJ_289] = GaussJacobi_T(A289, b289, n, 400);
%     % Doolittle
%     [solucionesDL_289, tiempoDL_289] = Doolittle_T(A289, b289);
%     % LSQR
%     [solucionLSQR_289, tiempoLSQR_289] = LSQR_T(A289, b289, tol);
%     % Cholesky
%     [solucionesCL_289, tiempoCL_289] = Cholesky_T(A289, b289);
%     % Gauss-Seidel
%     [solucionesSeidel_289, tiempoSeidel_289] = GaussSeidel_T(A289, b289, n, 95);
%     % GramSchmidth
%     [solucionGS_289, tiempoGS_289] = GramSchmidth_T(A289, b289);
%     % LSQR DISPERSO
%     [solucionLSQRD_289, tiempoLSQRD_289] = LSQR_D_T(A289, b289, tol);



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



% % Costo Temporal
% tiempos_289 = [tiempoGJ_289, tiempoDL_289, tiempoLSQR_289, tiempoCL_289, tiempoSeidel_289, tiempoLSQRD_289, tiempoGS_289];
% figure
% hold on
% bar(vectorNombre,tiempos_289)
% title('Costo temporal de cada método para matriz 289 x 289')
% ylabel('Tiempo')
% xlabel('Nombre del método')
% hold off  

end









