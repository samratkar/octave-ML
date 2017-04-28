function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
positive_positions_vector = find(y == 1);
negative_positions_vector = find(y == 0);
Positive_cases_exam1_score_vector = X(positive_positions_vector,1); 
Positive_cases_exam2_score_vector = X(positive_positions_vector,2);
%plotting the positive cases
plot(Positive_cases_exam1_score_vector, Positive_cases_exam2_score_vector, "k+", 
     "LineWidth",2, "MarkerSize",7);

Negative_cases_exam1_score_vector = X(negative_positions_vector,1); 
Negative_cases_exam2_score_vector = X(negative_positions_vector,2);
%plotting the negative cases
plot(Negative_cases_exam1_score_vector, Negative_cases_exam2_score_vector, "ko", 
  'MarkerFaceColor', 'y', 'MarkerSize', 7);

% =========================================================================



hold off;

end
