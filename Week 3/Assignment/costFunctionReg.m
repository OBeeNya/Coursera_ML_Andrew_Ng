function [J, grad] = costFunctionReg(theta, X, y, lambda)

m = length(y);

J = 0;
grad = zeros(size(theta));

J=-1/m*sum(y.*log(sigmoid(X*theta))+(1.-y).*log(1.-sigmoid(X*theta)))+(lambda/(2*m))*sum(theta(2:size(theta),:).^2);
temp=X'*(sigmoid(X*theta)-y)/m;
grad(1)=temp(1);
temp2=X'*(sigmoid(X*theta)-y)/m+lambda/m*theta;
grad(2:size(grad),:)=temp2(2:size(temp2),:);

end
