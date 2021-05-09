# **WEEK 7**

## **Large Margin Classification**  

*Optimization objective:*  
Support Vector Machine (SVM) is a very powerful and widely used algorithm, and can sometimes give a cleaner way of learning non-linear functions than logistic regression and neural networks.  
We are going to tweak the cost function so that the hypothesis equations are represented as such:  
![alt text](https://i.imgur.com/KD5GiG1.png)  
The equation for the cost function is as follows:  
![alt text](https://i.imgur.com/gKVL71F.png)  
Where we got rid by convention of 1/m, the values of the parameters being identical when minimizing the cost function.  
Also we are not controlling anymore the values of the parameters with lambda, but the we are optimizing the first term with C.  
When the cost function for logistic regression could be written as A + 𝜆B, here we have CA + B.

*Large margin intuition:*  
