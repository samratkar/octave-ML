function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
% p is a column vector of prediction for each of the 5000 data row.
% We need to fine p for each data entry and find the max classifier amoung 10
p = zeros(m, 1);

% classifier vector
h = zeros(num_labels, m);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       

%feature matrix is such that each row x0 to xn. And theta is such that each row has 
%the values for each x. So the classifier will be h = X'theta or theta' X. 
%I would like to have the predicted values in row vector, so I will use theta' X.

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
h = sigmoid (all_theta * X');
[max_value, label_index] = (max(h));

p = label_index';
% =========================================================================


end
