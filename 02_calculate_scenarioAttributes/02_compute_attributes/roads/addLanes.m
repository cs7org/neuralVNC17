function addedLanes = addLanes(graph,lengthRealLanes)
%This function computes the real length of lanes with the same origin node
%(in compLanes_graph, node j);
% Angle values <20° and >160° are not defined as curves; In consequence,
% the adjoining lanes need to be handled as one lane 

addedLanes = [];
lanes = lengthRealLanes(:,1);
lanes_update = lanes;
indices = lengthRealLanes(:,2:3);
counter = 0;

for i=1:length(indices)
    node = indices(i);
    if node == 0
        continue;
    end
    
    % list the rows within indices representing the lanes, that have the
    % same node in column 1 (column 1 = origin node)
    helpList = find(indices(:,1)==node);
    for j=1:length(helpList)
        for k = j+1:length(helpList)
            index1 = helpList(j);
            index2 = helpList(k);
            
            % calculation of the angle between lanes that have the same
            % origin node here called "node" and check for real lane
            % definition (that means no curve)
            if angleEdges(graph,node,indices(index1,2),indices(index2,2)) > (pi/180) * 160
                
                % if real lane check succeeds, summation of lane lengths
                counter = counter+1;
                addedLanes(counter) = lanes(index1)+lanes(index2);
                
                % deletion of lane lengths that have been summarized
                lanes_update(index1)=0;
                lanes_update(index2)=0;        %adde am ende alle die nicht null sind
            end
        end
    end
    indices(helpList)=0;
end

% deletion of rows without lane length values
lanes_update(lanes_update==0)=[];

% merge of summarized lane length values and remained not summarized lane
% length values
addedLanes = [addedLanes,transpose(lanes_update)];
            
end