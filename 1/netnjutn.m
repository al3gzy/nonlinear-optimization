function [nizx, nizf] = netnjutn(x0, beta, eta, eps, f, df, ddf)
    x0 = x0(:);
    xk = x0;
    nizx = xk;
    nizf = f(xk);
    max_iter = 100;
    k = 1;

    while norm(df(xk)) > eps && k <= max_iter
        [dk, ~] = dk = -ddf(xk) \ df(xk);

        alfa = 1;
        while f(xk + alfa * dk) > f(xk) + alfa * eta * (df(xk)' * dk)
            alfa = alfa * beta;
            if alfa < 1e-12
                warning('Prekid: alfa postala premala.');
                break;
            end
        end

        xk = xk + alfa * dk;
        nizx = [nizx xk];
        nizf = [nizf f(xk)];
        k = k + 1;
    end

end
