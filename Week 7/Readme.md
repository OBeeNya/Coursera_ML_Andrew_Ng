# **WEEK 7**

## **Large Margin Classification**  

*Optimization objective:*  
Support Vector Machine (SVM) is a very powerful and widely used algorithm, and can sometimes give a cleaner way of learning non-linear functions than logistic regression and neural networks.  
We are going to tweak the cost function so that the hypothesis equations are represented as such:  
![alt text](https://i.imgur.com/KD5GiG1.png)  
So we want h(x) to be superior to 1 if y=1, and inferior to -1 if y=0.  
Instead of having it superior and inferior to 0.  
The equation for the cost function is as follows:  
![alt text](https://i.imgur.com/gKVL71F.png)  
Where we got rid by convention of 1/m, the values of the parameters being identical when minimizing the cost function.  
Also we are not controlling anymore the values of the parameters with lambda, but the we are optimizing the first term with C.  
When the cost function for logistic regression could be written as A + 𝜆B, here we have CA + B.

*Large margin intuition:*  
SVM is also called large margin classifier because it will find the parameters separating the data with the largest margin possible.  
In presence of outliers, the boundary will be dependant on the value of C (higher C means more consideration regarding outliers).  

*Mathematics behind large margin classification:*  
Orthogonal projection of a vector onto an other and magnitude *p*.  
![alt text](https://i.imgur.com/nNJssjr.jpg)  
p is either positive or negative, depending on the angle of the two vectors.  
![alt text](https://i.imgur.com/hOXeZ4n.jpg)  
with ![alt text](https://i.imgur.com/CZ2PORj.jpg)  
The objective of the optimization is to minimize the square norm of the vector theta.  
![alt text](https://i.imgur.com/SH86HZp.jpg)  
so we want the right term be >1 or <-1.  
If the boundary doesn't have a large margin, so close to the training examples, p(i) will be pretty small (positively or negatively).  
So in order to have the right term >1 or <-1, we would need a large theta.  
But we want to find a set of parameters where the norm of theta is small.  
If the boundary has a large margin, p(i) will be larger, and we won't need such a large theta.

## **Kernels**

*Kernels I:*  
We've seen previously that we could use polynomial features to describe non linear functions. But those can be quite expensive.  
Let's define new features.  
We can start by defining some landmarks l(i).  
The new feature f:  
![alt text](https://i.imgur.com/xx706gL.jpg)  
This specific kernel is a *gaussian kernel*.  
If x and l are similar, k will be close to 1.  
If x is far from l, k will be close to 0.  
If sigma is large, f will derive more slowly.  
We precdict y=1 if theta*f>0.

*Kernels II:*  
In practice we set landmarks equal to the training set.  
l(m) = x(m)  
We compute the f vector of m dimensions using the kernel formula.  
We can then minimize the cost function (same equation) except theta is also of m dimension now, and the regularization term can be replaced by theta^T * theta.  
Kernels can technically work on other algo but it really works well with SVM.  
Large C (1/lambda) : low bias and high variance, and inverse.  
Large sigma^2 : high bias and low variance, and inverse.

*SVMs in practice:*  
Use software packages that are already well optimized, don't write code yourself.  
You still need to specify C and the choice of kernel.  

No kernel = linear kernel, useful with a large number of features and a small training set.  

Gaussian kernel: you still need to specify sigma, useful for small number of features and/or large training set.  
Depending on the package, you might still need to provide a kernel function.  
Do still use feature scaling.  

Other kernels need to satisfy the technical condition called "Mercer's theorem" to make sure SVM's pacakges run correctly and do not diverge.  
Other "esoteric" kernels: polynomial kernel ( k = (X^T * l + cst)^deg ), string kernel, chi-square kernel, histogram intersection kernel...  

For multi-class classification, either use built-in methods, or one-vs-all still works.  

Vs logistic regression:  
- n>>m : logistic regression of SVM with linear kernel
- small n + intermediate m : SVM with gaussian kernel
- small n + large m : create features then  use logistic regression or SVM with linear kernel  
Neural network works for all those situations but can be slower.  

The SVM cost function is convex so no risk of local optimum.
