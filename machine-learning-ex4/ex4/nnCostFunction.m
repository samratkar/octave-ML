function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices.
%
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
% reshape(vector input, number of rows, number of columns)
% Here Theta1 is reashaped into the original matrix of number of rows = hidden layer size (y's)
%and number of columns = X's = input layer + 1
% 25 * 401 matrix
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

%number of columns is equal to the hidden layer (X's) and number of rows = output layer = num_labels.
% 10 * 26 matrix
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);

% You need to return the following variables correctly
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

size_layer1 = size(X, 2) + 1; % no of Xs inputs + x0
size_layer2 = 25; % one added for bias
size_layer3 = 10; % output layer. So no need to add bias.


%Identify matrix encoder
I = eye(num_labels); %10 * 10 matrix of Identity encoder. it is always num_labels * num_labels
%Transforming the y into encoded Y with the help of the identity encoder.
Y = zeros(m, num_labels); % 5000 * 10 matrix
for i=1:m
  Y(i, :)= I(y(i), :);
end

%FORWARD PROPAGATION.
A1 = [ones(m, 1) X]; % 5000 * 401 matrix
%Theta1 = 25*401 matrix. So Theta1' is 401*25 matrix. So Z2 = 5000*25 matrix
Z2 = A1 * Theta1'; % 5000 * 25 matrix
A2 = [ones(size(Z2, 1), 1) sigmoid(Z2)]; % 5000*26 matrix
% Theta2 is 10*26 matrix. So Theta2' is 26*10 matrix
Z3 = A2*Theta2'; % 5000*10 matrix
H = A3 = sigmoid(Z3); % 5000*10 matrix


penalty = (lambda/(2*m))*(sum(sum(Theta1(:, 2:end).^2, 2)) + sum(sum(Theta2(:,2:end).^2, 2)));

%Cost function is the cummulative cost of the entire neural network.
%Although we have 3 layers here. But the below vectorized formulation of cost function
%will work for any number of layers. sum(a,2) gives sum of all elements of each row, in a column vector.
%So, the following internal sum of J is a column vector of one column and 5000 rows. Each row
%gives the sum of the cost of one trainings set.
%Always remember that the cost function is sum of all the costs (difference between output and target)
%for each target combinations. So, we are here summing the values of each cell across each row,
%and we get a cummulative cost for each row.
%then we do the external sum() for all the cost elements for each row, to get the cummulative cost
%for the entire network.
J = (1/m)*sum(sum((-Y).*log(H) - (1-Y).*log(1-H), 2));
J = J + penalty;


%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the
%               first time.
%

% BACKWARD PROPAGATION
Sigma3 = A3 - Y; % 5000*10 matrix
Sigma2 = (Sigma3*Theta2 .* sigmoidGradient([ones(size(Z2, 1), 1) Z2]))(:, 2:end);


Delta_1 = Sigma2'*A1;
Delta_2 = Sigma3'*A2;


% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

Theta1_grad = Delta_1./m + (lambda/m)*[zeros(size(Theta1,1), 1) Theta1(:, 2:end)];
Theta2_grad = Delta_2./m + (lambda/m)*[zeros(size(Theta2,1), 1) Theta2(:, 2:end)];

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
