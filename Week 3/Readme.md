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
  ![alt text](https://i.imgur.com/wDYRpt1.png)  
  therefore  
  ![alt text](https://i.imgur.com/IUGfeEc.png)  
  Vectorized implementation:  
  ![alt text](https://i.imgur.com/ZZifZh2.png)  
  The formula of gradient descent is identical to the one for multivariate linear regression.  
  Vectorized implementation of gradient descent:  
  ![alt text](https://i.imgur.com/hD8i4Y3.png)  
  
*Advanced optimization:*  
  Other techniques allow for better optimizations of cost functions than gradient descent, especially on large scales.  
  Such as *conjugate gradient*, *BFGS* and *L-BFGS*.  
  We will not look at the details of those algorithms (more advanced).  
  Some of there interesting properties: no need to define an α and usually faster computation.  
  It's not recommanded to write your own algorithms for those, but better to use already well implemented software libraries.  
  Look at the documentation of each pre-existing function to properly understand how to use them, what inputs are expected are what outpurs are produced.  
  
## **Multiclass Classification**

*Multiclass classification: One-vs-all:*  
  Instead of a binary classification problem where we have y={0;1}, we have y={0;1;2;...;n}.  
  The method is to chose one class and apply binary logistic regression to evaluate its probability, against all other classes.  
  Repeat for each class.  
  For the prediction with a new input, we can select the hypothesis that returned the maximum probability.
  
## **Solving the Problem of Overfitting**

*The problem of overfitting:*  
  When working on a hypothesis function, we might be underfitting (high bias) or overfitting.  
  In the case of overfitting (usually when we have too many features), the hypothesis might fit perfectly thez training set but fails to generalize to new examples.  
  Plotting / visualizing to intuitively detect the position we're in might be too difficult when using too many features.  
  The two main options to address that issue are :  
  - reducing the number of features (manually or with *model solution algorithm*), but maybe all features are useful;  
  - use *regularization*, we keep all the features but reduce the magnitude of the parameters, works well with a lot of slightly useful features.

*Cost function:*  
  Regularization consists of adding the parameters to the cost function so that when we try to minimze the cost function, we also are minimizing the parameters.  
  We are *penalizing* the parameters.  
  Using smaller values for the parameters forms a "simpler" hypothesis.  
  We don't know which parameters to pick in advance so we add them all as follows:  
  ![alt text](https://i.imgur.com/FtamwUj.png)  
  The added term is the *regularization term* and 𝜆 is the *regularization parameter*.  
  By convention we do not penalize 𝜃0.  
  If 𝜆 is too large, we will penalize the parameters too much and the hypothesis function will be underfitting.  
  
*Regularized linear regression:*  
  The updated formula for gradient descent is as follows (we update 𝜃0 separately as said before):  
  ![alt text](https://i.imgur.com/tQhcMzr.png)  
  We can take out the part concerning 𝜃, so that on every iteration we are shrinking 𝜃 a little:  
  ![alt text](https://i.imgur.com/4913XjM.png)  
  Updated formula for the normal equation:  
  ![alt text](https://i.imgur.com/uLO3nRR.png)  
  L of dimensions (n+1)x(n+1), and we do not include x0.  
  This also resolves the issue of noninvertability.  

*Regularized logistic regression:*  
  Updated cost function:  
  ![alt text](https://i.imgur.com/mpGpXbr.png)  
  Updated gradient descent formula looks identical to regularized linear regression, just remember that h0(x) represents the sigmoid function.
