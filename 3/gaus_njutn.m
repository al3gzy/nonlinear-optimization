function [nizxk, nizfk]=najmkv(x0,beta,eta,eps)
xk=x0(:);
nizxk=[xk];
nizfk=[f(xk)];

while norm(df(xk))>eps
    dk=ddf(xk)\(-df(xk));
    alfa=1;
    while f(xk+alfa*dk)>f(xk)+alfa*eta*df(xk)'*dk
    alfa=alfa*beta
    end
    xk=xk+alfa*dk;
    nizxk=[nizxk xk];
    nizfk=[nizfk f(xk)];
end

