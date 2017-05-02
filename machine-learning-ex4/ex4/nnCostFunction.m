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
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

%number of columns is equal to the hidden layer (X's) and number of rows = output layer = num_labels.
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

% Add bias for x0 to the input layer. Point to be noted is that we are using X here.
X = [ones(m,1) X]; % 5000 * 401 matrix
% determining the 1st hidden layer. Point to be noted is that we are using X' here.
a2 = sigmoid(Theta1 * X');  % 25 * 5000 matrix
% Add bias for a2.
a2 = [ones(1, m) ; a2]; % 26 * 5000 matrix
%Point to be noted is that we are using X here, and not X', because X is already transposed
%due to the previous layer's matrix multiplication.
a3 = sigmoid(Theta2 * a2); % 10 * 5000 matrix

%J =  (1/m)*sum (-y.* log (a3) - (1-y).* log (1-a3));
J = (1/m)*sum(sum((-y).*log(a3) - (1-y).*log(1-a3), 2));

%J = -1 * (1/m) * J;
%J = (1/m) * sum(( log(a3)*(-y) - log(1-a3)*(1-y) )) ;% + (lambda/(2*m)) * sum(Theta2(2:26).^2));
% GEEMA CODING --
%J = (1/m) * sum(( log(a3)*(-y) - log(1-a3)*(1-y) )) ;% + (lambda/(2*m)) * sum(Theta2(2:26).^2);
%I AM BAYMAX YOUR PERSONAL HEALTHCARE COMPANION.
%-------------------------
%Theta1_grad = 1/m * X' * (a1 - y);
%Theta1_grad = grad (2:size_layer1) + lambda/m * theta (2:size_layer1) ;

%Theta2_grad = 1/m * X' * (sigmoid(X * theta) - y);
%Theta2_grad = grad (2:size_layer1) + lambda/m * theta (2:size_layer1) ;


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
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
