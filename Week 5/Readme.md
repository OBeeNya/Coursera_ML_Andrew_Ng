# **WEEK 5**

## **Cost Function and Backpropagation**  

*Cost function:*  
Let's define some new variables:  
L := total number of layers  
sl := number of units in layer l (not counting bias unit)  
K := number of output units, =1 for binary classification & >3 for multi-class classification  
The cost function for neural networks is a generalization of the on for logistic regression:  
![alt text](https://i.imgur.com/UH2WFoK.jpg)  
The double sum adds up the logistic regression costs calculated for each cell in the output layer.  
The triple sum addus up the square of all individuals θ in the entire network.  
The i in the triple sum does not refer to training example i.

*Backpropagation algorithm:*  
