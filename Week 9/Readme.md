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
