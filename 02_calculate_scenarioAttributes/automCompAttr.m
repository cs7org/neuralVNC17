function attrMatrix = automCompAttr(listFiles_scenarios,some_function)
%This function initiates the computation of road and building attributes 
%for all net.xml files listed in listFiles_scenarios

nbrScenarios = size(listFiles_scenarios,1);
attrMatrix = [];
indices=[];
fileName = {};

% loop, that initiates the calculation
for i = 1:nbrScenarios 
   thisFile = listFiles_scenarios(i,1).name;
   fileName_splitted = strsplit(thisFile,'.');
   fileName{1,i} = fileName_splitted{1,1};
   corresp_poly = strjoin({fileName{1,i},'poly.xml'},'.');      % derivation of the corresponding poly.xml filename from the net.xml filename
   attrMatrix(i,:) = some_function(thisFile, corresp_poly);     % handover of one scenario's net.xml and poly.xml to the calculating function
end
    
end