function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);
m = size(X,1);
% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
for i = 1 : m 
  %both the below formulae will work. You can also use abs() instead of norm
  %min_dist = sqrt((centroids(1,:)-X(i,:))*(centroids(1,:)-X(i,:))');
  min_dist = norm(centroids(1,:)-X(i,:));
  min_idx = 1;
  for j = 2 : K
     %dist = sqrt((centroids(j,:)-X(i,:))*(centroids(j,:)-X(i,:))');
     dist = norm(centroids(j,:)-X(i,:));
     if (dist < min_dist)
        min_dist = dist;   
        min_idx = j;
     endif 
  endfor 
  idx(i) = min_idx;
endfor

% =============================================================

end

