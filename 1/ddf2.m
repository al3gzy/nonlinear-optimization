function H = ddf2(x)
    x1 = x(1);
    x2 = x(2);
    imen = (1 + x1^2 + x2^2);

    f2_xx = -8*x1^2 / imen^2 + 2 / imen + 8*x1^2 * (x1^2 - x2^2) / imen^3 - 2 * (x1^2 - x2^2) / imen^2;
    f2_yy = 8*x2^2 / imen^2 - 2 / imen + 8*x2^2 * (x1^2 - x2^2) / imen^3 - 2 * (x1^2 - x2^2) / imen^2;
    f2_xy = 8*x1*x2*(x1^2 - x2^2) / imen^3;

    H = [f2_xx, f2_xy; f2_xy, f2_yy];
end
