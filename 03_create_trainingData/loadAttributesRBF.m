function [attributes] = loadAttributesRBF(scenarioCount, testScenarios)
% written by Christina Stadler

%This function prepares the attributes of the scenarios that should be part
%of the training data for the training process of a RBF neural network

load('scenario_attributes.mat', 'scenario_attributes', 'listFiles_scenarios');

j = 0;
for k = 1:scenarioCount

    % check whether current scenario is a validation scenario (no training
    % scenario)
    if find(testScenarios==k)~=0
        j = j+1;
    else
    attributes((k-j),:) = scenario_attributes(k,:);
    end
end

end

