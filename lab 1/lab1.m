

%F1 x^2 = 60
%Se definen las variables a utilizar
x0=7.7;
tol = 0.0000000001;
iteraciones1 = 40;
%Ecuacion 1
f1 = @(x) x^2 - 60;
%Derivadas de la ecuacion 1
df1 = @(x) 2*x;
ddf1 = @(x) 2;
%Se definen el intervalo
a1=1;
b1=60;
%Se llaman a los metodos con la ecuación 1, guardando los tiempos empleados
tic;
[S1NR,convergencia1NR,error1NR] = newtonRaphson(x0,tol,iteraciones1,f1,df1);
time1NR = toc;
tic;
[S1F,convergencia1F,error1F] = regulaFalsi(a1,b1,tol,iteraciones1,f1);  
time1F = toc;
tic;
[S1B,convergencia1B,error1B] = biseccion(a1,b1,tol,iteraciones1,f1); 
time1B = toc;
tic;
[S1S,convergencia1S,error1S] = secante(a1,b1,tol,iteraciones1,f1);
time1S = toc;

%Se crean los graficos para representar el error de los metodos
figure(Name='Funcion 1');
tiledlayout(4,1);
ax0 = nexttile;
plot(ax0,error1NR);
title(ax0,'Newton Raphson');

ax2 = nexttile;
plot(ax2,error1F);
title(ax2,'Regula Falsi');

ax3 = nexttile;
plot(ax3,error1B);
title(ax3,'Biseccion');

ax4 = nexttile;
plot(ax4,error1S);
title(ax4,'Secante');


%F2 0 = x^3-2x^2+ln(2x+1)
%Se definen las variables a utilizar
x0=0.1;
tol = 0.0000000001;
iteraciones2 = 40;
%Se define la ecuacion
f2 = @(x) x^3 - 2*x^2 + log(2*x + 1);
%Se definen las derivadas de la ecuaciones
df2 = @(x) 3*x^2 - 4*x + 2/(2*x + 1);
ddf2 = @(x) 6*x -4 - 4/(2*x+1)^2;
%Se define el intervalo
a2=1;
b2=20;
%Se llaman a los metodos con la ecuación 2, guardando los tiempos empleados
tic;
[S2NR,convergencia2NR,error2NR] = newtonRaphson(x0,tol,iteraciones2,f2,df2);
time2NR = toc;
tic;
[S2F,convergencia2F,error2F] = regulaFalsi(a2,b2,tol,iteraciones2,f2);  
time2F = toc;
tic;
[S2B,convergencia2B,error2B] = biseccion(a2,b2,tol,iteraciones2,f2); 
time2B = toc;
tic;
[S2S,convergencia2S,error2S] = secante(a2,b2,tol,iteraciones2,f2);
time2S = toc;

%Se crean los graficos para representar el error de los metodos
figure(Name ='Funcion 2');
tiledlayout(4,1);
ax1 = nexttile;
plot(ax1,error2NR);
title(ax1,'Newton Raphson');

ax2 = nexttile;
plot(ax2,error2F);
title(ax2,'Regula Falsi');

ax3 = nexttile;
plot(ax3,error2B);
title(ax3,'Biseccion');

ax4 = nexttile;
plot(ax4,error2S);
title(ax4,'Secante');


%obtener los minimos errores y normalizarlos a 4 digitos significativos
%para ambas ecuaciones
errorMin1NR = round(min(error1NR),3);
errorMin1F = round(min(error1F),3);
errorMin1B = round(min(error1B),3);
errorMIN1S = round(min(error1S),3);

errorMin2NR = round(min(error2NR),3);
errorMin2F = round(min(error2F),3);
errorMin2B = round(min(error2B),3);
errorMIN2S = round(min(error2S),3);

