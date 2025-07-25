function grad = df(x)
    J = dr(x);
    r_vek = r(x);
    grad = J' * r_vek;
end
