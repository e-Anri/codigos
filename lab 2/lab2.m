%Se importan los datos
%A traves de la funcion generada automaticamente por matlab
CasosNuevosConSintomas = importfile("C:\Users\HP 14\Documents\MATLAB\CasosNuevosConSintomas.csv", [1, Inf]);
%Region del Bio Bio
BioBio = CasosNuevosConSintomas(12,2:end-2);

%Se obtienen los casos nuevos agrupados por semanas
semanalBB = [];
for i = 1:size(BioBio,2)/7
    inicio = (i-1)*7+1;
    final = i*7;
    semanalBB = [semanalBB,sum(BioBio(inicio:final))];
end

%Se grafican los datos originales por semana
figure
plot(semanalBB,'.');
title('Datos Originales por semana')

%Se obtiene la integral de los datos originales
integralOriginal = trapz(BioBio);

%Aplicación de ajuste con convolución
%Vector ajustado por mes aproximadamente 4 semanas
BB = ceil(conv(semanalBB,[1 1 1 1]/4));
x=1:1:size(BB,2);

%Se obtiene la integral de los valores ajustados
integralAjuste = trapz(x,BB);

%Se grafican los valores ajustados
figure
plot(BB,'.');
title('Datos ajustados')

%Se definen las ventanas en las que se desea obtenter datos con la
%interpolación

%Ventana de 1 día
xq1=1:1/7:size(BB,2); 
%Ventana de 3 días
xq2 = 1:3/7:size(BB,2);
%Ventana de 5 días
xq3 = 1:5/7:size(BB,2);



%Ventana de 1 día

%Se realiza la interpolación lineal
lineal1 = ceil(interp1(x,BB,xq1,"linear"));
figure
plot(xq1,lineal1,'.');
title('Interpolación Lineal Ventana de 1 día');

%Se realiza la interpolación cubica spline
spline1 = ceil(interp1(x,BB,xq1,"spline"));
figure
plot(xq1,spline1,'.')
title('Interpolación spline Ventana de 1 día')

%Se realiza la interpolación makima
makima1 = ceil(interp1(x,BB,xq1,"makima"));
figure
plot(xq1,makima1,'.')
title('Interpolación makima Ventana de 1 día')

%Ventana de 3 días
%Se realiza la interpolación linea
lineal2 = ceil(interp1(x,BB,xq2,"linear"));
figure
plot(xq2,lineal2,'.');
title('Interpolación Lineal Ventana de 3 días');

%Se realiza la interpolación cubica spline
spline2 = ceil(interp1(x,BB,xq2,"spline"));
figure
plot(xq2,spline2,'.')
title('Interpolación spline Ventana de 3 días')

%Se realiza la interpolación makima
makima2 = ceil(interp1(x,BB,xq2,"makima"));
figure
plot(xq2,makima2,'.')
title('Interpolación makima Ventana de 3 días')

%Ventana de 5 días
%Se realiza la interpolación linea
lineal3 = ceil(interp1(x,BB,xq3,"linear"));
figure
plot(xq3,lineal3,'.');
title('Interpolación Lineal Ventana de 5 días');

%Se realiza la interpolación cubica spline
spline3 = ceil(interp1(x,BB,xq3,"spline"));
figure
plot(xq3,spline3,'.')
title('Interpolación spline Ventana de 5 días')

%Se realiza la interpolación makima
makima3 = ceil(interp1(x,BB,xq3,"makima"));
figure
plot(xq3,makima3,'.')
title('Interpolación makima Ventana de 5 días')

%Aplicación de integral para cada una de las ventanas y metodos

%Ventana de 1 día
integralLinealP1 = trapz(xq1,lineal1);

integralSpilineP1 = trapz(xq1,spline1);

integralMakimaP1 = trapz(xq1,makima1);

%Ventana de 3 días
integralLinealP2 = trapz(xq2,lineal2);

integralSpilineP2 = trapz(xq2,spline2);

integralMakimaP2 = trapz(xq2,makima2);
%Ventana de 5 días
integralLinealP3 = trapz(xq3,lineal3);

integralSpilineP3 = trapz(xq3,spline3);

integralMakimaP3 = trapz(xq3,makima3);

%Calculo del error
errorLinealP1 = abs(integralAjuste - integralLinealP1);
errorLinealP2 = abs(integralAjuste - integralLinealP2);
errorLinealP3 = abs(integralAjuste - integralLinealP3);


errorSplineP1 = abs(integralAjuste - integralSpilineP1);
errorSplineP2 = abs(integralAjuste - integralSpilineP2);
errorSplineP3 = abs(integralAjuste - integralSpilineP3);


errorMakimaP1 = abs(integralAjuste -integralMakimaP1);
errorMakimaP2 = abs(integralAjuste -integralMakimaP2);
errorMakimaP3 = abs(integralAjuste -integralMakimaP3);


%Se grafican los errores obtenidos por cada ventana y cada metodo
X = categorical({'lineal','spline','makima'});
X = reordercats(X,{'lineal','spline','makima'});
figure
Y = [errorLinealP1,errorSplineP1,errorMakimaP1];
bar(X,Y)
title('Error ventana de 1 día')

figure
Y = [errorLinealP2,errorSplineP2,errorMakimaP2];
bar(X,Y)
title('Error ventana de 3 dias')

figure
Y = [errorLinealP3,errorSplineP3,errorMakimaP3];
bar(X,Y)
title('Error ventana de 5 dias')
