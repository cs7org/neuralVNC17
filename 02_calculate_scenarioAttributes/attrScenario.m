function attrVector = attrScenario(filename1,filename2)
% written by Xenia Flamm, edited by Christina Stadler

% This function calculates the scenario attributes for a given scenario
% represented by net.xml and poly.xml files

% read coordinates and additional information of junctions and lanes
netJunctions = getJunctions(filename1);
netLanes = getLanes(filename1);

% road network represented as graph of junctions and lanes
graph = makeNetGraph(netJunctions,netLanes);

% read coordinates of buildings' outlines
polyBuildings = getPolys(filename2);


%% Calcualtion of building attributes

fullarea = compFullArea(filename1,filename2);    % full area of scenario (filename1, filename2)
areaBuildings = compPolys(polyBuildings);        % vector with all buildings' areas
sumArea = sum(areaBuildings);                    % total built-up area
nbrBuildings = size(polyBuildings,1);            % total number of buildings
averageBuildingArea = sumArea/nbrBuildings;      % average building area
proportionalBuilding = sumArea/fullarea;         % percentage of the built-up area on the full scenario area


%% Calculation of road attributes
% angle/curve = angle between two consecutive lane segments within 20° and
% 160°
% crossing = junction of two roads with an angle between 45° and 135°

[angles, nbrAngles] = compAngles_graph(graph);   % computation of angles and counting of courves per node (written in vectores)
totalNbrAngles = sum(nbrAngles);                 % number of cuves
nbrCrossings = compNbrCrossings(angles) ;        % number of crossings

lengthRealLanes = compLanes_graph(graph);        % originating from node j, heading to node N(i): check for angles that are no curves by definition and computation of real lane lengths
addedLanes = addLanes(graph,lengthRealLanes);    % for lanes with the same origin node j: check for angles that are no curves by definition and computation of real lane lengths
averageRoadLength = mean(addedLanes);            % average length of a road
nbrRoads = length(addedLanes);                   % total number of roads
areaRoads = sum(addedLanes)*3.2*2;               % total area of roads
proportionalRoads = areaRoads / fullarea;        % percentage of the roads' area on the full scenario area


%% Output: Vector of attributes

attrVector = [averageBuildingArea nbrBuildings proportionalBuilding ...     % building attributes
averageRoadLength nbrRoads proportionalRoads totalNbrAngles nbrCrossings];  % road attributes


end