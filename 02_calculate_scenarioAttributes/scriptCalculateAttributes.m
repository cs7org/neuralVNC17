% written by Xenia Flamm, edited by Christina Stadler

% This script computes the scenario attributes of scenarios converted to
% xml-files and stored in pathFolder_scenarios

clear;


%% Search paths
% Attention: Please type your paths!

pathFolder_scenarios = 'E:\public\00_data\01_scenarios\sumo';        % folder path of all scenarios, whose attributes should be calculated
pathFolder_functions = 'E:\public\02_calculate_scenarioAttributes';  % folder path of all matlab functions used by this script
pathFolder_result = 'E:\public\03_create_trainingData';              % folder path as target for the result

% reads scenario files
listFiles_scenarios = dir(fullfile(pathFolder_scenarios,'*.net.xml'));                    % lists all scenarios in the path pathFolder


%% Compute and save scenario attributes

scenario_attributes = automCompAttr(listFiles_scenarios,@attrScenario);

target = strjoin({pathFolder_result,'scenario_attributes.mat'},'\');
save(target,'scenario_attributes', 'listFiles_scenarios')