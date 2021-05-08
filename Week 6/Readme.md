# **WEEK 6**

## **Evaluating a Learning Algorithm**  

*Deciding what to do next:*  
If your model is doing poor predictions, it can be tricky to decide which avenue pursuing.  
Usual courses of action are using more training examples, a smaller set of features, getting additional features, adding polynomial features, changing lambda.  
A simple technique to rule out some of these choices is performing a machine learning diagnostic, which will give insight on what is or is not working.  

*Evaluating a hypothesis:*  
A good way to see if your hypothesis is valid is to first randomly split your dataset into an actual training set (around 70%) and a test set.  
Compute then the test set error with the parameters obtained from the training set.  
For linear regression:  
![alt text](https://i.imgur.com/YBrc7yn.png)  
For logistic regression, you can also use the equivalent cost function, but an alternative exists:  
![alt text](https://i.imgur.com/OWKd7wE.png)  
with:  
![alt text](https://i.imgur.com/jNwIFsh.png)  

*Model selection and train/validation/test sets:*  
Chosing which polynomial degre use for your hypothesis is part of your model selection process.  
d := polynomial degree  
Split up your dataset not in 2 but in 3 sets: training set (60%), cross validation set (20%) and test set (20%).  
Optimize the parameters using the training set for each polynomial degree (maybe up to 10).  
Find the polynomial degree with the lowest error using the validation set (using cost function).  
Estimate the generalization error using the test set as seen in previous part.  
This prevents using the test set with a polynomial degree that was fit to it.

## **Bias vs Variance**

*Diagnosing bias vs variance:*  
A high bias represents underfitting and high variance represents overfitting.  
The training error will tend to only decrease as we increase d, but the cross validation error will tend to first decrease then increase.  
![alt text](https://i.imgur.com/ogtdZ55.png)  
High Jtrain + high Jcv + Jcv almost equal to Jtrain => high bias / underfitting  
Low Jtrain + Jcv >> Jtrain => high variance / underfitting

*Regularization and bias/variance:*  
