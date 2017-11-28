function lengthRealLanes = compLanes_graph(graph)
%This function computes the real length of lanes originating in node j and
%heading to node N(i);
% Angle values <20° and >160° are not defined as curves; In consequence,
% the adjoining lanes need to be handled as one lane 

lengthRealLanes = 0; 
nbrRealLanes = 0;

% loop that runs for node j
for j=1:numnodes(graph)
    
    % check for the presence of neighbors
    while ~isempty(neighbors(graph,j))
        N = neighbors(graph,j);
        
        % loop that runs for all neighbors i
        for i = 1:length(N)
            lengthTotal=0;
            lenLane = norm(graph.Nodes.Coordinates(N(i),:)-graph.Nodes.Coordinates(j,:));
            thisNode=j;
            nextNode=N(i);
            thisLength=lenLane;

            % start of iteration
            while true
                N_2 = neighbors(graph,nextNode);
                test = 0;
                for k = 1:length(N_2)
                    
                    % check whether the adjoined lanes are one real lane
                    if angleEdges(graph,nextNode,thisNode,N_2(k)) > (pi/180) * 160

                        % delete old edge
                        graph = rmedge(graph,thisNode,nextNode);

                        % go to the next node within N_2, which are all 
                        % neighbors of N(i), which is a neighbor of node j
                        % and repeat
                        lengthTotal=lengthTotal+thisLength;
                        thisNode=nextNode;
                        nextNode=N_2(k);
                        thisLength=norm(graph.Nodes.Coordinates(thisNode,:)-graph.Nodes.Coordinates(nextNode,:));
                        break; 
                    else
                        test = test+1;
                    end
                end

                % check for the end of the road
                if test == length(N_2)

                    lengthTotal=lengthTotal+thisLength;
                    graph = rmedge(graph,thisNode,nextNode);

                    % stops while loop        
                    break;                  
                end
            end

            % saving length of the road that starts with node j in
            % direction of N(i)
            nbrRealLanes = nbrRealLanes + 1;
            lengthRealLanes(nbrRealLanes,1:3) = [lengthTotal,j,N(i)];

        end
    end
end
    
end
          