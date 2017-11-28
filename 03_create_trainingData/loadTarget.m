function [target] = loadTarget(scenarioCount, testScenarios, listFiles)
%This function loads all target data, that should be part of the training
%data set and leaves out validation data declared in
%create_trainingData_FFnet.m

j = 1;
for i = 1:scenarioCount
    
    % check whether scenario i is a validation scenario
    if find(testScenarios==i) ~= 0
        
    else
        filename = listFiles(i,1).name;
        target(:,j) = loadLOSprob(filename);
        j=j+1;
    end
end

end

