function ret = dr(x)
    x1 = x(1);
    x2 = x(2);
    t = [1 2 3 4 5];
    J1 = sin(x2 * t)';
    J2 = (x1 * t .* cos(x2 * t))';
    ret = [J1, J2];
end
