function p = predict(theta, X)

m = size(X, 1);

p = zeros(m, 1);

p=((X*theta)./abs(X*theta)+1)/2;

end
