%This script creates the data set to train a radial basis function neural
%network

% It prepares the scenario attributes and angle, distance intervals and
% merges it to input data 

% For supervised learning purposes the script prepares the line-of-sight
% probabilities corresponding to the scenarios represented by scenario
% attributes as target data

clear;


%% Search paths
% Attention: Please type your paths!

pathFolder_targetData = 'E:\publication\00_data\02_LOSprobabilities';	% folder path of target data for supervised learning
pathFolder_trainingData = 'E:\publication\04_training';                 % folder path as target for the result
addpath(genpath(pathFolder_targetData),genpath(pathFolder_trainingData));


%% List target data

listFiles = list_matFiles(pathFolder_targetData);                       % list all target data

% INFO: Please type number of scenarios that should not be part of the
% training data for validation pruposes!
testScenarios = [40 41 42 48];
scenarioCount = size(listFiles,1);
trainingScenarioCount = size(listFiles,1)-size(testScenarios,2);


%% Load target

target = loadTarget(scenarioCount, testScenarios, listFiles);


%% Load input: Scenario attributes

attributes = loadAttributesRBF(scenarioCount, testScenarios);

% writes prepared attribute matrix into input data of training data set
input = attributes;


%% Save training data

storage = strjoin({pathFolder_trainingData,'trainingData_RBFnet.mat'},'\');

save(storage,'input', 'target')

