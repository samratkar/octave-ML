function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma.
%
%               Note that X is a matrix where each column is a
%               feature and each row is an example. You need
%               to perform the normalization separately for
%               each feature.
%
% Hint: You might find the 'mean' and 'std' functions useful.
%

mu = mean (X);
sigma = std (X);

% X_norm = [(X(:,1) - mu(1))/sigma(1), (X(:,2) - mu(2))/sigma(2)];
% We are normalizing the x1 and x2 separately, by finding the mean and starndard deviation
% separately and then doing the normalization over each of the feature matrix.
% Although the normalization is done on each of the features separately, it is found that
% still the different x's are nomalized to the same scale. This is because this method
% transforms a given distribution of the values, into a standard normal distribution,
% which lies in the same bell curve centered in the mean and spread across the std deviation
% of the distribution. The percentage of the distribution of the values are standard
% so, the values that we get as a reminder of the below computation would be similar.  
X_norm = (X.-mu)./sigma;

% ============================================================

end
