function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    
    theta = theta - (alpha/m)*((X*theta-y)'*X)'; % update theta
    
    J_history(iter) = computeCost(X, y, theta); % save cost
    
end

end