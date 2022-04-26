
function Analisis()
tic
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
n1 = 289;
n2 = 1089;
n3 = 4225;
x0 = ones(length(b289),1);


  % Métodos aplicados en matriz 289 x 289 
  % ------ [CÁLCULO DE ERROR] ------
  
      % Gauss-Jacobi
      [solucionesGJ_289, errorGJ_289, operacionesGJ_289] = GaussJacobi_E(A289, b289, n1, 400);
      % Doolittle
      [iteracionesDL_289, solucionesDL_289, errorDL_289, operacionesDL_289] = Doolittle_E(A289, b289);
      % LSQR
      [solucionLSQR_289, errorLSQR_289, operacionesLSQR_289] = LSQR_E(A289, b289, tol);
      % Cholesky
      [solucionesCL_289, errorCL_289, operacionesCL_289] = Cholesky_E(A289, b289);
      % Gauss-Seidel
      [solucionesSeidel_289, errorSeidel_289, operacionesSeidel_289] = GaussSeidel_E(A289, b289, n1, 95);
      % GramSchmidth
      [solucionGS_289, errorGS_289, operacionesGS_289] = GramSchmidth_E(A289,b289);
      % LSQR DISPERSO
      [solucionLSQRD_289, errorLSQRD_289, operacionesLSQRD_289] = LSQR_D_E(A289, b289, tol);


   % Métodos aplicados en matriz 1089 x 1089 
   % ------ [CÁLCULO DE ERROR] ------
   
       % Gauss-Jacobi
       [solucionesGJ_1089, errorGJ_1089, operacionesGJ_1089] = GaussJacobi_E(A1089, b1089, n2, 750);
       % Doolittle
       [iteracionesDL_1089, solucionesDL_1089, errorDL_1089, operacionesDL_1089] = Doolittle_E(A1089, b1089);
       % LSQR
       [solucionLSQR_1089, errorLSQR_1089, operacionesLSQR_1089] = LSQR_E(A1089, b1089, tol);
       % Cholesky
       [solucionesCL_1089, errorCL_1089, operacionesCL_1089] = Cholesky_E(A1089, b1089);
       % Gauss-Seidel
       [solucionesSeidel_1089, errorSeidel_1089, operacionesSeidel_1089] = GaussSeidel_E(A1089, b1089, n2, 352);
       % GramSchmidth
       [solucionGS_1089, errorGS_1089, operacionesGS_1089] = GramSchmidth_E(A1089,b1089);
       % LSQR DISPERSO
       [solucionLSQRD_1089, errorLSQRD_1089, operacionesLSQRD_1089] = LSQR_D_E(A1089, b1089, tol);



  % Métodos aplicados en matriz 4225 x 4225
  % ------ [CÁLCULO DE ERROR] ------
  
      % Gauss-Jacobi
      [solucionesGJ_4225, errorGJ_4225, operacionesGJ_4225] = GaussJacobi_E(A4225, b4225, n3, 2600);
      % Doolittle
      [iteracionesDL_4225, solucionesDL_4225, errorDL_4225, operacionesDL_4225] = Doolittle_E(A4225, b4225);
      % LSQR
      [solucionLSQR_4225, errorLSQR_4225, operacionesLSQR_4225] = LSQR_E(A4225, b4225, tol);
      % Cholesky
      [solucionesCL_4225, errorCL_4225, operacionesCL_4225] = Cholesky_E(A4225, b4225);
      % Gauss-Seidel
      [solucionesSeidel_4225, errorSeidel_4225, operacionesSeidel_4225] = GaussSeidel_E(A4225, b4225, n3, 1360);
      % GramSchmidth
      [solucionGS_4225, errorGS_4225, operacionesGS_4225] = GramSchmidth_E(A4225,b4225);
      % LSQR DISPERSO
      [solucionLSQRD_4225, errorLSQRD_4225, operacionesLSQRD_4225] = LSQR_D_E(A4225, b4225, tol);





  % Métodos aplicados en matriz 289 x 289 
  % ------ [CÁLCULO DE TIEMPO] ------
  
      % Gauss-Jacobi
      [solucionesGJ_289, tiempoGJ_289] = GaussJacobi_T(A289, b289, n1, 400);
      % Doolittle
      [solucionesDL_289, tiempoDL_289] = Doolittle_T(A289, b289);
      % LSQR
      [solucionLSQR_289, tiempoLSQR_289] = LSQR_T(A289, b289, tol);
      % Cholesky
      [solucionesCL_289, tiempoCL_289] = Cholesky_T(A289, b289);
      % Gauss-Seidel
      [solucionesSeidel_289, tiempoSeidel_289] = GaussSeidel_T(A289, b289, n1, 95);
      % GramSchmidth
      [solucionGS_289, tiempoGS_289] = GramSchmidth_T(A289, b289);
      % LSQR DISPERSO
      [solucionLSQRD_289, tiempoLSQRD_289] = LSQR_D_T(A289, b289, tol);



  % Métodos aplicados en matriz 1089 x 1089 
  % ------ [CÁLCULO DE TIEMPO] ------
  
      % Gauss-Jacobi
      [solucionesGJ_1089, tiempoGJ_1089] = GaussJacobi_T(A1089, b1089, n2, 750);
      % Doolittle
      [solucionesDL_1089, tiempoDL_1089] = Doolittle_T(A1089, b1089);
      % LSQR
      [solucionLSQR_1089, tiempoLSQR_1089] = LSQR_T(A1089, b1089, tol);
      % Cholesky
      [solucionesCL_1089, tiempoCL_1089] = Cholesky_T(A1089, b1089);
      % Gauss-Seidel
      [solucionesSeidel_1089, tiempoSeidel_1089] = GaussSeidel_T(A1089, b1089, n2, 352);
      % GramSchmidth
      [solucionGS_1089, tiempoGS_1089] = GramSchmidth_T(A1089, b1089);
      % LSQR DISPERSO
      [solucionLSQRD_1089, tiempoLSQRD_1089] = LSQR_D_T(A1089, b1089, tol);



  % Métodos aplicados en matriz 4225 x 4225
  % ------ [CÁLCULO DE TIEMPO] ------
  
      % Gauss-Jacobi
      [solucionesGJ_4225, tiempoGJ_4225] = GaussJacobi_T(A4225, b4225, n3, 2600);
      % Doolittle
      [solucionesDL_4225, tiempoDL_4225] = Doolittle_T(A4225, b4225);
      % LSQR
      [solucionLSQR_4225, tiempoLSQR_4225] = LSQR_T(A4225, b4225, tol);
      % Cholesky
      [solucionesCL_4225, tiempoCL_4225] = Cholesky_T(A4225, b4225);
      % Gauss-Seidel
      [solucionesSeidel_4225, tiempoSeidel_4225] = GaussSeidel_T(A4225, b4225, n3, 1360);
      % GramSchmidth
      [solucionGS_4225, tiempoGS_4225] = GramSchmidth_T(A4225, b4225);
      % LSQR DISPERSO
      [solucionLSQRD_4225, tiempoLSQRD_4225] = LSQR_D_T(A4225, b4225, tol);




