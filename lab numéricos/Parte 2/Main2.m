
% Gestor opción 2 menu

function [nombre, error, tiempo, operaciones] = Main2(efi, A1089, b1089, tol, n)

% Aquí corresponde hacer el análisis de
% cuál método es más viable para resolver la matriz 
% de entrada

    % Gauss Jacobi
    if efi >= 0 && efi <= 14
        % error
        [solucionesGJ_1089, error, operaciones] = GaussJacobi_E(A1089, b1089, n, 750);
        %tiempo
        [solucionesGJ_1089, tiempo] = GaussJacobi_T(A1089, b1089, n, 750);
        nombre = categorical({'Gauss Jacobi'});
        return;
        
        % GramSchmidth
    elseif efi > 14 && efi <= 35
        % error
        [solucionGS_1089, error, operaciones] = GramSchmidth_E(A1089,b1089);
        % tiempo
        [solucionGS_1089, tiempo] = GramSchmidth_T(A1089, b1089);
        nombre = categorical({'GramSchmidth'});
        return;
    
        % Doolittle
    elseif efi > 35 && efi <= 49
        % error
        [iteracionesDL_1089, solucionesDL_1089, error, operaciones] = Doolittle_E(A1089, b1089);
        % tiempo
        [solucionesDL_1089, tiempo] = Doolittle_T(A1089, b1089);
        nombre = categorical({'Doolittle'});
        return;
    
        % Gauss Seidel
    elseif efi > 49 && efi <= 63
        % error
        [solucionesSeidel_1089, error, operaciones] = GaussSeidel_E(A1089, b1089, n, 352);
        % tiempo
        [solucionesSeidel_1089, tiempo] = GaussSeidel_T(A1089, b1089, n, 352);
        nombre = categorical({'Gauss Seidel'});
        return;
    
        % LSQR
    elseif efi > 63 && efi <= 77
        % error
        [solucionLSQR_1089, error, operaciones] = LSQR_E(A1089, b1089, tol);
        % tiempo
        [solucionLSQR_1089, tiempo] = LSQR_T(A1089, b1089, tol);
        nombre = categorical({'LSQR'});
        return;
    
        % Cholesky
    elseif efi > 77 && efi <= 91
        % error
        [solucionesCL_1089, error, operaciones] = Cholesky_E(A1089, b1089);
        % tiempo
        [solucionesCL_1089, tiempo] = Cholesky_T(A1089, b1089);
        nombre = categorical({'Cholesky'});
        return;
    
        % LSQR Disperso
    elseif efi > 91 && efi <= 100
        % error
        [solucionLSQRD_1089, error, operaciones] = LSQR_D_E(A1089, b1089, tol);
        % tiempo
        [solucionLSQRD_1089, tiempo] = LSQR_D_T(A1089, b1089, tol);
        nombre = categorical({'LSQR Disperso'});
        return;
    end







%   % Métodos aplicados en matriz 1089 x 1089 
%   % ------ [CÁLCULO DE ERROR] ------
%   
%       % Gauss-Jacobi
%       [solucionesGJ_1089, errorGJ_1089, operacionesGJ_1089] = GaussJacobi_E(A1089, b1089, n, 750);
%       % Doolittle
%       [iteracionesDL_1089, solucionesDL_1089, errorDL_1089, operacionesDL_1089] = Doolittle_E(A1089, b1089);
%       % LSQR
%       [solucionLSQR_1089, errorLSQR_1089, operacionesLSQR_1089] = LSQR_E(A1089, b1089, tol);
%       % Cholesky
%       [solucionesCL_1089, errorCL_1089, operacionesCL_1089] = Cholesky_E(A1089, b1089);
%       % Gauss-Seidel
%       [solucionesSeidel_1089, errorSeidel_1089, operacionesSeidel_1089] = GaussSeidel_E(A1089, b1089, n, 352);
%       % GramSchmidth
%       [solucionGS_1089, errorGS_1089, operacionesGS_1089] = GramSchmidth_E(A1089,b1089);
%       % LSQR DISPERSO
%       [solucionLSQRD_1089, errorLSQRD_1089, operacionesLSQRD_1089] = LSQR_D_E(A1089, b1089, tol);



%  % Métodos aplicados en matriz 1089 x 1089 
%  % ------ [CÁLCULO DE TIEMPO] ------
%  
%      % Gauss-Jacobi
%      [solucionesGJ_1089, tiempoGJ_1089] = GaussJacobi_T(A1089, b1089, n, 750);
%      % Doolittle
%      [solucionesDL_1089, tiempoDL_1089] = Doolittle_T(A1089, b1089);
%      % LSQR
%      [solucionLSQR_1089, tiempoLSQR_1089] = LSQR_T(A1089, b1089, tol);
%      % Cholesky
%      [solucionesCL_1089, tiempoCL_1089] = Cholesky_T(A1089, b1089);
%      % Gauss-Seidel
%      [solucionesSeidel_1089, tiempoSeidel_1089] = GaussSeidel_T(A1089, b1089, n, 352);
%      % GramSchmidth
%      [solucionGS_1089, tiempoGS_1089] = GramSchmidth_T(A1089, b1089);
%      % LSQR DISPERSO
%      [solucionLSQRD_1089, tiempoLSQRD_1089] = LSQR_D_T(A1089, b1089, tol);



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


%  %Costo Temporal
%  tiempos_1089 = [tiempoGJ_1089, tiempoDL_1089, tiempoLSQR_1089, tiempoCL_1089, tiempoSeidel_1089, tiempoLSQRD_1089, tiempoGS_1089];
%  figure
%  hold on
%  bar(vectorNombre,tiempos_1089)
%  title('Costo temporal de cada método para matriz 1089 x 1089')
%  ylabel('Tiempo')
%  xlabel('Nombre del método')
%  hold off


%  % Costo espacial matriz 1089 x 1089
%  vectorOperaciones_1089 = [operacionesGJ_1089 operacionesDL_1089 operacionesLSQR_1089 operacionesCL_1089 operacionesSeidel_1089 operacionesGS_1089];
%  
%  
%  %Costo Temporal matriz 1089 x 1089
%  vectorTiempos_1089 = ['Gauss Jacobi - '+string(tiempoGJ_1089)+'[s]' 'Doolittle - '+ string(tiempoDL_1089)+'[s]' 'LSQR - '+string(tiempoLSQR_1089)+'[s]' 'Cholesky - ' + string(tiempoCL_1089) + '[s]' 'Gauss-Seidel - '+ string(tiempoSeidel_1089) + '[s]' 'GramSchmidth - ' + string(tiempoGS_1089)];
%  vectorTiempos_1089 = categorical(vectorTiempos_1089);
%  figure
%  hold on
%  bar(vectorTiempos_1089,vectorOperaciones_1089)
%  title('Costo espacial y temporal de cada método para matriz 1089 x 1089')
%  ylabel('Número de operaciones')
%  xlabel('Nombre del método y su costo temporal')
%  hold off


end
