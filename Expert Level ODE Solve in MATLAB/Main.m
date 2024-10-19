clear
close all
clc

%% ODE Function

% X(1) = x, X(2) = y, X(3) = z

Sigma = 10;
Rho = 28;
Beta = 8/3;

ODEFun = @(t, X) [ Sigma * (-X(1) + X(2))
                   -X(1) * X(3) + Rho * X(1) - X(2)
                   X(1) * X(2) - Beta * X(3)];



%% ODE Specs
dt = 0.001;
tSpan = [0, 50];
T = tSpan(1) : dt : tSpan(end);

Y0 = ones(3, 1);

%% ODE Solve Main Loop

% X(n + 1) = X(n) + dt * f(x) 
NumSteps = numel(T);
X = zeros(3, NumSteps);
X(:, 1) = Y0;

for i = 1:NumSteps - 1
    X(:, i + 1) = X(:, i) + dt * ODEFun(T(i), X(:, i));
end


%% Plotting

figure(1)
subplot(3, 1, 1)
plot(T, X(1, :), "LineWidth", 2)
subplot(3, 1, 2)
plot(T, X(2, :), "LineWidth", 2)
subplot(3, 1, 3)
plot(T, X(3, :), "LineWidth", 2)


figure(2)
plot3(X(1, :), X(2, :), X(3, :), "LineWidth", 1.5)