x0 = [0.1; 0.23];
beta = 0.7;
eta = 0.3;
eps = 0.0001;

[nizx1, nizf1] = metod_proj(x0, beta, eta, eps, @f2, @df2);
[nizx2, nizf2] = metod_proj(x0, beta, eta, eps, @f2, @df2);
[nizx3, nizf3] = metod_proj(x0, beta, eta, eps, @f3, @df3);

X = -2:0.05:2;
[X1, X2] = meshgrid(X, X);
f1_vek = @(x, y) 1 ./ (1 + x.^2 + y.^2);
Z1 = f1_vek(X1, X2);

figure();
hold on;

contour(X1, X2, Z1, 20);

plot(X, -1*ones(size(X)), 'r');
plot(X,  1*ones(size(X)), 'r');
plot(-1*ones(size(X)), X, 'r');
plot( 1*ones(size(X)), X, 'r');

scatter(nizx1(1,:), nizx1(2,:), 'filled');

hold off;
