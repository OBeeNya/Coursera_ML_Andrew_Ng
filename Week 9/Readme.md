# **WEEK 9**

## **Density Estimation**  

*Problem motivation*  
*Anomaly detection* is a common use of ML, in an in between supervised and unsupervised learning.  
First we get a "normal" / non-anomalous dataset, on which we build a model p(x).  
Then if p(xtest) < 𝜖 for a new example, we can flag it as anomalous.  
Used in fraud detection, manufacturing, monitoring computers in data centers...

*Gaussian distribution:*  
Gaussian distribution or *normal distribution*.  
If x is distributed Gaussian, with mean 𝜇 and variance 𝜎^2 (standard devviation 𝜎):  
![alt text](https://i.imgur.com/E42UENI.png)  
![alt text](https://i.imgur.com/pxDjNDf.png)  
*Parameter estimation*, if we suspect that some examples are distributed according to a normal distribution but we don't kow the values of 𝜇 and 𝜎:  
![alt text](https://i.imgur.com/MI0j5Ro.png)  
![alt text](https://i.imgur.com/CXonuwa.png)  
These estimates are the *maximum likelihood estimates* for the primes 𝜇 and 𝜎^2.

*Algorithm:*  
Independance assumption on the values of the features x:  
![alt text](https://i.imgur.com/vz9fOHA.png)  
The problem of estimating this distribution p of x is sometimes called the problem of *density estimation*.  
1/ Choose features that might be indicative of anomalous examples.  
2/ Fit parameters 𝜇 and 𝜎 (vectorization possible):  
![alt text](https://i.imgur.com/pRdCrvD.png)  
![alt text](https://i.imgur.com/PSj7aAL.png)  
3/ Given a new example x, compute p(x):  
![alt text](https://i.imgur.com/qMT0jzu.png)  

## **Building an Anomaly Detection System**

*Developing and evaluating an anomaly detection system:*  
How to go about developing a specific application of anomaly detection.  
Remember the importance of a real-number evaluation to help making decisions / evaluate our learning algo.  
Assume we have some labeled data, anomalous and non-anomalous data.  
Training set would be composed almost only of normal examples (60%).  
CV and test sets would be composed of 20% of the remaining normal examples each + half each of the anomalous examples.  
Fit the model on the training set.  
On example x of CV set, predict y=1 if p(x)<𝜖 and y=0 if p(x)>𝜖.  
Evaluation metrics: true/false positive, true/false negatives, precision/recall, F1 score.  
Don't use classification accuracy because of skewed classes.  
To choose 𝜖, try different values on CV set and see which one maximizes the F1 score.

*Anomaly detection vs Supervised learning:*  
If we have labeled data, why don't we use supervised learning?  
Anomaly detection can be more fruitful with a very small number of positive examples and a large number of negative examples.  
We only need the negative examples to estimate p(x).  
Also with enough positiive examples, future positive examples are more likely to be similar to ones from the training set (supervised better).  

*Choosing what features to use:*  
What features you choose has a hige effect on how well the algorithm does.  
If the data doesn't look Gaussian, the algorithm will often still work fine.  
You can play with different transformations of the data to make it look more Gaussian: log(x+c), x^(1/c)...  
You can perform error analysis, as seen with supervised learning, look at examples for which predictions were wrong and see if we can come up with new features.  

## **Multivariate Gaussian Distribution**

*Multivariate Gaussian Distribution:*  
This extension can sometimes catch anomalies that the earlier algorithm didn't.  
Instead of modeling p(x1)...p(xn) separately, we're going to model p(x) all in one go.  
Parameters ![alt text](https://i.imgur.com/VTlJxgX.png) (covariance matrix)  
![alt text](https://i.imgur.com/gx4zaZr.png) with |Σ| the determinant of Σ  
This can be useful to model correlation.

*Anomaly detection using the Multivariate Gaussian Distribution:*  
1/ Fit the parameters, same formula for 𝜇, but:  
![alt text](https://i.imgur.com/dNj82lQ.png)  
2/Compute p(x)  
The multivariate model is identical to the original model. The original model has a constraint, the covariance matrix Sigma must have 0's on the off diagonal elements.  
When to use which model? The MGD automatically captures correlations between features, while the original model is computationally cheaper / scales better to large n.  
Also for the MGD, m must be > n, or else Sigma matrix is non-invertible (be also careful of redundant features).  

## **Predicting Movie Ratings**

*Problem formulation:*  
*Recommender systems* are an important application of ML.  
Notation:  
n(u) := number of users  
n(m) := number of movies  
r(i,j) = 1 if user j rated movie i  
y(i,j) = rating given by user j to movie i  
Our job would be to come up with a learning algorithm that can automatically go fill in the missing ratings.  

*Content based recommendations:*  
A first approach to recommended systems is content-based recommendation.  
Features vector in R^n+1, x0 not included.  
For each user j, learn a parameter θj in R^n+1.  
Predict user j as rating movie i with θ(j)^T.x(i).  
m(j) := number of movies rated by user j  
To learn θ(j):  
![alt text](https://i.imgur.com/hJ9we2F.png)  
which can be simplified as:  
![alt text](https://i.imgur.com/oJOXqws.png) because m is a constant  
To learn all parameters:  
![alt text](https://i.imgur.com/aD1Icfa.png)  
Gradient descent:  
![alt text](https://i.imgur.com/WGBCv1x.png) similar to linear regression except for 1/m  

## **Collaborative Filtering**

*Collaborative filtering:*  
Another recommended system.  
This algorithm can start to learn which features to use.  
Suppose we have a dataset where we don't know the values of features (i.e. which genre it relates to the most).  
If we can first get the parameters θ from the users, it becomes possible to try to infer what are the values of x1 and x2 for each movie.  
Given some parameters, to learn x(i):  
![alt text](https://i.imgur.com/6Frcay5.png)  
and to learn all features:  
![alt text](https://i.imgur.com/mtc3WgW.png)  
We first estimated parameters based on known movie ratings.  
Then we estimated features based on known parameters.  
Chicken and egg problem: which comes first?  
Guess θ, then estimate features, then estimate new parameters, and so on... until your algorithm converges to reasonable sets of features and parameters.  

*Collaborative filtering algorithm:*  
There is an efficient algorithm that doesn't need to go back and forth between the features and the parameters.  
Basically, the two previous optimization objectives but put together:  
![alt text](https://i.imgur.com/iDAEaNu.png)  
Minimize J as a function of both the features and the parameters.  
We are doing away with the convention x0=1, so the features that we are going to learn are going to be in R^n, and not R^n+1.  
We don't need to hardcode x0=1 because the algorithm can choose to learn for itself that x1=1 if necessary.  
In summary:  
1/ Initialize features and parameters to random values  
2/ Min J using gradient descent (or an advanced optimization algo), i.e. for every j=1...n(u) and i=1...n(m):  
![alt text](https://i.imgur.com/LMANC2k.png)  
In this formalization, we are regularizing every x and θ because there's no longer the special case of θ0.  
3/ For a user, predict movie rating with θT * x.

## **Low Rank Matrix Factorization**

*Vectorization: Low Rank Matrix Factorization:*  
The predicted ratings can be grouped in one matrix as follows:  
![alt text](https://i.imgur.com/RNEGUd3.png)  
which can be obtained by multiplying the 2 matrices:  
![alt text](https://i.imgur.com/7Ik916N.png)  
This is low rank matrix factorization.  
Another thing you can do is once having learned the features, you can find similar movies. If ||x(i)-x(j)|| is small.

*Implementation detail: Mean normalization:*  
If a user never rated any movies, the parameters learn would be zero matrix.  
All predicted ratings for that user would then be equal to 0 and we wouldn't be able to recommend any movie.  
To prevent that we're going to apply mean normalization:  
![alt text](https://i.imgur.com/8qE2A1G.png)  
And when predicting new rating, we add back the mu:  
θ(j)T * x(i) + μ(i)  
