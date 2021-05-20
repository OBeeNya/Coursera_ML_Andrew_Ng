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
