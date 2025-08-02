function [nizx, nizf] = metod_proj(x0, beta, eta, eps, f, df)
    l = [-1; -1];
    u = [1; 1];

    function p = proj(xk, lower_b, upper_b)
        p = xk(:);
        p(xk > upper_b) = upper_b(xk > upper_b);
        p(xk < lower_b) = lower_b(xk < lower_b);
    end

    xk = x0(:);
    nizx = xk;
    nizf = f(xk);

    dk = proj(xk - df(xk), l, u) - xk;

    while norm(dk, 2) > eps
        alfa = 1;
        while f(xk + alfa*dk) > f(xk) + alfa*eta*df(xk)'*dk
            alfa = alfa * beta;
        end
        xk = xk + alfa * dk;
        nizx = [nizx xk];
        nizf = [nizf f(xk)];

        dk = proj(xk - df(xk), l, u) - xk;
    end
end
