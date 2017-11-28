% This script computes the scenario attributes of scenarios converted to
% xml-files and stored in pathFolder_scenarios

clear;


%% Search paths
% Attention: Please type your paths!

pathFolder_scenarios = 'E:\publication\00_data\01_scenarios\sumo';        % folder path of all scenarios, whose attributes should be calculated
pathFolder_functions = 'E:\publication\02_calculate_scenarioAttributes';  % folder path of all matlab functions used by this script
pathFolder_result = 'E:\publication\03_create_trainingData';              % folder path as target for the result
addpath(genpath(pathFolder_scenarios),genpath(pathFolder_functions),genpath(pathFolder_result));

% reads scenario files
listFiles_scenarios = listFiles(pathFolder_scenarios);                    % lists all scenarios in the path pathFolder


%% Compute and save scenario attributes

scenario_attributes = automCompAttr(listFiles_scenarios,@attrScenario);

target = strjoin({pathFolder_result,'scenario_attributes.mat'},'\');
save(target,'scenario_attributes', 'listFiles_scenarios')