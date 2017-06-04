
clear ; close all; clc;
addpath ../;

data = csvread('master_data_50.csv');

% for i = 1 : 20
    [train_data, cv_data, test_data] = random_data_setup(data);
    % plotting the entire training set
    plot (train_data(:,1),train_data(:,2), 'rx' );
    % predicting the hypothesis line to observe visually the bias.
    theta_trained = training_algo(train_data);
    hold;
    plot (train_data(:,1),[ones(size(train_data,1),1) train_data(:,1)]*theta_trained, 'b-' );
    xlabel('x'); ylabel('h(theta)');
    hold off;
    pause;
    % you cannot train all at once. You will have to train one at a time.
    % theta_trained = training_algo(train_data);
    compute_plot_costs(train_data, cv_data, test_data);
% endfor
