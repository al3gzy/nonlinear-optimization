% Parametri za metode
x0 = [0.5; 0.25];
beta = 0.7;
eta = 0.3;
eps = 1e-4;

%pozivamo sve četiri metode za -f1

f1_neg = @(x) -f1(x);
df1_neg = @(x) -df1(x);
ddf1_neg = @(x) -ddf1(x);

[nizx_grad, nizf_grad] = gradmetod(x0, beta, eta, eps, f1_neg, df1_neg);
% ne radi zbog armijo bektrekinga, stavljamo fiksni korak:
%[nizx_njutn, nizf_njutn] = njutn(x0, beta, eta, eps, f1_neg, df1_neg, ddf1_neg);
[nizx_net, nizf_net] = netnjutn(x0, beta, eta, eps, f1_neg, df1_neg, ddf1_neg);
[nizx_njutn, nizf_njutn] = njutn_fiksan(x0, eps, f1_neg, df1_neg, ddf1_neg);
%[nizx_net, nizf_net] = netnjutn_fiksan(x0, eps, f1_neg, df1_neg, ddf1_neg);
[nizx_kvazi, nizf_kvazi] = kvazinjutn(x0, beta, eta, eps, f1_neg, df1_neg, ddf1_neg);

% norme grad

norm_grad_grad = zeros(1, size(nizx_grad, 2));
for k = 1:size(nizx_grad, 2)
    grad = df1_neg(nizx_grad(:,k));
    norm_grad_grad(k) = norm(grad);
end

norm_grad_njutn = zeros(1, size(nizx_njutn, 2));
for k = 1:size(nizx_njutn, 2)
    grad = df1_neg(nizx_njutn(:,k));
    norm_grad_njutn(k) = norm(grad);
end

norm_grad_net = zeros(1, size(nizx_net, 2));
for k = 1:size(nizx_net, 2)
    grad = df1_neg(nizx_net(:,k));
    norm_grad_net(k) = norm(grad);
end

norm_grad_kvazi = zeros(1, size(nizx_kvazi, 2));
for k = 1:size(nizx_kvazi, 2)
    grad = df1_neg(nizx_kvazi(:,k));
    norm_grad_kvazi(k) = norm(grad);
end

% površina grafici

f1_vek = @(x, y) 1 ./ (1 + x.^2 + y.^2);
f2_vek = @(x, y) (x.^2 - y.^2) ./ (1 + x.^2 + y.^2);
f3_vek = @(x, y) (x .* y) ./ (1 + x.^2 + y.^2);

[X1, X2] = meshgrid(-1:0.05:1);

Z1 = f1_vek(X1, X2);
Z2 = f2_vek(X1, X2);
Z3 = f3_vek(X1, X2);

figure;
mesh(X1, X2, Z1);
title('Površinski prikaz f1');
xlabel('x'); ylabel('y'); zlabel('f1(x,y)');

figure;
mesh(X1, X2, Z2);
title('Površinski prikaz f2');
xlabel('x'); ylabel('y'); zlabel('f2(x,y)');

figure;
mesh(X1, X2, Z3);
title('Površinski prikaz f3');
xlabel('x'); ylabel('y'); zlabel('f3(x,y)');


% konture

figure;
contour(X1, X2, Z1, 30);
hold on;
scatter(nizx_grad(1,:), nizx_grad(2,:), 'r');
title('Konture f1 sa putem gradijentnog metoda');
xlabel('x');
ylabel('y');
hold off;

figure;
contour(X1, X2, Z2, 30);
hold on;
title('Konture f2');
xlabel('x');
ylabel('y');
hold off;

figure;
contour(X1, X2, Z3, 30);
hold on;
title('Konture f3');
xlabel('x');
ylabel('y');
hold off;


% poređenje algoritama preko normi

figure;
hold on;
plot(1:length(norm_grad_grad), norm_grad_grad, 'r', 'DisplayName', 'Gradijentni');
plot(1:length(norm_grad_kvazi), norm_grad_kvazi, 'b', 'DisplayName', 'Kvazi-Njutn');
plot(1:length(norm_grad_njutn), norm_grad_njutn, 'k', 'DisplayName', 'Njutn');
plot(1:length(norm_grad_net), norm_grad_net, 'g', 'DisplayName', 'Net-Njutn');
legend('show');
xlabel('Iteracija k');
ylabel('Norma gradijenta ||∇f(x_k)||');
title('Poređenje brzine konvergencije po normi gradijenta');
grid on;
