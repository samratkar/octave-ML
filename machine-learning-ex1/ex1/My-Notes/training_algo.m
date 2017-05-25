function theta_trained = train_data(train_data)
    theta = zeros(2, 1); % initialize fitting parameters
    % Some gradient descent settings
    iterations = 1500;
    alpha = 0.01;

    X_train = train_data(:,1);
    y_train = train_data(:,2);
    mtrain = size(y_train);
    X_train = [ones(mtrain, 1), X_train]; % Add a column of ones to x
    % run gradient descent
     [theta_optimum, J_history_train] = gradientDescent(X_train, y_train, theta, alpha, iterations);
     % Plot the linear fit
     % hold on; % keep previous plot visible
     % plot(X_train(:,2), X_train*theta_train, 'b-')
     % legend('Training data', 'Linear regression')
     % hold off % don't overlay any more plots on this figure
     % subplot(2,2,2)
     % plot (J_history_train);
     csvwrite("J_history_train.csv", J_history_train);
     theta_trained = theta_optimum;
end
