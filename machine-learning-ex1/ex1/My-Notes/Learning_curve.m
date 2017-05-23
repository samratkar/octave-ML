clear ; close all; clc;
addpath ../;

%% ======================= Part 2: Plotting =======================
fprintf('Plotting Data ...\n')
data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2);


m = length(y); % number of training examples

% Plot Data
% Note: You have to complete the code in plotData.m
subplot(2,2,1);
plot(X, y, 'r+');


%% =================== Part 3: Cost and Gradient descent ===================

X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

% run gradient descent
[theta, J_history] = gradientDescent(X, y, theta, alpha, iterations);

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, 'b-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

subplot(2,2,2)
plot (J_history);
