function [attributes] = loadAttributesFF(scenarioCount, testScenarios, angleEnd, distanceEnd)
% written by Christina Stadler

%This function prepares the attributes of the scenarios that should be part
%of the training data for the training process of a FF neural network

load('scenario_attributes.mat', 'scenario_attributes', 'listFiles_scenarios');
attributeCount = size(scenario_attributes,2);
dimension = angleEnd*distanceEnd;

for k = 1:scenarioCount
    
    % check whether current scenario is a validation scenario (no training
    % scenario)
    if find(testScenarios==k)~=0
    else
        attributes_(:,:,k) = scenario_attributes(k,:).*ones(dimension,attributeCount);
    end
end

% merging all training scenario attributes into output variable attributes
attributes = vertcat(attributes_(:,:,1),attributes_(:,:,2));
for k = 3:scenarioCount
    if find(testScenarios==k)~=0
    else
        attributes = vertcat(attributes,attributes_(:,:,k));
    end
end

end

