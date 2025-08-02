function [nizx, nizf] = kvazinjutn(x0, beta, eta, eps, f, df, ddf)
    xk = x0(:);
    nizx = [xk];
    nizf = [f(xk)];

    Bk = ddf(xk);

    while norm(df(xk)) > eps
        dk = Bk \ (-df(xk));
        alfa = 1;

        while f(xk + alfa*dk) > f(xk) + alfa*eta*(df(xk)'*dk)
            alfa = alfa * beta;
        end

        xk_new = xk + alfa*dk;
        sk = xk_new - xk;
        yk = df(xk_new) - df(xk);

        if yk' * sk > 0
            Bk = Bk - ((Bk*sk)*(sk'*Bk)) / (sk'*Bk*sk) + (yk*yk') / (yk'*sk);
        else
            disp('Narušen je uslov krivine.');
        end

        xk = xk_new;
        nizx = [nizx xk];
        nizf = [nizf f(xk)];
    end
end
