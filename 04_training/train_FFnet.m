% written by Christina Stadler

%This script starts the training process of a FF neural network configered
%under section %% Training

clear;


%% Search paths

path_str_functions = 'E:\public\04_training';        % folder path to training data
addpath(genpath(path_str_functions));


%% Load training data

load('trainingData_FFnet.mat');

x = input.';
t = target.';


%% Training

net = feedforwardnet([8 8 10]);
[net,tr] = train(net,x,t);
y = net(x);
perf = perform(net,y,t);
plotperform(tr)