# **WEEK 10**

## **Gradient Descent With Large Datasets**  

*Learning with large datasets:*  
When using very large datasets, computation can be very expensive.  
Before looking at how to deal with a million examples, let's first see why not use only a 1000 examples.  
Before investing a lot of effort on developing a software, a good sanity check is to first train on a small set and plot the learning curve.  
If we find a hihg-variance algo, it is safe to assume that more data will indeed be useful.  

*Stochastic Gradient Descent:*  
The usual method we saw before is called the *Batch Gradient Descent*.  
The problem with BGD is that computing the derivative term will be very expensive if m is very large.  
Because for one step, it will be necessary to compute the sum of errors for all examples.  
With Stochastic Gradient Descent, we make one step after computing the error for just one example.  
![alt text](https://i.imgur.com/DRdhI9Q.png)  
![alt text](https://i.imgur.com/lqSBPOD.png)  
The path to the optimum will be less direct but each step will be much faster.  
1/ Randomly shuffle training examples  
2 for i=1:m {  
𝜃(j) = 𝜃(j) - 𝛼(h𝜃(xi)-yi)xij  
}  
With this method, the parameters won't stay in the global/local optimum but will wander around in some close region.  
In practice this is ok with very large datasets.  

*Mini-Batch Gradient Descent:*  
