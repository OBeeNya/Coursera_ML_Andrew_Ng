# **WEEK 2**

## **Environment Setup Instructions**

*Mathlab online:*  
  https://matlab.mathworks.com/
  
*Octave:*  
  https://www.gnu.org/software/octave/download
  
## **Multivariate Linear Regression:**  

*Multiple features:*  
  Linear regression with multiple features / variables is known as *multivariate linear regression*.  
  Some notation:  
  ![alt text](https://i.imgur.com/8vq5GoP.png) := set of features of the ith training example    
  ![alt text](https://i.imgur.com/8QxZ2lr.png) := the value of jth feature of the ith training example  
  n := number of features  
  ![alt text](https://i.imgur.com/D5vZ4vg.png)  
  Defining vector x as the set of features and vector θ as the set of parameters, we have:  
  ![alt text](https://i.imgur.com/CbAACHz.png)  
  We assume x0=1.  
  
*Gradient descent for multiple variables:*  
  Updated formula:  
  ![alt text](https://i.imgur.com/9kpnRKC.png)  
  
*Feature scaling:*  
  Practical trick, it is good practice to scale features so they are in the same range, i.e. comprised between -1 and 1 for example, and not having one comprised between -100 and 100.  
  Features on too much different ranges may force the gradient descent algorithm to take too much time.  
  *Mean normalization* can also be used to adjust the computation. [Other methods exist](https://en.wikipedia.org/wiki/Feature_scaling#Methods).  
  ![alt text](https://i.imgur.com/mEMSJMA.png)  
  with μi being the average of all values for feature i and si being the range (max-min) of values, or the [standard deviation](https://en.wikipedia.org/wiki/Standard_deviation).  

*Learning rate:*  
   Debugging gradient descent: by plotting number of iterations on x-axis and J(θ) on y-axis, you can verify its behavior. If it's going up, α was probably taken too big. If it doesn't decrease fast enough, α might be too small.  
   Automatic convergence test: you can declare convergence when J(θ) goes below a threshold, but in practice this threshold is difficult to define.  
   A good practice is to try directly with a set of α, and see how each react.  
   
*Features and polynomial regression:*  
    We can improve our model in a couple of different ways. Maybe combining features makes more sense.  
    Our hypothesis function might not be linear, if it doesn't fit the data well. We can change the behavior of the function by making polynomial, or square root function, or any other form.  
    When doing this, scaling becomes that much more important as ranges might differ even more.
    
## **Computing Parameters Analytically**

*Normal equation:*  
  The *design matrix* X is of dimensions m*(n+1), m number of training examples and n number of features + column x0=1.  
  The normal equation allows us to perform the minimization of the cost function J without resorting to iterations.  
  This equation works by explicitly taking the derivatives of the cost function with respect to the θj's and setting them to 0.  
  ![alt text](https://i.imgur.com/86dVCoC.png)  
  There is no need for feature scaling with this method.  
  There is no need for iterations as said, and no need to define an α.  
  But with a computing cost of O(n^3), the normal equation can be very slow if n is very large (more than 10,000 features).
  
*Normal equation noninvertibility:*  
  A potential limit of the normal equation is that not all matrices are invertible.  
  Using the pinv function (pseudoinverse) instead of inv function in Octave resolves that issue.  
  One common cause of noninvertible matrices are redundant features, i.e. one feature is the scalar product of another (linearly dependant). We can delete one of the two features.  
  An other common cause is having more features than training examples. Deleting features can also be a solution here, or we can use *regularization* (not explained at this point).
  
## **Submitting Programming Assignments:**  

Personal use of [MATLAB Online](https://matlab.mathworks.com/)  

## **Octave/Matlab Tutorial:**  

*Basic operations:*  
  Octave is often used for quick prototyping before re-implementing on another lower level language.  
  Specific syntax:  
    *~=* not equal  
    *disp* display  
    *A = [ 1 2 3; 4 5 6]* matrix of dimension 2 * 3  
    *rand* random  
    *zeros (m, n)* / *ones (m, n)* matrices of m * n dimension filled with zeros or ones  
    *randn* normally distributed pseudorandom numbers  
    *hist* plot  
    *eye(n)* identity matrix of n * n dimension  
    *help + function* documentation on the function  
    
*Moving data around:*  
  *size* returns dimension of matrix, format returned is a 1 * 2 matrix  
  *length* returns length of bigger dimension, mostly useful for vectors  
  *pwd* prints working directory  
  *cd* changes directory  
  *ls* list elements in directory  
  *load + file* loads data from file  
  *who* lists current variables  
  *whos* gives more info on variables  
  *clear* clear variables  
  *save + filename + variable name* saves variable into a file, .mat or .txt -ascii to be readable by human  
  *A(i, j)* returns element from ith row jth column  
  *A(i, :)* returns all elements on ith row  
  *A = A[A, [values]]* appends values as column  
  *A = A[A; [values]]* appends values as row  
  *A(:)* puts all elements into a single vector  
  *C = [A B]* appends B to A to the right  
  *C= [A; B]* appends B to A below
  
*Computing on data:*  
   Operations element wise: add a . before sign  
   *A'* transpose A  
   *max(a)* returns maximum of row vector  
   *[val, ind] = max(a)* returns the value and index of the maximum  
   *a<3* returns a vector of a dimensions with 1 and 0 for result of comparison  
   *find(a<3)*  returns the values for which it's true  
   *sum(a)* sums values of row  
   *prod(a)* multiplies values of row  
   *floor(a)* rounddown values  
   *ceila)* roundup values  
   *max(A,[],1)* returns maximums by columns  
   *max(A,[],2)* returns maximums by rows  
   *max(max(A))* returns maximum of matrix  
   
*Plotting data:*  
  *plot* plot data on external window  
  *holdon* keeps the plot on even after plotting new ones  
  *label* add labels  
  *legend*  add legend  
  *title* add title  
  *print -dpng filename.png* save the figure as file  
  *close* cancel holdon  
  *figure(1); plot (x, y)* create a first figure  
  *subplot(1,2,1)* divide plot into 1x2 grid and access first element  
  *axis* define axis parameters  
  *clf* clear figure  
  *imagesc(A)* create a grid based on matrix
  
*Control statements: for, while, if statement:*  
  **for** i=1:10,  
    statements;  
    end;  
  **while** condition,  
    statements;  
    **if** condition,  
      break;  
      end;  
    end;  
  **if** condition,  
    statements;  
  **elseif** condition,  
    statements;  
    **else**,  
    statements;  
  end;  
  You can save functions in a .m file which will be automatically reached if in the right directory.  
  *addpath('...')* add directory to search for functions  
  function [y1, y2] = functionName(parameters)
    y1=statements;
    y2=statements;
  Cost function:
  function J = costFunctionJ(X, y, theta)
    m=size(X,1);
    predictions = X * theta;
    sqrErrors = (predictions-y).^2;
    J = 1/(2 * m) * sum(sqrErrors);
    
*Vectorization:*  
  Programming languages already come with simpler and more efficient way to code algorithms.  
  Hypothesis function:  
  ![alt text](https://i.imgur.com/pcH05aX.png)  
  Gradient descent:  
  ![alt text](https://i.imgur.com/dFS6BS1.png)  
