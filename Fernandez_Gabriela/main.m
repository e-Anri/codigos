%%
% Universidad de Santiago de Chile
% Laboratorio 2 Algorítmos Numéricos 1er Semestre 2022
% Estudiante: Gabriela Soledad Fernández Rodríguez
%%
oldpath = path;
path(oldpath,'./producto37/')

%% Importación de Datos
datosEstudio = datDefunciones();
totalDefunciones = trapz(datosEstudio)

%% Suavización de la curva mediante media móvil
M = round(movmedian(datosEstudio,15,'omitnan'));
errorMediaMovil = trapz(datosEstudio) - trapz(M);

%% Obtención de valores para interpolar y comparar
[filas, columnas] = size(M);
salto = 10;

x = 1:salto:columnas;
todos = 1:1:columnas;

if(x(1,end)) < size(M,2)

    x(1,end) = size(M,2);
end

tomados = ismember(todos,x);
noTomados = todos(~tomados);

y = M(x);

%% Inteprolation
interpolacion1 = interp1(x,y,noTomados,"spline");

figure
plot(M)
hold on

plot(x,y,'o',noTomados,interpolacion1,':.');
title('Interpolacion spline');

%%
interpolacion2 = interp1(x,y,noTomados,"linear");

figure
plot(M)
hold on

plot(x,y,'o',noTomados,interpolacion2,':.');
title('Interpolación linear');

%%
interpolacion3 = interp1(x,y,noTomados,"makima");

figure
plot(M)
hold on

plot(x,y,'o',noTomados,interpolacion3,':.');
title('Interpolación makima');

%%
errorPersonasInterLinear = floor(abs(trapz(M) - trapz(interpolacion1)))
errorCuadraticoMedioLinear = mse(interpolacion1 - M(noTomados))
errorPorcentualLinear = (errorPersonasInterLinear*100)/totalDefunciones
%%
errorPersonasInterSpline = floor(abs(trapz(M) - trapz(interpolacion2)))
errorCuadraticoMedioSpline = mse(interpolacion2 - M(noTomados))
errorPorcentualSpline = (errorPersonasInterLinear*100)/totalDefunciones
%%
errorPersonasInterMakima = floor(abs(trapz(M) - trapz(interpolacion3)))
errorCuadraticoMedioMakima = mse(interpolacion3 - M(noTomados))
errorPorcentualMakima = (errorPersonasInterLinear*100)/totalDefunciones