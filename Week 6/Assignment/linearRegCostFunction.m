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
