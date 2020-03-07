function [X_norm, mu, sigma] = featureNormalize(X)

X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

mu = mean(X_norm); % compute mean of the feature
X_norm = X_norm - mu; % substract mean from the dataset
sigma = std(X); % compute standard deviation
X_norm = X_norm./ sigma; % divide by standard deviation

end

