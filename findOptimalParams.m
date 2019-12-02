function [C, sigma] = dataset3Params(X, y, Xval, yval)

  %% Initalise parameters

  C = 1;
  sigma = 0.3;

  %% Define test values

  C_test = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]; sigma_test = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

  %% Run model with each permutation to find optimal values

  results = [];

  for C_count = 1:length(C_test)
    for sigma_count = 1:length(sigma_test)
      model = svmTrain(X, y, C_test(C_count), @(x1,x2) gaussianKernel(x1, x2, sigma_test(sigma_count)));
      predictions = svmPredict(model, Xval);
      error = sum(double(predictions ~= yval));
      results = [results; C_test(C_count) sigma_test(sigma_count) error];
    end
  end

  [val ind] = min(results(:,3));

  C = results(ind, 1);
  sigma = results(ind, 2);

end
