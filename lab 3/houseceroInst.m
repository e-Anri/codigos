function[u,sigma,inst] = houseceroInst(x)
inst = 0;
[m,n] = size(x);
mm = max(abs(x));
x = x/mm;
s = sign(x(1));
inst = inst + 10;
if s == 0
    s = 1;
    inst = inst + 2;
end
sigma = s * norm(x,2);
u = x + sigma * eye(m,1);
sigma = -mm *sigma;
inst = inst + 10;