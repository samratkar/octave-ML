
clear ; close all; clc;
addpath ../;

data = csvread('master_data.csv');

for i = 1 : 20
    [train_data, cv_data, test_data] = random_data_setup(data);
    theta_trained = training_algo(train_data);
    compute_plot_costs(train_data, cv_data, test_data, theta_trained);
endfor
