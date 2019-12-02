%% Initialization
clear ; close all; clc

% Load the Spam Email dataset

load('spamTrain.mat');

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);

p = svmPredict(model, X);


% Load the test dataset

load('spamTest.mat');

%% Train using linear kernel

p = svmPredict(model, Xtest);

fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
pause;


% Sort the weights and obtain the vocabulary list
[weight, idx] = sort(model.w, 'descend');
vocabList = getVocabList();

%% Display top 15 indicators of spam

fprintf('\nTop predictors of spam: \n');
for i = 1:15
    fprintf(' %-15s (%f) \n', vocabList{idx(i)}, weight(i));
end

fprintf('\n\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% Test on a sample email

filename = 'equifaxSample.txt';

% Read and predict
file_contents = readFile(filename);
word_indices  = processEmail(file_contents);
x             = emailFeatures(word_indices);
p = svmPredict(model, x);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
fprintf('(1 = spam, 0 = not spam)\n\n');
