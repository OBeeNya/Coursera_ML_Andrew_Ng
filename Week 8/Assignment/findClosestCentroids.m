function idx = findClosestCentroids(X, centroids)

K = size(centroids, 1);

idx = zeros(size(X,1), 1);

distance = zeros(size(X,1),size(centroids,1));

for i=1:size(X,1)
   for j=1:K
      distance(i,j) = sqrt(sum((X(i,:)-centroids(j,:)).^2)); 
   end
end

for i=1:size(X,1)
    [~,idx(i)] = min(distance(i,:));
end

end

___
  
function centroids = computeCentroids(X, idx, K)

[m n] = size(X);

centroids = zeros(K, n);

sumC = zeros(K,n);

for i=1:K
    for j=1:m
        if(idx(j)==i)
           sumC(i,:) = sumC(i,:) + X(j,:); 
        end
        centroids(i,:) = 1 / sum(idx(:)==i) * sumC(i,:);
    end
end

end

___
      
function centroids = kMeansInitCentroids(X, K)

centroids = zeros(K, size(X, 2));

randidx = randperm(size(X,1));

centroids = X(randidx(1:K),:);

end

___
  
function [U, S] = pca(X)

[m, n] = size(X);

U = zeros(n);
S = zeros(n);

Sigma = 1/m * X' * X ;
[U, S, ~] = svd(Sigma);

end

___
  
function Z = projectData(X, U, K)

Z = zeros(size(X, 1), K);

U_reduced = U(:, 1:K) ;
Z = X * U_reduced ;

end

___
  
function X_rec = recoverData(Z, U, K)

X_rec = zeros(size(Z, 1), size(U, 1));

U_reduced = U(:, 1:K) ;
X_rec = Z * U_reduced' ;

end
