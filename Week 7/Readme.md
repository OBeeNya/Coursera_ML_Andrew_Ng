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
If x and l are similar, k will be close to 1.  
If x is far from l, k will be close to 0.  
If sigma is large, f will derive more slowly.

*Kernel II:*  
