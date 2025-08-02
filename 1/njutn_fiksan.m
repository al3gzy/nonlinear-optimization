function [nizx, nizf] = njutn_fiksan(x0, eps, f, df, ddf)
    x0 = x0(:);
    nizx = [x0];
    nizf = [f(x0)];
    xk = x0;
    alfa = 0.05;

    while norm(df(xk)) > eps
        dk = -ddf(xk) \ df(xk);

        xk = xk + alfa * dk;
        nizx = [nizx xk];
        nizf = [nizf f(xk)];
    end
end
