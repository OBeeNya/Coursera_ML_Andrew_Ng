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
