%% Linear Regression - Single Variable
%

%% Initialization
clear ; close all; clc

%% Part 1 - Load Data

data = readtable('age_weight_SBP.txt');
X = [data.Age, data.Weight];
y = data.SBP;
m = length(y); % number of training examples

fprintf('Normalizing features.../n');
[X mu sigma] = featureNormalize(X);

%% Part 2 - Run Gradient Descent

X = [ones(m, 1) X]; % add a column of ones to x
theta = zeros(3, 1); % initialize fitting parameters

fprintf('\nComputing initial cost ...\n')
J = computeCost(X, y, theta);
fprintf('Initial cost: %f\n', J);

fprintf('Press Enter to continue\n')
pause;

iterations = 400; % set number of iterations
alpha = 0.01; % set learning rate

 % compute gradient descent
fprintf('\nRunning gradient descent ...\n')
[theta, J_history]  = gradientDescent(X, y, theta, alpha, iterations);

fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

fprintf('\nComputing cost after gradient descent ...\n')
J = computeCost(X, y, theta);
fprintf('Cost: %f\n', J);

%% Part 3 - Test on training data
fprintf('\n Testing on training data')
fprintf('\n Age: %d \n Weight: %d', data.Age(11), data.Weight(11))
fprintf('\n SBP: %d \n', data.SBP(11))

fprintf('SBP pedicted by linear model: %d \n', X(11,:)*theta)










