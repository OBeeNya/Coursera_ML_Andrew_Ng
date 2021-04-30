# **WEEK 3**

## **Classification and Representation**  

*Classification:*  
  Classification problems are better resolved with a *logistic regression* algorithm.  
  An attempt at using linear regression can be made, by mapping predictions greather than 0.5 to 1 and lesser to 0 (*threshold classifier*), but this solution doesn't work very well because classification is not actually a linear function.  
  A *binary classification* problem is where y can only take 2 values.  
  For more than 2 values, we talk about *multiclass classification*.  
  
*Hypothesis representation:*  
  We want the output of our hypothesis function to be between 0 and 1.  
  To obtain that, we use the *sigmoid function* or *logistic function*:  
  ![alt text](https://i.imgur.com/632nilD.jpg)  
  where we replace z by θ^Tx / h(x).  
  Plotting of g(z):  
  ![alt text](https://i.imgur.com/vDgnDsj.jpg)  
  Function asymptote 0 in -∞ and asymptote 1 in +∞.  
  Interpretation:  
  g(hθ(x)), which becomes hθ(x) gives us the probability that our output is 1.  
  ![alt text](https://i.imgur.com/ipMfo87.jpg)  
  
*Decision boundary:*  
  y=1 if hθ(x)>0.5, meaning if θ^Tx>0.  
  y=0 if θ^Tx<0.  
  The *decision boundary* is the line that separates the area here y=0 and where y=1.  
  For example, if θ=[a; b; c], y=1 if a+bx1+cx2>0, or bx1+cx2>-a.  
  As for linear regression, the input to the sigmoid function can be of a complex form, e.g. hθ(x)=θ0+01x^2+θ2x1x2^2...
  
## **Logistic Regression Model**

*Cost function:*  
  We cannot use the same cost function that we use for linear regression because the logistic function will cause the ouput to be wavy, causing many local optima (i.e. not a convex function).  
  The cost function that corrects this is as follows:  
  ![alt text](https://i.imgur.com/ll99evX.png)  
  ![alt text](https://i.imgur.com/Xuhwp2G.jpg) ![alt text](https://i.imgur.com/9fDbNPA.jpg)  
  
*Simplified cost function and gradient descent:*  
  We can regroup the two cost functions into one equation as follows:  
  
