function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)


m = size(X, 1);
num_labels = size(Theta2, 1);
size_layer1 = size(X, 2); % no of Xs inputs
size_layer2 = 25; % one added for bias
size_layer3 = 10; % output layer. So no need to add bias.


% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);



% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% Add bias for x0 to the input layer
X = [ones(m,1) X]; % 5000 * 401 matrix 
% determining the 1st hidden layer
a2 = sigmoid(Theta1 * X');  % 25 * 5000 matrix
% Add bias for a2  
a2 = [ones(1, m) ; a2]; % 26 * 5000 matrix 
a3 = sigmoid(Theta2 * a2); % 10 * 5000 matrix 

%a3 looks as following - 
%for every classifier, determining the predicted values. Each row is dedicated
%for one classifier, and that contains predicted value for all 5000 data points.
% h1 to h10 are the rows, one for each classifier. columns are the values for each 
% training set. so the matrix looks like the following - 
%   trg set 1           trg set 2     trg set 3     ...   trg set 5000
%     h1                  h1            h1                    h1
%     h2                  h2            h2                    h2
%     h3                  h3            h3                    h3
%     ..                  ..            ..                    ..
%     ..                  ..            ..                    ..
%     h_num_labels        h_numlabels   hnumlabels            h_numblabels 
% =========================================================================

[max_value, label_index] = (max(a3));
p = label_index';

end
