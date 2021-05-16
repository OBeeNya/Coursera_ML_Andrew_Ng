# **WEEK 9**

## **Density Estimation**  

*Problem motivation*  
*Anomaly detection* is a common use of ML, in an in between supervised and unsupervised learning.  
First we get a "normal" / non-anomalous dataset, on which we build a model p(x).  
Then if p(xtest) < 𝜖 for a new example, we can flag it as anomalous.  
Used in fraud detection, manufacturing, monitoring computers in data centers...

*Gaussian distribution:*  
