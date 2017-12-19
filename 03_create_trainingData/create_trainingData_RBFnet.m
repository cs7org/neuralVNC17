% written by Christina Stadler

%This script creates the data set to train a radial basis function neural
%network

% It prepares the scenario attributes and angle, distance intervals and
% merges it to input data 

% For supervised learning purposes the script prepares the line-of-sight
% probabilities corresponding to the scenarios represented by scenario
% attributes as target data

clear;


%% Search paths

path_targetData = 'E:\public\00_data\02_LOSprobabilities';      % folder path of target data for supervised learning
path_trainingData = 'E:\public\04_training';                    % folder path as target for the result
addpath(genpath(path_targetData),genpath(path_trainingData));
    

%% Prepare target data

listFiles = dir(fullfile(path_targetData,'*.mat'));   % list all target data

testScenarios = [40 41 42 48];                        % numbers of scenarios that should not be part of the training data for validation pruposes
scenarioCount = size(listFiles,1);
trainingScenarioCount = size(listFiles,1)-size(testScenarios,2);

target = loadTarget(scenarioCount, testScenarios, listFiles);


%% Load input: Scenario attributes

attributes = loadAttributesRBF(scenarioCount, testScenarios);

% writes prepared attribute matrix into input data of training data set
input = attributes;


%% Save training data

storage = strjoin({path_trainingData,'trainingData_RBFnet.mat'},'\');

save(storage,'input', 'target')

