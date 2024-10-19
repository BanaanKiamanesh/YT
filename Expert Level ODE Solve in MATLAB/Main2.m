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
tSpan = [0, 50];
% tSpan = linspace(0, 50, 100000);
Y0 = ones(3, 1);

%% ODE Solve Main Loop

opt = odeset("RelTol", 1e-6, "AbsTol", 1e-7, "Stats", "on", "OutputFcn", @(t, y, flag) ProgressBar(t, y, flag, tSpan));
[T, X] = ode23(ODEFun, tSpan, Y0, opt);
X = X';

% %% Plotting
% 
% figure(1)
% subplot(3, 1, 1)
% plot(T, X(1, :), "LineWidth", 2)
% subplot(3, 1, 2)
% plot(T, X(2, :), "LineWidth", 2)
% subplot(3, 1, 3)
% plot(T, X(3, :), "LineWidth", 2)
% 
% 
% figure(2)
% plot3(X(1, :), X(2, :), X(3, :), "LineWidth", 1.5)