function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

m = length(y);

J = 0;
grad = zeros(size(theta));

h = X * theta;
J = 1/(2*m) * sum((h-y).^2) + lambda/(2*m)*(sum(theta(2:end).^2));

grad(1) = 1/m * sum((h-y).*X(:,1));
tempg = X'*(h-y)/m + lambda/m*theta;
grad(2:end,:) = tempg(2:end,:);

grad = grad(:);

end

___
  
function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)

m = size(X, 1);

error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i=1:m
    thetatemp = trainLinearReg(X(1:i,:), y(1:i), lambda);
    [error_train(i),~] = linearRegCostFunction(X(1:i,:), y(1:i),thetatemp,0);
    [error_val(i),~] = linearRegCostFunction(Xval, yval,thetatemp,0);
end

end

___
  
function [X_poly] = polyFeatures(X, p)

X_poly = zeros(numel(X), p);

for i=1:p
   X_poly(:,i) = X.^i;
end

end

___
  
function [lambda_vec, error_train, error_val] = ...
    validationCurve(X, y, Xval, yval)

lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

error_train = zeros(length(lambda_vec), 1);
error_val = zeros(length(lambda_vec), 1);

for i=1:length(lambda_vec)
   lambda = lambda_vec(i);
   theta = trainLinearReg(X,y,lambda);
   [error_train(i),~] = linearRegCostFunction(X, y,theta,0);
   [error_val(i),~] = linearRegCostFunction(Xval, yval,theta,0);
end

end
