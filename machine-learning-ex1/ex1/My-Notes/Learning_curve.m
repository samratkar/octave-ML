clear ; close all; clc;
addpath ../;

data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples
mtrain = fix(0.60 * m);
mcv = fix(0.20*m);
mtest = fix(0.20* m);

if ((mtest+mtrain+mcv) != m)
    mtrain = mtrain + 1;
endif
jumbled_indices = randperm(m);

start_index=1;
end_index=start_index + mtrain - 1;
train_data = data(jumbled_indices(start_index:end_index),:);

start_index=end_index + 1;
end_index=start_index + mcv - 1;
cv_data = data (jumbled_indices(start_index:end_index),:);

start_index=end_index + 1;
end_index = start_index + mtest - 1;
test_data = data(jumbled_indices(start_index:end_index),:);

csvwrite ("train_data.csv", train_data);
csvwrite ("cv_data.csv", cv_data);
csvwrite ("test_data.csv", test_data);


%% =================== Training the theta using gradient descent ===================
theta = zeros(2, 1); % initialize fitting parameters
% Some gradient descent settings
iterations = 1500;
alpha = 0.01;

% Plot Data before adding bias. 
 X_train = train_data(:,1);
 y_train = train_data(:,2);
 X_cv = cv_data(:,1);
 y_cv = cv_data(:,2);

 subplot(2,2,1);
 plot(X_train, y_train, 'r+');


 X_train = [ones(mtrain, 1), X_train]; % Add a column of ones to x
% run gradient descent
 [theta_train, J_history_train] = gradientDescent(X_train, y_train, theta, alpha, iterations);

 % Plot the linear fit
 hold on; % keep previous plot visible
 plot(X_train(:,2), X_train*theta_train, 'b-')
 legend('Training data', 'Linear regression')
 hold off % don't overlay any more plots on this figure
 subplot(2,2,2)
 plot (J_history_train);

 %% ===================Cost with increasing training set - Jcv and Jtrain============
 for i = 1 : mcv
    Jcv(i) = computeCost(X_cv, y_cv, theta);
    Jtrain(i) = computeCost(X_train, y_train, theta);
 endfor
 subplot(2,2,3)
 plot (Jcv);
 hold on;
 plot(Jtrain);
