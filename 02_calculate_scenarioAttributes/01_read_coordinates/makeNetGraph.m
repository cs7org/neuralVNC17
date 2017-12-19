function netGraph = makeNetGraph(netJunctions,netLanes)
% written by Xenia Flamm, edited by Christina Stadler

% This function structures the net.xml information from getJunctions.m and
% getLanes.m into a graph

% read xml attributes of junctions and lanes
from = netLanes(:,4);
to = netLanes(:,5);
lengthLanes = netLanes(:,2);
junctionNames = netJunctions(:,1);
nodesCoordinates_x = cell2mat(netJunctions(:,3));
nodesCoordinates_y = cell2mat(netJunctions(:,4));
nodesCoordinates = [nodesCoordinates_x nodesCoordinates_y];
nodes = [from to];


%% Removal of multiple edges

for i = 1:length(from)
    copy = nodes(i,:);
    reversed = fliplr(copy);
    if isempty(copy)
        continue;
    end
    for j = 1:length(from)
        help = nodes(j,:);
        if isempty(help)
            continue;
        end
        find1 = strcmp(copy(1,:),nodes(j,:));
        find2 = strcmp(reversed(1,:),nodes(j,:));
        if sum(find1) == 2 && i ~= j
            nodes{j,1}=[];
            nodes{j,2}=[];
            lengthLanes{j,1}=[];
        end
        if sum(find2) == 2 && i ~= j
            nodes{j,1}=[];
            nodes{j,2}=[];
            lengthLanes{j,1}=[];
        end
    end

end

emptyCells = cellfun('isempty', nodes); 
nodes(all(emptyCells,2),:) = [];
emptyCells = cellfun('isempty', lengthLanes); 
lengthLanes(all(emptyCells),:) = [];

lengthLanes = cell2mat(lengthLanes);
from = nodes(:,1);
to = nodes(:,2);

netGraph = graph(from,to,lengthLanes,junctionNames);


%% Completion of graph

% add coordinates to junctions
netGraph.Nodes.Coordinates = nodesCoordinates;

% add length to edges
nbrEdges = netGraph.numedges;
dist = zeros(nbrEdges,1);

for j = 1:nbrEdges
    [s,t] = findedge(netGraph,j);
    s_coord = netGraph.Nodes.Coordinates(s,:);
    t_coord = netGraph.Nodes.Coordinates(t,:);
    dist(j) = norm(s_coord-t_coord);
end

netGraph.Edges.Distance = dist;  

end