function [angles, nbrAngles] = compAngles_graph(graph)
% written by Xenia Flamm, comments edited by Christina Stadler

% This function computes angles between adjoining lanes and counts the
% curves by definition

nbrAngles = zeros(1,numnodes(graph));

% Computation of angles between lanes linking via the same node
for i = 1:numnodes(graph)
    N = neighbors(graph,i);
    
    % reading coordinates of node i
    thisNode_coord = graph.Nodes.Coordinates(i,:);

    for j = 2:length(N)
        m=1;
        
        % calculating angle between neighbor j and every neighbor m within
        % node i
        while m<j
            n_1 = N(j);
            n_2 = N(m);
            coord_n_1 = graph.Nodes.Coordinates(n_1,:);
            coord_n_2 = graph.Nodes.Coordinates(n_2,:);
            p_1 = coord_n_1-thisNode_coord;
            p_2 = coord_n_2-thisNode_coord;
            l1 = norm(p_1);
            l2 = norm(p_2);
            prod = dot(p_1,p_2)/(l1*l2);
            angle = acos(prod);
            
            % output = angle between neighbor j and m within node i
            angles(j,m,i) = angle;
            
            % check whether angle represents a curve by definition (>20°
            % and <160°); this definition can be changed here
            % ATTENTION: in case of change it also needs to be changed in
            % compLanes_graph.m and addLanes.m!
            if abs(angle) > (pi/180) * 20 && abs(angle) < (pi/180) * 160
                % if check is passed, counter for courves per node
                % increases
                nbrAngles(i) = nbrAngles(i)+1;
            end
            m=m+1;
        end
    end
end         

end