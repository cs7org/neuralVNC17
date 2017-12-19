% written by Christina Stadler

%This script creates the data set to train a feed forward neural network.

% It prepares the scenario attributes and angle, distance intervals and
% merges it to input data.

% For supervised learning purposes the script prepares the line-of-sight
% probabilities corresponding to the scenarios represented by scenario
% attributes as target data.

clear;


%% Search paths

path_targetData = 'E:\public\00_data\02_LOSprobabilities';	% folder path of target data for supervised learning
path_trainingData = 'E:\public\04_training';                % folder path as target for the result
addpath(genpath(path_targetData),genpath(path_trainingData));


%% Prepare target data

listFiles = dir(fullfile(path_targetData,'*.mat'));   % list all target data

testScenarios = [40 41 42 48];                        % numbers of scenarios that should not be part of the training data for validation pruposes
scenarioCount = size(listFiles,1);
trainingScenarioCount = size(listFiles,1)-size(testScenarios,2);

target = loadTarget(scenarioCount, testScenarios, listFiles);
target = reshape(target,[],1);                        % reshape LOS probabilities for the training data set


%% Load input: Angle and Distance

angleStep = 1;          % degree
distanceStep = 5;       % meter

angleEnd = 360/angleStep;
distanceEnd = 725/distanceStep;

[angle, distance] = loadAngleDistance(listFiles, trainingScenarioCount, angleEnd, distanceEnd);

% writes prepared angle and distance vectors into input data of training
% data set
input(:,1) = angle;
input(:,2) = distance;


%% Load input: Scenario attributes

attributes = loadAttributesFF(scenarioCount, testScenarios, angleEnd, distanceEnd);

% writes prepared attribute matrix into input data of training data set
input(:,3:10) = attributes;


%% Save training data

storage = strjoin({path_trainingData,'trainingData_FFnet.mat'},'\');

save(storage,'input', 'target')

