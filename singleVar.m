%% Linear Regression - Single Variable
%
%   Implementation of single variable linear regression to predict
%   the Systolic Blood Pressure (SBP). There are two input variables
%   to chose from in the "age_weight_SBP.txt" file, age and weight
%   

%% Initialization
clear ; close all; clc

%% Part 1 - Load Data

data = readtable('age_weight_SBP.txt');
X = data.Age; y = data.SBP;
m = length(y); % number of training examples

fprintf('Plotting Data ...\n')

plotData(X, 'Age', y, 'SBP');

fprintf('Press Enter to continue\n')
pause;

%% Part 2 - Run gradient descent

X = [ones(m, 1), X]; % add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

fprintf('\nComputing initial cost ...\n')
J = computeCost(X, y, theta);
fprintf('Initial cost: %f\n', J);

fprintf('Press Enter to continue\n')
pause;

iterations = 1500; % set number of iterations
alpha = 0.0001; % set learning rate

 % compute gradient descent
fprintf('\nRunning gradient descent ...\n')
[theta, J_history]  = gradientDescent(X, y, theta, alpha, iterations);

fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);

fprintf('\nComputing cost after gradient descent ...\n')
J = computeCost(X, y, theta);
fprintf('Cost: %f\n', J);

%% Part 3 - Visualizing Model

fprintf('Plotting Linear Fit ...\n')
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')

fprintf('Press Enter to continue\n')
pause;

% Build grid of values to compute cost
theta0_vals = linspace(0.05, 0.15, 100);
theta1_vals = linspace(0, 3, 100);

% Intialize J_vals matrix
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Compute J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

% transpose J_vals to work with surf function
J_vals = J_vals';

fprintf('Plotting Surface and Contour ...\n')
surfContourData(theta0_vals, theta1_vals, J_vals, theta);

fprintf('Done! Press Enter to exit.\n')
pause;
%%