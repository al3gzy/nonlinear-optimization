function [nizx, nizf] = netnjutn_fiksan(x0, eps, f, df, ddf)
    x0 = x0(:);
    xk = x0;
    nizx = xk;
    nizf = f(xk);
    max_iter = 100;
    k = 1;
    alfa = 0.2;

    while norm(df(xk)) > eps && k <= max_iter
        dk = -ddf(xk) \ df(xk);

        xk = xk + alfa * dk;

        nizx = [nizx xk];
        nizf = [nizf f(xk)];
        k = k + 1;
    end
end
