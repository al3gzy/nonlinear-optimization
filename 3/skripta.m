x0 = [1; 1];
beta = 0.7;
eta = 0.3;
eps = 1e-4;
t = [1 2 3 4 5]';
y = [0.8 1.5 0.9 -0.7 -1.5]';

% metode
[nizx_gn, ~] = gaus_njutn(x0, beta, eta, eps);
xopt_gn = nizx_gn(:, end);

[nizx_lma, ~] = lma(x0, beta, eta, eps);
xopt_lma = nizx_lma(:, end);

% crtanje
t_mreza = 0:0.1:6;
figure;
hold on;
grid on;

scatter(t, y, 'r', 'filled'); % podaci
plot(t_mreza, regr(xopt_gn, t_mreza), 'c', 'DisplayName', 'Gaus-Njutn');
plot(t_mreza, regr(xopt_lma, t_mreza), 'b--', 'DisplayName', 'LMA');
plot(t_mreza, regr(x0, t_mreza), 'g');

xlim([0 6]);
ylim([-2 2]);

% predikcija za y6
y6_gn = regr(xopt_gn, 6); %
y6_lma = regr(xopt_lma, 6);
fprintf('Predikcija za t = 6 (GN): y6 = %.4f\n', y6_gn);
fprintf('Predikcija za t = 6 (LMA): y6 = %.4f\n', y6_lma);
