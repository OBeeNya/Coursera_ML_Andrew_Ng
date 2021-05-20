function J = computeCost(X, y, theta)

m = length(y);

J = 0;

J=1/(2*m)*sum((X*theta-y).^2);

end

% gradientDescent.m

function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

m = length(y); 
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    t1= theta(1) - (alpha * ( 1/m * sum( X * theta - y) ));
    t2=theta(2) - (alpha * ( 1/m * sum((X * theta - y).*X(:,2))));

    theta(1) =t1;
    theta(2) = t2;
   
    J_history(iter) = computeCost(X, y, theta);

end

end

% featureNormalize.m

function [X_norm, mu, sigma] = featureNormalize(X)

X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));
      

mu=sum(X)/size(X,1);
sigma=std(X);
X_norm=(X-mu)./sigma;

end

% gradientDescentMulti.m

function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)

m = length(y); 
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    temp=X*theta-y;
    theta=theta-alpha/m*X'*temp;
   
    J_history(iter) = computeCostMulti(X, y, theta);

end

end

% normalEqn.m

function [theta] = normalEqn(X, y)

theta = zeros(size(X, 2), 1);

theta=pinv((X'*X))*X'*y;

end
