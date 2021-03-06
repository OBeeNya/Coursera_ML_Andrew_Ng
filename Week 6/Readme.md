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
Chosing lambda:  
1. Create a range of lambdas  
2. Create set of models with different ds  
3. For each lambda go through all the models and learn some parameters  
4. Compute the cross validation error without regularization
5. Select the best combo that produces the lowest error on the cross validation set
6. Use the best parameters and lambda on Jtest to see if it's a good generalization
![alt text](https://i.imgur.com/eCDTyv0.png)  

*Learning curves:*  
Plotting the errors of Jtrain and Jcv as functions of the training set size helps visualizing possible bias and/or variance issues.  
High bias:  
- low training set size: low Jtrain and high Jcv
- high training set size: high Jtrain and high Jcv with both being close  
![alt text](https://i.imgur.com/wWahTHH.png)  
Getting more data won't help.

High variance:
- low training set size: low Jtrain and high Jcv
- high training set size: Jtrain increasses and Jcv decreases without leveling off. Also Jcv >> J train.
![alt text](https://i.imgur.com/OhVvDnW.png)  
Getting more data is likely to help.

*Deciding what to do next revisited:*  
More training examples => fixes high variance  
Smaller set of features => fixes high variance  
Adding features => fixes high bias  
Polynomial features => fixes high bias  
Decreasing lambda => fixers high bias  
Increasing lambda => fixes high variance  
For neural networks, small networks can be underfitting while large overfitting.  
If one hidden layer is a good default choice, we can experiment with different numbers of hidden layers and compute Jcv for each.

## **Building a Spam Classifier**

*Prioritizing what to work on:*  
Machine learning system design, which strategy and what to prioritize, example of a spam classifier.  
A feature can be a list of words, the most recurrent in spam and non-span emails, where their absence and presence are correlated with the nature of the mail.  
You can try improving the accuracy of your system by collecting lots of data, or developing sophisticated features based on email routing info, or message body, or to detect misspellings.  
Brainstorming in advance is a good idea but you shouldn't fixate on one solely based on gut feeling.

*Error analysis:*  
Recommended approach:
- start with a simple, quick and dirty implementation and test it on CV;
- plot learning curves to try and decide what is likely to help, avoiding premature optimization;
- error analysis: manually examine examples that the algorithm made an error on and try spotting any systematic trend;
- sometimes error analysis is not very easy or helpful to implement. Numerical evaluation can give the performance of an algo with and without a "technique" (more on this later).

## **Handling Skewed Data**

*Error metrics for skewed classes:*  
Skewed classes is a case where one class is much more present than the other (maybe 99% vs 1%).  
In this situation, an algorithm being right 99% of the time is not very impressive and may not be performant at all.  
Different evaluation metrics can be used, let's take the following binary classification example:  
![alt text](https://i.imgur.com/2RtHGMN.png)  
Precision = true positive / (true positive + false positive)  
Recall = true positive / (true positive + false negative)

*Trading off precision and recall:*  
If we want to predict a true statement only if we are very confident, we could increase the threshold for predicting 1, for example 0.5 -> 0.7.  
This would give us higher precision but lower recall.  
On the opposite, if we want to avoid missing true statements / avoid false negatives, we could lower the threshold, obtaining lower precision but higher recall.  
Comparing precision and recall numbers using an avergae of both is not a good idea.  
We can instead use the F1 score on numbers obtained from the cross validation set:  
![alt text](https://i.imgur.com/iwHm9tb.png)  
This is just one of many possible formulas, but this one is pretty popular and useful.

## **Using Large Data Sets**

*Data for machine learning:*  
Under certain conditions, getting a lot of data can be very effective.  
Can a human expert look at features x and accurately predict y + do we use an algo with lots of parameters.
