function [J, grad] = lrCostFunction(theta, X, y, lambda)
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

J=-1/m*sum(y.*log(sigmoid(X*theta))+(1.-y).*log(1.-sigmoid(X*theta)))+(lambda/(2*m))*sum(theta(2:size(theta),:).^2);
temp=X'*(sigmoid(X*theta)-y)/m;
grad(1)=temp(1);
temp2=X'*(sigmoid(X*theta)-y)/m+lambda/m*theta;
grad(2:size(grad),:)=temp2(2:size(temp2),:);

grad = grad(:);

end

___
  
function [all_theta] = oneVsAll(X, y, num_labels, lambda)

m = size(X, 1);
n = size(X, 2);

all_theta = zeros(num_labels, n + 1);

X = [ones(m, 1) X];

initial_theta=zeros(n+1,1);
options=optimset('GradObj','on','MaxIter',50);

for i = 1:num_labels
    all_theta(i,:)=fmincg(@(t)(lrCostFunction(t,X,(y==i),lambda)),initial_theta,options);
end

end

___
  
function p = predictOneVsAll(all_theta, X)

m = size(X, 1);
num_labels = size(all_theta, 1);

p = zeros(size(X, 1), 1);

X = [ones(m, 1) X];

[~,p]=max(X*(all_theta'),[],2);

end

___
             