% ---------- [GRÁFICOS] ----------

 % Errores matriz 289 x 289
 vectorErrores_289 = [errorGJ_289, errorDL_289, errorLSQR_289, errorCL_289, errorSeidel_289, errorLSQRD_289, errorGS_289];
 vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'LSQR Disperso', 'GramSchmidth'});
 figure
 hold on
 bar(vectorNombre, vectorErrores_289)
 title('Error de cada método para matriz 289 x 289')
 ylabel('Error') 
 xlabel('Nombre del método')
 hold off


 % Errores matriz 1089 x 1089
 vectorErrores_1089 = [errorGJ_1089, errorDL_1089, errorLSQR_1089, errorCL_1089, errorSeidel_1089, errorLSQRD_1089, errorGS_1089];
 vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'LSQR Disperso', 'GramSchmidth'});
 figure
 hold on
 bar(vectorNombre, vectorErrores_1089)
 title('Error de cada método para matriz 1089 x 1089')
 ylabel('Error') 
 xlabel('Nombre del método')
 hold off



 % Errores matriz 4225 x 4225
 vectorErrores_4225 = [errorGJ_4225, errorDL_4225, errorLSQR_4225, errorCL_4225, errorSeidel_4225, errorLSQRD_4225, errorGS_4225];
 vectorNombre = categorical({'Gauss-Jacobi','Doolittle','LSQR', 'Cholesky', 'Gauss-Seidel', 'LSQR Disperso', 'GramSchmidth'});
 figure
 hold on
 bar(vectorNombre, vectorErrores_4225)
 title('Error de cada método para matriz 4225 x 4225')
 ylabel('Error') 
 xlabel('Nombre del método')
 hold off





  % Costo Temporal matriz 289 x 289
  tiempos_289 = [tiempoGJ_289, tiempoDL_289, tiempoLSQR_289, tiempoCL_289, tiempoSeidel_289, tiempoLSQRD_289, tiempoGS_289];
  figure
  hold on
  bar(vectorNombre,tiempos_289)
  title('Costo temporal de cada método para matriz 289 x 289')
  ylabel('Tiempo')
  xlabel('Nombre del método')
  hold off  


  %Costo Temporal matriz 1089 x 1089
  tiempos_1089 = [tiempoGJ_1089, tiempoDL_1089, tiempoLSQR_1089, tiempoCL_1089, tiempoSeidel_1089, tiempoLSQRD_1089, tiempoGS_1089];
  figure
  hold on
  bar(vectorNombre,tiempos_1089)
  title('Costo temporal de cada método para matriz 1089 x 1089')
  ylabel('Tiempo')
  xlabel('Nombre del método')
  hold off


 %Costo Temporal matriz 4225 x 4225
 tiempos_4225 = [tiempoGJ_4225, tiempoDL_4225, tiempoLSQR_4225, tiempoCL_4225, tiempoSeidel_4225, tiempoLSQRD_4225, tiempoGS_4225];
 figure
 hold on
 bar(vectorNombre,tiempos_4225)
 title('Costo temporal de cada método para matriz 4225 x 4225')
 ylabel('Tiempo')
 xlabel('Nombre del método')
 hold off




 % Costo espacial matriz 289 x 289
 vectorOperaciones_289 = [operacionesGJ_289 operacionesDL_289 operacionesLSQR_289 operacionesCL_289 operacionesSeidel_289 operacionesGS_289 operacionesLSQRD_289];
 
 
 %Costo Temporal matriz 289 x 289
 vectorTiempos_289 = ['Gauss Jacobi - '+string(tiempoGJ_289)+'[s]' 'Doolittle - '+string(tiempoDL_289)+'[s]' 'LSQR - '+string(tiempoLSQR_289)+'[s]' 'Cholesky - '+string(tiempoCL_289)+'[s]' 'Gauss-Seidel - '+string(tiempoSeidel_289)+'[s]' 'GramSchmidth - '+string(tiempoGS_289)+'[s]' 'LSQR Disperso - '+string(tiempoLSQRD_289)+'[s]'];
 vectorTiempos_289 = categorical(vectorTiempos_289);
 figure
 hold on
 bar(vectorTiempos_289,vectorOperaciones_289)
 title('Costo espacial y temporal de cada método para matriz 289 x 289')
 ylabel('Número de operaciones')
 xlabel('Nombre del método y su costo temporal')
 hold off


  % Costo espacial matriz 1089 x 1089
  vectorOperaciones_1089 = [operacionesGJ_1089 operacionesDL_1089 operacionesLSQR_1089 operacionesCL_1089 operacionesSeidel_1089 operacionesGS_1089 operacionesLSQRD_1089];
  
  
  %Costo Temporal matriz 1089 x 1089
  vectorTiempos_1089 = ['Gauss Jacobi - '+string(tiempoGJ_1089)+'[s]' 'Doolittle - '+string(tiempoDL_1089)+'[s]' 'LSQR - '+string(tiempoLSQR_1089)+'[s]' 'Cholesky - '+string(tiempoCL_1089)+'[s]' 'Gauss-Seidel - '+string(tiempoSeidel_1089)+'[s]' 'GramSchmidth - '+string(tiempoGS_1089)+'[s]' 'LSQR Disperso - '+string(tiempoLSQRD_1089)+'[s]'];
  vectorTiempos_1089 = categorical(vectorTiempos_1089);
  figure
  hold on
  bar(vectorTiempos_1089,vectorOperaciones_1089)
  title('Costo espacial y temporal de cada método para matriz 1089 x 1089')
  ylabel('Número de operaciones')
  xlabel('Nombre del método y su costo temporal')
  hold off



   % Costo espacial matriz 4225 x 4225
   vectorOperaciones_4225 = [operacionesGJ_4225 operacionesDL_4225 operacionesLSQR_4225 operacionesCL_4225 operacionesSeidel_4225 operacionesGS_4225 operacionesLSQRD_4225];
   
   
   %Costo Temporal matriz 1089 x 1089
   vectorTiempos_4225 = ['Gauss Jacobi - '+string(tiempoGJ_4225)+'[s]' 'Doolittle - '+string(tiempoDL_4225)+'[s]' 'LSQR - '+string(tiempoLSQR_4225)+'[s]' 'Cholesky - '+string(tiempoCL_4225)+'[s]' 'Gauss-Seidel - '+string(tiempoSeidel_4225)+'[s]' 'GramSchmidth - '+string(tiempoGS_4225)+'[s]' 'LSQR Disperso - '+string(tiempoLSQRD_4225)+'[s]'];
   vectorTiempos_4225 = categorical(vectorTiempos_4225);
   figure
   hold on
   bar(vectorTiempos_4225, vectorOperaciones_4225)
   title('Costo espacial y temporal de cada método para matriz 4225 x 4225')
   ylabel('Número de operaciones')
   xlabel('Nombre del método y su costo temporal')
   hold off

   tiempoTotal = toc;

filename = 'dataLaptop.mat';
save(filename)

end
