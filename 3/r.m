function ret = r(x)
    x1 = x(1);
    x2 = x(2);
    t = [1 2 3 4 5];
    y = [0.8 1.5 0.9 -0.7 -1.9];
    ret = (x1 * sin(x2 * t) - y)';
end
