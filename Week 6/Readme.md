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
For logistic regression, you can also use the equivalent cost function, an alternative exists:  
![alt text](https://i.imgur.com/OWKd7wE.png)  
with:  
![alt text](https://i.imgur.com/jNwIFsh.png)  

*Model selection and train/validation/test sets:*  
