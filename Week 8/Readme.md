# **WEEK 8**

## **Clustering**  

*Unsupervised learning: Introduction:*  
Unsupervised algorithms find patterns. Clustering will be the first that we see.  
The training sets in unsupervised learning only have x, no labels y.  
Clustering algo can be useful for market segmentation, social network analysis, organise computing clusters, astronomical data analysis...

*K-means algorithm:*  
With unlabeled data, you want to group data into coherent subsets.  
K-means is by far the most popular algorithm.  
The first step is to randomly initialize points (cluster centroids μk), as many as the number of clusters you want to get.  
The the algorithm iterates on 2 steps:
- cluster assignment step: assign each data point to the closest cluster centroid  
for i=1 to n  
c(i) := index (from 1 to K) of cluster centroid closest to x(i)  
min || x(i) - μk ||^2  
- move centroid to the average of the points of the same group  
for k=1 to K  
μk := average/mean of points assigned to cluster k  

Repeat until convergence. 
This algo takes 2 inputs: K and X. x0 dropped by convention.  
If a cluster ends up with 0 points, you can eliminate it. If you really need to have K clusters, you can randomly initialize it again.  
Non-separated clusters: clusters are not very distinct from one an other.

*Optimization objective:*  
K-means algo also has a cost function that we want to minimize. Useful for 2 purposes: debugging and finding better clusters / avoid local optima.  
μc(i) := cluster centroid to which x(i) has been assigned  
![alt text](https://i.imgur.com/vkzsBL3.png) also called distortion function  
The cluster assignment step minimize J with c.  
The centroid move step minimize J with μ.

*Random initialization:*  
K must be inferior to m.  
Set μs equal to random xs.  
This randomness can give you different solutions / local optima.  
To mitigate that, try multiple initializations:  
for i=1 to 50/1000  
randomly initialize K  
use K-means  
compute J  
Finally pick the clustering with the lowest J.

*Choosing the number of clusters:*  
There is no perfect automated way to select the number of clusters.  
Usually it's chosen manually.  
The true number of clusters can be ambiguous, but this is part of unsupervised learning.  
The *elbow method* consists of computing J as a function of K number of clusters, and look for point where stops decreasing as much.  
In practice, it is not often used because the curve might not have a very well defined elbow.  
Sometimes, you use K-means with an already well defined purpose. A better way to determine K is to see how well different numbers of clusters serve that later downstream purpose.

## **Motivation**

*Motivation I: Data compression:*  
One type of unsupervised learning problem is *dimensionality reduction*.  
One reason to use it is for *data compression*, uses up less computer space + speeds up learning algo.  
Redundant features are not that rare when working with hundreds of features obtained from different sources.  
You can also reduce the dimension when certain features are highly correlated.  
You represent each training examples as a combination of new vectors.

*Motivation II: Visualization:*  
A second application of dimensionality reduction is visualization.  
If you reduce features of dimension to 2D it becomes much easier to plot it and maybe make more sense of it.

## **Principal Component Analysis**

*Principal Component Analysis: Problem formulation:*  
PCA is by far the most popular algorithm.  
Before applying PCA, it's good practice to first perform mean normalization and feature scaling.  
To reduce from n-dimension to k-dimension, find k vectors onto which to project the data so as to minimize the square projection error.  
In other words, we're going to project the data onto the linear subspace spanned by the set of vectors.  
Despite cosmetic similarity, PCA is not linear regression.

*Principal Component Analysis: Analysis algorithm:*  
Don't forget about the data preprocessing steps: mean normalization and feature scaling.  
The mathematical proof for PCA is out of the scope of this course.  
1/ Compute the co-variance matrix:  
![alt text](https://i.imgur.com/MYcl0Fp.png)  
In Octave: Sigma = 1/m * X' * X ;  
2/ Compute the *eigenvectors* of Sigma.  
In Octave: [U, S, V] = svd(Sigma) ;  
U being the matrix we're interested in, of dimensions nxn. Each column of U represents a vector.  
3/ To reduce from n dimensions to k dimensions, take the first k columns/vectors of U.  
In Octave: Ureduced = U(:, 1:k) ; dimension nxk  
4/ Finally you compute z = Ureduced^T * x ; dimension k  
In Octave: z = Ureduced' * x ;

## **Applying PCA**

*Reconstruction from compressed representation:*  
How to go back from k-dimension to n-dimension:  
Xapprox = Ureduced * z ;  

*Choosing the number of principal components:*  
K is called the number of principle compnents that were retained.  
PCA tries to minimize the average the average squared projection error.  
The total variation of the data is:  
![alt text](https://i.imgur.com/V0fHrXa.png) on average how far is a training example from the origin  
A good rule of thumb to choose K is:  
![alt text](https://i.imgur.com/ptlIZL6.png)  
"I chose K so that 99% of the variance is retained."  
One way to implement this could be:  
k = 1 ;  
while { 99% of variance is not retained }  
do { k++ }  
But this is inefficient.  
When calling svd, S is a diagonal matrix.  
For given k:  
![alt text](blob:https://imgur.com/f8da3e78-c596-4552-9069-d3d028c19b45)  

