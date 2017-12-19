% written by Xenia Flamm, edited by Christina Stadler


% INFO: This script needs to be executed while Matlab path = path of this
% script. Otherwise netconvert.exe and polyconvert.exe will no tbe found.

% INFO2: Resulting net.xml and polx.xml files are placed in
% 00_data\01_scenarios\sumo.


clear;

% Load search paths for matlab functions and *.osm-files
pathOSM = 'E:\public\00_data\01_scenarios\osm';

% lists all *.osm-files in pathOSM
listFiles_scenarios = dir(fullfile(pathOSM,'*.osm'));

% loop repeats for all scenarios in pathFolder
for i=1:size(listFiles_scenarios,1)
    
    % reads name of next scenario to convert
    thisScenario = strjoin({pathOSM,listFiles_scenarios(i,1).name},{'\'});
    
    % starts generation of net.xml and poly.xml for next scenario
    [status_net,cmdout_net,output] = netconvert_matlab(thisScenario);
    [status_poly,cmdout_poly] = polyconvert_matlab(thisScenario,output);
    
end