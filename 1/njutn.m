function [nizx, nizf] = njutn(x0, beta, eta, eps, f, df, ddf)
    x0 = x0(:);
    nizx = [x0];
    nizf = [f(x0)];
    xk = x0;

    while norm(df(xk)) > eps
        dk = ddf(xk) \ (-df(xk));
        alfa = 1;

        while f(xk + alfa*dk) > f(xk) + alfa*eta*(df(xk)'*dk)
            alfa = alfa * beta;
        end

        xk = xk + alfa * dk;
        nizx = [nizx xk];
        nizf = [nizf f(xk)];
    end
end
