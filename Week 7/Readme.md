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
