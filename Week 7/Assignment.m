function sim = gaussianKernel(x1, x2, sigma)

x1 = x1(:); x2 = x2(:);

sim = 0;

sim = exp(-sum((x1-x2).^2)/(2*sigma^2));

end

___
  
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

___
  
function word_indices = processEmail(email_contents)

vocabList = getVocabList();

word_indices = [];

email_contents = lower(email_contents);

email_contents = regexprep(email_contents, '<[^<>]+>', ' ');

email_contents = regexprep(email_contents, '[0-9]+', 'number');

email_contents = regexprep(email_contents, ...
                           '(http|https)://[^\s]*', 'httpaddr');

email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');

email_contents = regexprep(email_contents, '[$]+', 'dollar');

fprintf('\n==== Processed Email ====\n\n');

l = 0;

while ~isempty(email_contents)

    [str, email_contents] = ...
       strtok(email_contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
   
    str = regexprep(str, '[^a-zA-Z0-9]', '');

    try str = porterStemmer(strtrim(str)); 
    catch str = ''; continue;
    end;

    if length(str) < 1
       continue;
    end

    for i=1:length(vocabList)
       if(strcmp(str,vocabList{i})==1)
          word_indices = [word_indices ; i];
       end
    end

    if (l + length(str) + 1) > 78
        fprintf('\n');
        l = 0;
    end
    fprintf('%s ', str);
    l = l + length(str) + 1;

end

fprintf('\n\n=========================\n');

end

___
  
function x = emailFeatures(word_indices)

n = 1899;

x = zeros(n, 1);

for i=1:length(word_indices)
   x(word_indices(i))=1; 
end

end
