function [nizx, nizf] = gradmetod(x0, beta, eta, eps, f, df)
    x0 = x0(:);
    nizx = [x0];
    nizf = [f(x0)];
    xk = x0;

    while norm(df(xk)) > eps
        dk = -df(xk);
        alfa = 1;
        while f(xk + alfa * dk) > f(xk) + alfa * eta * df(xk)' * dk
            alfa = alfa * beta;
        end
        xk = xk + alfa * dk;
        nizx = [nizx xk];
        nizf = [nizf f(xk)];
    end
end
