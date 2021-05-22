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
Instead of m examples or 1 example in each iteration, we'll train over b examples in one iteration.  
b = mini-batch size, typically in [2 ; 100]  
Repeat:  
![alt text](https://i.imgur.com/ZT7EB13.png)  
Just like SGD, this is faster than BGD.  
But it can also be more effective than SGD because with proper vectorization, it allows for partial parallelized computation.  
One disadvantage is having to determine an additional parameter.  

*Stochastic Gradient Descent Convergence:*  
With SGD, it is not smart to plot J(train) as a function of the number of iterations because the point is to start making progress after looking at just a single example.  
So we can compute the cost (𝜃, (x(i), y(i))) right before updating 𝜃.  
Then every 1000 or so iterations, plot the cost averaged over the last 1000 examples.  
It might be useful to play with 𝛼 and the number of avergaed examples to get a meaningful plot.  
𝛼 is typically held constant. Wen can slowly decrease it over time if we want 𝜃 to converge, but in practice it is rarely done.

## **Advanced Topics**

*Online learning:*  
