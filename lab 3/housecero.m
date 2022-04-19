function[u,sigma] = housecero(x)
[m,n] = size(x);
mm = max(abs(x));
x = x/mm;
s = sign(x(1));
if s == 0
    s = 1;
end
sigma = s * norm(x,2);
u = x + sigma * eye(m,1);
sigma = -mm *sigma;