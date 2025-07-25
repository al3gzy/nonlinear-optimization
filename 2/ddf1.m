function H = ddf1(x)
    x1 = x(1);
    x2 = x(2);
    imen = (1 + x1^2 + x2^2);

    f1_xx = (8*x1^2) / imen^3 - 2 / imen^2;
    f1_yy = (8*x2^2) / imen^3 - 2 / imen^2;
    f1_xy = (8*x1*x2) / imen^3;

    H = [f1_xx, f1_xy; f1_xy, f1_yy];
end
