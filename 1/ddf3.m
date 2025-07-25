function H = ddf3(x)
    x1 = x(1);
    x2 = x(2);
    imen = (1 + x1^2 + x2^2);

    f3_xx = 8*x1^3*x2 / imen^3 - 6*x1*x2 / imen^2;
    f3_xy = -2*x1^2 / imen^2 + 8*x1^2*x2^2 / imen^3 + 1 / imen - 2*x2^2 / imen^2;
    f3_yy = 8*x1*x2^3 / imen^3 - 6*x1*x2 / imen^2;

    H = [f3_xx, f3_xy; f3_xy, f3_yy];
end
