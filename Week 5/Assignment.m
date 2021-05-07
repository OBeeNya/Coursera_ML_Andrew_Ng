function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

a1 = [ ones(m,1) X ]; % input units based on X
a2 = sigmoid(a1 * Theta1'); % computation of hidden layer
a2 = [ ones(m,1) a2 ]; % adding bias unit to hidden layer
aL = sigmoid(a2 * Theta2'); % computation of output layer

Y = zeros(size(y,1), num_labels); % transformation of y to fit the vector format
for i=1:m
    Y(i,y(i))=1;
end;
    
J = -1/m * sum(sum(Y.*log(aL) + (1-Y).*log(1.-aL)))... % cost function
    + lambda/(2*m) * sum(sum(sum((Theta1(:,2:end)).^2)) + sum(sum((Theta2(:,2:end)).^2))); % adding regularization

dL = aL-Y; % backpropagation
d2 = (dL*Theta2).*a2.*(1-a2);
Theta2_grad = (a2'*dL)'/m;
Theta2_grad(:,2:end) = Theta2_grad(:,2:end)+(lambda*Theta2(:,2:end))/m; % regularization
d2 = d2(:,2:end);
d1 = (d2*Theta1).*a1.*(1-a1);
Theta1_grad = (a1'*d2)'/m;
Theta1_grad(:,2:end) = Theta1_grad(:,2:end)+(lambda*Theta1(:,2:end))/m;  % regularization

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
               
___
               
function g = sigmoidGradient(z)

g = zeros(size(z));

g = g + (1./(1+exp(-z))) .* (1-(1./(1+exp(-z))));

end

___
               
function W = randInitializeWeights(L_in, L_out)

W = zeros(L_out, 1 + L_in);

    % Randomly initialize the weights to small values
    epsilon_init = 0.12;
    W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;

end
