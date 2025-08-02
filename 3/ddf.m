function H = ddf(x)
    J = dr(x);
    H = J' * J;
end