%Se grafican los errores minimos de ambas ecuaciones con todos los metodos
figure(Name = 'Errores minimos');
tiledlayout(2,1);
ax1 = nexttile;
x1 = categorical({'Newton Raphson','Regula Falsi','Biseccion','Secante'});
x1 = reordercats(x1,{'Newton Raphson','Regula Falsi','Biseccion','Secante'});
bar(x1,[errorMin1NR,errorMin1F,errorMin1B,errorMIN1S]);
title(ax1,'Errores funcion 1');
ax2 = nexttile;
bar(x1,[errorMin2NR,errorMin2F,errorMin2B,errorMIN2S]);
title(ax2,'Errores funcion 2');


%Comparar errores a priori y/o posteriori con los minimos función 1
%Primero se deben calcular
%Error a priori newton raphson
enNR = error1NR(1);

for i=1:iteraciones1
    en1NR = (1/2)*(ddf1(S1NR)/df1(S1NR))*enNR^2;
    enNR = en1NR;
end
enNR = round(enNR,3);

%error a priori biseccion
enB = (b1-a1)/iteraciones1^2;
enB = round(enB,3);

%error a priori secante
en0S = error1S(1);
en1S = error1S(2);

for i = 1:iteraciones1
    en2S = (1/2)*(ddf1(7.7)/df1(7.7))*en1S*en0S;
    en0S = en1S;
    en1S = en2S;
end
en2S = round(en2S,3);

%error a posteori de regula falsi no fue encontrado

%Se grafican los errores minimos con los errores a priori para compararlos
figure(Name = 'Comparación de Errores minimos con error priori funcion 1');
tiledlayout(3,1);
ax1 = nexttile;
x1 = categorical({'Minimo error','Error priori'});
x1 = reordercats(x1,{'Minimo error','Error priori'});
bar(x1,[errorMin1NR,enNR]);
title(ax1,'Newton Raphson');
ax2 = nexttile;
bar(x1,[errorMin2B,enB]);
title(ax2,'Bisección');
ax3 = nexttile;
bar(x1,[errorMIN2S,en2S]);
title(ax3,'Secante')

%Comparar errores a priori y/o posteriori con los minimos función 2
%Primero se deben calcular
%Error a priori newton raphson
enNR = error2NR(1);
for i=1:iteraciones2
    en1NR = (1/2)*(ddf2(0.1)/df2(0.1))*enNR^2;
    enNR = en1NR;
end
enNR = round(enNR,3);

%error a priori biseccion
enB = (b1-a1)/iteraciones2^2;
enB = round(enB,3);

%error a priori secante
en0S = error2S(1);
en1S = error2S(2);

for i = 1:iteraciones2
    en2S = (1/2)*(ddf2(0.1)/df2(0.1))*en1S*en0S;
    en0S = en1S;
    en1S = en2S;
end
en2S = round(en2S,3);

%error a posteori de regula falsi no fue encontrado

%Se grafican los errores minimos con los errores a priori para compararlos
figure(Name = 'Comparación de Errores minimos con error priori funcion 2');
tiledlayout(3,1);
ax1 = nexttile;
x1 = categorical({'Minimo error','Error priori'});
x1 = reordercats(x1,{'Minimo error','Error priori'});
bar(x1,[errorMin1NR,enNR]);
title(ax1,'Newton Raphson');
ax2 = nexttile;
bar(x1,[errorMin2B,enB]);
title(ax2,'Bisección');
ax3 = nexttile;
bar(x1,[errorMIN2S,en2S]);
title(ax3,'Secante')


%Comparar tiempos mediante graficos

y1 = [time1NR,time1F,time1B,time1S];
y2 = [time2NR,time2F,time2B,time2S];

figure(Name = 'Tiempos');
tiledlayout(2,1);
ax1 = nexttile;
x1 = categorical({'Newton Raphson','Regula Falsi','Biseccion','Secante'});
x1 = reordercats(x1,{'Newton Raphson','Regula Falsi','Biseccion','Secante'});
bar(x1,y1);
title(ax1,'Tiempos funcion 1');
ax2 = nexttile;
bar(x1,y2);
title(ax2,'Tiempos funcion 2');

