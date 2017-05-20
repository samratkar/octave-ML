data_set = csvread ("data1.csv");
h_theta = data_set(:,1);  % g(z). Note that this is always between 0 to 1 as it is a probability
j_theta1 = -log(h_theta); % y = 1
j_theta2 = -log (1-h_theta); % y = 0

% j_theta1 = data_set(:,2); % when y = 1, j_theta1 = - log(h_theta)
% j_theta2 = data_set(:,3); % when y = 0, j_theta2 = - log(1-h_theta)
% Note that the final cost function that we get is summarised in one line as follows -
%*********************************************************************
% Sigma(-y*j_theta1 - (1-y)*j_theta2) **Summation is from 1 to m.
%*********************************************************************
% See that y acts as a switch to make the terms on or off.
% When y=1, I need to consider only theta1. So, I need to make theta2 as zero.
% So, the switch with theta2 is made as 1-y.
% Similarly when y=0, first term needs to be made off, so it is multiplied with y.
figure; hold on;
plot( h_theta, j_theta1, 'r');
plot( h_theta, j_theta2, 'b');
% Labels and Legend
xlabel('h(theta)')
ylabel('J(theta)')
% Specified in plot order
legend('j1(theta) when y=1', 'j2(theta) when y=0')
hold off;
 % A new file is being created because otherwise, one huge matrix will be
 % created with space which will be a union of both the data sets
data_set1 = csvread ("data2.csv");
number_series = data_set1(:,1);
figure;hold on;
plot(number_series, log(number_series), 'g');
xlabel('x')
ylabel('log(x)')
hold off;
