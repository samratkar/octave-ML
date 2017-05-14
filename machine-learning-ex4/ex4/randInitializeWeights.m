function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights
%   of a layer with L_in incoming connections and L_out outgoing
%   connections.
%
%   Note that W should be set to a matrix of size(L_out, 1 + L_in) as
%   the first column of W handles the "bias" terms
%

% You need to return the following variables correctly
W = zeros(L_out, 1 + L_in);

% ====================== YOUR CODE HERE ======================
% Instructions: Initialize W randomly so that we break the symmetry while
%               training the neural network.
%
% Note: The first column of W corresponds to the parameters for the bias unit
%epsilon_init = (sqrt(6)/sqrt(lin + lout)) = 2.45/sqrt(400+10) = 2.45 / 20.24 = 0.12

epsilon_init = 0.12;
% rand(n) creates an n*n matrix with random numbers.
% Note that Theta matrix that we find is specific to the interconnections between one
% input layer and one output layer. Hence the initialization is also to be done for each
% of the Theta matrix independently. If we have n layers, this method needs to be called
% n times to initialize the thetas of each of the layers. L_out and L_in is for the layer
% the for which initialization is being done.
% W is the matrix of L_out Vs L_in.
W = rand(L_out, 1+L_in) * 2*epsilon_init - epsilon_init;


% =========================================================================

end
