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
