function compute_plot_costs(train_data, cv_data, test_data, theta_trained)

% Plot Data before adding bias.
 X_cv = cv_data(:,1);
 y_cv = cv_data(:,2);
 X_train = train_data(:,1);
 y_train = train_data(:,2);
 X_test = test_data(:,1);
 y_test = test_data(:,2);
 mtest = size(y_test);
 mcv = size(y_cv);
 mtrain = size(y_train);

 X_cv = [ones(mcv, 1), X_cv]; % Add a column of ones to x
 X_train = [ones(mtrain, 1), X_train]; % Add a column of ones to x
 X_test = [ones(mtest, 1), X_test]; % Add a column of ones to x
 %% ===================Cost with increasing training set - Jcv and Jtrain============
 Jcv = zeros(mcv, 1);
 Jtrain = zeros(mcv, 1);
 Jtest = zeros(mtest,1);
 for i = 1 : mcv
    Jcv(i) = computeCost(X_cv(1:i,:), y_cv(1:i,:), theta_trained);
    Jtrain(i) = computeCost(X_train(1:i,:), y_train(1:i,:), theta_trained);
    Jtest(i) = computeCost(X_test(1:i,:), y_test(1:i,:), theta_trained);
 endfor

 hold on;
  plot(Jtrain,'b');
  plot (Jcv,'r');
  plot (Jtest,'g');
  legend ("Jtrain","Jcv", "Jtest");
  xlabel('No. of training set'); ylabel('J(theta)');

 % csvwrite("J_cv.csv", Jcv);
 % csvwrite("J_train.csv", Jtrain);
end
