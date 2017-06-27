function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
steps_array = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
array_size = size(steps_array,2);
array_index = 1;
for i = 1 : array_size
  for j = 1 : array_size
    C = steps_array(i);
    sigma = steps_array(j);
    model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    predictions = svmPredict(model, Xval);
    pred_error(array_index) = mean(double(predictions ~= yval));
    c_array(array_index)= C;
    sigma_array(array_index)=sigma;
    array_index ++;
  endfor
endfor

[min_error_val, min_index] = min (pred_error);
C = c_array(min_index);
sigma = sigma_array(min_index);


% =========================================================================

end
