%Carga de datos

A = load("A1089.dat");
b = load("b1089.dat");
%p = load("nodos.dat");
%e = load("fronteras.dat");
%t = load("elementos.dat");


Sdirecto = [];

Siterativo = [];

Snormal = [];

tic
[L,U] = crout(A);
t0 = toc;
tic
[Q,R] = householder(A);
t2  = toc;
erroresIterativo = [];
x0 = ones(length(b),1);
tol = 0.00001;
iters = 100;
erroresNormal = [];

%Metodo directo
tic
 for i=1:100   
     xdirecto = directo(L,U,b);
     Sdirecto = [Sdirecto,xdirecto];
     b = circshift(b,1);
 end
 errorDirecto = norm(A*Sdirecto(:,100)-b,2);
 t0 = t0+toc;
 mediasDirecto = mean(Sdirecto);
[m0,n0] = size(mediasDirecto);
g1 = repmat({'Metodo Directo'},m0,n0);

%Metodo iterativo
b = load("b1089.dat");
tic
for i = 1:100
     [xiterativo,errorIterativo] = iterativo(A,b,x0,tol,iters);
     Siterativo = [Siterativo,xiterativo];
     erroresIterativo = [erroresIterativo,min(errorIterativo)];
     b = circshift(b,1);
end
errorIterativo = min(erroresIterativo);
t1 = toc;
mediasIterativo = mean(Siterativo);
[m1,n1] = size(mediasIterativo);
g2 = repmat({'Metodo Iterativo'},m1,n1);


%Metodo Normal u Ortogonal
b = load("b1089.dat");
tic
for i = 1:100
     xnormal = normal(Q,R,b);
     Snormal = [Snormal,xnormal];
     errorNormal = norm(A*xnormal-b,2);
     erroresNormal = [erroresNormal,errorNormal];
     b = circshift(b,1);
end
errorNormal = min(erroresNormal);
t2 = t2 + toc;

mediasNormal = mean(Snormal);
[m2,n2] = size(mediasNormal);
g3 = repmat({'Metodo Normal u ortogonal'},m2,n2);
x = [mediasDirecto,mediasIterativo,mediasNormal];
g = [g1,g2,g3];
boxplot(x,g);

%Conteo de instrucciones
instDirecta = 0;
instIterativo = 0;
instNormal = 0;


[L,U,inst] = croutInst(A);
instDirecta = instDirecta + inst;
b = load("b1089.dat");
 for i=1:100   
     [xdirecto,inst] = directoInst(L,U,b);
     instDirecta = instDirecta + inst;
     Sdirecto = [Sdirecto,xdirecto];
     b = circshift(b,1);
     instDirecta = instDirecta + 2;
     
 end
 errorDirecto = norm(A*Sdirecto(:,100)-b,2);
 instDirecta = instDirecta + 1;

b = load("b1089.dat");
for i = 1:100
     [xiterativo,errorIterativo,inst] = iterativoInst(A,b,x0,tol,iters);
     instIterativo = instIterativo + inst;
     Siterativo = [Siterativo,xiterativo];
     erroresIterativo = [erroresIterativo,min(errorIterativo)];
     b = circshift(b,1);
     instIterativo = instIterativo + 3;
     
end
errorIterativo = min(erroresIterativo);
instIterativo = instIterativo + 1;

b = load("b1089.dat");
[Q,R,inst] = householderInst(A);
instNormal = instNormal + inst;
for i = 1:100
     [xnormal,inst] = normalInst(Q,R,b);
     instNormal = instNormal + inst;
     Snormal = [Snormal,xnormal];
     errorNormal = norm(A*xnormal-b,2);
     erroresNormal = [erroresNormal,errorNormal];
     b = circshift(b,1);
     instNormal = instNormal + 4;
end
errorNormal = min(erroresNormal);
instNormal = instNormal + 1;

figure(Name = 'Comparacion de metodos');
tiledlayout(3,1);
ax0 = nexttile;
errores = [errorDirecto,errorIterativo,errorNormal];
x1 = categorical({'Directo','Iterativo','Normal'});
x1 = reordercats(x1,{'Directo','Iterativo','Normal'});
bar(x1,errores);
title(ax0,'Errores');
ax1 = nexttile;
tiempos = [t0,t1,t2];
bar(x1,tiempos);
title(ax1,'Tiempos');
ax2 = nexttile;
instrucciones = [instDirecta,instIterativo,instNormal];
bar(x1,instrucciones)
title(ax2,'Instrucciones')
