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
The triple sum adds up the square of all individuals θ in the entire network.  
The i in the triple sum does not refer to training example i.

*Backpropagation algorithm:*  
Backpropagation is neural-network terminology for minimizing our cost function.  
The backpropagation algorithm is used to compute the partial derivative of J(θ) : ![alt text](https://i.imgur.com/SeSWDXP.jpg), where 𝛿lj represents the "error" of node j in layer l  
𝛿lj = aLj - yj for each output unit, or in vectorized form 𝛿L = aL - y  
For inner layers: ![alt text](https://i.imgur.com/OHiBvzq.jpg)  
where ![alt text](https://i.imgur.com/7vvh7RE.jpg)  
No 𝛿1 computed cause no errors on training set.  
Using vectorization, ![alt text](https://i.imgur.com/Za7acMC.jpg)  
For gradient computation, first we set ![alt text](https://i.imgur.com/vteHPgQ.jpg)  
For training examples t=1 to m:  
- Set ![alt text](https://i.imgur.com/fYeqNrp.jpg)  
- Perform forward propagation to compute al for l=2,3...L  
a2=g(z1)  
- Using yt, compute 𝛿L=aL-yt
- Perform backward propagation and compute ![alt text](https://i.imgur.com/mMG6upu.jpg)  
- ![alt text](https://i.imgur.com/Gtdg4Bh.jpg) or with vectorization ![alt text](https://i.imgur.com/fyDU0jK.jpg)  
Finally:  
- ![alt text](https://i.imgur.com/pjDl9jQ.jpg) for j!=0, and without the regularization term for j=0  
D is used as an accumulator to add up our values as we go along and eventually compute our partial derivative as:  
![alt text](https://i.imgur.com/F7eQ8U3.jpg)

*Backpropagation intuition:*  
![alt text](https://i.imgur.com/8XZowjq.jpg)

## **Backpropagation in Practive:**

*Implementation note: unrolling parameters:*  
Advanced optimization algorithms (such as fminunc) assume that the parameters are in vector form.  
But in neural networks, we are working with parameters θ and gradients D in the form of matrices.  
We need to "unroll" them in order to use the optimizing functions.  
thetaVector = [ Theta1(:) ; Theta2(:) ; Theta3(:) ];  
And to get to the original matrices (if Theta1 is of dimensions 10x11 in this example):  
Theta1 = reshape(thetaVector(1:110),10,11);

*Gradient checking:*  
Backpropagation can be tricky to implement and can look as if it's working properly even with subtle bugs.  
Numerical gradient checking can give us the confidence that the computation is correct.  
![alt text](https://i.imgur.com/n1uwWXL.jpg)  
epsilon should be taken pretty small, such as 10^-4.  
Example of implementation in octave:  
epsilon = 1e-4;  
for i = 1:n,  
  thetaPlus = theta;  
  thetaPlus(i) += epsilon;  
  thetaMinus = theta;  
  thetaMinus(i) -= epsilon;  
  gradApprox(i) = (J(thetaPlus) - J(thetaMinus))/(2 * epsilon);  
end;  
You can then check that gradApprox approximates to DVec.  
Once you verified it, you should turn off that computation, otherwise your code will be very slow.

*Random initialization:*  
Unlike for logistic regression, initializing all parameters to 0 won't work because then all a2 nodes will be equal, same later for all gradient derivatives and computed parameters.  
To address this issue, we use random initialization (or *symmetry breaking*) as such:  
Theta1 = rand(m,n) * (2 * init_epsilon) - init_epsilon;  
for Theta1 a matrix of dimensions mxn.  
The epsilon used here is not related to the one used in gradient checking.  

*Putting it together:*  
First pick a network architecture, meaning the number of layers and number of nodes in the hidden layers.  
The number of input units corresponds to the number of features and the number of output units corresponds to the number of classes.  
A reasonable default is 1 hidden layer.  
For more than 1 hidden layer, a reasonable default is having the same number of nodes in each hidden layer.  
The usual steps to train a neural networks are as follows:  
- randomly initialize weights;  
- perform forward propagation to get hθ(xi) for any xi;  
- implement cost function;  
- implement back propagation to compute partial derivatives;  
- use gradient checking to confirm that backprop worked (then disable it);  
- use gradient descent or an advanced optimization algorithm to minimize the cost function.  
When performing forward and backprop, we loop on every training example:  
for i=1:m,  
perform forward + backprop using xi and yi  
get activations a(l) and delta terms 𝛿l for l=1...L  
get Δ  
compute 
