function plotData(X, y)

figure; hold on;

admitted=find(y==1);
notadmitted=find(y==0);

plot(X(admitted,[1]),X(admitted,[2]), 'LineStyle','none','Marker','o');
plot(X(notadmitted,[1]),X(notadmitted,[2]),'LineStyle', 'none', 'Marker','*');

hold off;

end

___
  
function g = sigmoid(z)

g = zeros(size(z));

g=g+1./(1+exp(-z));

end

___
  
function [J, grad] = costFunction(theta, X, y)

m = length(y);

J = 0;
grad = zeros(size(theta));

J=-1/m*sum(y.*log(sigmoid(X*theta))+(1.-y).*log(1.-sigmoid(X*theta)));
grad=X'*(sigmoid(X*theta)-y)/m;

end

___
  
function p = predict(theta, X)

m = size(X, 1);

p = zeros(m, 1);

p=((X*theta)./abs(X*theta)+abs((X*theta)./abs(X*theta)))/2;

end

___
  
function [J, grad] = costFunctionReg(theta, X, y, lambda)

m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

J=-1/m*sum(y.*log(sigmoid(X*theta))+(1.-y).*log(1.-sigmoid(X*theta)))+(lambda/(2*m))*sum(theta(2:size(theta),:).^2);
temp=X'*(sigmoid(X*theta)-y)/m;
grad(1)=temp(1);
temp2=X'*(sigmoid(X*theta)-y)/m+lambda/m*theta;
grad(2:size(grad),:)=temp2(2:size(temp2),:);

end
