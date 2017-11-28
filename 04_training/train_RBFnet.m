%This script starts the training process of a RBF neural network configered
%under section %% Training

clear;


%% Search paths
% Attention: Please type your path!

path_str_functions = 'E:\publication\04_training';        % folder path to training data
addpath(genpath(path_str_functions));


%% Load training data

load('trainingData_RBFnet.mat');

x = input.';
t = target;


%% Training
%net = newrb(P,T,goal,spread,MN,DF)
%P input vectors, T output, goal error (0.0), spread of fcts (1.0), MN max
%nbr neurons (nbr samples), DF nbr neurons to add between displays(25)

net = newrb(x,t,0.005,2000,48,1);
y = net(x);
perf = perform(net,y,t);