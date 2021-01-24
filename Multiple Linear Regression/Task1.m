clc;


trainValues = csvread("train.csv",1,0);
testValues = csvread("test.csv",1,0);


%############ missing values removing ##############
lengthOf_TrainValues = size(trainValues);
nonZeroRows = [];
for i = 1 : lengthOf_TrainValues(1)
if (trainValues(i,4) ~= 0)
nonZeroRows = [nonZeroRows, i];
end
end

trainValues_mod = trainValues(nonZeroRows, :);

Task1_Plotting(trainValues,'Train Dataset');
Task1_Plotting(testValues,'Test Dataset');

%###### multivarite regression #########
yVals = trainValues_mod(:,7);
xVals = trainValues_mod(:,1:6);
[numRows_X, ~] = size(xVals);
xVals = [ones(numRows_X,1), xVals];
func_Coeffcs = ((xVals' * xVals) \ (xVals' * yVals));
fprintf("\n y = (%0.3f) + (%0.3f) x1 + (%0.3f) x2 + (%0.3f) x3 + (%0.3f) x4 + (%0.3f) x5 + (%0.3f) x6 \n",func_Coeffcs(1),func_Coeffcs(2),func_Coeffcs(3),func_Coeffcs(4),func_Coeffcs(5),func_Coeffcs(6),func_Coeffcs(7));

%####### RMSE ##########
X = testValues(:,1:6);
[rows_Num, ~] = size(X);
X = [ones(rows_Num,1), X];
values_Predicted = X * func_Coeffcs;

actualY_test = testValues(:,7);
test_PredictedY = values_Predicted;

test_Error = (test_PredictedY - actualY_test);
test_RMSE = (mean(test_Error.^2))^0.5;

X = trainValues(:,1:6);
[rows_Num, ~] = size(X);
X = [ones(rows_Num,1), X];
values_Predicted = X * func_Coeffcs;

actualY_train = trainValues(:,7);
train_PredictedY = values_Predicted;

train_Error = (train_PredictedY - actualY_train);
train_RMSE = (mean(train_Error.^2))^0.5;

fprintf("\n train rmse : %0.3f\n",train_RMSE);
fprintf("\n test  rmse : %0.3f\n",test_RMSE);
