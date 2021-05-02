# **WEEK 4**

## **Motivations**  

*Non-linear hypotheses:*  
In a classification problem, an logistic regression can be used as seen before.  
But if the solution is non-linear, logistic regression will only work effectively for a small number of features.  
Computing with polynomial terms of one hundred features would be way too expensive.  
[Learn more about algorithmic complexity](https://devopedia.org/algorithmic-complexity)

*Neurons and the brain:*  
The hypothesis of the *one learning algorithm* is based on the fact that the same part of the brain tissue can execute different tasks when performing neuro-rewiring experiments.  
If we figure out the brain's algorithm, we can implement some approximation of that algorithm on a computer.

## **Neural Networks**

*Model representation I:*  
Neurons are basically units that take inputs (dendrites) and channel output (axons).  
In our model, dendrites are the input features X and the output is the hypothesis function.  
In this model, the x0 input is sometimes called the *bias unit*, always equal to 1, and not always represented.  
In neural networks, we use the same function as classification, yet we sometimes call it a *sigmoid (logistic) activation function*.  
In neural networks, parameters are sometimes called *weights*.  
Layers between the input and output layers are called *hidden layers*.  
The hidden layers *nodes* can be called *activation units*.  
![alt text](https://i.imgur.com/VlBdVxy.png) activation of unit i in layer j  
![alt text](https://i.imgur.com/Y1a8z8e.png) matrix of weights controlling function mapping from layer j to layer j+1  
If network has sj units in layer j and sj+1 units in layer j+1, then ![alt text](https://i.imgur.com/Y1a8z8e.png) will be of dimensions sj+1*(sj + 1)  
For a simple neural network like this:  
![alt text](https://i.imgur.com/p3C2XQp.png)  
the values of each activation nodes are as follows:  
![alt text](https://i.imgur.com/0MAoPiH.png)  

*Model representation II:*  
