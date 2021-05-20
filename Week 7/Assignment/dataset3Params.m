function [C, sigma] = dataset3Params(X, y, Xval, yval)

C = 1;
sigma = 0.3;

rangeTest = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
errors = zeros(length(rangeTest),length(rangeTest));

L = X;

for i=1:length(rangeTest)
    for j=1:length(rangeTest)
        model = svmTrain(X, y, rangeTest(i), @(X, L) gaussianKernel(X, L, rangeTest(j)));  
        predictions = svmPredict(model, Xval);
        errors(i,j) = mean(double(predictions~=yval));
    end
end

[~,indexC] = min(errors);
[~,indexSigma] = min(min(errors));
indexC = indexC(indexSigma);

C = rangeTest(indexC);
sigma = rangeTest(indexSigma);

end
