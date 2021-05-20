function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

m = size(X, 1);
         
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

a1 = [ ones(m,1) X ]; 
a2 = sigmoid(a1 * Theta1');
a2 = [ ones(m,1) a2 ];
aL = sigmoid(a2 * Theta2'); 

Y = zeros(size(y,1), num_labels);
for i=1:m
    Y(i,y(i))=1;
end;
    
J = -1/m * sum(sum(Y.*log(aL) + (1-Y).*log(1.-aL)))... 
    + lambda/(2*m) * sum(sum(sum((Theta1(:,2:end)).^2)) + sum(sum((Theta2(:,2:end)).^2))); 

dL = aL-Y; 
d2 = (dL*Theta2).*a2.*(1-a2);
Theta2_grad = (a2'*dL)'/m;
Theta2_grad(:,2:end) = Theta2_grad(:,2:end)+(lambda*Theta2(:,2:end))/m; 
d2 = d2(:,2:end);
d1 = (d2*Theta1).*a1.*(1-a1);
Theta1_grad = (a1'*d2)'/m;
Theta1_grad(:,2:end) = Theta1_grad(:,2:end)+(lambda*Theta1(:,2:end))/m;

grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
