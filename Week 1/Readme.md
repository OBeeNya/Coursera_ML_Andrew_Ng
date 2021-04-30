
# **WEEK 1**

## **Introduction**

*Machine learning:*  
    A computer program is said to learn from experience E with respect to some class of tasks T and performance measure P, if its performance at tasks in T, as measured by P, improves with experience E.
    
*Supervised learning:*  
    We are given a data set and already know what our correct output should look like, having the idea that there is a relationship between the input and the output.
    
*Regression problem: (supervised)*  
    We are trying to predict results within a continuous output, meaning that we are trying to map input variables to some continuous function.
    
*Classification problem: (supervised)*  
     We are instead trying to predict results in a discrete output. In other words, we are trying to map input variables into discrete categories.
     
*Features / attributes:*  
    Inputs used. We might want to use an infinite number of features.
    
*Unsupervised learning:*  
    Unsupervised learning allows us to approach problems with little or no idea what our results should look like. We can derive structure from data where we don't necessarily know the effect of the variables.
    
*Clustering algorithm: (unsupervised)*  
    Take a collection of outputs, and find a way to automatically group these outputs into groups that are somehow similar or related by different variables.
    
*Non-clustering algorithm: (unsupervised)*  
    Allows to find structure in a chaotic environment.
  
## **Model and Cost Function**

*Training set:*  
    Dataset used to learn.
    
*Notation:*  
    m := number of training examples  
    x := input variable  
    y := output/target variable  
    ![alt text](https://i.imgur.com/MSZLCzN.png) := training example  
    X := the space of input values  
    Y := the space of output value  
    h := the "hypothesis" function that maps X to Y, h : X -> Y
    
*Univariate linear regression:*  
    Regression problem + linear hypothesis function (affine) + one variable
    
*Cost function / mean squared error:*  
    Measures the accuracy of our hypothesis function. Takes a (fancy) average of all the results of the hypothesis with inputs x's and the actual outputs y's.  
    ![alt text](https://i.imgur.com/ReYlTLj.png)  
    θ0 and θ1 are the *parameters*.  
    The added 1/2 is added as a convenience for the computation of gradient descent as the derivative term of the square function will cancel out the 1/2 term (not 
    explained at this point).  
    The objective is to *minimize* J(θ0,θ1).

## **Parameter Learning**

*Gradient descent:*  
    Estimates the parameters in the hypothesis function, updates the value of the parameters until the cost function is minimized.  
    ![alt text](https://i.imgur.com/g9SngRe.png)  
    α is the *learning rate*, meaning how big a step we take downhill.  
    We should adjust our learning rate to ensure that the gradient descent algorithm converge in a reasonable time. Too small and it will take too much time, too high and we might miss the minimum.  
    The *partial derivative* gives us the slope of the tangent, therefore the direction to move towards.  
    At each iteration, one should simultaneously update all parameters.  
    Different starting points / *initializations* might give us a different local minimum of the cost function.  
    As we approach a local minimum, no need to decrease the learning rate as the derivative term will decrease, therefore the gradient descent will automatically take smaller steps.  
    
*Linear regression:*  
    In the case of linear regression, there is no local minimum other than the general one. Its cost function is a convex quadratic function.  
    ![alt text](https://i.imgur.com/fcvvkKV.png)  
    ![alt text](https://i.imgur.com/XMKHZlz.png)      
    See [Multivariable Calculus by MIT OCW](https://ocw.mit.edu/courses/mathematics/18-02sc-multivariable-calculus-fall-2010/index.htm) to compute derivatives yourself.   
    We talk about *batch* gradient descent because for each step we calculate the sum for all training examples.  
    Other versions of gradient descent exist where we only compute for subsets of the training set.  

## **Linear Algebra Review**  

*Matrices and vectors:*  
    Matrices are 2-dimensional arrays.  
    A matrix with m rows and n columns is a mxn matrix, of dimension mxn, part of the set R^mxn.  
    A vector is a matrix of only one column (incomplete definition as square matrices or matrices of one given dimension can be considered vectors).  
    For a matrix A, the entry Aij is the in the ith row and jth column.  
    Attention to different kinds of indexing: 1-indexing more used in math, and 0-indexing more used in computer science.  
    
*Addition and scalar multiplication:*  
    Matrix addition: (A+B)ij=Aij+Bij  
    We can only add matrices of the same dimension.  
    Scalar multiplication: each element of the matrix is multiplied by the real number.  
    
*Matrix-vector multiplication:*  
    We map the column of the vector onto each row of the matrix, multiplying each element and summing the result.  
    An m x n matrix multiplied by an n x 1 vector results in an m x 1 vector.  
    Dataset (matrix) * Parameters (vector) = Prediction (vector)  
    
*Matrix-matrix multiplication:*  
    We multiply two matrices by breaking it into several vector multiplications and concatenating the result.  
    An m x n matrix multiplied by an n x o matrix results in an m x o matrix.  
    Matrix-matrix multiplication can be useful for a quick computation of competing hypotheses.  
    Dataset (matrix) * Competing parameters (matrix) = Predictions (matrix)  
    
*Matrix multiplication properties:*  
    Matrices are not *commutative*: A * B != B * A  
    Matrices are *associative*: (A * B) * C = A * (B * C)  
    The *identity matrix*, when multiplied by any matrix of the same dimensions, results in the original matrix. The identity matrix simply has 1's on the diagonal (upper left to lower right diagonal) and 0's elsewhere.  
    
*Inverse and transpose:*  
    The *inverse* of a matrix A is denoted A^−1. Multiplying by the inverse results in the identity matrix.  
    Only *square matrices* have inverses.  
    Not all square matrices have an inverse, they are called *singular* or *degenerate*.  
    The *transpose* of a matrix A is denoted A^T, and the ith column of A^T is equal to the ith row of A.
